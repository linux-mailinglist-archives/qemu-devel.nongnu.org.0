Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC446CDA2B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:09:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVX8-0000qZ-NG; Wed, 29 Mar 2023 09:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4450486d3=Mark.Syms@citrix.com>)
 id 1phTRH-00089Q-8K
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:53:59 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4450486d3=Mark.Syms@citrix.com>)
 id 1phTRF-0006te-N6
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680087237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x4MdWt2kBPYP0ElgtaHjHKOOZ+d88GXTfADLoRNHIU4=;
 b=IfC39ybbzg7tmFC5r04CmOPvAU+4k9OhSoJtb2GATpqDywOlcRVQFlmn
 Hbsx4ghmmr9+RmFg21SNQXLWneQz6/ILLNTKpU9iPtmQ4cZsO4/HWPEK3
 G3duOmtZrMaumUouqphzt1MRWGWhTJ85KPdd/0J4JfysqQ1+cSXq2w+Zp U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103524296
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:188QhKvu6sWox9YpgG6JkF5f0OfnVAJeMUV32f8akzHdYApBsoF/q
 tZmKW2Fa/mCZGuhL9p3ady0pxkF78fSy9RrT1E/rXozHixE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASExiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLisgSj7c36WN5ujnEMpdjIMgIJHMFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxhRslHTnrsy+EDYzRBr0airO93QEjCPbZwNxRvC+
 jiXoQwVBDlDCfjY1AW04kuKm+vovQ3pcr8YMOKRo6sCbFq7mTVIVUx+uUGAieC0j1P7V99BJ
 kg8/C0ooq4vskuxQbHAswaQ+SDe+ERGApwJTrN8sVvWokbJ3+qHLm4fYxpvN4Rhj+lsGWYJ5
 1XOnN+xIhU65dV5VkmhGqeoQSKaYHZKfD5SNXNYHWPp8PG4/tht00unosJLVffs04arQWyYL
 yWi9nBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARVodtzxoqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2Qcl5r279oCH5JN4OiN2bGKuPGpxcEdMOS
 BG7hO+szMULYCvCgVFfOepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwRyCkXW4hji3+GB1yPFXB
 HtuWZr0ZZrsIfg9nWXeqiZ0+eND+x3SMkuIG8yhnkr6ief2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:aswrNKPL2TcNH8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; d="scan'208";a="103524296"
To: <qemu-devel@nongnu.org>
CC: <tim.smith@cloud.com>, <mark.syms@cloud.com>
Subject: Ensure the PV ring is drained on disconnect
Date: Wed, 29 Mar 2023 11:53:43 +0100
Message-ID: <20230329105344.3465706-1-mark.syms@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=4450486d3=Mark.Syms@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Mar 2023 09:08:07 -0400
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
Reply-to:  Mark Syms <mark.syms@citrix.com>
From:  Mark Syms via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


If the Xen PV guest VM sends a close whilst there is outstanding I/O
being processed that IO needs to be completed and drained before
unrealizing the rings or SEGVs will occurr when the I/O does complete
and tries to update an already unmapped grant entry.

