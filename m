Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142873A5902
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 16:20:09 +0200 (CEST)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQy8-0001vR-5f
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 10:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsPTt-0002B4-0z
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 08:44:49 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsPTr-0002p3-D6
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 08:44:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g20so11919671ejt.0
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BpDcDyzS52PJCNHfm4QFhFHSYIq/T1frwoFD/U6XjJ8=;
 b=CHidKgT8CAigmkpH9cHxuclBqAvX7E2O3nSBZGLI/P1EKfpaotd/F3KOGQKYL2PNHH
 6Iw2zxOWIEq7hmtLPDzvb6TpiAeJHu2Gj7v3RtcttHSKWDRNO1qmuvVKBXnlcqe8YgMc
 nOQf9IIdpGz55ou22OHkJOaJh1sxVIV2akVIo5OSCzB0MeSYMOJZ/mIR1IWaOFwSOeYR
 kVWzbn1EdNUA3HZ2xjnthP9gy0ZWX9nIKt0F6py6yO4HX3wuuie8LlvFjRjdb13pOGCr
 Ex03F1lgZ2WzVqY3uQnWAp8Lu+Kn13bi3HQODCtFY2EFE4vezc8WqF5hopOaVCFzeVOv
 rHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BpDcDyzS52PJCNHfm4QFhFHSYIq/T1frwoFD/U6XjJ8=;
 b=PBhvgdvwAvUy9qkXeKE5vGooEbUe2++8tw34WQLNqLVcEaWXA1hXaYxirjAhdE4a++
 /2HacLB5a8fSIGUKJouM7/loRTbrbS8P72ARx1ldCQ7iaYkmr6gReNcf976XntkWXmp5
 x3OBSXfbD5ts9ciWCt6Rzbg5EPUA5WOF+/x6GxzKY53sJBSEtpyHMvCnLl24uJXy1Pz1
 mDNYLORhc/CV0TAmt0acEVlCmQcmHG9AiKs1+8WzqbB/4sfY0qwYTmVDCN4Ckdydj97Z
 uthwTf6+a35sSJ5mgCQGAVjkcQdt6HakapIrqU+LnI9O7SHUrixXs7usAHW1RuQFhqXN
 UFPg==
X-Gm-Message-State: AOAM533FA3wJ2bZiVMzu7ohSwCV2LquqZS1QdMHTtf3t90KM/19gsPoW
 d+dbIt5Ro9QPe6JaHdbpKbyPn5YcX/uP7JQemY0TDJ0cw+q++Q==
X-Google-Smtp-Source: ABdhPJwIRLPj/3p2QIpicro3CARTa13smHhEObXXfFv6VEKGm15C379gnQwg0e4acwoBOMZJxsM10itjGSN7x6G07KM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr11143867ejy.407.1623588284453; 
 Sun, 13 Jun 2021 05:44:44 -0700 (PDT)
MIME-Version: 1.0
From: Lara Lazier <laramglazier@gmail.com>
Date: Sun, 13 Jun 2021 14:44:33 +0200
Message-ID: <CANX1H+037CdUQmeKJtzRW+6=9KpCpfbfDHV9Dna2Hq1hbbAa9A@mail.gmail.com>
Subject: [Qemu-devel] GSoC Introduction
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f4d67105c4a51aab"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 13 Jun 2021 10:13:03 -0400
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

--000000000000f4d67105c4a51aab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone!

My name is Lara, and I am one of this year's GSoC students. I am studying
computer science in Z=C3=BCrich, and I will start my master's in September.=
 For
my GSoC project, I am working with Paolo Bonzini on fixing and extending
the SVM implementation in QEMU.

I am very excited to learn many new things this summer and to get to know
this community.

Best
Lara

--000000000000f4d67105c4a51aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone!<br><br>My name is Lara, and I am one of this =
year&#39;s GSoC students. I am studying computer science in Z=C3=BCrich, an=
d I will start my master&#39;s in September. For my GSoC project, I am work=
ing with Paolo Bonzini on fixing and extending the SVM implementation in QE=
MU. <br><br>I am very excited to learn many new things this summer and to g=
et to know this community. <br><br>Best<br>Lara</div>

--000000000000f4d67105c4a51aab--

