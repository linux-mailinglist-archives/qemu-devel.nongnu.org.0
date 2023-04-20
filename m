Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBD6E99DF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:49:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppXRh-0004wf-Vy; Thu, 20 Apr 2023 12:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppXRe-0004vs-IT; Thu, 20 Apr 2023 12:47:42 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppXRY-0002uX-SG; Thu, 20 Apr 2023 12:47:42 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AAD4A5FC19;
 Thu, 20 Apr 2023 19:47:23 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58f::1:1d] (unknown
 [2a02:6b8:b081:b58f::1:1d])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id Llhr0015UuQ0-VizhMOFd; Thu, 20 Apr 2023 19:47:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682009242; bh=m7Q451d/Nt3/Oj21TluThGwq1Gf5GKUJ50U9QXbZWYY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=oz6WxluCFrg5D3tMuzhGHztxYpBHBogPEKsbBwtoYQRdSmGLOvbLVvAv2sDazYRtZ
 R/wVj7ZdX8fs84jKKXwv0k2ILqVrZve2eZVIAuaghW/LX99JtbHtc5Wt3LYqvWVvT8
 qFWt+UNUWmEWDghzugfkKQoBCNMrtFtmfXk8aDqE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <79d1bb42-4457-6da0-6230-47d9ab021305@yandex-team.ru>
Date: Thu, 20 Apr 2023 19:47:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] scripts/qapi: allow optional experimental enum
 values
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com, chen.zhang@intel.com,
 lizhijian@fujitsu.com
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-3-vsementsov@yandex-team.ru>
 <rt6g5voqlmz2x3ydkyi4zabffigjfnl2ivqwjqhtnusjztqtdw@ndmtjfneg4mc>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <rt6g5voqlmz2x3ydkyi4zabffigjfnl2ivqwjqhtnusjztqtdw@ndmtjfneg4mc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20.04.23 17:43, Eric Blake wrote:
> On Thu, Apr 20, 2023 at 01:52:30AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> To be used in the next commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   scripts/qapi/types.py | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
>> index c39d054d2c..18f8734047 100644
>> --- a/scripts/qapi/types.py
>> +++ b/scripts/qapi/types.py
>> @@ -61,10 +61,12 @@ def gen_enum_lookup(name: str,
>>   
>>           special_features = gen_special_features(memb.features)
>>           if special_features != '0':
>> +            feats += memb.ifcond.gen_if()
>>               feats += mcgen('''
>>           [%(index)s] = %(special_features)s,
>>   ''',
>>                              index=index, special_features=special_features)
>> +            feats += memb.ifcond.gen_endif()
> 
> Perhaps Markus will have a comment here; but in general, changes to
> the QAPI that don't have accompanying changes in the testsuite are
> hard to prove that they do something useful.
> 
> At a minimum, the commit message should at least say what sort of
> things are not permitted without this patch that are now possible,
> rather than making me figure out what the next patch uses that failed
> the QAPI generator without this patch.
> 

OK, I'll improve the commit message if we decide to keep patch 3 as is.

Actually patch would be more obvious if have a bit more code context: just above this same gen_if()s are called to generate #ifdefs for enum members.


-- 
Best regards,
Vladimir


