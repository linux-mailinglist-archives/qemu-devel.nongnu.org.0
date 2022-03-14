Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08F4D7A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 06:46:09 +0100 (CET)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTdWw-0004k1-8n
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 01:46:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTdTM-00042I-8Y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 01:42:24 -0400
Received: from [2607:f8b0:4864:20::935] (port=45983
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTdTI-0004d2-9g
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 01:42:23 -0400
Received: by mail-ua1-x935.google.com with SMTP id b37so6157883uad.12
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LA50HJN7uAKEtYx45b+/lljNHIrWXpFS9E/pP9xHeUY=;
 b=OYYYehQRhcmIvhred9vcz2pGF8peJ8wTd2kJQ+ZwwLgooUSVprdk0FL2v+3qdgcD8Y
 6JNs3AippKY1tciomAcR90qbq3ywvHoUHrcHq1OBTK5NWo0ykq41HjwoItzMJtbw5MgY
 WJy1lG9fddHHBF/KEDvTR31UAPD/sK4Fz/4jsEvWT8fRRpeDUBiZHqV/OU0RsMjtIgpl
 6hWEAj7WBkE052n7icmGXG2xQy0b0vCWMiFFOL2mSjFonB/qMIA9vja0gB4HST1KM8Qa
 rPLzmFoktzDU0CizCRWWeNMtow6kIdQYKDAVvGbz8YWwxLTtwZnOHbG1v8UlgHFU81C7
 jSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LA50HJN7uAKEtYx45b+/lljNHIrWXpFS9E/pP9xHeUY=;
 b=Kv4snMPejgER0/XzwkwPouf1yotrQwfav2iqScXQYJgHQePeu7aLdjpd1vFDTg7kEE
 7s1VMw37wGFoseWwUHfHgp1n5cMSmkNSVyDYr1fgLoSGKdOnDrWjZjaZlhFF4DgaeRq4
 nXVXO5NTjWAPZaFxj6w6p88GnXNtHIQ5ZitGXWcEiB8Npk9+GehaMjzcDA3aBbR1seyY
 JVW6L4RFOhrZ/Czb/PF9nR+u0dOiccCIVUxTUQscSyQjzYl0tb7lkdMD9n0VUXFBKG12
 3ZJvEMSW55qmjkjKXnfVZa6EHXQr1io3EjCN07qcAJz/Oer7QfLgMvt7YBm0/r+hPvvA
 F8/g==
X-Gm-Message-State: AOAM5333czXzp+cACcksL9y95CsBfpdX7nKt35Z77TWQOUTCwMv3jxd+
 MXb7W4xp3It6PnYJha3Ow6OX2K60VWD0EVDjtN6f5g==
X-Google-Smtp-Source: ABdhPJzt4iegabHWWKmUW7qzi+meRUEb4TQA3wNTs1LKfQXdcuCstiZUwRSbvs6/hvq9CgtcxR7eS1wfOvzgWQXRkI4=
X-Received: by 2002:ab0:6194:0:b0:34a:737:f4c with SMTP id
 h20-20020ab06194000000b0034a07370f4cmr8327200uan.54.1647236537568; 
 Sun, 13 Mar 2022 22:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
 <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
 <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
 <e873b940-7af8-037a-ff30-1768626b8ec4@linaro.org>
In-Reply-To: <e873b940-7af8-037a-ff30-1768626b8ec4@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 13 Mar 2022 23:42:09 -0600
Message-ID: <CANCZdfpyLrtvq0atJYnaGaBriv=kGNfjPZewqoSY2KvJVJ0hrA@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000aee34505da2724cb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aee34505da2724cb
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022 at 10:36 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/13/22 21:09, Warner Losh wrote:
> > Oh? Out of paranoia, how can I verify that this is the case when
> compiled on FreeBSD?
> > Perhaps the atomic sequence FreeBSD uses differs a little from Linux and
> we don't trigger
> > that code?
>
> $ objdump -dr libqemu-arm-*-user.fa.p/accel_tcg_user-exec.c.o
>
> 0000000000001490 <helper_atomic_cmpxchgl_le>:
> ...
>      14b7:       e8 04 ec ff ff          callq  c0
> <atomic_mmu_lookup.constprop.0>
>      14bc:       48 89 c2                mov    %rax,%rdx
>      14bf:       44 89 e0                mov    %r12d,%eax
>      14c2:       f0 44 0f b1 32          lock cmpxchg %r14d,(%rdx)
>

Looks like this compiles correctly on FreeBSD... We have something similar:

    1f69:       41 89 f1                mov    %esi,%r9d
    1f6c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%rdi        # 1f73
<helper_atomic_cmpxchgl_le+0x53>
    1f73:       64 48 8b 34 25 00 00    mov    %fs:0x0,%rsi
    1f7a:       00 00
    1f7c:       48 89 8e 00 00 00 00    mov    %rcx,0x0(%rsi)
    1f83:       89 d0                   mov    %edx,%eax
    1f85:       f0 46 0f b1 04 0f       lock cmpxchg %r8d,(%rdi,%r9,1)

Warner


> r~
>

--000000000000aee34505da2724cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 13, 2022 at 10:36 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 3/13/22 21:09, Warner Losh wrote:<br>
&gt; Oh? Out of paranoia, how can I verify that this is the case when compi=
led on FreeBSD?<br>
&gt; Perhaps the atomic sequence FreeBSD uses differs a little from Linux a=
nd we don&#39;t trigger<br>
&gt; that code?<br>
<br>
$ objdump -dr libqemu-arm-*-user.fa.p/accel_tcg_user-exec.c.o<br>
<br>
0000000000001490 &lt;helper_atomic_cmpxchgl_le&gt;:<br>
...<br>
=C2=A0 =C2=A0 =C2=A014b7:=C2=A0 =C2=A0 =C2=A0 =C2=A0e8 04 ec ff ff=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 callq=C2=A0 c0 &lt;atomic_mmu_lookup.constprop.=
0&gt;<br>
=C2=A0 =C2=A0 =C2=A014bc:=C2=A0 =C2=A0 =C2=A0 =C2=A048 89 c2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %rax,%rdx<br>
=C2=A0 =C2=A0 =C2=A014bf:=C2=A0 =C2=A0 =C2=A0 =C2=A044 89 e0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %r12d,%eax<br>
=C2=A0 =C2=A0 =C2=A014c2:=C2=A0 =C2=A0 =C2=A0 =C2=A0f0 44 0f b1 32=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lock cmpxchg %r14d,(%rdx)<br></blockquote><div>=
<br></div><div>Looks like this compiles correctly on FreeBSD... We have som=
ething similar:</div><div><br></div><div>=C2=A0 =C2=A0 1f69: =C2=A0 =C2=A0 =
=C2=A0 41 89 f1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =
=C2=A0 =C2=A0%esi,%r9d<br>=C2=A0 =C2=A0 1f6c: =C2=A0 =C2=A0 =C2=A0 48 8b 3d=
 00 00 00 00 =C2=A0 =C2=A0mov =C2=A0 =C2=A00x0(%rip),%rdi =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# 1f73 &lt;helper_atomic_cmpxchgl_le+0x53&gt;<br>=C2=A0 =C2=A0 1f=
73: =C2=A0 =C2=A0 =C2=A0 64 48 8b 34 25 00 00 =C2=A0 =C2=A0mov =C2=A0 =C2=
=A0%fs:0x0,%rsi<br>=C2=A0 =C2=A0 1f7a: =C2=A0 =C2=A0 =C2=A0 00 00 <br>=C2=
=A0 =C2=A0 1f7c: =C2=A0 =C2=A0 =C2=A0 48 89 8e 00 00 00 00 =C2=A0 =C2=A0mov=
 =C2=A0 =C2=A0%rcx,0x0(%rsi)<br>=C2=A0 =C2=A0 1f83: =C2=A0 =C2=A0 =C2=A0 89=
 d0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=
=A0 =C2=A0%edx,%eax<br>=C2=A0 =C2=A0 1f85: =C2=A0 =C2=A0 =C2=A0 f0 46 0f b1=
 04 0f =C2=A0 =C2=A0 =C2=A0 lock cmpxchg %r8d,(%rdi,%r9,1)<br></div><div><b=
r></div><div>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000aee34505da2724cb--

