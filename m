Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7B43920A9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:12:52 +0200 (CEST)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyxW-0001RP-VN
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1llyrC-0001jQ-0w
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:06:18 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1llyrA-0002WY-80
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:06:17 -0400
Received: by mail-il1-x135.google.com with SMTP id h11so1866120ili.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=97uix2YaQ8qXPIqE/N3wiBQ9cfxzEr39W3DThYRafE4=;
 b=CAjOShlNOgUlq8OWuKSIj/cRCUIwL6Tw3OxIEfwHuPmQGtvODv27XwAceZ0YJrbtnK
 OhgK/mFKyyynGaBP0GudwrPhkg0jOyHI+2dfJPiCmrdxYxItR5r8hgcDLacaWN1zNbOG
 TrWilDsVv/trLSH0qROoCrPWlgTt1rrL/PP15tsd5Dc4IC1eXJXDzi/J9m76f2OlDs+v
 8AGC9Ok7cII+sQpQc45KkV6nVytdDrLfy5SLWi+ehpGhlBggqJUGFALDaJF6XWKcj1/4
 S2Iccg7zZo84jIQBcv6BW5TdxRCveckZFeK7EuOdg9YoZqVDViOQuFCybprqRfEsnEJN
 htHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=97uix2YaQ8qXPIqE/N3wiBQ9cfxzEr39W3DThYRafE4=;
 b=XYv7aDDrhSlzCFdFkd2N+rDj5NpJURF3c9kiuY9F3IKKW+y5pMNmfvwtpZv8gPRFNJ
 CpFWzAlKpWtAmli5L4SHcDOHZGi0Nj+UeDjaf/goh8XB4jwnyPnOlSF7OitC2e4d+MiH
 kXDSEm/ACoqPGwz37JfZUWh3FEBySshipNefRgN3zho7JKCzM3ZDxDZswnQJA2ws45HO
 eP8vfyPYRu1HqSCFs1p+488vdolYnbnU+YDS99X2GH14kUYMmzscQoGRi8u0TiiNSDhE
 /GhCxuazXhLawie8RcY5ebVlRqc+HQinNG6z8zoruTAJxgRoe2GO2RF9tgM0Ee2KlFCT
 qdRQ==
X-Gm-Message-State: AOAM531DYSU8IQLO4YW9mUumeSW4IpjBFN2ZNIegjjBQfptCdccehu2q
 h43ic3k25fZ6FDghfrOfjSyNHaBBzkOkOlkPLbyi5NdWrMs=
X-Google-Smtp-Source: ABdhPJyGtYr3KrQNRsT0p7UX2QUsQtxQAFtbMMPAzJQCGRkqex19ovKMrdEPcz2Dx7oZdn94MKtlkK4PNvOdjfP0xhk=
X-Received: by 2002:a05:6e02:1708:: with SMTP id
 u8mr31251070ill.188.1622055974777; 
 Wed, 26 May 2021 12:06:14 -0700 (PDT)
MIME-Version: 1.0
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Thu, 27 May 2021 00:35:48 +0530
Message-ID: <CAN6ztm-8A5Dt4xnzO7RM1rSGgsKyy9yB0AwrqQzCK1HVr0Z0Yg@mail.gmail.com>
Subject: GSoC 2021: Request for WIKI account to update project details
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002eba8805c3405619"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002eba8805c3405619
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am Niteesh, one of the students selected in Google Summer Of Code.
I will be working on the project
**Interactive, Asynchronous QMP TUI**

One of the works assigned to me was to create a Wiki page to update the
details and status of my project.

I kindly request the admin to grant me access to the wiki through the below
credentials
Email id: niteesh.gs@gmail.com
password: some_dummy_password

Thanks,
Niteesh.

--0000000000002eba8805c3405619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I am Niteesh, one=
 of the students selected in Google Summer Of Code.</div><div class=3D"gmai=
l_default" style=3D"font-size:small">I will be working on the project=C2=A0=
</div><div class=3D"gmail_default" style=3D"font-size:small"><b>*Interactiv=
e, Asynchronous QMP TUI*</b></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">One of the works assigned to me was to create a Wiki page to update the=
</div><div class=3D"gmail_default" style=3D"font-size:small">details and st=
atus of my project.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I kin=
dly request the admin to grant me access to the wiki through the below</div=
><div class=3D"gmail_default" style=3D"font-size:small">credentials</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Email id: <a href=3D"m=
ailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</a></div><div class=3D"gma=
il_default" style=3D"font-size:small">password: some_dummy_password</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks,<br>Niteesh.</div></div=
>

--0000000000002eba8805c3405619--

