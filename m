Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DDC1D5D84
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 03:02:49 +0200 (CEST)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZlE0-0007Fx-4d
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 21:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan@dlrobertson.com>)
 id 1jZgzK-0007fb-Ec
 for qemu-devel@nongnu.org; Fri, 15 May 2020 16:31:22 -0400
Received: from sender4-op-o13.zoho.com ([136.143.188.13]:17308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dan@dlrobertson.com>)
 id 1jZgzJ-0001LA-Kh
 for qemu-devel@nongnu.org; Fri, 15 May 2020 16:31:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589574671; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mYOL1JbpPWswiQPRVjvm8wbjIosk3Dc2M/UCH6MkgeeRD2xz3CTrR9bNb9JylQqrgpkHHfG0/kVorCumllWIhO6W18gXffOlcwEi0HBo5OyMLtzoC1WDlp5xlMEoBOUEGEWCttug6+6HxUz4XKe86vP1u6XtdCqCsFx/gWrvTyU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1589574671;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=zi1XpzwuImmF3d6L4K5s3LW0ScEPYsYTNhFghJlPkDU=; 
 b=FPG2J3AElf04FvEVF0mrqHlxBRmu/jA055oq7tTL97T8CL8Cuyn6GewOjpjDn2gS0jzi8YBtkQ+0Nt13ZGN86AA9tdIKL/ukAcfiPt5rQmB/yRKXXn0cai7YB1SMTCvsjjJE0ubZDPR7HURLPX5cdNL+M3i5THEBTAmG6MhNLfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-96-255-47-18.washdc.fios.verizon.net
 [96.255.47.18]) by mx.zohomail.com
 with SMTPS id 1589574669765330.7402429609224;
 Fri, 15 May 2020 13:31:09 -0700 (PDT)
From: Dan Robertson <dan@dlrobertson.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-ID: <20200515203015.7090-1-dan@dlrobertson.com>
Subject: [PATCH 0/1] 9pfs: include linux/limits.h for XATTR_SIZE_MAX
Date: Fri, 15 May 2020 20:30:14 +0000
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=136.143.188.13; envelope-from=dan@dlrobertson.com;
 helo=sender4-op-o13.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 16:31:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 May 2020 21:00:30 -0400
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
Cc: Dan Robertson <dan@dlrobertson.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compliling qemu with `--enable-virtfs` and musl libc, XATTR_SIZE_MAX
is undeclared in v9fs_xattrcreate. Things compile fine with glibc as
linux/limits.h is indirectly included via dirent.h.

Dan Robertson (1):
  9pfs: include linux/limits.h for XATTR_SIZE_MAX

 hw/9pfs/9p.c | 1 +
 1 file changed, 1 insertion(+)



