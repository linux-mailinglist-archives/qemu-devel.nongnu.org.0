Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BF34EAFC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:49:06 +0200 (CEST)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFg1-00079k-6s
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lRFW9-00041S-DC
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:53 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lRFW7-0005Jv-Jz
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:53 -0400
Received: from localhost.localdomain ([82.142.14.126]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mo77T-1lxVqs19Ex-00pc0G; Tue, 30 Mar 2021 16:38:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Linux user for 6.0 patches
Date: Tue, 30 Mar 2021 16:38:45 +0200
Message-Id: <20210330143846.721955-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BWVYqT8x7I+87aHF2VArueVRvSNRCyraql/+yZe7Syn6IR8rcB3
 eRe8Yytrgw5MRPaotEc3waUVsp+HLOEZGyldn2bi8mmGeBvRDHYDMp80fUn7lCCI4jMumQ6
 AycIsWgqs+zG6f2/4QN8fIWvozfASnL2E0SVt0vOwQFj1Q4UGZ89PV+WNn2mPs87KMR6z4I
 eRJlnzoKvb8vs24a1yrbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ATMU0cTNHnw=:8Lh+0uN2O9oRWWTbZKoc0E
 aQ4MDUqLloy96G3uuUuNJyp81o3FtOZ1ZCYczgngJLeaiRnoil65Mb3bJVfFPLXijdBwm+Thp
 aHQCF2AwUnYgRXQD7Nz1FYxTWtQgDAM1lvBm418LSrcxd98ztmOS8VbaMfZ3bLOhlvcLtO5cH
 ulIDsneYAQS/GmwW0s888I1D0BLUAOGtUmxh7jriQStYZ78recNjQ5HYJm9nZifs2IismeyAJ
 cXx96OCPRTwikc1YhYu+6NJtXKq9OL7QbKs8t08PMt0twvbeXSN8BkzMhkkvsgnaQ6jkEZ/Kj
 h+JZcMdPuIWE/38L+tAcrroYYUBK49ZBQGbB/rQPJClsecDvj9UX4F9zhsQDTEYUF2Rror2tw
 g4ZK+LFy8wsGgWpeAjyN4gOHdbumLBcArFA+yxEQ6EL44d3W4qhUSJgiQykPrXq5upInQv3fT
 YaE4WCL8LU4bjnbKgB0nt9GxZ8WNxk7qQ9Aj2U+VybH+cLm4G/Wp
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-=3D=0D
request' into staging (2021-03-28 19:49:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 13e340c886679fb17df02a35e7d82cb8beb6e9f4:=0D
=0D
  linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its length is 0 (2=
02=3D=0D
1-03-29 21:56:18 +0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user Pull request 20210330=0D
=0D
Fix NETLINK_LIST_MEMBERSHIPS with NULL/invalid pointer and 0 length=0D
=0D
----------------------------------------------------------------=0D
=0D
Fr=3DC3=3DA9d=3DC3=3DA9ric Fortier (1):=0D
  linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its length is 0=0D
=0D
 linux-user/syscall.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=3D20=0D
2.30.2=0D
=0D

