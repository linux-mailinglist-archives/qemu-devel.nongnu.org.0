Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3474EDDA5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:44:01 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwxs-0003XV-N3
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:44:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nZwpU-0006Ws-Dz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:35:22 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:48227
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nZwpS-0007s4-Aq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:35:20 -0400
HMM_SOURCE_IP: 172.18.0.188:59016.1608508693
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.160 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id B6FE728008B;
 Thu, 31 Mar 2022 23:35:06 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 490d67d3724d467c9e520817d82a5906 for
 peterx@redhat.com; Thu, 31 Mar 2022 23:35:10 CST
X-Transaction-ID: 490d67d3724d467c9e520817d82a5906
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <899de505-9d82-e4a9-7d9d-74b3396b6add@chinatelecom.cn>
Date: Thu, 31 Mar 2022 23:35:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v21 8/9] migration-test: Export migration-test util
 funtions
To: Peter Xu <peterx@redhat.com>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
 <dc7f8ce5fadc148dc2c2e14bc43940d58cd205bc.1647435820.git.huangy81@chinatelecom.cn>
 <YkNV42fFoD0xZ4cd@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <YkNV42fFoD0xZ4cd@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/3/30 2:54, Peter Xu 写道:
> On Wed, Mar 16, 2022 at 09:07:20PM +0800, huangy81@chinatelecom.cn wrote:
>> +void wait_for_serial(const char *tmpfs, const char *side)
> 
> Passing over tmpfs over and over (even if it's mostly a constant) doesn't
> sound appealing to me..
> 
> I hope there's still a way that we could avoid doing that when spliting the
> file.  Or, how about you just add a new test into migration-test?  After
> all all migration tests (including auto-converge) is there, and I don't
> strongly feel that we need a separate file urgently.
Ok, i separated file just for code readability. I'm not very insistent 
to do this if we think it's ok to add dirtylimit test to migration test. 
Thanks for the comment. :)

Yong
>  > Thanks,
> 

