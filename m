Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006D4DAEF3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:36:33 +0100 (CET)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURxA-0001Hf-NQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:36:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nURsw-00068H-3r
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:32:10 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:38640
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nURst-00088x-9q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:32:09 -0400
HMM_SOURCE_IP: 172.18.0.188:53556.1008326885
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5FC3E2800EC;
 Wed, 16 Mar 2022 19:31:54 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id e462f571ab6c4a00872e7c5b474801c7 for
 peterx@redhat.com; Wed, 16 Mar 2022 19:31:57 CST
X-Transaction-ID: e462f571ab6c4a00872e7c5b474801c7
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <4e0fb112-013b-7877-67e5-cf29d52f6876@chinatelecom.cn>
Date: Wed, 16 Mar 2022 19:31:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v20 8/9] migration-test: Export migration-test util
 funtions
To: Peter Xu <peterx@redhat.com>
References: <cover.1647396907.git.huangy81@chinatelecom.cn>
 <5be89638a128ce19c38c2cee8e055ad900b52a9c.1647396907.git.huangy81@chinatelecom.cn>
 <YjFi4UbB3Rh9iDBV@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YjFi4UbB3Rh9iDBV@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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



在 2022/3/16 12:09, Peter Xu 写道:
> On Wed, Mar 16, 2022 at 10:21:38AM +0800, huangy81@chinatelecom.cn wrote:
>> +void cleanup(const char *filename)
>> +{
>> +    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
>> +
>> +    unlink(path);
>> +}
> 
> If to move most of these tmpfs helpers out anyway, shouldn't we also move
> all tmpfs ops into this helper file?  E.g. initializations of tmpfs var is
> still separately done.  That's a bit odd.
> 
> Ideally IIUC tmpfs doesn't need to be exported in migration-helpers.h at
> all below, but hidden.
Indeed，exporting tmpfs var seems weried. I would remove this next 
version. Thanks
> 
>> diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
>> index d63bba9..d08551f 100644
>> --- a/tests/qtest/migration-helpers.h
>> +++ b/tests/qtest/migration-helpers.h
>> @@ -14,7 +14,14 @@
>>   
>>   #include "libqos/libqtest.h"
>>   
>> +/* For dirty ring test; so far only x86_64 is supported */
>> +#if defined(__linux__) && defined(HOST_X86_64)
>> +#include "linux/kvm.h"
>> +#endif
>> +#include <sys/ioctl.h>
>> +
>>   extern bool got_stop;
>> +extern const char *tmpfs;
> 

-- 
Best regard

Hyman Huang(黄勇)

