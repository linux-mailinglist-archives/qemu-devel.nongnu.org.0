Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4122F5C5E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:28:09 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzxzE-0005BF-CW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyI-0004Fn-12; Thu, 14 Jan 2021 03:27:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyF-0006a0-Kv; Thu, 14 Jan 2021 03:27:09 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DGcpF6QF0z15sh9;
 Thu, 14 Jan 2021 16:25:57 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Jan 2021
 16:26:53 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH 0/6] Fix some style problems in audio
Date: Thu, 14 Jan 2021 16:10:53 +0800
Message-ID: <20210114081059.19632-1-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhanghan64@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some style problems in audio directory are found by checkpatch.pl. Fix these
style problems.

Zhang Han (6):
  audio: Add braces for statements/fix braces' position
  audio: Add spaces around operator/delete redundant spaces
  audio: foo* bar" should be "foo *bar".
  audio: Fix lines over 90 characters
  audio: Don't use '#' flag of printf format ('%#') in format strings
  audio: Suspect code indent for conditional statements

 audio/alsaaudio.c      | 15 +++++--------
 audio/audio.c          | 26 ++++++++++------------
 audio/audio_template.h | 14 +++++-------
 audio/coreaudio.c      | 17 +++++++-------
 audio/dsoundaudio.c    | 50 +++++++++++++++++++++++++++---------------
 audio/jackaudio.c      |  2 +-
 audio/ossaudio.c       | 12 ++++------
 audio/paaudio.c        |  2 +-
 8 files changed, 68 insertions(+), 70 deletions(-)

-- 
2.29.1.59.gf9b6481aed


