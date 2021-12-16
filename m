Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CFF4768B1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 04:28:38 +0100 (CET)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxhRd-0002JF-D5
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 22:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxhQN-0001V7-78
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 22:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxhQK-0005or-2o
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 22:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639625234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNoDHn30PH5I3byNZ0pzM8DE3QrHWocdOICt/VpRx6A=;
 b=VkHobP+gXmipRRWmtvDdHyIGPG4/5o53IduD3Fdre0XOnZBbSF73586zJOkAjvRi1pSYwP
 f8j0zjazyUTZGHwFKUCjOhkfkI05nTe9t07OCVm6GLlbZ36T6xqXCL63kQ0ydk9nLB7Olo
 u6C2Ra0iiChHGn5fqWvrJCi7xuHygno=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-nHpKuDpJP5yZwUFxpcPjtQ-1; Wed, 15 Dec 2021 22:27:13 -0500
X-MC-Unique: nHpKuDpJP5yZwUFxpcPjtQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 i123-20020a2e2281000000b0021cfde1fa8eso7969833lji.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 19:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qNoDHn30PH5I3byNZ0pzM8DE3QrHWocdOICt/VpRx6A=;
 b=KM+7dckvn40ucaPG2vA7gg5+BAThEUnYuZ9yqGVyrXB2X6027tgZnmaij0ShH1Pg4g
 Xhj+gUxN7Qa6fFobSdigT9dsOkoVHJcWLsNqvnAomQnogcyC7/GQAoQpQ2QwdYIuDl9O
 GZy5gTxWwbw5P/UaffLVunBNQMiAD/zlALG2gSyMk6iLqzG7xiGIIbHtXm7b8c/IcUxd
 TEjuCXZPDHUQob/jaDNgQEN9mR+BYlycW8CpFoqKmeQq0CESNfdFuz80RuPDqQtu+BkM
 sertpD+7nCdr0eecCNiLBJ7W2ONCt0Zf2V8VjebRTew95QBEU/Mb2dKYLtBOHCL9Sj8R
 sgmw==
X-Gm-Message-State: AOAM5323s1byX9A0ZdtczC7QKMofwvNCwR8U2QMpK0Y9hr6Y0mFTbJid
 CEy0N4gwrQWzyZWGvYIwHG7SL7rWUe97fKBW97/qVZU2k35IU5yqswtNSUhV29MQ65tUArlK0pW
 Bz/BnV00HPL5J8yoPJuEB3FT+31R+Byc=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr13013650lfi.498.1639625231290; 
 Wed, 15 Dec 2021 19:27:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkzLuvaP3z+yrsIG3HS2ymF5rGl1c5KDRXswFq2bmEKIxgZnvS13G/324YhYCTQGOvWPlDDtNQ//gra5h7O24=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr13013631lfi.498.1639625231020; 
 Wed, 15 Dec 2021 19:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20211215144718.311979-1-philmd@redhat.com>
In-Reply-To: <20211215144718.311979-1-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Dec 2021 11:27:00 +0800
Message-ID: <CACGkMEv53evZSfc_3xn=orgRCBE94Q0aHLO0VZrLjNykw9S-+A@mail.gmail.com>
Subject: Re: [PATCH] hw/net/vmxnet3: Log guest-triggerable errors using
 LOG_GUEST_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Duhao <504224090@qq.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Dike <dike199774@qq.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 10:47 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
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

Applied.

Thanks

> ---
>  hw/net/vmxnet3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index f65af4e9ef2..0b7acf7f895 100644
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
> 2.33.1
>


