Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA84B409B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:07:27 +0100 (CET)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSe6-0007rH-SL
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:07:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSWM-0004LS-GT
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:59:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSWH-0008HV-D9
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciStdZsrWDAE/WKx7Z0gNjxFPjNcgTCVqeyK/41VWqs=;
 b=ZYrDXXhkKJLR4q5GeBcWzSFNpl8jb5d/PUgGmt4CWysd9kU1Blvs7n7f+APByAY9sWyc9/
 xImMt5/eWpfjszDVaeSBaySgBJ4pW4ixt3y184MMP2mAlYu8VzDz9S3MV/iXWIRI1a4XHV
 oW34thiyhndieKej8O5686Jou7LKSG4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-DLnLleaXMOi5OFkAN6tWqg-1; Sun, 13 Feb 2022 22:59:16 -0500
X-MC-Unique: DLnLleaXMOi5OFkAN6tWqg-1
Received: by mail-lf1-f70.google.com with SMTP id
 d1-20020a0565123d0100b004433d2e2fd0so369957lfv.8
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 19:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ciStdZsrWDAE/WKx7Z0gNjxFPjNcgTCVqeyK/41VWqs=;
 b=tmeNPH7BS6sGEoThGfzxf41D9/Cydoq4frbZrf8hKLkDDg0u62VaVYB9Lh1K0r2eNZ
 SabXEZljagI+6hCcwvo6u1zGDrZdBMoGbgTMiCqeYxtvRKsRW4uNGU2daAytJR9KZ/pR
 ojj+ZIqwj7pe/bsbkOIcrV7jHakcUCwOxmRaivLN9c3Zpkkffgv5gwsvWsiEyzc7o29W
 10FWn7ICpWnFxMbYxiCKmCeu+8zB71VVOFNeljIYtD0Weudzq5jLAZP8LFmrTPjIX6ri
 ublDjBMstzRT3A26euw1vNKe1cL8CBRjRyRgdmnaSmwgRsPQF2i6c0O+krsAVFoNvtly
 tc2g==
X-Gm-Message-State: AOAM533bEUbPIt3VsP/1qJeWgocCXA2ntaNfWewktDkzCwoVUrALmKX4
 Zd3Ova5bi+cJs8/OD8P4ChY19mkJKJhtNcp/3sFip5jcGoJfZ5qLD63v65gosRXiPYQQ6dy9pBd
 VwM1VWCxrM9P+hrVbiKPxWezmUiXpuKo=
X-Received: by 2002:a2e:9150:: with SMTP id q16mr7483912ljg.420.1644811154367; 
 Sun, 13 Feb 2022 19:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTuKcXqBH/jQQqS580ybrdrGrAGxUHfnVcdMETop4sW1QhxmgdGo5ynFnnyI00BvJZWBTBUbrS7Fp6+mPs4Iw=
X-Received: by 2002:a2e:9150:: with SMTP id q16mr7483897ljg.420.1644811154092; 
 Sun, 13 Feb 2022 19:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20220214035741.70990-1-jasowang@redhat.com>
In-Reply-To: <20220214035741.70990-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 11:59:02 +0800
Message-ID: <CACGkMEtzN==iE6hwmBvWL84N9HPiFh+MH+COuC=Kj1HxwnQVmA@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/net/vmxnet3: Log guest-triggerable errors using
 LOG_GUEST_ERROR
To: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Dike <dike199774@qq.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Duhao <504224090@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi:

Hit the wrong button, please ignore this series.

Thanks

On Mon, Feb 14, 2022 at 11:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> The "Interrupt Cause" register (VMXNET3_REG_ICR) is read-only.
> Write accesses are ignored. Log them with as LOG_GUEST_ERROR
> instead of aborting:
>
>   [R +0.239743] writeq 0xe0002031 0x46291a5a55460800
>   ERROR:hw/net/vmxnet3.c:1819:vmxnet3_io_bar1_write: code should not be r=
eached
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   (gdb) bt
>   #3  0x74c397d3 in __GI_abort () at abort.c:79
>   #4  0x76d3cd4c in g_assertion_message (domain=3D<optimized out>, file=
=3D<optimized out>, line=3D<optimized out>, func=3D<optimized out>, message=
=3D<optimized out>) at ../glib/gtestutils.c:3223
>   #5  0x76d9d45f in g_assertion_message_expr
>       (domain=3D0x0, file=3D0x59fc2e53 "hw/net/vmxnet3.c", line=3D1819, f=
unc=3D0x59fc11e0 <__func__.vmxnet3_io_bar1_write> "vmxnet3_io_bar1_write", =
expr=3D<optimized out>)
>       at ../glib/gtestutils.c:3249
>   #6  0x57e80a3a in vmxnet3_io_bar1_write (opaque=3D0x62814100, addr=3D56=
, val=3D70, size=3D4) at hw/net/vmxnet3.c:1819
>   #7  0x58c2d894 in memory_region_write_accessor (mr=3D0x62816b90, addr=
=3D56, value=3D0x7fff9450, size=3D4, shift=3D0, mask=3D4294967295, attrs=3D=
...) at softmmu/memory.c:492
>   #8  0x58c2d1d2 in access_with_adjusted_size (addr=3D56, value=3D0x7fff9=
450, size=3D1, access_size_min=3D4, access_size_max=3D4, access_fn=3D
>       0x58c2d290 <memory_region_write_accessor>, mr=3D0x62816b90, attrs=
=3D...) at softmmu/memory.c:554
>   #9  0x58c2bae7 in memory_region_dispatch_write (mr=3D0x62816b90, addr=
=3D56, data=3D70, op=3DMO_8, attrs=3D...) at softmmu/memory.c:1504
>   #10 0x58bfd034 in flatview_write_continue (fv=3D0x606000181700, addr=3D=
0xe0002038, attrs=3D..., ptr=3D0x7fffb9e0, len=3D1, addr1=3D56, l=3D1, mr=
=3D0x62816b90)
>       at softmmu/physmem.c:2782
>   #11 0x58beba00 in flatview_write (fv=3D0x606000181700, addr=3D0xe000203=
1, attrs=3D..., buf=3D0x7fffb9e0, len=3D8) at softmmu/physmem.c:2822
>   #12 0x58beb589 in address_space_write (as=3D0x608000015f20, addr=3D0xe0=
002031, attrs=3D..., buf=3D0x7fffb9e0, len=3D8) at softmmu/physmem.c:2914
>
> Reported-by: Dike <dike199774@qq.com>
> Reported-by: Duhao <504224090@qq.com>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032932
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/vmxnet3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index f65af4e9ef..0b7acf7f89 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1816,7 +1816,9 @@ vmxnet3_io_bar1_write(void *opaque,
>      case VMXNET3_REG_ICR:
>          VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] =3D %" PRIx64 ", size %d=
",
>                    val, size);
> -        g_assert_not_reached();
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: write to read-only register VMXNET3_REG_ICR\n=
",
> +                      TYPE_VMXNET3);
>          break;
>
>      /* Event Cause Register */
> --
> 2.32.0 (Apple Git-132)
>


