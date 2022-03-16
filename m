Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0834DAD8D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:31:20 +0100 (CET)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPzy-0000Hb-M9
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:31:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nUPwC-0006pD-Ba; Wed, 16 Mar 2022 05:27:24 -0400
Received: from smtp44.i.mail.ru ([94.100.177.104]:52190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nUPw9-0003xw-S2; Wed, 16 Mar 2022 05:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Resr0a6SZ+++kbEbcAphhweJbQVaV5pTwyIcYjDXcHI=; 
 t=1647422841;x=1648028241; 
 b=jZHU/VFlf56OwvTgE8g+s9Wed+woquWQ5PI2rDP8mOTgx9osXODMqeGpIaTYndlbscL/cUFbPbdgogB0LXbEHTjaNVlBFjNe9Md+d4q+V3W0+H5g4jATd2JwhtbhS2cctARfDQO15mu0U4VvbGrH4tx09/X6hz2YaO50rbu2s28SfOKpfKkysViadwikGSSl4A2kk5JHK3cvLU4fiToNx+F4rh/7GO2PL4oIau++YjMGG8FQQOOniDZPpRLT6bHySTPAmGY2OYu8jeL6r4w79FwL78IClBymnwDw+eXzLnQXNRSx/64cCBnVowF/KuV4O+EOEF2sUR1FjQ+yByjrnA==;
Received: by smtp44.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nUPw4-0003L7-13; Wed, 16 Mar 2022 12:27:16 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com,
	v.sementsov-og@mail.ru
Subject: [PATCH v2] MAINTAINERS: change Vladimir's email address
Date: Wed, 16 Mar 2022 12:27:02 +0300
Message-Id: <20220316092702.426629-1-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp44.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC6E89A8CCEF2E51DF9B70E0E78BE6910182A05F538085040C180F7CD96A386D71FAB7E061B81F1EA520A04FE9F292442DA84B3C702C9E7BE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E16D8B060A9A23898638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83B65766707D75771DD8D7226AE44810C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EECCD848CCB6FE560CCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE96A3A8AAADC8934A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC1D24C945E8ED59B63AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637FB8DFA2B4C1950FED81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FBC98423A6B99EAC042539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7AE7BCF8822911FFAB2FB32862571613143AD8EB30CF7A9EDBB1881A6453793CE9C32612AADDFBE0612021BB8FAF1186319510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21F5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34697E0FA301E2821512B99A519D150F76F7B1A73AD8D3517A038B7B884B7B701B04D098B425297B241D7E09C32AA3244CD0EE1E62063B3105DB9B6554D1A788C26C24832127668422927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojsh/F1VvpH8fzO5CmjyADig==
X-Mailru-Sender: 6C3E74F07C41AE94DFF23C58890DE8D59F5475698DDFD438EAEA4CB4B52CC787B5B3668FD548DDDEE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.104;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp44.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Old vsementsov@virtuozzo.com is not accessible anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---

v2: @ya.ru mailbox works bad with mailing lists and git send-email
command, @mail.ru works normally.

Probably, I'll have to change the email again in the near future. May be
not. But I think it worth to change it now to something that works.

 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2..c34b7562b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2500,7 +2500,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2539,7 +2539,7 @@ T: git https://repo.or.cz/qemu/armbru.git block-next
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2762,13 +2762,13 @@ F: scripts/*.py
 F: tests/*.py
 
 Benchmark util
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 S: Maintained
 F: scripts/simplebench/
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
 
 Transactions helper
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 S: Maintained
 F: include/qemu/transactions.h
 F: util/transactions.c
@@ -3352,7 +3352,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3448,7 +3448,7 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-- 
2.35.1


