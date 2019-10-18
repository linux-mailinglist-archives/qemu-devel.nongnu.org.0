Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A4DBB8D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 05:00:41 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLIVM-0000QT-8g
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 23:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elohimes@gmail.com>) id 1iLIUM-0008MF-1l
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 22:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1iLIUK-0006tO-V2
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 22:59:37 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:41909)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1iLIUK-0006t4-RT
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 22:59:36 -0400
Received: by mail-qk1-x743.google.com with SMTP id p10so3981207qkg.8
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LvNOEvxkKeEfYNd3NSNBotW+Qur9uR661fnCY2SQVs=;
 b=FTcqYpL1IQgUEygPRSuhCHyXf9bEqbBrPIKZLNJYuh831c7zrH7XUVW0DZGOjiZr41
 RUfUQ8msAol/ALVpk5pQV4EXe28YiOVWWAZjvs+k9x0cjwULobjEOekgpcd9rlVltapc
 01M4xtLLI2F3EViUMOB4x1Dl9KYXS77ITQNKVO+oUaRW+cmaZEzdFb724xFwK+Ny4E/s
 zxIXZvJrtAWZ997ktee/EZCq6MqRf9hGfK5sS9GeK58dS9W7aTYehAoTw4ahzDYcyVP1
 ijt2ul6tASEhEgpNAYllnHd2fWcjZes7q71MX5WT+AHwKREBDRSnU8ouXr8wVLpeXbk3
 UQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LvNOEvxkKeEfYNd3NSNBotW+Qur9uR661fnCY2SQVs=;
 b=Y4k3CHMm+eTi7eaJdGmAAlrdVRMxrZyauh4KqgUx4pywREPVNfNS1ObV39lr5n7L19
 OcnuChxFh9+9lmC4Z/CouiSa4FiP0rdc7s1mJ52FS/Th4jfscMnKddVkRPRKnxIGad5c
 wzQi4//kJ5WQ0lnWdrhR4KEQ3exQiz8sIq+FJxz7EOV5FcwlnUpIN74e3w1VKxbL5S6q
 Zi6vSEg+zl0Pi72FhqiN+tqjLtRdGUyWELPBllnVgStUGV9wZQUAw6rSWI+TA2h6YCHI
 b8pg0OYRevOtTd6ckg3hDPrlYHvNoinyC6I7e/09DMicKGG14q/sm+kNJeWP9POWqIQD
 MsnA==
X-Gm-Message-State: APjAAAXMh4O0jpVXHpksVqdud3b6RQP49eXYNupIrgfz18gy6rEYCb0V
 gLugznmdOivXYNKBKcz9EZSoaQHTvrGNx35Z1qk=
X-Google-Smtp-Source: APXvYqwM09CzGvufs+G8ubVoO7Lufyvf1d7GW9bu+tH3wHyaIdB8LQ4VTE3D3SelPzQ+WLKmXqPogbgPCoRaVsMnRBM=
X-Received: by 2002:a37:a2d5:: with SMTP id l204mr1416442qke.285.1571367575385; 
 Thu, 17 Oct 2019 19:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191017163859.23184-1-felipe@nutanix.com>
In-Reply-To: <20191017163859.23184-1-felipe@nutanix.com>
From: Yongji Xie <elohimes@gmail.com>
Date: Fri, 18 Oct 2019 10:59:23 +0800
Message-ID: <CAONzpcbR+OjcrfavTnFXVopG-YsTdnFCT=no0eFei4oanfmj1Q@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-scsi: implement handle_output
To: Felipe Franciosi <felipe@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 at 01:17, Felipe Franciosi <felipe@nutanix.com> wrote:
>
> Originally, vhost-user-scsi did not implement a handle_output callback
> as that didn't seem necessary. Turns out it is.
>
> Depending on which other devices are presented to a VM, SeaBIOS may
> decide to map vhost-user-scsi devices on the 64-bit range of the address
> space. As a result, SeaBIOS will kick VQs via the config space. Those
> land on Qemu (not the vhost backend) and are missed, causing the VM not
> to boot. This fixes the issue by getting Qemu to post the notification.
>
Should we fix this in vhost-user-blk too?

Thanks,
Yongji

> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> ---
>  hw/scsi/vhost-user-scsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 6a6c15dd32..13278ed151 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -62,8 +62,9 @@ static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
>      }
>  }
>
> -static void vhost_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +static void vhost_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>  {
> +    event_notifier_set(virtio_queue_get_host_notifier(vq));
>  }
>
>  static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
> @@ -80,9 +81,9 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> -    virtio_scsi_common_realize(dev, vhost_dummy_handle_output,
> -                               vhost_dummy_handle_output,
> -                               vhost_dummy_handle_output, &err);
> +    virtio_scsi_common_realize(dev, vhost_handle_output,
> +                               vhost_handle_output,
> +                               vhost_handle_output, &err);
>      if (err != NULL) {
>          error_propagate(errp, err);
>          return;
> --
> 2.20.1
>

