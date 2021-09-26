Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C341896A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 16:24:09 +0200 (CEST)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUV4Z-0004gg-Oq
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 10:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohamedatef1698@gmail.com>)
 id 1mUV2w-0003Aa-3N
 for Qemu-devel@nongnu.org; Sun, 26 Sep 2021 10:22:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mohamedatef1698@gmail.com>)
 id 1mUV2u-0001WW-J6
 for Qemu-devel@nongnu.org; Sun, 26 Sep 2021 10:22:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id i23so43887307wrb.2
 for <Qemu-devel@nongnu.org>; Sun, 26 Sep 2021 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=djioIIJ+q7ekstzSPL1b+y3KUjJqxpb3NLLkT859Ngk=;
 b=QHBxKkbmnsSXGJYvGry0UDHt0WB/xcF83mxx2F5aw3Ro9bDJR7Hj1rVeWwT7f+b4PM
 Hid5bttPnh2U3nW7iBnNIkmk7Pg5TspoHwoX4ZUuYFY69ImI/dJUf4gKA6WpDCSAZDRy
 f1ZXWK+dOoN6v+E3fG6/SDls95NiWHMmzf3x6rctp7u2vYZW1KLqeFzD7KRdz01L4Fvz
 OGKGuoWSu5K9+jp+GVgjJG6YGDShMAwNmY3c4upYpWa0WntMUumNWgWJtAtLsOekNoX+
 DH2jgjciQCla24hVJrhRzIz46kIcQRGsLbG9zL99mOor37tkG4ouInk4dU/iQ3YMlqVs
 nPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=djioIIJ+q7ekstzSPL1b+y3KUjJqxpb3NLLkT859Ngk=;
 b=4LhS9dqRkm33JC0MUXI2fnFp7bNY/gkkEn9XsEnYKe/RIh6nUbMq9s3f7A9YBF4IFj
 7WYLFrha5/VQAxWOQzC7KIAbKzHtlRf2nPGfrlT3O+2iE44YNCU91Io3FwKH0VONg3yr
 sEAaWhAQiX+yG9UILijFYRZdGY97PZUIwO9FFFX+dtlx7FzFI1enRh3Yi7tPOx7O6QBg
 oYJXrY38YQcMxEp/7z57A9IpvrjepfxEqUg0Op55mruFZ97qonBs3noib/AsrLMCUYef
 weqX4IWZ/tfDg5DAqH+9Qdu3z+RiwBSty8kq8R9VmejcuJ7p16TTeK1nJlUEaNwHR5Si
 pyDA==
X-Gm-Message-State: AOAM530/LUfZFBUpaCKX+jDd+gXj/B3jW+BN0I9iFdTxuzJfmaLZ6HNY
 o9oR3V4nXstyl06sabqmosX0l3L/PkO46u8GMYG5X95YAXhm0w==
X-Google-Smtp-Source: ABdhPJyWb8ZwTn110H99oR6YkCRl4PD7ygEZxvZuj8pvZ/jih4f/VgbLqjVxW8OdVrp3BkLorqnXSVLixKgaiUKe2Ws=
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr11789681wmj.121.1632666140744; 
 Sun, 26 Sep 2021 07:22:20 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Atef <mohamedatef1698@gmail.com>
Date: Sun, 26 Sep 2021 16:22:09 +0200
Message-ID: <CAPFh8N+Q1_PXtq5YM--X=f+AoJNYhvCLJ7NSqHaw=g6eLP5QOw@mail.gmail.com>
Subject: Development request
To: Qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005b24e105cce6b5b0"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=mohamedatef1698@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b24e105cce6b5b0
Content-Type: text/plain; charset="UTF-8"

Hello there,
We are 6 students from Egypt and now We are in our last year and We need to
build a project as a graduation project.
And We are interested in the area of runtime systems, operating systems and
compilers.
We are going to work 40-60 hrs a week
Can We help with some tools you need as a graduation project given that We
have a professor to mentor us.
If not,
Can you suggest some tools you need to build and We will work on it.
The project takes one academic year

Thanks

--0000000000005b24e105cce6b5b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div dir=3D"rtl"><div dir=3D"rtl"><div dir=3D"rtl"><div di=
r=3D"ltr">Hello there,<br></div><div><div dir=3D"auto">We are 6 students fr=
om Egypt and now We are in our last year and We need to build a project as =
a graduation project.=C2=A0</div><div dir=3D"auto">And We are interested in=
 the area of runtime systems, operating systems and compilers.</div><div di=
r=3D"auto">We are going to work 40-60 hrs a week=C2=A0</div><div dir=3D"aut=
o">Can We help with some tools you need as a graduation project given that =
We have a professor to mentor us.=C2=A0</div><div dir=3D"auto">If not,</div=
><div dir=3D"auto"> Can you suggest some tools you need to build and We wil=
l work on it.=C2=A0</div><div dir=3D"auto">The project takes one academic y=
ear</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks</div></div></=
div></div></div></div>

--0000000000005b24e105cce6b5b0--

