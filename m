Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF558A130
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:26:18 +0200 (CEST)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgU5-0002s1-8k
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQP-0006R6-Ro; Thu, 04 Aug 2022 15:22:29 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:57051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQK-0002iT-A2; Thu, 04 Aug 2022 15:22:29 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6lYs-1oLIzF33Xi-008GYx; Thu, 04
 Aug 2022 21:22:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PULL 3/5] docs/about/removed-features: Move the -soundhw into the
 right section
Date: Thu,  4 Aug 2022 21:22:14 +0200
Message-Id: <20220804192216.1958922-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
References: <20220804192216.1958922-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:luPvrACtIbj4IbMrkXlqYNiy5vKf3lwkofsHIWpn8mxUj3hrlRC
 Dzo2XA5tXnjhXe6vvbP52yllcmQBoWRx+0zYXwguYBIlh2HBgCvtdiyCFiEm6o7+dU7ePUB
 +t9fcaaF5+FHV7LC4WFiQIP57j6SahY9Vyp7k28+3kZL135ykb8A0yVK/YCpWu7N+T/N9Ae
 MHwCeER/npt/FGvrcvDmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ukKcctbwkBE=:QQlKjrJ5kKRvQpjjU+SYYu
 TwLrO0dpNr23T3SDFLqCaLbPC9ENW/1wSlfEcHtpKxOTuQdFhdFaozn9Tfe9BNUVNAN98vRJK
 U4fTvl4nxg8YJcTwRGOrI2x4YMuAeWxyP59++CiO7a8gtP6Tof5f74aHbM/i+maMHprxSdKxN
 Ue94w94JvVoipmVslEFU2E1cL/ODAA6M9StQMkGPqjnSU8gQ7q67/Z2UYu+egn2gkhefj3xob
 6dgqg3to2p3ziBuYVKqhWeKFQfTeE0kpiwKQxzvqe1LGg2TECAyrGZf9dHW9odCabg2Kfkvt7
 2ApzRywFl0cbT6jxYsvlcTF62YVQGAM52gF0sg08dVhaQJQ4rKiy7yfAMzDyYRoJZ2Ne0qQLP
 bVE0iafZvMpJWfIQ0Kn5rKEh2bQ/l6p+OzqmRouN9FVHTkmTQxy62DNb7UqGyiItBcQrOVulw
 3d2jYzRV+v6ZlahyoSWzbx7OkJMlzc64VWThtFl5n9h6OkRto2OaJnloGxuhnNEax0KAPr81w
 +WOrKl31MV5D1XyIThGJosjDImdoe9RnRbpkFJtp4/2W8yjBnndN12EpHBA1+lRQ/RMGDBbDe
 xD/FsuypXdt5QvV8FzRDTAbXUatALjnjYNN46Zdo1uehYXfcHLNPcWxfIGZbThKCmWMOAFv4l
 nda4o5Eewxt+2mbAIku5mB24y2uj15IsF7mFYmn/oZY3y+F5xsvPcDMdyfgNY+7cKHSUXhoX/
 YdqvR1uBB8Q/yPNqqd6p20UIyhwfrwFHodq3og==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The note about the removal of '-soundhw' has been accidentally added
to the section of removed "linux-user mode CPUs" ... it should reside
in the section about removed "System emulator command line arguments"
instead.

Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20220802075611.346835-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/about/removed-features.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c7b9dadd5d63..925e22016f98 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -396,6 +396,13 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+Creating sound card devices using ``-soundhw`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Sound card devices should be created using ``-device`` or ``-audio``.
+The exception is ``pcspk`` which can be activated using ``-machine
+pcspk-audiodev=<name>``.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
@@ -681,13 +688,6 @@ tripped up the CI testing and was suspected to be quite broken. For that
 reason the maintainers strongly suspected no one actually used it.
 
 
-Creating sound card devices using ``-soundhw`` (removed in 7.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Sound card devices should be created using ``-device`` or ``-audio``.
-The exception is ``pcspk`` which can be activated using ``-machine
-pcspk-audiodev=<name>``.
-
 TCG introspection features
 --------------------------
 
-- 
2.37.1


