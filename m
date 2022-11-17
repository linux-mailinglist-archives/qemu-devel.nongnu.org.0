Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DF62E8C2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 23:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovnjQ-00007w-JO; Thu, 17 Nov 2022 17:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovnjN-00007j-SI; Thu, 17 Nov 2022 17:51:37 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovnjK-0006pV-8L; Thu, 17 Nov 2022 17:51:36 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-369426664f9so33285527b3.12; 
 Thu, 17 Nov 2022 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SqoGB5jdvmowJ3qhXST5N54oA6J4YoX9EMCdPYrqBkc=;
 b=Wz8slORoEHYSvCVEx1oDwTmz4zG4q7oU7i3GNOlHpXDGu0KGdU5rXZ2klr/x4FcnLY
 Lq5ys9F36TW8v5E5OmazgW/lgWvIJwEqvXr7WZS0OIyXha5jXEELQJ1LjAk2eA/xj0l0
 +AyiQfs7kG3AM9JPaO2CBv8DuVNyE9y+T3GuVIG80TEO/V81wUoTaChVFiFFancSEd2G
 UMXgbLVZMK5oV9myUOz+P9aplJ+Shr1PE+Eqz+mSQVL2JPbVCezcHPi+3FeRiP79UMev
 sOl6yhQXywDvKu/hbrRBAp0S7rZiYS9djl/qdBNO3gLpEbm6kH5XQR7+YAyfUzm0RMDO
 WVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SqoGB5jdvmowJ3qhXST5N54oA6J4YoX9EMCdPYrqBkc=;
 b=h3+tq4ygysWfUDK7yPXyhmHL3y0fMuRPfJC4Y8Hmia1KXq9w5EZd5Vq9KhPPawOjjM
 C+c04DsTlZ1hU+Vw3lGulo8+jZq9jl4Nn1QhSbk8VE3pGLkVNljgh2EHWEfipGaGjOrE
 n+dakHo06r0h+nT28iiQmE09GBA+s1BqKOlS63MYcOzrrnyakuFiI8YQLGYUh/EmwrQT
 GbKydjx0j5NknGAIQrtbwI/NSewgto4h1ZI7yLaBmnZixm8uR4hF/qjpAE57lX3nue9N
 +jEhbLK9McS82O7NzIUk9KWAar1if+JFBJEiduhSyDoHpGrsM8pxdClyWJStWV3Q2tQR
 CoLQ==
X-Gm-Message-State: ANoB5pldPAjARE3VZcSriFagdc//1l0d2TMXnLVvnFaJr0OysIj/d/aq
 eQgGg8hZ6EiNlMjZlaLP470qAJJCAjFifPAtgt0=
X-Google-Smtp-Source: AA0mqf7NNINPQjH+PsPnEEFIEfIvGhVkM9wwqgrAkJpHoDkm7hnlm89vC1iKkgMR43xR7VOIOMACsI8duWQDw3QB3UQ=
X-Received: by 2002:a0d:d202:0:b0:370:1a06:1b4a with SMTP id
 u2-20020a0dd202000000b003701a061b4amr4095389ywd.206.1668725491999; Thu, 17
 Nov 2022 14:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
 <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
 <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
 <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
 <CAJSP0QVPVhCYKw2vT_un3r=L3xhow5E5OX84xp4uoJUb-1=jFg@mail.gmail.com>
 <014101d8fac5$2cad8420$86088c60$@fiebig.nl>
In-Reply-To: <014101d8fac5$2cad8420$86088c60$@fiebig.nl>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 17:51:20 -0500
Message-ID: <CAJSP0QXK=boxdrWgoD9FAkzxH6UK9qKS425km8YHX0FgQfwvHg@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: multipart/alternative; boundary="0000000000002da81e05edb26e94"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000002da81e05edb26e94
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 17, 2022, 15:42 Tobias Fiebig <tobias@fiebig.nl> wrote:

> Heho,
> I gave v3 a shot and it performs as expected; For a requested MSS of 1320,
> TSO consistently uses a 1308 MSS. So for me, this patch works. Thanks for
> fixing this. :-)
>
> Sadly, I do not have boxes to test with .1q around; If none of you has
> either, and that should be tested as well, I can give it a shot in the
> coming days, but it might take some time.
>

Awesome, thanks for your help! I don't have a .1q setup on hand.

Stefan


> Side note: I found the 'missing' 12b in 12b of TCP options being added.
> :-| So sorry for that noise.
>
> With best regards,
> Tobias
>
> MTU1500
> RTL8139: +++ C+ mode offloaded task TSO IP data 7272 frame data 7292
> specified MSS=1448
> RTL8139: +++ C+ mode offloaded task TSO IP data 8720 frame data 8740
> specified MSS=1448
> RTL8139: +++ C+ mode offloaded task TSO IP data 8720 frame data 8740
> specified MSS=1448
> RTL8139: +++ C+ mode offloaded task TSO IP data 10168 frame data 10188
> specified MSS=1448
>
> MTU1320
> RTL8139: +++ C+ mode offloaded task TSO IP data 2648 frame data 2668
> specified MSS=1308
> RTL8139: +++ C+ mode offloaded task TSO IP data 10496 frame data 10516
> specified MSS=1308
> RTL8139: +++ C+ mode offloaded task TSO IP data 6572 frame data 6592
> specified MSS=1308
> RTL8139: +++ C+ mode offloaded task TSO IP data 6572 frame data 6592
> specified MSS=1308
>
>

--0000000000002da81e05edb26e94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 17, 2022, 15:42 Tobias Fiebig &lt;<a href=
=3D"mailto:tobias@fiebig.nl">tobias@fiebig.nl</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Heho,<br>
I gave v3 a shot and it performs as expected; For a requested MSS of 1320, =
TSO consistently uses a 1308 MSS. So for me, this patch works. Thanks for f=
ixing this. :-)<br>
<br>
Sadly, I do not have boxes to test with .1q around; If none of you has eith=
er, and that should be tested as well, I can give it a shot in the coming d=
ays, but it might take some time.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Awesome, thanks for your help! I don&#39;t=
 have a .1q setup on hand.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Stefan</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
Side note: I found the &#39;missing&#39; 12b in 12b of TCP options being ad=
ded. :-| So sorry for that noise.<br>
<br>
With best regards,<br>
Tobias<br>
<br>
MTU1500<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 7272 frame data 7292 specif=
ied MSS=3D1448<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 8720 frame data 8740 specif=
ied MSS=3D1448<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 8720 frame data 8740 specif=
ied MSS=3D1448<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 10168 frame data 10188 spec=
ified MSS=3D1448<br>
<br>
MTU1320<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 2648 frame data 2668 specif=
ied MSS=3D1308<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 10496 frame data 10516 spec=
ified MSS=3D1308<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 6572 frame data 6592 specif=
ied MSS=3D1308<br>
RTL8139: +++ C+ mode offloaded task TSO IP data 6572 frame data 6592 specif=
ied MSS=3D1308<br>
<br>
</blockquote></div></div></div>

--0000000000002da81e05edb26e94--

