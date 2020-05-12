Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5771CEA6C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 04:03:07 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYKG9-0003a7-M9
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 22:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jYKEv-0002nV-6B
 for qemu-devel@nongnu.org; Mon, 11 May 2020 22:01:49 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jYKEt-0003bH-1Z
 for qemu-devel@nongnu.org; Mon, 11 May 2020 22:01:48 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1723538|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_social|0.0954109-0.000910089-0.903679; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03309; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.HX7DxE7_1589248891; 
Received: from 30.225.208.71(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HX7DxE7_1589248891)
 by smtp.aliyun-inc.com(10.147.40.233);
 Tue, 12 May 2020 10:01:32 +0800
To: pavel.dovgaluk@ispras.ru
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Questions about record & replay for RISC-V
Message-ID: <30f3e5ff-fd20-5005-a033-d8c93a0f3194@c-sky.com>
Date: Tue, 12 May 2020 10:01:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 22:01:33
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pavel,

I am developing a profiling tool depending on record & replay feature of 
QEMU for  RISC-V.
Here I'd like to ask you some questions.

First, is it possible to record & replay a Linux system by this feature 
in theory? I mean keep the strict instruction
sequence of each process and kernel, for a very simple image,  with only 
timer and UART.

Second, is it planed to support RISC-V?

Thanks very much.

Best regards,
Zhiwei

