Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FAA3F0E57
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:42:49 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGUGm-0007SH-P5
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGUFk-0006m3-7O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:41:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGUFh-0006PY-MR
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:41:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f5so5842286wrm.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HS4bNPaXD8ZxQw5JMQbah4PSCQWSaFSo+KyQhmY8SLg=;
 b=mC9q7Hc5IMaNh2kt6yG9daybalvbX959KJ1XQhz3zS//2cxuFszFFtq19PM87y5Lm/
 oaaFO42mCkg6Zlax5UQeLBms3trAcYpGNTxOYK0wKqqRBA8ugllI2g4SFdYvUremCKhb
 ixSK8rT5/qB0rfQ6zBOBy1/5KQMawDAAS4Jy2NWxJnZlnTwmwZUwvmT8K73p7lTjZluB
 D9eMfRYZo66lcvXCSmqUwZvobclAVylibGB1l9sgQG6+z7I9TDK2hOvMf6ZKf93Fog0M
 7IgYjW0whXhbkWxlIiTfghUZxCyCSzfYRqn8heMIdabKUUnqfczegJaIKZF5tMyr42Hl
 GoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HS4bNPaXD8ZxQw5JMQbah4PSCQWSaFSo+KyQhmY8SLg=;
 b=qey3EKnEo9nxcrsxhxyLUSLIykCKJZ1N9z32QXMk5Nw90R8DKNEy4xhoFK0y0EdJV7
 LnSUedxuL1Ar0yYX/XUgueRXdtvogexFZLS/6DOTh9USMZEApm4nJbTgTeDTzj7I684o
 9++4/j6yEcj5YHMKg5y8EeuAVFGdBl8bMkDKdjqo8LY6t/8+qy1ClS3Zd86cPhO1qv9b
 aY1h9TvVG3JVwPtP534IDi7ku/jbZ1+FDqReOkcb6rEQZwHKG+X+yl+ARUHu0vkFlw9e
 +p+XGV2U8ymnJqXBcPuHISLn4+IIjv3rWfiXmj6GZ5LrdQ15Pq+xvCLpr14w3Elg4MMp
 Tg1A==
X-Gm-Message-State: AOAM531vVLeEfcJ2LZy8YwvCc0CTrdPqaI+yJbrOCoyE480cwXgK2Nyw
 0fXNzY2zhgua1QMKRE/JwAXQzRWZosjOPppNquoAnw==
X-Google-Smtp-Source: ABdhPJw296wU8gqTSMsOl8mWsqfoWMJbvVCytaDP3nN/eXIqmivHTeuW/jZlQojohZu9u6eHNx9/c+FM5Qr2hRxZLFE=
X-Received: by 2002:a5d:4bca:: with SMTP id l10mr31380wrt.187.1629326498900;
 Wed, 18 Aug 2021 15:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
 <20210818203233.791599-2-philipp.tomsich@vrull.eu>
 <a03ce617-6bc6-0b23-e7d5-65ab03ea7e7e@linaro.org>
In-Reply-To: <a03ce617-6bc6-0b23-e7d5-65ab03ea7e7e@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 19 Aug 2021 00:41:28 +0200
Message-ID: <CAAeLtUD-5Rv6Sc8mR-f2PHHSVyasAEn4z8TK1-bwsirks3+Qng@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000030bf6005c9dd236c"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030bf6005c9dd236c
Content-Type: text/plain; charset="UTF-8"

I will provide a v3 to restore bisectability,

On Thu, 19 Aug 2021 at 00:39, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/18/21 10:32 AM, Philipp Tomsich wrote:
> > +++ b/target/riscv/cpu.h
> > @@ -67,7 +67,6 @@
> >   #define RVS RV('S')
> >   #define RVU RV('U')
> >   #define RVH RV('H')
> > -#define RVB RV('B')
>
> This patch does not compile by itself, because RVB is still used in
> insn_trans/trans_rvb.c.inc.
>
>
> r~
>

--00000000000030bf6005c9dd236c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I will provide a v3 to restore bisectability,</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 19 Au=
g 2021 at 00:39, Richard Henderson &lt;<a href=3D"mailto:richard.henderson@=
linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 8/18/21 10:32 AM, Philipp Tomsic=
h wrote:<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -67,7 +67,6 @@<br>
&gt;=C2=A0 =C2=A0#define RVS RV(&#39;S&#39;)<br>
&gt;=C2=A0 =C2=A0#define RVU RV(&#39;U&#39;)<br>
&gt;=C2=A0 =C2=A0#define RVH RV(&#39;H&#39;)<br>
&gt; -#define RVB RV(&#39;B&#39;)<br>
<br>
This patch does not compile by itself, because RVB is still used in <br>
insn_trans/trans_rvb.c.inc.<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000030bf6005c9dd236c--

