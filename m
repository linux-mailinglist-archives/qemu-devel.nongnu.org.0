Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F773469E4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:35:12 +0100 (CET)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnk7-0007IO-7S
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a1ef93da295669d939df344e9169e1e8db57d9fd@lizzy.crudebyte.com>)
 id 1lOni8-0005gq-OF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:33:08 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a1ef93da295669d939df344e9169e1e8db57d9fd@lizzy.crudebyte.com>)
 id 1lOni7-00078K-35
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=2D19tss3Rq3wIX7E3eq38tEnoGR9eq23qg4gxCDXyfU=; b=XPrR3
 Ik0T7v7k/QV2SB5Z97rHu3FaYp4XPpxYV1CzwN28O7sFJvT/1wqlfKAC3IfSob7nylSzLWD2B3lEM
 0Mnko15Y86fXhb2lgbu8uenOH1C6xxtlaj94HFI9uAGNsSQ8s4q1VFEiHeeT3fuHdwQYCpGCwU5S7
 ovLE1IvsNbvZHPvpXFx2rrKBnXFqMa2R6+pNOOl5ysmU6U4mUIJrhxgfu65qykybkoe6di46hXxz8
 xzQlAP3JiKiN/VtLQMYhcYli1IUodGuFxUMOBCIOC/FRVScZ4dHfhJruVJz3+E9KGU1/AASQwEN8X
 DWj3f/2LryjP9w37+FKHpQnCulC/Q==;
Message-Id: <a1ef93da295669d939df344e9169e1e8db57d9fd.1616528420.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1616528420.git.qemu_oss@crudebyte.com>
References: <cover.1616528420.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 23 Mar 2021 19:55:46 +0100
Subject: [PATCH 3/4] docs/devel/9p: fix references to pictures
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a1ef93da295669d939df344e9169e1e8db57d9fd@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The original source https://wiki.qemu.org/Documentation/9p does not use
a prefixed path for pictures. The (auto converted) in-tree .rst version
of the 9p documentation though uses pictures that are placed into the
subdirectory 'img' for not mixing them with .rst files within the same
directory, so prefix references to those pictures with 'img/'.

Also the auto conversion tool 'pandoc' did not replace the image
references by a correct 'image' rst keyword, so correct that as well.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 docs/devel/9p.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/9p.rst b/docs/devel/9p.rst
index e2a57b77b2..f326edc8d7 100644
--- a/docs/devel/9p.rst
+++ b/docs/devel/9p.rst
@@ -64,7 +64,7 @@ Topology
 The following figure shows the basic structure of the 9pfs
 implementation in QEMU.
 
-`frameless|upright=3.0 <File:9pfs_topology.png>`__
+.. image:: img/9pfs_topology.png
 
 The implementation consists of 3 modular components: 9p server, 9p
 filesystem drivers and 9p transport drivers. The 9p client on guest OS
@@ -219,7 +219,7 @@ Another important aspect to know is that once a thread leaves the scope
 of a Coroutine, then that thread is back at using its own thread-owned
 stack again.
 
-`frameless|upright=2.4 <File:Coroutines_stacks.png>`__
+.. image:: img/Coroutines_stacks.png
 
 Each coroutine instance usually handles a certain "collaborative" task,
 where "collaborative" means that individual parts of the task usually
@@ -253,7 +253,7 @@ Control Flow
 The following figure shows the control flow and relationship of Threads
 and Coroutines of the 9pfs implementation.
 
-`frameless|upright=3.5 <File:9pfs_control_flow.png>`__
+.. image::  img/9pfs_control_flow.png
 
 Getting back to 9pfs as concrete user of Coroutines, every 9P client
 request that comes in on 9P server side is a task the 9P server needs to
-- 
2.20.1


