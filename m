Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18801F194B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 14:54:27 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiHII-0004hZ-VX
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 08:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jiHHX-00047M-3P
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 08:53:39 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jiHHU-0007LF-O7
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 08:53:38 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4090251|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0555507-0.00305885-0.94139;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03308; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.Hjhqnj0_1591620807; 
Received: from 30.225.208.60(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hjhqnj0_1591620807)
 by smtp.aliyun-inc.com(10.147.41.120);
 Mon, 08 Jun 2020 20:53:27 +0800
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: fpu/softfloat: a question on BFloat 16 support on QEMU
Message-ID: <ea06c0c3-465e-34a5-5427-41ae6bf583dc@c-sky.com>
Date: Mon, 8 Jun 2020 20:53:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 08:53:28
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

I am doing bfloat16 support on QEMU.

Once I tried to reuse float32 interface, but I couldn't properly process 
rounding in some insns like fadd.

What's your opinion about it? Should I expand the fpu/softfloat?

Best Regards,
Zhiwei

