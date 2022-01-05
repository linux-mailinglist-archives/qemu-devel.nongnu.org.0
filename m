Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F383485577
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:09:32 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57ut-0005kp-9i
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <spwilliamsiam@gmail.com>)
 id 1n56ZS-0001Ya-FV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:43:18 -0500
Received: from [2a00:1450:4864:20::230] (port=35408
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <spwilliamsiam@gmail.com>)
 id 1n56ZQ-0002dK-My
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:43:17 -0500
Received: by mail-lj1-x230.google.com with SMTP id by39so66077820ljb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=mRlINATHsTIGJms9zxg+QvjwMS97exiNHq4xso2frPQ=;
 b=bLWTgQOkMfyt+W+XJ/eDNEekD2MDFCbIC9684goJvEofpcSsZ5rCmzAX9WcampiTv+
 fiSMg4CKzExvzlnetOrTMS66I9TA17LGO+iBFRhATIL0YRLdvqlMoa6STukAmCSUXDzO
 ymm316env/N418TGzO9+FBM/9lqWXOSEw5GDii7KnjqChxLPVwUG/jGnWAUIiprV6Q6E
 2NZ/8NPymGs9JxNy0g3TaUGulKx2S3nRk6Uek7Vm7rYpSuhP/2H3uZ9YdEkSRNo8xaOR
 lRX7fFHySfWq7WqpmZ+je+gwduWjf2uV3+nvUBeRmflESlfxoSsMAA+y1ix5S+iDVtTm
 Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mRlINATHsTIGJms9zxg+QvjwMS97exiNHq4xso2frPQ=;
 b=VQXa3nDGsuSYr4x+DpGO0e30Bx7uZ8qucFI1iXqfODQgTW/DrKL6qT0VYcZ+gNnnHc
 5zVfI73AqXo49qbjZvekvt82bysI9v/jAvCkzebR7ge+iPInFlKaf53vq+9Z20KSYvI/
 JNb8D+3paag7DAjnsz4GrNR5Dep5vZJS7S41MtQvmzExv4tWEx9MyaFmMF4W8pTh0IVL
 Fw2HwBJ+xHqIAE3sz/F7LAIw/IKm6/8MF3qe2vScujLCQ50h1Q7QRlB+kTgjovc8BN9d
 gIXy0PL5hVWIPCBky1mP/O40sXJkTzAvP7IxTr2Cu14fDCkBOj2FjId7x3M/6EyySfyW
 m4uQ==
X-Gm-Message-State: AOAM532UoF6MlXjD+51SO7sBoFd1l4dp9GQEPw9ZepewlWK3lrcUOX6z
 D8oTEGsVgo7vXJSsoxklsPPyPLpZNNwG8C1DAc5/eDaul/4=
X-Google-Smtp-Source: ABdhPJy9XnZH6rsept7w5xd65x6KQQ/S5Afkloq8KE5xXgnPJv+QSfOWPGlWDvgHKudw6hzmVT3dyEpkAj/+kCu2HoQ=
X-Received: by 2002:a2e:7c0c:: with SMTP id x12mr43950460ljc.216.1641390193640; 
 Wed, 05 Jan 2022 05:43:13 -0800 (PST)
MIME-Version: 1.0
From: Sam Williams <spwilliamsiam@gmail.com>
Date: Wed, 5 Jan 2022 08:43:02 -0500
Message-ID: <CAADTLxQMpb8PBc0CfPNdOOjtwmhSwS+e0MrDqa5Ut7By0MOVjA@mail.gmail.com>
Subject: QEMU issue on Windows with WHPX Acceleration
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006e06b605d4d5ef83"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=spwilliamsiam@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jan 2022 10:04:51 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e06b605d4d5ef83
Content-Type: text/plain; charset="UTF-8"

See reddit post:
https://www.reddit.com/r/VFIO/comments/l9bl8b/anyone_able_to_run_qemu_52_git_master_on_windows/

This is all the info I have on this, it's all in the reddit post.

--0000000000006e06b605d4d5ef83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>See reddit post: <a href=3D"https://www.reddit.com/r/=
VFIO/comments/l9bl8b/anyone_able_to_run_qemu_52_git_master_on_windows/">htt=
ps://www.reddit.com/r/VFIO/comments/l9bl8b/anyone_able_to_run_qemu_52_git_m=
aster_on_windows/</a></div><div><br></div><div>This is all the info I have =
on this, it&#39;s all in the reddit post.<br></div></div>

--0000000000006e06b605d4d5ef83--

