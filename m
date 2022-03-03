Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619794CB6C0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 07:13:15 +0100 (CET)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeiA-0006XV-EE
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 01:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPeh7-0005pU-IH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 01:12:09 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:54973
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPeh4-0005wo-5R
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 01:12:07 -0500
HMM_SOURCE_IP: 172.18.0.188:39866.1490861252
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id D72D12800A9;
 Thu,  3 Mar 2022 14:11:54 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 8657b0474bac4e19bbe4024c4c0dd3d5 for
 armbru@redhat.com; Thu, 03 Mar 2022 14:11:57 CST
X-Transaction-ID: 8657b0474bac4e19bbe4024c4c0dd3d5
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <421c4d25-093b-ec1a-e1cf-b954a21a1b1f@chinatelecom.cn>
Date: Thu, 3 Mar 2022 14:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v17 8/8] tests/qtest/qmp-cmd-test: Ignore
 query-vcpu-dirty-limit test
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <cover.1646243447.git.huangy81@chinatelecom.cn>
 <324b04870910c6fc489d0b1e4fe4e098737ae8c4.1646243447.git.huangy81@chinatelecom.cn>
 <87o82nefw5.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87o82nefw5.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/3/3 13:58, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> query-vcpu-dirty-limit success depends on enabling dirty
>> page rate limit, so just add it to the list of skipped
>> command to ensure qmp-cmd-test run successfully.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   tests/qtest/qmp-cmd-test.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>> index 7f103ea..4b216a0 100644
>> --- a/tests/qtest/qmp-cmd-test.c
>> +++ b/tests/qtest/qmp-cmd-test.c
>> @@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
>>           "query-sev-capabilities",
>>           "query-sgx",
>>           "query-sgx-capabilities",
>> +        /* Success depends on enabling dirty page rate limit */
>> +        "query-vcpu-dirty-limit",
>>           NULL
>>       };
>>       int i;
> 
> I think you need to squash this into the patch that adds the command, so
> "make check" passes after each commit.
> 
> As far as I can tell, there is no other test coverage.  That gap needs
> to be plugged.
> 
Indeed, please ignore this version. I have done this in versoin 18. :)

-- 
Best regard

Hyman Huang(黄勇)

