Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C087F2FD8DB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:52:41 +0100 (CET)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Iau-0003tC-Em
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1l2IZ5-0002y8-4s
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:50:47 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:40068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1l2IZ3-0004OG-A6
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:50:46 -0500
Received: by mail-ot1-x32c.google.com with SMTP id i20so16556605otl.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYQrXUav3wMwj+KMh6H1q8zVQ8wo3Trb8TeS1gH5Klo=;
 b=kpvTIBbehVklomtQRfpv7ymoncCXYlkrHxjj3DLyebmywqmeIg98h87clBtSYPyF0y
 i0XC39bc0dPaa6Z+n/ii/BaAA5CmCfqYUR5/GHC+AkSnuvbnZFWznRJdvXr1ibsYR2Qj
 fYY9W3d+p1nkiov0rOBZ+jHEQ7L3FI8hn03YEJPcP6bRagRg3jh5ze1M0hKbx8w/JCZS
 qHRcUQ9ct936wE5UFmB42JXHEhoehQ3nUcQsMlU/kph4vqF6Wnd5mhODfZXG6kj+bCip
 XCfC29160X1IWqp0hWnJVEVvHYHzNFBoWUrjcFFTCB0nAcRpGFlLX2zk7yMUD1IrH3rg
 zQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYQrXUav3wMwj+KMh6H1q8zVQ8wo3Trb8TeS1gH5Klo=;
 b=Et1uWGdBrM0XKVQk9DYPIJu9vl7Kt+GGFQB0AxBKfOj5sMm3wQXDtQQ5cIGm6H68RA
 9cWYl59TUOs30xQxAljd2GMZ/5tk4vufG3tyma8+MQ8lxpFaUaFKsTsmkes4ayPAAG1G
 cN7/T7HmCqEs9zm9CWPHRTYpQ7qdOYhbsbRXvzbiDxjzjA8oNxpGHHUdMJR5oG9ChnBU
 ZM04Uon9LeaWtFAct7e1i4vGkAAEURr6+qZt3fi+zecAKFczibN6OcrdKu5/xEyyiJ/s
 STsJt9gbGm9IOczb61LqoI/86T+ijKlCf3pEtrCKMaat4wAsXCuHubJfhfPwaPa91jDA
 v0WA==
X-Gm-Message-State: AOAM532EL8svmPEC8VxBkzyLnMq9IC73E8FmZ65zeeMQCepnRO3YnQwu
 u3nemu8dipsVDBaJ/W2VnVzLS5UHu+VCN/XCPHs=
X-Google-Smtp-Source: ABdhPJwcl3w5X5oJ4mu255oA3qBsrTrYyB2xsj1HtFy6GrRFIpfFpXYyfS3Zk4VmTVyow92hFXV7E7rttPjt2LbOgXI=
X-Received: by 2002:a9d:774b:: with SMTP id t11mr7887077otl.337.1611168643707; 
 Wed, 20 Jan 2021 10:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20210120035027.51037-1-dubo163@126.com>
In-Reply-To: <20210120035027.51037-1-dubo163@126.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Wed, 20 Jan 2021 12:50:32 -0600
Message-ID: <CAFubqFtX-vWJ8ajnxVeh9r677Pr1mxvRayj7aOfCAeduWTf-hA@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-blk.c:fix the qemu-kvm crash in the
 vhost-user-blk env.
To: Bobo Du <dubo163@126.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks good - I just suggest some suggestions for the commit message.

On Wed, Jan 20, 2021 at 8:46 AM Bobo Du <dubo163@126.com> wrote:
>
> In our spdk env, when we restart spdk vhost process, all the spdk
> vhost dev will be reconnected,if the vhost_user_blk_device_realize
> failed in the reconnect code goto label with the qemu_chr_fe_wait_connected,
> the vhost_user_cleanup will set user->chr be NULL,but the fe handler
> vhost_user_blk_event is still work on the env.
>
> If the vhost slave(eg:spdk) has not been done,we will see the qemu-kvm
> crash after reopen the vhost-user-blk dev:

The English up to here is a little awkward. Maybe rather:

When a vhost-user-blk backend, such as SPDK restarts, all of the
backend's vhost devs will be reconnected. If
vhost_user_blk_device_realize() fails at qemu_chr_fe_wait_connected(),
goto virtio_err will be executed. This in turn calls
vhost_user_cleanup which sets user->chr to NULL. This is problematic
because the qemu_chr_fe_handler will still be active and will crash if
the backend comes back up and reopens the chardev.

> gdb debug info from qemu-kvm-2.10:
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> Core was generated by `/usr/libexec/qemu-kvm -name guest=db1ae942ac9c5486bf93c7baac5fcce6,debug-thread'.

I don't think you need these three lines:
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Core was generated by `/usr/libexec/qemu-kvm -name
guest=db1ae942ac9c5486bf93c7baac5fcce6,debug-thread'.

> Program terminated with signal 11, Segmentation fault.
> #0  qemu_chr_fe_set_msgfds (be=0x0, fds=0x0, num=0) at chardev/char-fe.c:144
> 144        Chardev *s = be->chr;
>
> So,we must reset the fe handler after the goto label virtio_err.
>
> Signed-off-by: Bobo Du <dubo163@126.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index da4fbf9084..c90687ab82 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -507,6 +507,8 @@ virtio_err:
>      }
>      g_free(s->virtqs);
>      virtio_cleanup(vdev);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL,
> +                             NULL, NULL, NULL, false);
>      vhost_user_cleanup(&s->vhost_user);
>  }
>
> --
> 2.17.0
>
>

