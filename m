Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5B394FE5
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:44:09 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnFBB-0003b2-3f
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF8k-00018L-5q
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:41:38 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF8Z-000644-0Z
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:41:36 -0400
Received: by mail-il1-x12c.google.com with SMTP id x9so2110301ilp.4
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RJRiWLuGvNyjVYDJ6M6c26f22iqJtUwuZ4YLodH63C0=;
 b=rh4FU60VG1HTBxy8qKv+Cq7iV2v+esjlNuT/wTu3fX4vZ59K/FRW+AQ/pVRZFvj20y
 4Imcfewh9Jr4Ih65IXIy/SbOs7Z3cLkH0t4Gs85y0ZfkytPx7JxBHFN4XovRYZl4aNBb
 2Y+pMRt1LY6FVIbR5/4QheuggjV5cN/W0EcHF5eGXhvGuEG7tQmzbEWLl1wTbUprLO1H
 L3fFv/kWAIhrOp9SodtHFmBNHhRHMmAgGV8bG3d8xZ/Z2vkMmrmvV7g6IwOppnAagl8q
 BqgOc015kn+jSSKolc1VbBDPV6XJ4UHDpzpxD0H82aWqzaeIyt3xzXn6qxcFGQTpMzli
 HGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJRiWLuGvNyjVYDJ6M6c26f22iqJtUwuZ4YLodH63C0=;
 b=YStbrircU8dAqlLyF/Dfc5FqDAazOCZdl/OeDwmQK5EwdOb7sl0cKzeq/xnPWYjwMo
 Bm42EmPC6Ak9diODkm5zQ3Fd96a3Zks/1PedXBqjnHLEAA/SQTDxMAjm9e7dtQAFPKwE
 Y6aUOTgudVxMIg24D5XhPkriVWwCy2J3pWhxrpijFHSgUX8IYJrkzMhM7lsxn7g80Lki
 REsreHsNt31oyBfycQBsGJrbpdEjhI+1EMvJGWw1qY3JF6yw0zgJamxJqc+3ei/xfiZe
 yLyiQofhWd/+/8YH0QgVIhls+Ol7JfuzfNK8ibifMUoQo3Ddy2fjWSEZbN9BsMzcv8RQ
 UrRg==
X-Gm-Message-State: AOAM532z++QZTqlLUGOAcsny6nKlTCnHxZem3nXTpRt6h7qsSQ3jvomq
 f9bsjHMv1sG7kQ/Gnxzf/K5qrQNPBKRImjaGNWc=
X-Google-Smtp-Source: ABdhPJwWzRR4oCG+Zfx9/Vclo/hDK+dihKsnuJyngrwXXwlCaG61sYo5HqutjoSVfsNFScW+4khrVCOu1wCaktaRXT8=
X-Received: by 2002:a92:c52d:: with SMTP id m13mr12189523ili.191.1622356885794; 
 Sat, 29 May 2021 23:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
 <31a9b076-03dd-0b79-1657-6f6b6d3c7bef@amsat.org>
In-Reply-To: <31a9b076-03dd-0b79-1657-6f6b6d3c7bef@amsat.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sun, 30 May 2021 08:41:14 +0200
Message-ID: <CAD-LL6gYZFJgda4rg7gZ=xZ1CCGzuc3V=DyPggXsH6PNq-jYCg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Cache modelling TCG plugin
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e0768e05c3866551"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e0768e05c3866551
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, I'll also CC Emilio in the v2 of this series.

On Sun, May 30, 2021 at 8:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Cc'ing Emilio too.
>
> On 5/29/21 5:22 PM, Mahmoud Mandour wrote:
> > In this RFC patch series, I propose an initial cache modelling TCG
> > plugin. As of now, it models separate L1 data cache and L1 instruction
> > cache. It supports three eviction policies: LRU, random, and FIFO. Once
> > a policy is chosen, it's used for both instruction and data caches.
> >
> > Mahmoud Mandour (3):
> >   plugins: Added a new cache modelling plugin
> >   plugins: cache: Enabled parameterization and added trace printing
> >   plugins: cache: Added FIFO and LRU eviction policies.
> >
> >  contrib/plugins/Makefile |   1 +
> >  contrib/plugins/cache.c  | 595 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 596 insertions(+)
> >  create mode 100644 contrib/plugins/cache.c
> >
>
>

--000000000000e0768e05c3866551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, I&#39;ll also CC Emilio=C2=A0in the v2 of this =
series.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, May 30, 2021 at 8:36 AM Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Cc&#39;ing Emilio too.<br>
<br>
On 5/29/21 5:22 PM, Mahmoud Mandour wrote:<br>
&gt; In this RFC patch series, I propose an initial cache modelling TCG<br>
&gt; plugin. As of now, it models separate L1 data cache and L1 instruction=
<br>
&gt; cache. It supports three eviction policies: LRU, random, and FIFO. Onc=
e<br>
&gt; a policy is chosen, it&#39;s used for both instruction and data caches=
.<br>
&gt; <br>
&gt; Mahmoud Mandour (3):<br>
&gt;=C2=A0 =C2=A0plugins: Added a new cache modelling plugin<br>
&gt;=C2=A0 =C2=A0plugins: cache: Enabled parameterization and added trace p=
rinting<br>
&gt;=C2=A0 =C2=A0plugins: cache: Added FIFO and LRU eviction policies.<br>
&gt; <br>
&gt;=C2=A0 contrib/plugins/Makefile |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 contrib/plugins/cache.c=C2=A0 | 595 ++++++++++++++++++++++++++++=
+++++++++++<br>
&gt;=C2=A0 2 files changed, 596 insertions(+)<br>
&gt;=C2=A0 create mode 100644 contrib/plugins/cache.c<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000e0768e05c3866551--

