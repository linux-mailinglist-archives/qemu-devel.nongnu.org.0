Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E247D371290
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:44:44 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUC4-0000SG-0C
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0003IE-TB; Mon, 03 May 2021 04:36:43 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:58577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0000hu-NF; Mon, 03 May 2021 04:36:43 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4alK-1lbpNG15nS-001jTL; Mon, 03
 May 2021 10:36:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] hw/display/qxl: Constify VMStateDescription
Date: Mon,  3 May 2021 10:36:08 +0200
Message-Id: <20210503083623.139700-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3SNDRugjWWZ8THMSzwhF+K6Ngpfa9XU1MtrJRIDhbXT1+1m99fu
 wwwX/QJ9NBIoDBOMjMGPwYJWhzt4g671ozfml6x0H/12hQ4H2YrZMaxH30TQ6dMFqHhkg+n
 Y6U4W9Mpz+5S8BcM1VIt1pzEZ8ls/J4CoMtTz27vfHHhDnDKMbrnZ5kI6dBvlSML3srGPrB
 9xvXv8+qlkowx6xTXq2ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9nDD3REuhOM=:tkgIqfyzZHxTZwTZaguQpZ
 /1EJMAOMQbYKGF8It97VF54adEZp/9LNuXZoA3b+HiohaM0rBMLAuHF9ZB/5R7i5lfhY9NY12
 Nzbrif+DrcdwV3j3vgf8+5jQPsk+a+XvxvWtvfK+ouxqE7UzsFTl49cbYNy6k8o5yIFgROa+d
 49l/H8uBoJfSImSFARPiBD9V38HtUKIOqUZlqHWF1HS2a7YpbQV8KfswZDmGnF/icFwq8t4AY
 y/AoLS2PIe74C9RMH1zaY1FH74GFfM2AUr9sr2f4YJJIMtTXSha+6j02YJMxMNM4Mh9Z6XWtU
 JTlNPbHPdmAA23WywNU6RHD7QFh2QIAdu3SJlerjvMjuLGVQMuZautqBoIcNNZUwPMjYeN0kI
 sWmwKu+WM4zSeJ+t2EJ8wGSHhzTGmEPwIFuXICeMl0/JhRlTt3M3o7rKCDf8KV5NEn5X59aMg
 zHVkCJn5BRMOEU6UHz950s3LLCvtSrBAF99t+rbmvgDBPOo9wGZrA/40oHv1wFh5Nlx8FbFL/
 qeW0eBgWIPPVtizvpK2lKI=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210313171150.2122409-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/qxl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 93907e82a332..2ba75637ec30 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2384,7 +2384,7 @@ static bool qxl_monitors_config_needed(void *opaque)
 }
 
 
-static VMStateDescription qxl_memslot = {
+static const VMStateDescription qxl_memslot = {
     .name               = "qxl-memslot",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
@@ -2396,7 +2396,7 @@ static VMStateDescription qxl_memslot = {
     }
 };
 
-static VMStateDescription qxl_surface = {
+static const VMStateDescription qxl_surface = {
     .name               = "qxl-surface",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
@@ -2414,7 +2414,7 @@ static VMStateDescription qxl_surface = {
     }
 };
 
-static VMStateDescription qxl_vmstate_monitors_config = {
+static const VMStateDescription qxl_vmstate_monitors_config = {
     .name               = "qxl/monitors-config",
     .version_id         = 1,
     .minimum_version_id = 1,
@@ -2425,7 +2425,7 @@ static VMStateDescription qxl_vmstate_monitors_config = {
     },
 };
 
-static VMStateDescription qxl_vmstate = {
+static const VMStateDescription qxl_vmstate = {
     .name               = "qxl",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
-- 
2.31.1


