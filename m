Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9030A999
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 15:24:59 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6a8Q-0005OM-EK
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 09:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6a72-0004vC-L4
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:23:32 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:44326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6a70-0002LB-LO
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:23:32 -0500
Received: by mail-qt1-x833.google.com with SMTP id h16so11196758qth.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=MlvNxTSdnWHPLH3pIu98nenqfJ2zzAV90rm+9964cYA=;
 b=N1nHH1VH3PderhTJWPemMIM9rQg6juySkPu8fe9nPrDoQaLHQ0f+4MvxQN0WYhcP+F
 YQnAe9mcWH+lc832O0kxpd9SSdsrUBhsoFbjna845ynFePEcR7QlgYq/TtN27Qko6OaQ
 W0kaNbkZ+bTGNnm31aOuapxxM/qXq0IvaOcfeMDgi3khGqAvPhP29dScfbXdfomlsXRZ
 3aPgrPKMz8wdlAkIwc2I0krbnd8wvg19/89pBygz2w9DPKeNzsRQiRsC8SbQgKBj9sxv
 mY9WUWrg4XXf49TZswCiBQUrNrEn3eMIOAO/LNPwZ8ZAKR9IwW1dPJ8cCpyJFGqquuEz
 j2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=MlvNxTSdnWHPLH3pIu98nenqfJ2zzAV90rm+9964cYA=;
 b=hZHniR3BhhQDNPqrqsbLtX3ivhmOUyp32QyOwFkD1382hZIk13OTXi6FVuM741ZyGY
 GnlmCoHjkoZavC6Lyzzfc33hEdukmAyhRoB4p4I2E5kHcHuY26velPGYWUA+O9BMVnl0
 lVPR62bPktD+nV5OZDYxFWctqRn+TMf4bzy2pTbScABH1DCfNYbkndQGyAH9hMPp0MCL
 tDq1MqERWKtYuVEyzSdXVgAHzMYvvvQXyM2NpvOVZKwS+IMbLLWZKjIEof8HDbnwWDOw
 ctN7pjMPnwF0lJlqzdZBp4zho7w0Qipd27aWVdlBsOgPrnanVhn79I0o3qqdAqQjQbol
 yZow==
X-Gm-Message-State: AOAM531FuakUzcnvdJtxSkSaKQSxnkFjb1acFk28j4AmIdp2tQkMePeq
 BHDSwA9CzXi7vPcGrk25mXQ=
X-Google-Smtp-Source: ABdhPJylkqnS8pH716Dnyr7k8bNs/i5AEl15pQDbJeb+J2P006MsiZK0U2UZ8UTIOupfKqFELzvpIQ==
X-Received: by 2002:ac8:7599:: with SMTP id s25mr15636471qtq.89.1612189406552; 
 Mon, 01 Feb 2021 06:23:26 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id c22sm775759qtp.19.2021.02.01.06.23.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 06:23:25 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Makefile has local changes that will be overwritten
Message-Id: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
Date: Mon, 1 Feb 2021 09:23:24 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ddstreet@canonical.com
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When trying to build QEMU I see this error:

error: Your local changes to the following files would be overwritten by =
checkout:
	Makefile
Please commit your changes or stash them before you switch branches.
Aborting

What I do to see this error:
./configure --target-list=3Di386-softmmu

I did some bisecting and found out this is the patch that causes the =
problem:

commit 7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8
Author: Dan Streetman <ddstreet@canonical.com>
Date:   Tue Jan 19 12:20:46 2021 -0500

    configure: replace --enable/disable-git-update with =
--with-git-submodules
   =20
    Replace the --enable-git-update and --disable-git-update configure =
params
    with the param --with-git-submodules=3D(update|validate|ignore) to
    allow 3 options for building from a git repo.


My Info:
Mac OS 11.1
Arm64 CPU=

