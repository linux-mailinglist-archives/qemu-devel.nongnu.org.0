Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE433469E0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:33:54 +0100 (CET)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnir-0005o0-SV
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90def23eb7a2588741ee09eed7bc17bc819647c0@lizzy.crudebyte.com>)
 id 1lOng5-0002n3-6Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:31:01 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:55741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90def23eb7a2588741ee09eed7bc17bc819647c0@lizzy.crudebyte.com>)
 id 1lOng3-00066X-L1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=48F/AuZRP37OShqlK75XbB+rqz8psQYhcuvY4KWu5zU=; b=RbOZ/
 nzk46+bgDv/N7PTvLQYZdUUlFbQPHjPz6ECtm18tKmPP70tAVjo+bWrRDQSO5vx84MFvcZ9wnf5U8
 XUHD6DiTMNF8QcMuR9L3BA6QT0J5l8cFiNrLh1+uKDV0vOsXSDJsQMYVlo2wxQdsgFgqgiT6aCGn/
 LBeJWMFRGPJsLm2tdKgU9K/0/QSMy+w+SiW17KzU845Iu17RWTk5G/VwFhyrNwUtL/aVDSTOWsxfX
 NRQ95HlvcxKyrqx+6sQqH+SoOpfaTGomGJZkb8UQMyMqYj/1oOtCbajEmbru68DodH4ngatGvxsPm
 Hgfl6oKJCXhs9s1BeQZgcbT9l/DpQ==;
Message-Id: <90def23eb7a2588741ee09eed7bc17bc819647c0.1616528420.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1616528420.git.qemu_oss@crudebyte.com>
References: <cover.1616528420.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 23 Mar 2021 19:52:54 +0100
Subject: [PATCH 2/4] docs/devel: add directory for pictures
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=90def23eb7a2588741ee09eed7bc17bc819647c0@lizzy.crudebyte.com;
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

Add a new subdirectory 'img' and add the (currently) 3 pictures from

  https://wiki.qemu.org/Documentation/9p

into that new directory.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 docs/devel/img/9pfs_control_flow.png | Bin 0 -> 156560 bytes
 docs/devel/img/9pfs_topology.png     | Bin 0 -> 51529 bytes
 docs/devel/img/Coroutines_stacks.png | Bin 0 -> 87204 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 docs/devel/img/9pfs_control_flow.png
 create mode 100644 docs/devel/img/9pfs_topology.png
 create mode 100644 docs/devel/img/Coroutines_stacks.png

diff --git a/docs/devel/img/9pfs_control_flow.png b/docs/devel/img/9pfs_control_flow.png
new file mode 100644
index 0000000000..c112d366c5
Binary files /dev/null and b/docs/devel/img/9pfs_control_flow.png differ
diff --git a/docs/devel/img/9pfs_topology.png b/docs/devel/img/9pfs_topology.png
new file mode 100644
index 0000000000..f685805a49
Binary files /dev/null and b/docs/devel/img/9pfs_topology.png differ
diff --git a/docs/devel/img/Coroutines_stacks.png b/docs/devel/img/Coroutines_stacks.png
new file mode 100644
index 0000000000..cc9baf4b6c
Binary files /dev/null and b/docs/devel/img/Coroutines_stacks.png differ
-- 
2.20.1


