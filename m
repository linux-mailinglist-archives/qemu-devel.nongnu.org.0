Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8B3D563A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:11:28 +0200 (CEST)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vs5-0000g8-PS
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7vr2-0008BP-EV; Mon, 26 Jul 2021 04:20:52 -0400
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117]:11836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7vr0-0005qa-KM; Mon, 26 Jul 2021 04:20:52 -0400
IronPort-SDR: Zf6za24ZJxvhESduMWU3Hr7SJM5MqiiwZtddL/2SLnZ79uNfDqKjht8XfNua8zmnRcAHco2WNf
 pFif1JDVAscb7k9LORadvrNma5b9pCtMBVRL+tevOnr2Ex3Xvs6WR1nOClqYMp96j573BaLpPS
 VWsB0jzkc/r+0JoEuAiJzmWrLRhce8IWNcuPMhlEsv3JZ0N6K0FR9/PC/BgncxHg+y4ksv9Wqq
 jxQ/pZPypUICUIifc3FfhSE9Ige3xaUPOuHrvFJNbI5im0LWuumA4N1yLUgwPppGCIKU07c3fy
 5SbqRpHIJlvMUusqRPlq6iSv
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="37752777"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="37752777"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 26 Jul 2021 17:20:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FAE96CCAA;
 Mon, 26 Jul 2021 17:20:44 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4176F0A28;
 Mon, 26 Jul 2021 17:20:43 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om2.fujitsu.com (Postfix) with ESMTP id 9613D400568AA;
 Mon, 26 Jul 2021 17:20:43 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] This is a test mail
Date: Mon, 26 Jul 2021 17:20:31 +0900
Message-Id: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.117;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa4.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a test mail to check the behavior of my mail
because it is not listed in the ML of qemu-devel.
I may send several test mails.

I apologize and thank you for your patience.

Shuuichirou Ishii (1):
  Test mail v2.     This is a test mail to check the behavior of my mail
    because it is not listed in the ML of qemu-devel.     I may send
    several test mails. I apologize and thank you for your patience.

 test-mail.txt | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.3.1


