Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9848571D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 18:13:39 +0100 (CET)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59r0-0007Ux-0B
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 12:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n59nc-0003VP-PL
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:10:09 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46611
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n59na-0007pe-Tw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:10:08 -0500
Received: by mail-io1-xd2e.google.com with SMTP id x6so48962929iol.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 09:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Eu+tr/OZ1ED3HpoCROwoL3qUvCdgdS6adVCkCL/b4s0=;
 b=J2pGBCTt38/kho0/7mGm8+eiV86y3RA6+aCxX0IF3kH/5VULUmM5TO1bwdc/b3X5kr
 yDeHakrVCKKm8Nz/FNWwPwNa26So6zde6myqZ6Y/qXuoGSTVlCPASxEIFBhpWII0DRHg
 h+2Nm6zFTGaIjm51DT9D2yQsfTZSENstkGaeSC+PwmasCtUzYYwMO3pRUJHcItrMfJOH
 aGOpYOhXz2tTV2L1W5ho7rLnnj+PxMJIE1DGYnQdUz6e0ZFe9P6n0OC19osdCEJ1WyNx
 4LlvSFROaX+0Pf9BD1x2HMlmugq5FztQfWjGKeDRzUgBx/C4QLOC2gNkqFmyucezfmQf
 I5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Eu+tr/OZ1ED3HpoCROwoL3qUvCdgdS6adVCkCL/b4s0=;
 b=R4xbqUcLCkF//x8JpGtwmpjeEqH5+8i5yU15uWZa96lvOvNmQVkxAs+Ut8zIA5EqE1
 eM3NEKbi8rIlklBCWS3p/sTv1/PC2vVi7tquUF9226bdkhHxk/6M5Lw6kUrvvxTnZmOb
 K2kielxCGzpvCji443oetOBoj5LFtX/gDZsQ9Nd/7SC8eYGw5r8wJYkmMOLZyltZb9FG
 FccjgtawtZG24VY8OGR5WcJ30xXkCbxvb+4DZ8X/gssesFbeXM5zFUhwKkJWsA3StGp5
 QaudteLuzQSW04k8Di8ulR85cYrJ22YBhkSfIaC4Wr7QREiyi9IawhpNgrLGuCAIYFSO
 9TxQ==
X-Gm-Message-State: AOAM531dqRZX3estYSABV8fA7T2e+KBOBEoMdIXfPW0hn1pFfSfz1MLC
 /VJpOPDkF3I7nzMjCkXoJ3tatRpkxciOpvQz0JNbYNEZiQY=
X-Google-Smtp-Source: ABdhPJwN0psMKCicf1V5++iG9qt6I7k8UkyGra9oxaxB/G2PodAwvOEsKSMRp5HDvLv7dqV3YWLEG3gCo4slMIKng4Q=
X-Received: by 2002:a5d:87d8:: with SMTP id q24mr25604186ios.154.1641402605107; 
 Wed, 05 Jan 2022 09:10:05 -0800 (PST)
MIME-Version: 1.0
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Wed, 5 Jan 2022 18:09:53 +0100
Message-ID: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
Subject: Rational behind partial AVX support in Qemu
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000035fce505d4d8d379"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=stevie.lavern@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000035fce505d4d8d379
Content-Type: text/plain; charset="UTF-8"

Hello,
I'm currently testing various binaries under qemu linux user and went into
a strange bug.

Here is the TLDR: is there a reason to allow VEX.L to be 1 when not
supporting AVX instructions? Crashing with illegal op may save some time
and headache to users.

And now for some context:
One of my test binaries had some AVX instructions and crashed in a weird
way.
As I understand AVX is not supported, and so a Qemu crash should be
expected.
However, in this instance, it's the guest that crashed, long after the
offending AVX instruction.

The faulty instruction was a `vmovups ymmword ptr [rsp], ymm0`.
Looking into i386/translate.c, it seems that it is correctly decoded but
its generation (see 'case 0x111' in `gen_sse`) is invalid.

Indeed, while the VEX prefix is correctly decoded, its VEX.L bit is never
used during the instruction generation and is always assumed to be 0.
Therefore, the instruction generated is a `vmovups xmmword ptr [rsp],
xmm0`, using a 128bits register instead of the orignal one using a 256bits
register.

My understanding is that the VEX prefix and 256 bits registers where
introduced by AVX. As Qemu does not support AVX, is there any kind of
reason not to crash (illegalop) when VEX.L = 1?

Best regards,

Thanks,
Stevie

--00000000000035fce505d4d8d379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I&#39;m currently testing various binaries unde=
r qemu linux user and went into a strange bug.<br></div><div><br></div><div=
>Here is the TLDR: is there a reason to allow VEX.L to be 1 when not suppor=
ting AVX instructions? Crashing with illegal op may save some time and head=
ache to users.</div><div><br></div><div>And now for some context:</div><div=
>One of my test binaries had some AVX instructions and crashed in a weird w=
ay.<br></div><div>As I understand AVX is not supported, and so a Qemu crash=
 should be expected.</div><div>However, in this instance, it&#39;s the gues=
t that crashed, long after the offending AVX instruction.<br></div><div><br=
></div><div>The faulty instruction was a `vmovups ymmword ptr [rsp], ymm0`.=
</div><div>Looking into i386/translate.c, it seems that it is correctly dec=
oded but its generation (see &#39;case 0x111&#39; in `gen_sse`) is invalid.=
<br></div><div><br></div><div>Indeed, while the VEX prefix is correctly dec=
oded, its VEX.L bit is never used during the instruction generation and is =
always assumed to be 0.</div><div>Therefore, the instruction generated is a=
 `vmovups xmmword ptr [rsp], xmm0`, using a 128bits register instead of the=
 orignal one using a 256bits register.</div><div><br></div><div>My understa=
nding is that the VEX prefix and 256 bits registers where introduced by AVX=
. As Qemu does not support AVX, is there any kind of reason not to crash (i=
llegalop) when VEX.L =3D 1?</div><div><br></div><div>Best regards,</div><di=
v><br></div><div>Thanks,</div><div>Stevie</div></div>

--00000000000035fce505d4d8d379--

