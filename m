Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C948631C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:47:30 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QIr-0004CV-45
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0007bs-A8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004iH-QE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:55 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsI0I-1mG4kL2EqA-00tnYG; Thu, 06
 Jan 2022 11:41:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] qemu-binfmt-conf.sh: fix -F option
Date: Thu,  6 Jan 2022 11:41:11 +0100
Message-Id: <20220106104137.732883-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u/u13qdSs/kU8Vs9v+pdfCeRb9U1GZv5YzYxbvq1T3zShlYgeAo
 55d46nATiXQXlggjcSmdKmjjv54hDxTlO8lg8T6DJi5OyLHliCCrhej5g9W0TW1bVl6lMp1
 8Da6B+XUI+9L6PoAHmG8AiGSOGMTvaUKgKnrDe+8YZhncDI0L87duczmYuu1QQefJwwIisF
 ItE+qhbyB7i3XUl+j/Nwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fmlVKuJeyXM=:3Hp/XK/EX5eI6czik/18w0
 g5C9du2lDiVX59fYoafYEQNzoGzo/SOxy3lRpsKAB5LhlDJFDJ571hCJuWjpvxXKxSCUZxGpk
 jfwBLgJ5RgT3+g5OHz+34ec07eCGk1LUldzGHm8cJTavekhnwlcVlIQE7KyPSEEzPISsYsXDV
 uv5+VdKZv8GJN5klh+XiseM4l76wByIJn5quPHG+8VmZxuVYrTtkrgUlINk3G9YaBl3ApiTTF
 +iCh+I8Z8ESi++JTDtZdNNGKrzW/3RykTl2fAkXeeGPsQLReretrM/8U3wBqs51bplSP/vhtc
 Oep9B//Oc5+yRpuxtigHYmAmf+dCGL3kavsEQadv6tU3BkJ7xnBG2JvbzzB6vxNfG8IWCyFeF
 U/SPSuTRxhi5lsjsPOibt6qEZulbmptjYa+/QBukjE7MMm0uFZVpDD9rat8YogqXd17uUIUfP
 9u5h8II0KCn6S7W0cLl16U+13vXZCCqExPRwFFIYMHidWncE/SbC2nm5ajoVlDnbBkd4RbbZq
 mkMvM5w7xQDAeoIskvRrjSRpJgLfxStOIXe1l1rigcmXte+XSnTXnumtdzmk6jYHGkWkLG/xl
 QtjiTonsnnkHLwrvd9DwZjvINW9JK/rCArMMP2Fse80j5gN629gkLEyfdU8KT0zJAi+ZIbTUp
 6UMbiLmUf2cedGStJ/ZzdC2VvFGRpJSr41GDPp0IoChufWMs3HuUiCX/+FzgmaIFIJY4=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Martin Wilck <mwilck@suse.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Wilck <mwilck@suse.com>

qemu-binfmt-conf.sh should use "-F" as short option for "--qemu-suffix".
Fix the getopt call to make this work.

Fixes: 7155be7cda5c ("qemu-binfmt-conf.sh: allow to provide a suffix to the interpreter name")
Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211129135100.3934-1-mwilck@suse.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7de996d536ea..e9bfeb94d314 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -340,7 +340,9 @@ PERSISTENT=no
 PRESERVE_ARG0=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
+_longopts="debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,\
+persistent:,preserve-argv0:"
+options=$(getopt -o ds:Q:S:e:hc:p:g:F: -l ${_longopts} -- "$@")
 eval set -- "$options"
 
 while true ; do
-- 
2.33.1


