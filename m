Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7E2C329A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 22:23:08 +0100 (CET)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khfmE-0000uR-Qp
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 16:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1khfiw-0008Ev-Dc
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:19:42 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:16092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1khfiu-00044l-9M
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606252774;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=iw6p6ZKyjJn3daRLOXN3/zlIysuU8MwKpOEAdrot86I=;
 b=dzdCiWMexDXfMsYuDB5I87vofzAhIOzbu7BWOKZJO1Z4fNPH2vgQi6S2E64ySVfjng
 +NqTKG8ilqwisyjaP9E2HEIC8lVanlMhXNafFiit2d3xvlkhUwi6xB330yN9LiADVdnz
 L8CAFZqnjm8AuEYY0BJvz2jhA9N+/XYEl79NYMijevZLx4ueT0BBhbtRrRiBAaogWUsf
 yyHZdgjjfqS9ovdAV//OXmSv9UXEOwkUJy/F+8frT/54O1vpfpszckePDAZlXdai6vEF
 De6+uuTOaFG2VdSTWf0KkgfdiMLGUVV04nTQs9S5Y5cGtVqpYIOlb3Iy0PCw04/1EIXu
 ubHw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3Gwg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id V0b6ccwAOLJXwpi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 24 Nov 2020 22:19:33 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Olaf Hering <olaf@aepfle.de>,
	qemu-devel@nongnu.org
Subject: [PATCH v1] configure: remove python pkg_resources check
Date: Tue, 24 Nov 2020 22:19:25 +0100
Message-Id: <20201124211925.4194-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.219; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 8c5d2f9a69..ce9b3c0a33 100755
--- a/configure
+++ b/configure
@@ -1913,9 +1913,6 @@ fi
 
 case "$meson" in
     git | internal)
-        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
-            error_exit "Python setuptools not found"
-        fi
         meson="$python ${source_path}/meson/meson.py"
         ;;
     *) meson=$(command -v "$meson") ;;

