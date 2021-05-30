Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C8394EE6
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 03:25:32 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnACn-00020e-B0
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 21:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shehab.badawy002@gmail.com>)
 id 1ln9ry-0005VS-F8
 for qemu-devel@nongnu.org; Sat, 29 May 2021 21:03:58 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shehab.badawy002@gmail.com>)
 id 1ln9rx-0001xm-1r
 for qemu-devel@nongnu.org; Sat, 29 May 2021 21:03:58 -0400
Received: by mail-lj1-x22b.google.com with SMTP id bn21so2824791ljb.1
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 18:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SHLmVBVkVKW94wB188wQ3Zte8trcZgeAioXglsz3iLg=;
 b=B+Ac8YBOee65Tmd96kheeCQMN1UU5E+OY0f+2k2I+8r4MxWFG6F97cE0agVYkf96Zq
 NThaklJnJ8k0Rlvfc/CAoG2Fusz9IPtz/TrWjBJESyE++XwcY34pdODXAwrlHdN4wrpG
 uRrqLY4SuiJg7iM7ezehOI5Orslb31l1iMsouSZ8Z0ez9NLfpGTm2j68DtCumNo49LY+
 m7yF6Tfpei2j6m5gLJzZz9NqoXaOhv+pVwYEgOmYFg39dORkNXLQLBy95M1YvEmBr84O
 z+7QSEW/ccw7zOKRYNEF3vGDGtWY3n+0PrukFP1kLIhGQXQAOXImnBG+FklIlqeHnRUv
 an1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SHLmVBVkVKW94wB188wQ3Zte8trcZgeAioXglsz3iLg=;
 b=Qn9dOFaeJNDGIKhyCo1SUHolvXlR5EJRyLcdrx78wF641H1xiGOtvRm0Qode5zMoFd
 5VNxMUvfVOPlEZWo0o66lOb38di/5dDR4/1sX4Tz6Hlhut8sNslGyfKVr135soNIxu3F
 PPWbMZYURBL8X/acNtxKW7FXw0uWBGnLLgDLuD726RnFXMrxlteiTtEGZ4JRvHu8sEJ5
 a9lAlAelWXWeUUq3nNdQZup09MKwUWceA8ibSLm9NSSowj3nehelUMTmwmCmaFV24uQ1
 VdXStwmfQ0//Q/CY61O07wxZnwhylBDkvdUGpVrZqGDbFvmoNhaeKQpWX+FayKzYnmiV
 hS3Q==
X-Gm-Message-State: AOAM531kNziYeC1mSXxYyCrykREb2yxZB4rDITQFUrvoZVIZSCpR3TRI
 YtS1eNR9rxRiYmGraKwhr81nGBqhz8bs4k5yNi8yy4pE7vs=
X-Google-Smtp-Source: ABdhPJxMNgwrEGbtYXSFhWt8N6/bM9dOmKwGzvYlI8hcsh56Qe0otAspLV1IoHepguZNWITsyzqOi//f/hOAvpzR9LM=
X-Received: by 2002:a2e:b806:: with SMTP id u6mr821261ljo.249.1622336633977;
 Sat, 29 May 2021 18:03:53 -0700 (PDT)
MIME-Version: 1.0
From: Shehab Badawy <shehab.badawy002@gmail.com>
Date: Sun, 30 May 2021 03:03:43 +0200
Message-ID: <CAHfWo0OByqVADs3Sa36cvBg0stdQ=yo-H=hJKAd5TYVq0-eysw@mail.gmail.com>
Subject: Google summer program
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c63c6105c381aee8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=shehab.badawy002@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: 59
X-Spam_score: 5.9
X-Spam_bar: +++++
X-Spam_report: (5.9 / 5.0 requ) BAYES_99=4, BAYES_999=0.2, BAYES_99_FREEMAIL=1,
 BAYES_99_HTML=0.6, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
X-Mailman-Approved-At: Sat, 29 May 2021 21:23:58 -0400
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

--000000000000c63c6105c381aee8
Content-Type: text/plain; charset="UTF-8"

Hello i just saw the application you are developing from google summer of
code and i'm curious about it
what prerequisites that i need to learn so i can contribute in the
application
thanks in advance

--000000000000c63c6105c381aee8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello i just saw the application you are developing from g=
oogle summer of code and i&#39;m curious=C2=A0about it=C2=A0<br>what prereq=
uisites=C2=A0that i need to learn so i can contribute in the application=C2=
=A0<br>thanks in=C2=A0advance</div>

--000000000000c63c6105c381aee8--

