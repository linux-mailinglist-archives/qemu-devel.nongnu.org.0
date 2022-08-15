Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DD593110
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 16:55:22 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNbUv-0001Wr-Aj
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 10:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fb@frank-buss.de>) id 1oNbLe-0001Fx-DI
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:45:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fb@frank-buss.de>) id 1oNbBh-0005rO-Lq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:35:31 -0400
Received: from [192.168.11.32] ([89.0.228.67]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MnpP8-1nYbF03HIo-00pMPR for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022
 16:35:24 +0200
Message-ID: <83bb27f7-8700-f96c-617c-8e9dfa485db6@frank-buss.de>
Date: Mon, 15 Aug 2022 16:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Frank Buss <fb@frank-buss.de>
Subject: CAN driver for the MCP2515 IC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xy9qTFHPowULCYfG1MzZYOozwDHgCLstHFScAgn4ljHhRq3xbf/
 zuxGqEXLftbp7fmNxExS+L8ziNTTphSB982qrmaHGR+LiyVjX8Wgp+l1n+dL9JzLx45TmgA
 U6+UpH0kfRMDEt8SnZUmzzMZp6Qe16ug/YIc7JHWpw0GxfqaNWsaEIoRucTyup88idNQIi8
 EtFaYZBp6QgLDumf5JKWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u6Mmr0xdg3o=:qC9meT3B5VkpYkDpVnzHnJ
 Dun8IMMX5KE6itxT3NZi4ZaVczX5yfcjucqWNeBo2AiRYuxQsrD93jZmWgo9olH2GoL4fDncG
 r1DjF86Y6PX7FCyyE04KxepPlAronjr734kbuDpiSxD9BwbRFkFHsCFCqAXcqELxUBCrIbM5y
 RnMaMItdx3oKQbaTTz17x/UWljaC5yRVTyCHmMXUp8kQEvFoXe0RSOgv5UeObAucdnz4HePmh
 41WDYs2zZS5SBmt84ODnmQyTi9xGxoYJEpARM3JoPPon53qTge8M3VOsuDDnav3ArHJE7EVC+
 Z3YW/0pT4rU4C7Eh+hKdKxdTSaAvo5oHqedYyzeNq4HmIghy9glR++3ioyDmdRJ2Ga4oHlqlj
 nCvcBgkuS1JuyIDrpfRhFHMkQUn36M2eJtgrneX73xnIMz2MbwWbJBWDgpZXJyzQzb2UlDV8Z
 nCzawaTgnjTrqBbJLUCSnVS6SNvISlGzq9OJLd8AgT9hrl+6MynXTM2xMyTyJCrTfRLiL+bSx
 yDcaQYOUBsjf+sNomypP2ZViGHD1Bozi06VMw+/lOxVPs8DHKvd78T8M9oet7yMZLPmlGfAWw
 ggpVbThXQH/elqZANwoyzfJqt9oN23wc1Z29gBi3M9D1/AZq1cZm8th6+lrHSXPQlcCnBGmbD
 vt1ORE29CiHgOnCwKCIvRqCjRL45IFiEFJDIEO/t5peM6Eru2Sj1AbcoxNPCgocLM3lD+0Kq7
 tP75jsIqr2DrxhF7tPYkglEs59D7uoZkmcPRbQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=fb@frank-buss.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Hello,

I'm using the MCP2515 CAN controller IC with Zephyr. For easier testing, 
I would like to simulate it with QEMU, forwarding it to the Linux host 
CAN system. Is there already such an implementation? Otherwise I would 
write one (probably based on the Xilinx CAN implementation) and send a 
patch, shouldn't be much work.

Best regards,

Frank

