Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343829D08A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 16:08:41 +0100 (CET)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXn44-0006ai-EB
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 11:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXn1n-0005Eh-52
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXn1g-0004lB-JY
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603897569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cu+A6FbL4icM+oyrSkDsqBrl3qU0PQJiQ3nWqMDOkIA=;
 b=hudAUX2BYqk14fZC9HfQ7n1+B3M5DNlhxJa8thbCd38bW6TswL4014PAXHl42zEDQNNW9w
 3khB1wiHadfB5dmpFBSHzv1pHcpVy5xVLwlUYBaDHxVtpZEgex4RBQszbTorcO0lt3SDcA
 oGMQGBvDsK66jaJ2CsREIPE+hOEQHeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-hMbfclVvMT6-9UdWONPbuA-1; Wed, 28 Oct 2020 11:06:07 -0400
X-MC-Unique: hMbfclVvMT6-9UdWONPbuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 650EB8015C3;
 Wed, 28 Oct 2020 15:06:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911A076642;
 Wed, 28 Oct 2020 15:06:04 +0000 (UTC)
Subject: Re: [PATCH 8/9] target/ppc: silence the compiler warnings
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-9-kuhn.chenqun@huawei.com>
 <77fb89c5-daa2-0039-bdba-cce0f9895195@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c8255814-80ff-8937-938f-158ff924bb91@redhat.com>
Date: Wed, 28 Oct 2020 16:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <77fb89c5-daa2-0039-bdba-cce0f9895195@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2020 10.56, Philippe Mathieu-Daudé wrote:
> On 10/28/20 5:18 AM, Chen Qun wrote:
>> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
>> target/ppc/mmu_helper.c: In function ‘dump_mmu’:
>> target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>  1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
>>       |            ^
>> target/ppc/mmu_helper.c:1358:5: note: here
>>  1358 |     default:
>>       |     ^~~~~~~
>>
>> Add the corresponding "fall through" comment to fix it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> ---
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  target/ppc/mmu_helper.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
>> index 8972714775..51749b62df 100644
>> --- a/target/ppc/mmu_helper.c
>> +++ b/target/ppc/mmu_helper.c
>> @@ -1355,6 +1355,7 @@ void dump_mmu(CPUPPCState *env)
>>              break;
>>          }
>>  #endif
>> +        /* fall through */
> 
> I'm surprise the compiler emit a warning for missing comment,
> but don't emit one for superfluous and confusing ones (when
> building a ppc32-only target). You'd need to put this before
> the #endif.
> 
> But instead of this band-aid to silent warning, replace the
> TODO by a LOG_UNIMP call, and add a break before the #endif.

+1 for replacing the TODO with a LOG_UNIMP call and adding a break instead,
that would look way less messy than the current code.

 Thanks,
  Thomas


