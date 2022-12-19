Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3665122F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7LCg-0005zo-KG; Mon, 19 Dec 2022 13:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p7LCe-0005zO-Tc
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:49:32 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p7LCd-0004Bx-57
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:49:32 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-417b63464c6so139341817b3.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YLrwr8jSBmJZoYTV+gwFR0wmrKQ7pfIDwbIhBhwpqA=;
 b=johJcJxq1L5tQqZaNbWl0dut60wiA+8JXMJzoPoZJ5FLE7vZLa2S6QXMl49mxVrjF8
 JC8nogQm6OgMGbjcFrOOpK4j4k4hgROeIhnxXkMud29a9qWZ7zJMbq9rZXZ6dadyWeUL
 IZOQE6mT+OdDJo3FWMABB43pvHd/tZ/yVUr2v9TGtpUDzJkcJEx0EoB7H2RbK6Hmsl3Z
 0d21T0MnApvOawmL02OGfH17Kg32ifi8qs2bf0qmeceuLQRD9U87aeFNEtIuXTNbRIRE
 kZXID9kh5g2aF+I+Z6EluYjozjPfHh2xnLG8dTX7ykhMBszUR9Uo6dDDzJA8Z8b3iEdK
 IOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YLrwr8jSBmJZoYTV+gwFR0wmrKQ7pfIDwbIhBhwpqA=;
 b=MvwQCXD7pD9MyehmlMNLHJyP2CkQjIbH9rxZd1rKsrFwoSmN3toO9joo5Cgja8y+L3
 fUWO2V4gcNh4yENVHjVSms9CD/hf47f1gOZjyAUzpgeS/ufcLb6uPAX+Dj8K7XfKteji
 cHsoa5IyHQtKnC42wIyFf0rRx/2VuZ30a/K2nYsuV4Xp+ErGuOJ0vq2ksT/MMdyymeVf
 VGwGzrSf3rP6ar/wdpFTNA9LucXatCFNGF20gnxZ9K2L1VwEhumtm0IlxwuL0qeHgxL7
 NA0G/N1pn/6KqEXQT7myRXEdOyvjpv9qhsLRHcKstepB41YsIoWAUnBJnSWF/6Z5c6Aw
 rYwA==
X-Gm-Message-State: ANoB5pllfO6cHiXLfEbKYRP/MrPZQJF+7VXeJjZQZDrSoyxfBNtBRU2N
 KFKVbDABFbJmaIScOuN8V2jOz2bXbnmJXy5tIiw=
X-Google-Smtp-Source: AA0mqf4YsNmNn3Jyv2TSw+quOnSXSlh6GmwMjVU19GQ1CDrtPxSrC2ak+jOt+byWUbBQaPNp13EuWgwvmHfDWm7aCYM=
X-Received: by 2002:a0d:dd96:0:b0:370:1a06:1b4a with SMTP id
 g144-20020a0ddd96000000b003701a061b4amr12042035ywe.206.1671475769714; Mon, 19
 Dec 2022 10:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20221202132231.1048669-1-alex.bennee@linaro.org>
In-Reply-To: <20221202132231.1048669-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 19 Dec 2022 13:49:17 -0500
Message-ID: <CAJSP0QWJKnG-2Z1MzPVXiuCj-MwtBfuGk4NjpFZkOBB8QB5K_w@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0] backends/vhost-user: relax the ioeventfd check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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

On Fri, 2 Dec 2022 at 08:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> While you certainly need ioeventfds to work for KVM guests it
> shouldn't be limited to that. We can run vhost-user backends for TCG
> guests and either use ioeventfds or in band signalling.

I suggest tweaking this sentence so it's clear that you mean QEMU's
simulated eventfds rather than kvm.ko's real ioeventfds:
s/use eventfds or in band signalling/simulate ioeventfds or use in
band signalling/

>
> Maybe we should apply the same fix as b0aa77d36d (vhost-user: fix
> ioeventfd_enabled)?
>
> With this change I can run:
>
>   $QEMU $OPTS \
>     -display gtk,gl=3Don \
>     -device vhost-user-gpu-pci,chardev=3Dvhgpu \
>     -chardev socket,id=3Dvhgpu,path=3Dvhgpu.sock
>
> with:
>
>   ./contrib/vhost-user-gpu/vhost-user-gpu \
>     -s vhgpu.sock \
>     -v
>
> and at least see things start-up (although the display gets rotated by
> 180 degrees).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  backends/vhost-user.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 5dedb2d987..87d43fb03a 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -21,12 +21,6 @@
>  #include "io/channel-command.h"
>  #include "hw/virtio/virtio-bus.h"
>
> -static bool
> -ioeventfd_enabled(void)
> -{
> -    return kvm_enabled() && kvm_eventfds_enabled();
> -}
> -
>  int
>  vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
>                              unsigned nvqs, Error **errp)
> @@ -35,8 +29,8 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIO=
Device *vdev,
>
>      assert(!b->vdev && vdev);
>
> -    if (!ioeventfd_enabled()) {
> -        error_setg(errp, "vhost initialization failed: requires kvm");
> +    if (kvm_enabled() && !kvm_eventfds_enabled()) {
> +        error_setg(errp, "vhost initialization failed: kvm required ioev=
entfds");
>          return -1;
>      }

The check can be dropped completely. If kvm.ko doesn't support
ioeventfds QEMU can simulate them just like it does with TCG. In
practice I don't think this happens with a reasonably modern kernel
version.

Stefan

