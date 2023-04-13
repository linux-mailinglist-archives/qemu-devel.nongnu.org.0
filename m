Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F566E0C0A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:06:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmukj-0004cU-Ti; Thu, 13 Apr 2023 07:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmukU-0004Ix-LW
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:04:26 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmukL-0000J8-48
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:04:17 -0400
Received: by mail-yb1-xb36.google.com with SMTP id t16so1974207ybi.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681383796; x=1683975796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=29RgO4BSWqxZ7uZGYePJU5OPPWEpeg9+S+2mQWBLcVA=;
 b=UmdU4OzS3hBlao+slz2krcoyhgDS8+F8xFglm+1QGVLCoJtuV6JsOasWKtCyMX9Uy2
 F7mNmPnjUqNRIxw5YYqIJ8XpYABaqi/s5yMWyacOAmJ9/+jwkRt8uF55VtxeCGqg1gD7
 qaghii+xZMUR9B2PQ1fGxbI3bXsswZ8gfPyhSko5wfHCRosPUokfxwCGB0BKH7dLu5U4
 DpgwoNiQVj0r/DDNEQ/OSVuscQJss+uMLJFauM6PjkEJ4snMBnzHysGFRfoj8szYWscg
 gO4mxOdm7hFDSb3lYLJiqdTWNTfAwV97ekdt0HXXUMxXdTWL/yjyHn94pmKUFeUAU0Er
 m1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681383796; x=1683975796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29RgO4BSWqxZ7uZGYePJU5OPPWEpeg9+S+2mQWBLcVA=;
 b=L+RYXIbghVzssjTrUXPeCtUvNqA6h5O+g5Plnj8BAijZvOPCn++/cJtQSAFVUrFOEE
 7xVJzPiBu5LeHpaN3yIjehLkDmxX3iEu/9zWLTWQDOzeZd9iS753aPDUthengGDsfXN0
 qqCdTi1nGk1dPJbvgW7oZJb45g6WD1osPj6G4gBev2GMspFGM3Km610eKQYiO22cRjI1
 jJuCsFQL/DrTWDTH5kMzQ6w79tZyMiN7SAEAmPgMKGpabdftmlFTr1TrCpOmSOZ8LT66
 W4fDv5d+izpzjjxNqAbB3vScvXcDoTK7ak8QEK4dlxErnOwYgz4/C1uzTiaMb77MSpmK
 5KSg==
X-Gm-Message-State: AAQBX9eRP1L0gPLQhf8/gM0nQJwmLv3bC6rKPV7L0zSsQPP7gowORXV8
 zZroyEtjGWr84upfCeBoVBP3Q/A9aeDbf+vhHko=
X-Google-Smtp-Source: AKy350bQDyzZBzVX0rWjNZKg85sagu5FK8vE+LTr3yLIr31xoj4FXHfOTDQ9u844n9lK/W5pJUxpbAjy9jPs1WUqXgk=
X-Received: by 2002:a25:76c4:0:b0:b8b:f1ac:9c6e with SMTP id
 r187-20020a2576c4000000b00b8bf1ac9c6emr953594ybc.2.1681383796532; Thu, 13 Apr
 2023 04:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
In-Reply-To: <20230411150515.14020-2-hreitz@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Apr 2023 07:03:04 -0400
Message-ID: <CAJSP0QVbNrvCYN+4aokEf=-L=D9YRTCKX-9-793NEBi91d6Fqw@mail.gmail.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 11 Apr 2023 at 11:05, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
> setting the vhost features will set this feature, too.  Doing so
> disables all vrings, which may not be intended.
>
> For example, enabling or disabling logging during migration requires
> setting those features (to set or unset VHOST_F_LOG_ALL), which will
> automatically disable all vrings.  In either case, the VM is running
> (disabling logging is done after a failed or cancelled migration, and
> only once the VM is running again, see comment in
> memory_global_dirty_log_stop()), so the vrings should really be enabled.
> As a result, the back-end seems to hang.
>
> To fix this, we must remember whether the vrings are supposed to be
> enabled, and, if so, re-enable them after a SET_FEATURES call that set
> VHOST_USER_F_PROTOCOL_FEATURES.
>
> It seems less than ideal that there is a short period in which the VM is
> running but the vrings will be stopped (between SET_FEATURES and
> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
> e.g. by introducing a new flag or vhost-user protocol feature to disable
> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
> new functions for setting/clearing singular feature bits (so that
> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>
> Even with such a potential addition to the protocol, we still need this
> fix here, because we cannot expect that back-ends will implement this
> addition.
>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 10 ++++++++++
>  hw/virtio/vhost.c         | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..2fe02ed5d4 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -90,6 +90,16 @@ struct vhost_dev {
>      int vq_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +
> +    /*
> +     * Whether the virtqueues are supposed to be enabled (via
> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
> +     * enabling/disabling logging) will disable all virtqueues if
> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
> +     * re-enable them if this field is set.
> +     */
> +    bool enable_vqs;
> +
>      /**
>       * vhost feature handling requires matching the feature set
>       * offered by a backend which may be a subset of the total
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..cbff589efa 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>  static QLIST_HEAD(, vhost_dev) vhost_devices =
>      QLIST_HEAD_INITIALIZER(vhost_devices);
>
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable);
> +
>  bool vhost_has_free_slot(void)
>  {
>      unsigned int slots_limit = ~0U;
> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
>          }
>      }
>
> +    if (dev->enable_vqs) {
> +        /*
> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled all

Is there a reason to put this vhost-user-specific workaround in
vhost.c instead of vhost-user.c?

Stefan

