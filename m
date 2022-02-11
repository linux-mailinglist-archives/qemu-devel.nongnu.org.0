Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC49A4B1FF5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:15:08 +0100 (CET)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIR59-0006yj-8Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nIQwD-0005FS-FP
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nIQw1-0003ya-A1
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644566737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+/8FVzYqejolS+yHrsNaXnZQw4pm/DSsotc7I6qN2Y=;
 b=JG2jtndZGUFIjSAPUcyUEkUHN5BxxO2JFuEj7sFLJFM4C9yMJg0tpICbKUyGc5zQBA0Zdl
 6atc3BvKJq3B/xHdEWhdOuTTlRNig0DjMdiWRKKP1vWkist4WKP8y1W+QKtkCfKb5q5Yut
 61pQ3jcm2wEK0K/gQ1rFyOrBbzdgFhY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-2BN0i1rNMlKN4izQTGRv3A-1; Fri, 11 Feb 2022 03:05:36 -0500
X-MC-Unique: 2BN0i1rNMlKN4izQTGRv3A-1
Received: by mail-lj1-f197.google.com with SMTP id
 n9-20020a2e82c9000000b002435af2e8b9so3737817ljh.20
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 00:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z+/8FVzYqejolS+yHrsNaXnZQw4pm/DSsotc7I6qN2Y=;
 b=jZrEHkPJy36Vrz7Ev0cV9WzKLkC+xjEL1zfIWQ3J7hI4IEWdO6dkJlGYRqOHa6cZxD
 8liAGp/1tXVqdX39Lg14N/8TM7fPfdK913oyuWBRjnfOcsakf7IGIa4CvY13fXg659HN
 DtWrGIzjcS8TKQbY7cj1ZERM1Q4KcN5EBEQHromnXZuaIGaqyJ3e9C2kxMN/xpvWZK5S
 kNtaH7w7/D+6JHAOjn4czqZGPbhXnz5N3IVh5t7FsVDkpmSA4JXL+7MBVoAGAmoIiMcB
 NvM9xMWdpZAOuSRyffhquB+DLeirRQF2YLah5xOpcMqV1zHKOg11ib90x9dpHpIyQGaJ
 N4/A==
X-Gm-Message-State: AOAM530TgmWPEE3LPuj03xujKHUzgrEPZBzNG4U+RGEOP1egl/Zy9NPx
 K6Jy6h/N5A9WUmdGOWvLFalL7a56uATrWyv8XsXsD4Vcm6/y5AuNBBxRTtmeecZGj6uQiicIVMV
 7SomdsES3FZeamP5Cvxcu1NfWEPU/Iio=
X-Received: by 2002:a05:6512:e9c:: with SMTP id
 bi28mr399378lfb.498.1644566734831; 
 Fri, 11 Feb 2022 00:05:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM2uRZWjRsBD49bdltWpSro1ZWbjmjpgZw5EEzJqIEXls0WJy2Hy7/Ccl966tw6Tjc0cwAzzQnBiezNxkce5Q=
X-Received: by 2002:a05:6512:e9c:: with SMTP id
 bi28mr399364lfb.498.1644566734480; 
 Fri, 11 Feb 2022 00:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20220210080331.196C384ED9@mail.netbsd.org>
In-Reply-To: <20220210080331.196C384ED9@mail.netbsd.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 11 Feb 2022 16:05:23 +0800
Message-ID: <CACGkMEsCytLYv0ZWAMy-SrSmRajx_uLRMbaRLW04A94u5Q0y1Q@mail.gmail.com>
Subject: Re: [PATCH] hw/net: e1000e: Clear ICR on read when using non MSI-X
 interrupts
To: Nick Hudson <skrll@netbsd.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 4:10 PM Nick Hudson <skrll@netbsd.org> wrote:
>
> In section 7.4.3 of the 82574 datasheet it states that
>
>     "In systems that do not support MSI-X, reading the ICR
>      register clears it's bits..."
>
> Some OSes rely on this.
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> ---
>  hw/net/e1000e_core.c | 5 +++++
>  hw/net/trace-events  | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 8ae6fb7e14..2c51089a82 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -2607,6 +2607,11 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
>          core->mac[ICR] =3D 0;
>      }
>
> +    if (!msix_enabled(core->owner)) {
> +        trace_e1000e_irq_icr_clear_nonmsix_icr_read();
> +        core->mac[ICR] =3D 0;
> +    }
> +
>      if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
>          (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
>          trace_e1000e_irq_icr_clear_iame();
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 643338f610..084086ec44 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -221,6 +221,7 @@ e1000e_irq_write_ics(uint32_t val) "Adding ICR bits 0=
x%x"
>  e1000e_irq_icr_process_iame(void) "Clearing IMS bits due to IAME"
>  e1000e_irq_read_ics(uint32_t ics) "Current ICS: 0x%x"
>  e1000e_irq_read_ims(uint32_t ims) "Current IMS: 0x%x"
> +e1000e_irq_icr_clear_nonmisx_icr_read(void) "Clearing ICR on read due to=
 non MSI-X int"

s/mis/msi/

FAILED: libcommon.fa.p/hw_net_e1000e_core.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -I../common-user/host/x86_64
-I../capstone/include/capstone -I../dtc/libfdt -I../slirp
-I../slirp/src -I/usr/include/pixman-1 -I/usr/include/libpng16
-I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-I/usr/include/gio-unix-2.0 -fdiagnostics-color=3Dauto -Wall
-Winvalid-pch -Werror -std=3Dgnu11 -g -isystem
/home/devel/git/qemu/linux-headers -isystem linux-headers -iquote .
-iquote /home/devel/git/qemu -iquote /home/devel/git/qemu/include
-iquote /home/devel/git/qemu/disas/libvixl -iquote
/home/devel/git/qemu/tcg/i386 -pthread -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600
-DNCURSES_WIDECHAR=3D1 -MD -MQ libcommon.fa.p/hw_net_e1000e_core.c.o -MF
libcommon.fa.p/hw_net_e1000e_core.c.o.d -o
libcommon.fa.p/hw_net_e1000e_core.c.o -c ../hw/net/e1000e_core.c
../hw/net/e1000e_core.c: In function =E2=80=98e1000e_mac_icr_read=E2=80=99:
../hw/net/e1000e_core.c:2611:9: error: implicit declaration of
function =E2=80=98trace_e1000e_irq_icr_clear_nonmsix_icr_read=E2=80=99; did=
 you mean
=E2=80=98trace_e1000e_irq_icr_clear_nonmisx_icr_read=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
 2611 |         trace_e1000e_irq_icr_clear_nonmsix_icr_read();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         trace_e1000e_irq_icr_clear_nonmisx_icr_read
../hw/net/e1000e_core.c:2611:9: error: nested extern declaration of
=E2=80=98trace_e1000e_irq_icr_clear_nonmsix_icr_read=E2=80=99 [-Werror=3Dne=
sted-externs]

I wonder how the patch is tested.

Thanks

>  e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR:=
 0x%x"
>  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x=
%x"
>  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IM=
S"
> --
> 2.25.1
>


