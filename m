Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBE44AA6C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:17:56 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNGN-0006c5-PI
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNCO-0000i4-6R; Tue, 09 Nov 2021 04:13:48 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:53989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNCM-0005KS-7Q; Tue, 09 Nov 2021 04:13:47 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5FtF-1md7i712KD-0119bP; Tue, 09
 Nov 2021 10:12:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] docs/about/deprecated: Remove empty 'related binaries'
 section
Date: Tue,  9 Nov 2021 10:12:38 +0100
Message-Id: <20211109091238.817997-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x76QNzdADSPKEOU3OveNFP+BcfK+BGp0E/AgVvF8W/RQtZQnMCa
 SwLWPnOvUO4JS9npGg94M4s+Mt+uFASHMFRBCWSEDAYuc3RCZ+5zz7TOFIsxAwsAceHXIAN
 3gwCB9Wys/CbrLsr85e3C2evIHcuzvX0ZsMwTyylfL7y4s+0PILLDbRjbLNfL78gSxo4+Z2
 UnS8GB7SYqVd7dpOiA1AA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q3KA6nlt3rY=:iwQCd16B4r8AVOe9CXeJOe
 cAU7MxJOOLz9xwJmPGfnbO0jHBMcI1k+ORJRLzaqzezskt3diCRyRvZE9OzfKP1Zv5CoZ3TyG
 I8MaBdNcBDYDoelzeomf5d0ef2NALAIYbIQF0QJmvjk/ajLO2XCDmxxylNw5fMCmbJw+5Vn6Q
 LQX/4AcjQ1eI1GrfQH5Y4XYXM4Sq85vOCUXkcEjF55XX+GiABH+gY9pkxYlJ5Es5fq5xfGXYW
 SKi4EGnvzyTjmDPKzDhEWN287Zy4FAf/0MWP+lmu8eVFq9tMDa3dxQmyTORl6QwqYrxedAxFA
 7+7gkhFOWGH+sqTRHkJ/obXzWfBfskSYqzf574xqRrzKKhEuEeaaQ/lo4E81Ii/piWF/f64nQ
 hupeVameshLMQ/kCkjcZpfhw4P8PlkuqhiuV+U4S6K7LxesvJbZitQFE1oPwLkMWavst5tIJ4
 s8JpbuWXax4Ie/lNdL2Z90i9VplAzOhs5J/OgjuVoV8kkRGKMfoxMKfm23tp31f/0Al5N7mXt
 dIcWMdsn0JQau0BpaKV/zh+0+D7cworEXK+bv0PcOo2faajF6t4i97ZiYvRW0vWi1GvenAojV
 p/bGfQBgacVGWbKTtxf6MoqO6jm6PMuAnSkrEiShIAQy0RdhhkU2yHoIUvNPHTwyLHiJHmGbR
 TDWxA/nVOoRD15GqDctokehnagLqWITrcWReSaoqWWNzTiVM2v5ZknAFPOwj9krqMYh4=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-trivial@nongnu.org,
 Joaquin de Andres <me@xcancerberox.com.ar>, Laurent Vivier <laurent@vivier.eu>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
removed the content of the "Related binaries" section but forgot
to remove the section title. Since it is now empty, remove it too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>
Message-Id: <20211105142656.145791-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/about/deprecated.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 56f9ad15ab54..5e514fb443da 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -370,9 +370,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
-Related binaries
-----------------
-
 Backwards compatibility
 -----------------------
 
-- 
2.31.1


