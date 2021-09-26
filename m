Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A2418566
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 03:38:53 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUJ80-0005eS-7C
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 21:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=19037465be=david.dai@montage-tech.com>)
 id 1mUJ79-0004zB-3E
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 21:37:59 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:54248)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=19037465be=david.dai@montage-tech.com>)
 id 1mUJ77-0005WS-63
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 21:37:58 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Sat, 25 Sep 2021 18:30:29 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005812712.msg; Sat, 25 Sep 2021 18:30:29 -0700
X-Spam-Processed: usmail.montage-tech.com, Sat, 25 Sep 2021 18:30:29 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Sat, 25 Sep 2021 18:30:29 -0700
X-Return-Path: prvs=19037465be=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1632619804; x=1633224604;
 i=david.dai@montage-tech.com; q=dns/txt; h=From:To:Cc:Subject:
 Date:Message-Id:MIME-Version:Content-Transfer-Encoding; bh=ZYFNK
 CspkMssZm493TaUPrOTja2kAWrioCsePQz9mlU=; b=k0rEh0KQweU07tDnGYFcI
 /JDtRKylpJeeWbdba9UsQiv4tY7xcR0KdGMuO+CGz8wJ019Qpc4qvp4QVKmCSAgb
 i/Kb9Iqq0jjsvLX+29XknVe+2yusmqLA2z92jiUChXQ7nCdLEJRWfKFzTNGb9WOZ
 Sn92ui+MCryiBMzsvY6DIg=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Sun, 26 Sep 2021 09:30:04 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017481097.msg; Sun, 26 Sep 2021 09:30:02 +0800
X-Spam-Processed: shmail.montage-tech.com, Sun, 26 Sep 2021 09:30:02 +0800
 (not processed: message from trusted or authenticated source)
From: David Dai <david.dai@montage-tech.com>
To: qemu-devel@nongnu.org
Subject: 
Date: Sun, 26 Sep 2021 09:28:09 +0800
Message-Id: <20210926012809.76493-1-david.dai@montage-tech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=19037465be=david.dai@montage-tech.com;
 helo=usmail.montage-tech.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=0.001,
 DKIM_INVALID=0.1, DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 stefanha@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Add a virtual pci to QEMU, this pci device is used to dynamically attach memroy to VM,
so driver in guest can apply host memory in fly without virtualization management
software's help, such as libvirt/manager. The attached memory is isolated from System RAM,
 it can be used in heterogeneous memory management for virtualization.




