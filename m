Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22669368633
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 19:49:18 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZdS0-0002d0-Q9
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 13:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minyihh@uci.edu>) id 1lZdPw-0001vV-Mg
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:47:08 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minyihh@uci.edu>) id 1lZdPt-0001sI-Im
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:47:08 -0400
Received: by mail-il1-x129.google.com with SMTP id l19so34693337ilk.13
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uci-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZHDN1V9Dn1zLqYEM1M9fB4ZcgOYkRzZB9EE1FxKUVKY=;
 b=Wqvpy2EutWULMvNtvgihHugaurrhi7qDWdM/ytNNV+qtbYC0nGV32T7Rbe3xq5gDzY
 lSDpTW0axuz4iPZMyYE6soH7KwyC0YCA8HVJs73HopljoyrCPKRpM3o5muS0/cNXcteY
 K/dlfwNpPefASzuVK3K9/CEa6pnhqlf2ucMLiaI74ZXcRf6FhBMpxcGmSAKjY7833IfM
 6FVPAeDsthgkQ7us9y7IyDd5LCqZBbPx2sk1IdfEZbaOuTbLFPGqSEKsvNCX0vrEYL2k
 Pzqepqk63I10YxjfOsPyWGHWu/Exaeuba6nCbnYT2MhkPgPjd/Dj/y9G3u30nj0GCFiw
 Zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZHDN1V9Dn1zLqYEM1M9fB4ZcgOYkRzZB9EE1FxKUVKY=;
 b=pDPZO/j3NFXGi1GFGEvuweqCGAfULBsWNTBqLBi17Tc1hKNa7uFzCfAQE/Z8yvGNyd
 S+0jHiecceUfHuOsW0CQMXE7kag5p/09iUoWOALxiMRWTiRMqBIHRMruGvZ7AiuPS+F5
 azhWbI9EHi7iMA8o/WZUv588SgV32ZFvjrWPl+5XlH1D2VGU3RGocmW+Vs665ei+VGWa
 rZ/VK2gpgimrBv8PvXTZ/vpAgF5ua6Cq7encDFPjMGWP6IHXo+R01Q4BbjHwrt3TtxxX
 jNLFczHEGMmJxDnSD4wSCTgknDrgwO3Ivw9OV1BzL4K3C1KaW6RR5Lghgg+LPZN9R3AG
 MITA==
X-Gm-Message-State: AOAM532VCsFiCJpgS//CdmUDj6Jg8FGWx2tFfq/dmfpAZswnB4I7010k
 RgipL7fmYuqX65HCjP97Kumk1d2+Nkn1aEXaxvrexg==
X-Google-Smtp-Source: ABdhPJzlbHfdPmwVGRXCg5/UC01OGYzUv5yKn47EymVrf25Qo2bQUMdoXKE+Lgva8o19MvUZwbfPk3mIHcmNTyB6BDQ=
X-Received: by 2002:a05:6e02:8f0:: with SMTP id
 n16mr3703373ilt.7.1619113619786; 
 Thu, 22 Apr 2021 10:46:59 -0700 (PDT)
MIME-Version: 1.0
From: Min-Yih Hsu <minyihh@uci.edu>
Date: Thu, 22 Apr 2021 10:46:49 -0700
Message-ID: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
Subject: [RFC] tcg plugin: Additional plugin interface
To: alex.bennee@linaro.org
Content-Type: multipart/alternative; boundary="00000000000028a89605c09344e3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=minyihh@uci.edu; helo=mail-il1-x129.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000028a89605c09344e3
Content-Type: text/plain; charset="UTF-8"

Hi Alex and QEMU developers,

Recently I was working with the TCG plugin. I found that
`qemu_plugin_cb_flags` seems to reserve the functionality to read / write
CPU register state, I'm wondering if you can share some roadmap or thoughts
on this feature?

Personally I see reading the CPU register state as (kind of) low-hanging
fruit. The most straightforward way to implement it will be adding another
function that can be called by insn_exec callbacks to read (v)CPU register
values. What do you think about this?

Thank you
-Min
-- 
Min-Yih Hsu
Ph.D Student in ICS Department, University of California, Irvine (UCI).

--00000000000028a89605c09344e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alex and QEMU developers,<div><br></di=
v><div>Recently I was=C2=A0working with the TCG plugin. I found that `qemu_=
plugin_cb_flags` seems to reserve the functionality to read / write CPU reg=
ister state, I&#39;m wondering if you can share some roadmap or thoughts on=
 this feature?<br clear=3D"all"><div><br></div><div>Personally I see readin=
g the CPU register state as (kind of) low-hanging fruit. The most straightf=
orward way to implement=C2=A0it will be adding another function that can be=
 called by insn_exec callbacks to read (v)CPU register values. What do you =
think about this?</div><div><br></div><div>Thank you</div><div>-Min</div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Min-Y=
ih Hsu</div><div>Ph.D Student in ICS Department, University of California, =
Irvine (UCI).<br></div></div></div></div></div></div>

--00000000000028a89605c09344e3--

