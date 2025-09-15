$(document).ready(function () {
    $(document).on('change', "[data-behavior~=\"display-alert\"]", function () {
        const title = $(this).data('title') || 'Woah!';
        const target = $(this).data('message');
        const message = $(`#${target}`).html() || 'Default message';
        showModal(title, message);
    });

    function showModal(title, message) {
        $('#customModal').remove();

        const modalObject = $('<div>', {
            id: 'customModal',
            class: 'modal fade',
            role: 'dialog',
            tabindex: -1,
            'aria-modal': 'true'
        });
        console.log(modalObject);

        const modalDialog = $('<div>', { class: 'modal-dialog' }).appendTo(modalObject);
        console.log(modalDialog);

        const modalContent = $('<div>', { class: 'modal-content' }).appendTo(modalDialog);
        console.log(modalContent);

        const modalHeader = $('<div>', { class: 'modal-header' }).appendTo(modalContent);
        console.log(modalHeader);

        const modalTitle = $('<h5>', {
            class: 'modal-title fs-5',
            id: 'modalTitle'
        }).text(title).appendTo(modalHeader);
        console.log(modalTitle);

        const headerCloseButton = $('<button>', {
            type: 'button',
            class: 'btn-close',
            'data-bs-dismiss': 'modal',
            'aria-label': 'Close'
        }).appendTo(modalHeader);
        console.log(headerCloseButton);

        const modalBody = $('<div>', {
            class: 'modal-body'            
        }).html(message).appendTo(modalContent);
        console.log(modalBody);

        const modalFooter = $('<div>', { class: 'modal-footer' }).appendTo(modalContent);
        console.log(modalFooter);

        const footerCloseButton = $('<button>', {
            type: 'button',
            class: 'btn btn-secondary',
            'data-bs-dismiss': 'modal'
        }).text("Close").appendTo(modalFooter);
        console.log(footerCloseButton);

        $('body').append(modalObject);

        const modal = new bootstrap.Modal($("#customModal")[0]);
        modal.show();
    }
});