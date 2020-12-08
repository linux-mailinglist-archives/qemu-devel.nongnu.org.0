Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94602D329A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:25:53 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmicS-0005bk-Py
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiSA-0007tB-Vy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:15:17 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiS1-0007TX-K2
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:15:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8J9xwr029391;
 Tue, 8 Dec 2020 19:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=UwHmdZtWvx7zCKunOoRSHkvbiY16FLCLUGXZNXruGiQ=;
 b=gk8zn+bhxtXKPrKNTtbe9VYHXAHCEgowsZv4OImAHGFk218n4qMerkjSVnyhzJMausj3
 l4qMYZP8qUon9sg4IvPJkpSnZwkfyF5x4okpghKn7gdO5IETVrzGo/h6JXV6DcahBqim
 P7cscmwSbpOxTAVdNO99BypG2H/IGdt3JB5vCjAGDEvA5Qbg00Rx+/m6x4tEQg6pSPQt
 RdpMXWa731F3osGAVa68Kr2I+1+V4gjfhKwqpbtVLIjHp3PTUM5/NfmHHEN/But1sn8f
 SXkod+PSfmS9FRGquoCG1mb/srEXI+aNAbuPX/ovmxtPZRIsA0rBs2dsnNLzviWjq95A ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3581mqvh97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Dec 2020 19:14:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8JAeGr015803;
 Tue, 8 Dec 2020 19:14:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 358kytcva6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Dec 2020 19:14:58 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8JEvfd028385;
 Tue, 8 Dec 2020 19:14:57 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 11:14:56 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Add a new -action parameter
Date: Tue,  8 Dec 2020 14:14:46 -0500
Message-Id: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080117
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow up to the proposal to add a "-no-panicstop" option to QEMU that would allow us to
control whether the VM is paused or allowed to continue running without intervention from a management layer
when a guest panic occurs. See the inital thread and replies for details:

https://lore.kernel.org/qemu-devel/1601606494-1154-1-git-send-email-alejandro.j.jimenez@oracle.com/

From that discussion came a request for a generic mechanism to group options like -no-shutdown, -no-reboot, etc,
that specify an action taken by QEMU in response to a guest event (reboot, shutdown, panic, and watchdog
expiration are the current options). The existing options would translate to the new option, like:

* -no-reboot --> "-action reboot=shutdown"
* -no-shutdown --> "-action shutdown=pause"

Please share any questions or comments.

Regards,
Alejandro

Alejandro Jimenez (4):
  vl: Add an -action option to respond to guest events
  vl: Add option to avoid stopping VM upon guest panic
  qmp: Allow setting -action parameters on the fly
  qtest/pvpanic: Test panic option that allows VM to continue

 MAINTAINERS                      |   2 +
 include/sysemu/runstate-action.h |  16 ++++
 include/sysemu/sysemu.h          |   2 +
 qapi/run-state.json              | 140 +++++++++++++++++++++++++++++++++++
 qemu-options.hx                  |  25 +++++++
 softmmu/meson.build              |   1 +
 softmmu/runstate-action.c        | 153 +++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                     |  44 ++++++++++-
 tests/qtest/pvpanic-test.c       |  26 ++++++-
 9 files changed, 404 insertions(+), 5 deletions(-)
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/runstate-action.c

-- 
1.8.3.1


