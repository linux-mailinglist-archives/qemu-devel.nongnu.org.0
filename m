Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7E30AB66
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:32:42 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bBx-0000oa-KL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bA0-0007uo-Tu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:30:40 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:32839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6b9q-0007pB-NA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:30:40 -0500
Received: by mail-qk1-x72e.google.com with SMTP id x81so16582945qkb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qDvxA4lJ1dDY5/TH9J0skQeKTpW2H5zswH3pS1Aj9E0=;
 b=qHWu16O9H9gKV8CrXrgctb43qn2HChVUDWfCS2JOa1ofiPEOvabAYQzJ273OltKHcP
 nAAfuAajJeoS5AkhwmOH0cqbr7iSz6Rd6NnfGLmPTReyQllngPoylfAPZ4aie2b+nQMH
 mVXU4+sAgiue1N/xG95PdjxKAe+QpS6Epv3PkODspbT3WEPYmldo/5CvxRrI79KtHIO/
 F4JA6HhgavnwG4LdgyhjL4OvIg+zleAC9sDdm13VIM/fVrq9KRNzyqSG1aF6XsRCgCYK
 ATQbdyJ245jqaL8uN6XfsQgZRzPieXtfC7InlFjZ1D9G1w2XnsdK7Mkkla7gbVxoMBo2
 AiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qDvxA4lJ1dDY5/TH9J0skQeKTpW2H5zswH3pS1Aj9E0=;
 b=YaR1ysMm8qP2Axba2uJSb6PmSJrYK4gkse2jgriMaTV/Y5rMOV9RLT57zEgspdtkMP
 HQO/GOUtLsaniP0ewJiD85LovK3QWG6srnizhSocEHRZRTDpbLpXJUSbDq4yQtMSHNyQ
 7dWbw6Vx6Ww6s7T2MsQlrLi5SN00BSB1gMM0WsprpKDmiPYunj2n0OMRAvAudD+x1xRY
 6l6J0f3+tgl2iffAIdOHawQeXIg8yjHNgqlkOzdj2NlWdA8rCszNtT2t5bdNNW6rJSTO
 wr6aeNGamJnB2X1+Ym3CvdAN2GrIAHILFw4HtrQwjd5gsFGvwTw/QFoydBeIv7Nu+LNb
 7xBg==
X-Gm-Message-State: AOAM5305sOeHCSz9OgIQpdjsup+8CfQ8qt3NsGznDyZCyZf6pmlZgz2K
 D8pFAvaDIG29Bls1p2/eXKs=
X-Google-Smtp-Source: ABdhPJzFKRFWhqozP768mGQU3Bxd/DPGn4py1jbdHe1Rduo6uNr6qh4m258BCbt8GTx+6dstWNcWIg==
X-Received: by 2002:a05:620a:530:: with SMTP id
 h16mr16424242qkh.136.1612193427289; 
 Mon, 01 Feb 2021 07:30:27 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id e5sm14073293qtp.86.2021.02.01.07.30.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:30:26 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Makefile has local changes that will be overwritten
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA_m3vbjh42_tox4h_9wS_BSEad=nJrc=v_it01FxVV=EQ@mail.gmail.com>
Date: Mon, 1 Feb 2021 10:30:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9865C2F-68A9-404F-896C-09C2A78C51A3@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
 <CAFEAcA_m3vbjh42_tox4h_9wS_BSEad=nJrc=v_it01FxVV=EQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: Dan Streetman <ddstreet@canonical.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 1, 2021, at 9:52 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Mon, 1 Feb 2021 at 14:49, Dan Streetman <ddstreet@canonical.com> =
wrote:
>>=20
>> On Mon, Feb 1, 2021 at 9:23 AM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>=20
>>> When trying to build QEMU I see this error:
>>>=20
>>> error: Your local changes to the following files would be =
overwritten by checkout:
>>>        Makefile
>>> Please commit your changes or stash them before you switch branches.
>>> Aborting
>>>=20
>>> What I do to see this error:
>>> ./configure --target-list=3Di386-softmmu
>>=20
>> Sorry, I don't see that error, what commit are you building from?
>=20
> ...and what does git think the local changes to Makefile are ?

This is the output of 'git status':
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
	modified:   dtc (new commits, modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	pixman/

no changes added to commit (use "git add" and/or "git commit -a")


This is the output of 'git diff master':
diff --git a/dtc b/dtc
index 85e5d83984..88f18909db 160000
--- a/dtc
+++ b/dtc
@@ -1 +1 @@
-Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
+Subproject commit 88f18909db731a627456f26d779445f84e449536-dirty

I have tried 'git clean -d -f', 'git reset --hard' and 'git pull'. I am =
now at 74208cd252c5da9d867270a178799abd802b9338 and still seeing the =
error with MakeFile.


