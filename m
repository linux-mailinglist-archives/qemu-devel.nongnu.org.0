Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C1E4D8EE4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:36:14 +0100 (CET)
Received: from localhost ([::1]:44726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTsMP-0002Vp-5F
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:36:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nTsKY-0000Sd-I5
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:34:18 -0400
Received: from [2001:470:ea4a:1:5054:ff:fec7:86e4] (port=46269
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nTsKW-0006GD-Hf
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:34:18 -0400
Received: (nullmailer pid 2511 invoked by uid 1000);
 Mon, 14 Mar 2022 21:34:05 -0000
From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: qemu-binfmt-conf.sh: mips improvements
Date: Mon, 14 Mar 2022 22:33:53 +0100
Message-Id: <20220314213355.2477-1-dilfridge@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305000624.1498181-1-dilfridge@gentoo.org>
References: <20220305000624.1498181-1-dilfridge@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2001:470:ea4a:1:5054:ff:fec7:86e4 (failed)
Received-SPF: none client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=huettel@www.akhuettel.de; helo=smtp.gentoo.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two patches; the first one has been under review before, the second builds
on it and extends the binfmt-misc magic to differentiate between o32 and
n32 binaries (see also issue 843).




