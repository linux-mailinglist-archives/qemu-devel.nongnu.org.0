Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E5443D51
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 07:35:24 +0100 (CET)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi9rm-00016X-QJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 02:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mi9px-0000Me-Ad
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:33:29 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:48173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mi9pu-0003Mg-Mg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:33:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5407256|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.035069-0.0275016-0.937429;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=1; RT=1; SR=0; TI=SMTPD_---.LmitsjP_1635921193; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LmitsjP_1635921193)
 by smtp.aliyun-inc.com(10.147.41.187);
 Wed, 03 Nov 2021 14:33:13 +0800
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Question on plugin or modules support on windows
Message-ID: <72e4e46f-96d6-89a7-af51-3a5d3f81d45c@c-sky.com>
Date: Wed, 3 Nov 2021 14:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.121; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-121.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Hi folks,

I want to use plugins or modules on Windows. However, these features are 
still not supported  on cross build for Windows.
Does someone know why it is not supported?

I also want to look for some suggestions on how to implement it.

Any advice is appreciated.

Thanks,
Zhiwei


