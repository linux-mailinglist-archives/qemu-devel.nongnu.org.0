Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C023DBE57
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:26:25 +0200 (CEST)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XDE-0001HO-LI
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m9XCN-0000bo-Vm
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:25:32 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m9XCM-0008Ly-Dk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:25:31 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 48-20020a9d0bb30000b02904cd671b911bso10489350oth.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HdskX8zxdZAM7uLrQ6kx49kV23Wai4M5Kt9JaSPvMq4=;
 b=Kocf4BEQipMTEH24+z18QE7hCnMBtC0gQ5/iy9k6egOubeAxvSWwxyUUQGrr5qU9Pv
 yrIW857572jaMabnJaK2ya267acqDkZbxoMR9MA6Xo2vATr65v3Q3rF4Hxshv1B9Ytzv
 gU/9WobwTkC7VAgLf45+IwHQBTUbP/x0Hwu2LvvfHYbwpLS5635Y7iWGEQh9By6GzFDO
 wYHxRtln/Y5RECA0tgdv35d+gyiRZuX/sT/fPV7eAo8WpqX/PXzgAO37gWszJDT0cgkU
 /Qa+EsG+4z+DsZh+SlBHatBg2F/VXWud3l7jI8LLhfEtNrO5jhtuI3ShFc1EHS+wUJMn
 +2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HdskX8zxdZAM7uLrQ6kx49kV23Wai4M5Kt9JaSPvMq4=;
 b=WMbepderdsKHkDCUQE6CfxGjoPqmA3NmpP0Bcc0Yly2/omLb+9az9hmBua085DDExK
 YAfMtKvoRnsvq8OxWw5xefI+hZAO020AKCVgRf6F9Msa8hDNbVZvpeu640bgsOLuW4VX
 j75qxUnuwj+vgnWRVnlBFFIu1Jpq/EgczHpo+8nYVRoJUmYhvPG2z1rR89yjcryh79aA
 wW/m5OqsXKimUyLAUToNerz9YoM86IjrRzc4QiQKhHCW7YZuHWdDvOcPzUFcfr4fqZeE
 ifKr4RsBxrK0se0vuTOz2vpUDzR2dZome4oPTkMlehoktFe5NH/4A+jZKsOVHctSq33e
 VjlQ==
X-Gm-Message-State: AOAM532Gzom1+iZi4giu29wQE/mfAYOmUn9iXEGW1Rkc4jKsBo5crrBa
 zqi6iA4sYWHSN4fln2g7qZdVyD6w3T44akYjBFAYiCoUGgE=
X-Google-Smtp-Source: ABdhPJy8SwxsMOu/Abjr77YLHyEovzh93DXeG+GSyz8n/4tqjEi0tudm7cYDFHLFlhk+/EVeObmGTuPHByyBbt4xE6s=
X-Received: by 2002:a9d:3e06:: with SMTP id a6mr3130001otd.50.1627669527499;
 Fri, 30 Jul 2021 11:25:27 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 30 Jul 2021 14:25:16 -0400
Message-ID: <CAK7rcp_FEt15q5kdYp2mTuP1SdiEZ=vRssYoX_Ba1CKeMyf7WA@mail.gmail.com>
Subject: Misc questions
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ffb8f305c85b5719"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ffb8f305c85b5719
Content-Type: text/plain; charset="UTF-8"

Hello,


I think I need a concurrent radix tree that is written to work with atomic
updates. I would like to ask if anyone knows of one within qemu? Or at
least to efficiently obtain the page address/mmu index corresponding for a
given address.

Is there any documentation on cpu_mmu_index? Each target provides its own
implementation, but I find it hard to gather what is expected of this
except to read all of the references in the periphery.

Lastly, ok I have a working build going and it runs without crashing. But
when I pass it my image, all it does is show the qemu shell prompt,
"(qemu)". I'm not sure why it doesn't start running, I think it should at
least encounter new opcodes and then stop. Can anybody think of anything
that I might be missing?

--000000000000ffb8f305c85b5719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div><br></div><div>I think I need a =
concurrent radix tree that is written to work with atomic updates. I would =
like to ask if anyone knows of one within qemu? Or at least to efficiently =
obtain the page address/mmu index corresponding for a given address.<br><br=
>Is there any documentation on cpu_mmu_index? Each target provides its own =
implementation, but I find it hard to gather what is expected of this excep=
t to read all of the references in the periphery.=C2=A0</div><div><br>Lastl=
y, ok I have a working build going and it runs without crashing. But when I=
 pass it my image, all it does is show the qemu shell prompt, &quot;(qemu)&=
quot;. I&#39;m not sure why it doesn&#39;t start running, I think it should=
 at least encounter new opcodes and then stop. Can anybody think of anythin=
g that I might be missing?</div></div>

--000000000000ffb8f305c85b5719--

