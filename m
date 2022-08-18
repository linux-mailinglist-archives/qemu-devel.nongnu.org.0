Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648235982C1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 13:58:24 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOeAI-0005Sg-Tz
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 07:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oOe47-0000u4-GS
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:52:01 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:58193
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oOe43-0007tm-9t
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:51:58 -0400
HMM_SOURCE_IP: 172.18.0.188:50246.1058077225
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id F32BD28008B;
 Thu, 18 Aug 2022 19:51:46 +0800 (CST)
X-189-SAVE-TO-SEND: tugy@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id e49dd066fef64abda5752caba764042e for
 peter.maydell@linaro.org; Thu, 18 Aug 2022 19:51:49 CST
X-Transaction-ID: e49dd066fef64abda5752caba764042e
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <72b11825-06bd-758c-189b-cac4470e0019@chinatelecom.cn>
Date: Thu, 18 Aug 2022 19:51:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] vhost-user: Call qemu_socketpair() instead of
 socketpair()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: f4bug@amsat.org, marcandre.lureau@redhat.com, qemu_oss@crudebyte.com,
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com,
 kraxel@redhat.com, qemu-devel@nongnu.org
References: <cover.1660303075.git.tugy@chinatelecom.cn>
 <3e370aa5326809d63f7eef573be558da987d27f5.1660303075.git.tugy@chinatelecom.cn>
 <CAFEAcA_MsAPxaqzgszYP2xSacNFMWZFH-8QQSRvSHCGjN93T3A@mail.gmail.com>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <CAFEAcA_MsAPxaqzgszYP2xSacNFMWZFH-8QQSRvSHCGjN93T3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.227; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



On 8/12/22 19:50, Peter Maydell wrote:
> On Fri, 12 Aug 2022 at 12:44, <tugy@chinatelecom.cn> wrote:
>>
>> From: Guoyi Tu <tugy@chinatelecom.cn>
>>
>> set close-on-exec flag on the new opened file descriptors at default
> 
> What goes wrong if we don't do this? The commit message
> is a good place to explain what bug the commit is fixing,
> and its consequences.
> 
> thanks
> -- PMM
> 
OK, will do and send another version

Thanks.

