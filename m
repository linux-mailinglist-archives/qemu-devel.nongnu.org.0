Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C773730E7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:37:20 +0200 (CEST)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0r9-00020h-2a
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1le0pk-0000lA-T6
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:35:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1le0pg-0002u9-JQ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:35:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id h11so219961pfn.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORKAIf1asRZPMa+6s/pHeGXqpiqVPzgrJoeHO0bf6hM=;
 b=pY22gDIxTcb4XCUZoOIQSSDXtS6jhFyeUozhPEQ+7xYpO8ZBdajXTaENmhcrrlmEPR
 Kx0OkUqZmS9OlahoPe48PyCLigtoNdN+BdIPjqF5ko4xIZfircF75J0PkfliV9t+V0DY
 5K1Sqyz704cAGhJdWJcLokQAKkBmZxJhIxm/Rud5YkUBfZmK80n6A0pQyAufLYvONeZA
 j4bL6MEH09jCUFdnFPKhhrm8rwzbwphcHDmMcn99/tGKGQci15jBTawMqTpn5ioOuF/n
 RY1I06bMCVAkmdoh0FQ9CkPfTl9FRN/fSRu+mOUIMYTz5KpMww0badgJTTg9PHWubaQu
 Ip2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORKAIf1asRZPMa+6s/pHeGXqpiqVPzgrJoeHO0bf6hM=;
 b=LcXDjJ3qoKJG+HBricL6/P6Hr/ph1XDRB2cYV3gVyi3nU6iypyrTNacgJ7u8OtMqnA
 cdfOP/VVksCyjsCMy6xuox7mTmzxbExeuMz7P03iDZfTlBqQrem7laNZkeyKKpItigym
 D+FphKdrTvyJapTfbWtOWZVL9xsgfE7ORR4aE5onrr43nUybJamN67RH5k7BHUf7gFBM
 1zM7+UcKDiaK/p4nHTvCH9mPv/bhtB6HrhlpdKrDXxap64Sy9E8rcnC8e05FJT58lLae
 G6GcMNo+Co+fF/0bCHOUt9zghJormI3iRdfEluVmCoR8FDcc6LqWHCbJv7CDAKtAdKDo
 BJ4A==
X-Gm-Message-State: AOAM532DB4YozOKjWGxM9ViddPCu1AXroH8HOp6v505ykuwowGutbp57
 /j/XkYw33ze0w2w7W+IUEhIhQCij95Jh5je1xKY=
X-Google-Smtp-Source: ABdhPJwlK0lzSx/l7zbdHR6BGPPkStJ09a9ve7oiD/QgulcEbtC7Hk3Rr1UhzAbGWhakKGZCKkUDoIN/HVj1GdofWOI=
X-Received: by 2002:a63:5602:: with SMTP id k2mr14807519pgb.127.1620156946418; 
 Tue, 04 May 2021 12:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
 <df6c1dc7-5d0f-f094-5d2f-2d8f9a909a1c@vivier.eu>
In-Reply-To: <df6c1dc7-5d0f-f094-5d2f-2d8f9a909a1c@vivier.eu>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Wed, 5 May 2021 01:05:35 +0530
Message-ID: <CAAQ-SiMje-qBYy8bwRKXmUEMSQk5UR=rPtTPUBGQ6Fqhs-i_eA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/27] virtio-snd: Add properties for class init
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000004590d605c1862f73"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004590d605c1862f73
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 May 2021 at 19:02, Laurent Vivier <laurent@vivier.eu> wrote:

> There is nothing specific to PCI in that code, why do you prevent the use
> of virtio-snd as a MMIO
> device?
>
> I am sorry I do not understand your question completely. If by preventing
the use of virtio-snd, you mean
why did I add the PCI dependencies to the Kconfig file, then I think I must
have been a bit confused
while writing it. VIRTIO_PCI already includes those dependencies, I will
change the dependency to
VIRTIO. (Which is what it is for other virtio devices too.)

However if you mean why did I not add an MMIO binding for this device, then
there is no
specific reason. I simply followed what QEMU had been doing for the other
virtio devices.
Will there be any advantages to implementing the device as a MMIO device?

> Thanks,
>
> Laurent
>
> --
Regards
Shreyansh

--0000000000004590d605c1862f73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 4 May 2021 at 19:02, Laurent Vivi=
er &lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivie=
r.eu</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">There is nothing specific to PCI in that c=
ode, why do you prevent the use of virtio-snd as a MMIO<br>
device?<br>
<br></blockquote><div>I am sorry I do not understand your question complete=
ly. If by preventing the use of virtio-snd, you mean</div><div>why did I ad=
d the PCI dependencies to the Kconfig file, then I think I must have been a=
 bit confused</div><div>while writing it. VIRTIO_PCI already includes those=
 dependencies, I will change the dependency to</div><div>VIRTIO. (Which is =
what it is for other virtio devices too.)</div><div><br></div><div>However =
if you mean why did I not add an MMIO binding for this device, then there i=
s no</div><div>specific reason. I simply followed what QEMU had been doing =
for the other virtio devices.</div><div>Will there be any advantages to imp=
lementing the device as a MMIO device?=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Thanks,<br>
<br>
Laurent<br>
<br></blockquote><div>--=C2=A0</div><div>Regards</div><div>Shreyansh=C2=A0<=
/div></div></div>

--0000000000004590d605c1862f73--

