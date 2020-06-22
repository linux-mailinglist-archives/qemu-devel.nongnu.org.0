Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EA2037CD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 15:21:28 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnMO7-0003aP-Mw
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 09:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1jnMMq-0002hD-Vn
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:20:09 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1jnMMp-0001gk-6N
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:20:08 -0400
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M9nAB-1jkLYR2gpZ-005mXp; Mon, 22 Jun 2020 15:19:58 +0200
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] tricore: added triboard with tc27x_soc
Date: Mon, 22 Jun 2020 15:19:33 +0200
Message-Id: <20200622131934.10328-1-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
X-Provags-ID: V03:K1:/fX7kEWGxVmAfgZ9ptOT3frCY4RVreqek+2ev9Lh/vsxH5KIFms
 o7S/ATSOOrqIxUYqRPQDqFiSdN/sckUSaRKFZaRNPvX9BFe2v7D3CTSNaWIRICp6VdT7AUW
 0ebRoc2H8PcIChaV0jYeWtKBmTxtvUt7IeKI9Jj48CWqrkLyJNtUVwt8CJR/kTcOswuTs66
 J7QGSRpaNbPonefSdgbww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d0s3xXhe3Qk=:bxYTFPrcm9VnpS0fZAl6Rb
 ET7esTfCSZ7ZDkN+Sql1hDgvpiqvfujw1/2DuQ6A1NV6UcuIQ7uom636w8M1+ssjWc6cXwIOu
 jkTfAVCDbTNBAafCuJzavP4cmAzHqpLpdYSMxtbq1Aw0v6C5SR3/RlDjkTgVuEI1JHhNvCvVi
 Qlyq6wqBJEza1q3dwtShN8xAO2bCppTafJBYXMyUEh2zVrE/kq1GAZxP2CshVMzzqnHB+GcNp
 GxLuE5LCJDKlCmrB15xi8lK7mgS+u8J+cXCZpqFlkMBLZqd65yYB65ES7CP919nxdMZIadCNP
 +53EYx8VysMxiEDite8f8WfEkETGfHtaOw+UjK4SqZLSbN2lrAxHqdvt2zVrMVQWQ+FhNpaj7
 /gZpZ7DJzQqtIL8ST2Ol7pRC9VkPxBfZIK9Py0rWcFI1tH9XbK8fRrmbujEDc3OOBCvxILQpy
 BgZXAFRi09aYOPaUsbimVj8rVxVa8Bi/R1fJTG0fFltyAEhBb25WVsp8IjaroXLUONiaxwajE
 jNsGQ5YxMBvf9eO/424b04W8BUrsN/5Sh7KRsXa4KXiday0p4EBHObmSPj81FtFt0GGf9CA+a
 sf1xnW8zruIE4ggnUgpuuNlwpGuS3Faye3Ph2fzyB+kQf5hNmq6dt2sdVaIF4FaxUrH2XLYGr
 niZdtpzbvP0lN8I8l8/5mQGDfvSw7W0p6NRm5cq+7Ii8BshH8R88TTEhuXwGI9GFB+U7slh8L
 7XU55R1slnqeJnwaepY//UC7A11o7QGglx1Ey6Xv7NifLZFv0ZCwr+cvFrHyANXoaNrV+pJus
 uXRlIQ0i6omOKHgUvkMvqDM6GHf+g2KcVdU2aXpXsAgLfO/42N8GZ/LrZ4N9QoC+hbp0ZjC
Received-SPF: none client-ip=217.72.192.74;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 09:20:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: kbastian@mail.uni-paderborn.de,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

Hello everyone,

this patch adds the AURIX TC277 D-Step TriBoard as QEMU machine
(-M AURIX_TriBoard_TC277D). Memory maps are implemented according to the
"AURIX TC27x D-Step User's Manual V2.2 2014-12". AURIX memory layouts
are specified by the processor, that is why this patch has been reworked as a
SoC-implementation for v2. Patch v3 added sizes to memory mappings.

Andreas Konopik (1):
  tricore: added triboard with tc27x_soc

 hw/tricore/Kconfig             |   8 ++
 hw/tricore/Makefile.objs       |   2 +
 hw/tricore/tc27x_soc.c         | 246 +++++++++++++++++++++++++++++++++
 hw/tricore/triboard.c          | 102 ++++++++++++++
 include/hw/tricore/tc27x_soc.h | 139 +++++++++++++++++++
 include/hw/tricore/triboard.h  |  53 +++++++
 6 files changed, 550 insertions(+)
 create mode 100644 hw/tricore/tc27x_soc.c
 create mode 100644 hw/tricore/triboard.c
 create mode 100644 include/hw/tricore/tc27x_soc.h
 create mode 100644 include/hw/tricore/triboard.h

-- 
2.27.0


