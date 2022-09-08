Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E825B2187
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 17:06:25 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWJ6m-0001Sf-LA
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 11:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oWJ05-0003cG-A2
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:59:29 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:49338
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oWJ03-0002WP-8z
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:59:29 -0400
HMM_SOURCE_IP: 172.18.0.218:33982.873127330
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.96.92 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 33D4E28008C;
 Thu,  8 Sep 2022 22:59:14 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 31cac22b33644402bb9939c4fdde1a07 for
 peterx@redhat.com; Thu, 08 Sep 2022 22:59:20 CST
X-Transaction-ID: 31cac22b33644402bb9939c4fdde1a07
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <6ba692e6-9eeb-4c5c-9b9e-d60d47fbf61a@chinatelecom.cn>
Date: Thu, 8 Sep 2022 22:59:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 4/8] migration: Implement dirty-limit convergence algo
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <4b42dedc0d1ed336ef39c604f3aa1611745a3917.1662052189.git.huangy81@chinatelecom.cn>
 <Yxevn7rSCKaPHQfd@xz-m1.local>
 <7022f34e-76d5-7287-74eb-846ae62e0f42@chinatelecom.cn>
 <YxoAkwLnnTtltEI/@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YxoAkwLnnTtltEI/@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



在 2022/9/8 22:47, Peter Xu 写道:
> Yong,
> 
> Your recent two posts all got wrongly cut-off by your mail server for some
> reason..
> 
Hm， i noticed that, i'll check it. Thanks for reminding. :)

-- 
Best regard

Hyman Huang(黄勇)

