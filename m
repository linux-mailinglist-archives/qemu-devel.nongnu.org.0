Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898A30AC40
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:06:29 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bie-0003GB-4Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6bc7-0005nm-RY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:59:43 -0500
Received: from mout.gmx.net ([212.227.17.20]:52245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6bc5-0003bD-3Y
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612195164;
 bh=fgAqcVSCAsdr7KsSL/Yv/JTUk/uNb2eo+CI9f0qNChs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=EuC/qDJqhGe38vjudXcTaEY3XsShD+pDAOqtEluBrj/VbTa8kB+K7pxTrrWXoREZJ
 mXDxS3RR5aErNfCgqQ/+6ZjavsWqYGk0+jEvwqX6i6QB7p9DfG8KlsRHxFBeCbz3ky
 YbxghL6F0y4D+wgOIxEJAl26TLjUOyuUQp1cz1bQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.182.87]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5if-1lPdtZ1Kb7-00J0jX; Mon, 01
 Feb 2021 16:59:24 +0100
Date: Mon, 1 Feb 2021 16:59:22 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add missing TARGET___O_TMPFILE for hppa and alpha
Message-ID: <20210201155922.GA18291@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:wLSwswOwCsEwEKk9RXmjUybI9wzkQ8E91uqNZ2ec6werO1hitoe
 +MdoT/200y9jqHHdRPCZ6+J33HzjChXRMqx8NGcSGAs4aYmILoynAiC/B9F9leo2LRFuAO0
 sdfdIsqgBUk6Kw4n3pOgBYn5hRN1EzUVqpshRxftfEwpbG8uw4crIggIr4xEiUXrtyjii4K
 QRjWUMwkZtApqmH0ZZ5Cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T+XlsWwplr4=:lEKvts6ZVMERtP1ay/xaIS
 QL7lpogNG2hs+GKfLai/APy3d8W9z1ua/pRP5hCpgQ3L0NjvLWw6XBuOO1F7hvA1P4AZJQcJs
 9ixvcyzNsW/yY1DOAlpphGMCsLFJ4r9MdY4jpha9EyIS1vfP6bX/NqBkEbfoC6y6Qe6jcXAzC
 qzksDva/Co98FpY9ILHha0BCaEUADJchvMQWk9eFlqhGuHdYdG9jNOxo1Bw728pvVoUyhrXUG
 /HZ0Or88n0W34VR2hJoC1epBxsLzJMrDVcSO46yqk82Wo1/JVogIw72GrC0/nPisxbYwd8Wpz
 4x6szBBCQGCc5KFma8ktMm7/jBNqw7hFLd+v28H+vZ39812PpsYhr4yWRl7dLZ2+QnEqeI544
 i3A3Xt1JSpuA6W8/IfyjW9/4OCWt69vj8HZAe+utNjtPNNNC4VFT5P5SOmb+OhSRt8O906Gcz
 YCA6PJAIuRVduigx59jJQKpfMOZOQGlDtuqiosQhy/UDPWz0EZWbv3dHOwGO3MxNI+6bnxVd7
 JL7MOfGulBujkOvFxpzY37Wz97B9FRFsM6DzKJlXxayHihUQnU4RRI+0A7dlDtsdh9S1SqtYZ
 ev10BcqneYHdSTAQDA0UDUoK9+Ovv99rVsiyZ2UEJInvqxakz2G6T9ivfRu5nlEMqZFuMDHmv
 JZqkd/ZJdxftqNcZB0+6OLb7mqui48/ZlXp+KiP9AOsQJs/RqpFozUpEaZ6nqKkBrLtL4mP11
 I4nCzteKKeDBhyAMedyp0K1GHcZDA4yz298zNnOiRLPTk59meCVnV4iHMWSphkSN0XbityCB6
 cYWSyIDmB7/mCGuhZ7/hwN4EvA+RIBBxUujOJSWOyKFW7ONx5v77yFPgwQLxfOVVs/pU9I43d
 JFVHywHVqacBwHgt2dww==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hppa and alpha targets miss the #define of the TARGET___O_TMPFILE
and as such fail to run a trivial symlink command like

    ln -s /bin/bash /tmp

which results in an -EINVAL return code.

Adding the define fixes the problem.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcn=
tl.h
index 2617e73472..0a74807a8b 100644
=2D-- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -23,6 +23,7 @@
 #define TARGET_O_CLOEXEC     010000000
 #define TARGET___O_SYNC      020000000
 #define TARGET_O_PATH        040000000
+#define TARGET___O_TMPFILE  0100000000

 #define TARGET_F_GETLK         7
 #define TARGET_F_SETLK         8
diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl=
.h
index bd966a59b8..08e3a4fcb0 100644
=2D-- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -21,6 +21,7 @@
 #define TARGET_O_CLOEXEC     010000000
 #define TARGET___O_SYNC      000100000
 #define TARGET_O_PATH        020000000
+#define TARGET___O_TMPFILE   040000000

 #define TARGET_F_RDLCK         1
 #define TARGET_F_WRLCK         2

