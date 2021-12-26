Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A503447F4CF
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 01:21:26 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1HHx-0000e5-GL
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 19:21:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HGE-0007bB-GO
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:19:38 -0500
Received: from [2a00:1450:4864:20::529] (port=43536
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HGC-0003TD-WC
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:19:38 -0500
Received: by mail-ed1-x529.google.com with SMTP id o20so46765411eds.10
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 16:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWwMHfeqVF7UV/QYn0hc5EllJFAzn/CvusOlzHleRf0=;
 b=XnpcSL0dDgwyxCsICgw5B9zZEAW7i7ibVNTWNzyveqsCEQ3miSkFQFDO6Q1xXZBuLk
 8FCvHo9wIfFuQRm1OmVHSFtx1ftI+QEG5TvShgF6uYk+6foQ/gvilQjM8hbdbcX0ANOR
 TTiZ29kQ1hA4SrE0G8HvMqc2FNLq+xb++KrXk/WVHiuSlulsTxuWDk39b3NyoUlc0O7M
 rDDj2y2BW6XI55tbq0qsbyzcJQ/lLaL38/W5GexcF0jo4mNJYSDtsaxsY9muMDjRaIUv
 l2W0++Gkft8byDdsph31ktD4mIB3m5nuPyUCF1JBFHiRPqKT6U307RrzwAHbgjJRPiMW
 rrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tWwMHfeqVF7UV/QYn0hc5EllJFAzn/CvusOlzHleRf0=;
 b=2gL+TYe3t70KxSIGRhzfVugZoWaEF4DoePkzsrIfhtKt766KT1hqdV1UH2m7VRwzKE
 6WCyTEgTumQJyRnoz2DMy5OyH1lsw4LMMEjF8nIhTLeQyxJnZqICoUGS87t65cpheoYc
 Yz6ZxieFdUKrI9e1uLLamJNy/3lfs8D/Npm4jeHhsvPLUOzoyvRdLQJzRHzZbtWSe0U2
 buIY4kL6xg+xEsYbKz6NBzts4aCuu02C3eKlHOd+T///UKz2opy7p1ABIu7daNKn2y9E
 d9ra28RaVmdtz170jv/d04TiVgzd5p5+0dcQd1IuMBrgiTrBwl9jfzbVqkKihYkmQpNL
 2Jwg==
X-Gm-Message-State: AOAM532v6NTtnou3oblG80kAK9C3bmrII25V3iT41BciEJRn4f+JKewL
 E3KGwFtX7l8wS1fz1fMVLlGe7ICFhC7U0w==
X-Google-Smtp-Source: ABdhPJyBNwb5R0p6s4CCQsL9gHxHo5QujMS2wckycp8I/gYlosuEY1rrycG+ebkMCeTJzFxrEiZShw==
X-Received: by 2002:a17:906:dc94:: with SMTP id
 cs20mr9171658ejc.316.1640477974446; 
 Sat, 25 Dec 2021 16:19:34 -0800 (PST)
Received: from x1w.redhat.com (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id jg34sm3841001ejc.74.2021.12.25.16.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 16:19:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/tcg/mips64el: Run float tests
Date: Sun, 26 Dec 2021 01:19:29 +0100
Message-Id: <20211226001931.3809249-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test doesn't pass, so I presume there is a bug in our model...=0D
=0D
Based-on: <20211224035541.2159966-1-richard.henderson@linaro.org>=0D
https://lore.kernel.org/qemu-devel/20211224035541.2159966-1-richard.henders=
on@linaro.org/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/tcg/mips64el: Add float reference files=0D
  tests/tcg/mips64el: Run float tests=0D
=0D
 tests/tcg/mips64el/Makefile.target |   2 +=0D
 tests/tcg/mips64el/float_convs.ref | 748 ++++++++++++++++++++++++++++=0D
 tests/tcg/mips64el/float_madds.ref | 768 +++++++++++++++++++++++++++++=0D
 3 files changed, 1518 insertions(+)=0D
 create mode 100644 tests/tcg/mips64el/Makefile.target=0D
 create mode 100644 tests/tcg/mips64el/float_convs.ref=0D
 create mode 100644 tests/tcg/mips64el/float_madds.ref=0D
=0D
-- =0D
2.33.1=0D
=0D

