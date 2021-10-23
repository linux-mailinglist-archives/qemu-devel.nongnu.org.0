Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D84384B6
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:36:11 +0200 (CEST)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLsI-0000wG-EP
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnr-0005EC-7w; Sat, 23 Oct 2021 14:31:35 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:39255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnp-0006Xx-3K; Sat, 23 Oct 2021 14:31:34 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6bPS-1mkUfc1MVi-01804E; Sat, 23
 Oct 2021 20:31:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] README: Fix some documentation URLs
Date: Sat, 23 Oct 2021 20:31:21 +0200
Message-Id: <20211023183123.813116-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5izw5EsDHrbMdDYzse6zcZydMtlEL3iEpqvu0DOXI1ywbNhdfJZ
 /2zy69k7fHFl8ZupNVInLoPegejhLb4fVIZsWl53Womkr+y6S8dtiT2veEeuEY2YX/Y/6Cb
 +8/Q4IWC/ACat/G0IoaKAckia3UMd4BmWgLSppevF2u8ETOqCBFzokjJMeuW04Bd7vzCB+s
 4zNvjICSVy+khDRYc/CBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bmbfWlDUQGk=:nBkb7Dfk9nr1XEc1MKChHb
 eHB5HGVBOHGVCnFmJI0XKl2YH805mXpckMWLHSzeesC84KnDnEO47deDBYwSLPtShUH0Fv9mP
 9cmbRDrxhX7fsDO21S07SvqSeQZDWcVZv81Sd//CppkW7U+WBWGZP4xUJ1E39Nsp6eWQzR248
 5Q+kmCFOIJuZBju0o+Tnd/1LHPegczdw9ByKrQnlfHt7tfztEfSo0f2ix862BJquhvGd46/vv
 KtHeYB23VV9enBU5yg4/yzTjNhJtTXbgd4FQis0Z0/s9AM3HE9+n+R40mAWG21+76T428JfMJ
 EZKwdKmhDlw0RInkfmNovqqE8+8wB8A+qc7ZoalFnYal9C/6cK0CBGmQtJdB7JlfHZ5VIEOFh
 TYk84QXSde9k01wrup52DbjgMCQsHjpqbF/PUXS6E8E2UjvEdweS5+7XABl4lPPX1p2ajY3m7
 3Cx9ru7n1E4pTa5/bBerL2qILLstjQ8Qa5BDAZ+vgCl33SChkN6reVa/Gshr+LWYJ7mNiOBVg
 8NZu+3XLZqNPfsSTs8y4JBIoDPieGaHivzzZaALB7UW6BsocGlNYmD/5h/IzN9Zi6izHtToho
 cTaUdaAZ5nggwizSYFSqKc2XxMkwWa4WpJtdyYHNoOorpM/ZvBLP0dIwAQj3z777gyXQYSL8+
 J7dROGQVVTeu2t2aVyiTjFxRhfJ0CITaqVa/vgd1CHmso4R314kPtc8xzza9kBBJq1jQ=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

All of these pages live in the wiki, not in the main web site.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 README.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/README.rst b/README.rst
index 79b19f1481e1..23795b837740 100644
--- a/README.rst
+++ b/README.rst
@@ -59,9 +59,9 @@ of other UNIX targets. The simple steps to build QEMU are:
 
 Additional information can also be found online via the QEMU website:
 
-* `<https://qemu.org/Hosts/Linux>`_
-* `<https://qemu.org/Hosts/Mac>`_
-* `<https://qemu.org/Hosts/W32>`_
+* `<https://wiki.qemu.org/Hosts/Linux>`_
+* `<https://wiki.qemu.org/Hosts/Mac>`_
+* `<https://wiki.qemu.org/Hosts/W32>`_
 
 
 Submitting patches
@@ -84,8 +84,8 @@ the Developers Guide.
 Additional information on submitting patches can be found online via
 the QEMU website
 
-* `<https://qemu.org/Contribute/SubmitAPatch>`_
-* `<https://qemu.org/Contribute/TrivialPatches>`_
+* `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
+* `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
 
 The QEMU website is also maintained under source control.
 
@@ -144,7 +144,7 @@ reported via GitLab.
 
 For additional information on bug reporting consult:
 
-* `<https://qemu.org/Contribute/ReportABug>`_
+* `<https://wiki.qemu.org/Contribute/ReportABug>`_
 
 
 ChangeLog
@@ -168,4 +168,4 @@ main methods being email and IRC
 Information on additional methods of contacting the community can be
 found online via the QEMU website:
 
-* `<https://qemu.org/Contribute/StartHere>`_
+* `<https://wiki.qemu.org/Contribute/StartHere>`_
-- 
2.31.1


