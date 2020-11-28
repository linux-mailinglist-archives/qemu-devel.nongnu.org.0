Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42832C6F34
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 07:57:53 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiuB6-0007Kf-HV
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 01:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiuAK-0006t7-T7
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:57:04 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiuAH-0003w0-IL
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 01:57:04 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cjj2f20vbz4whm
 for <qemu-devel@nongnu.org>; Sat, 28 Nov 2020 14:56:26 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 28 Nov 2020 14:56:48 +0800
Received: from [10.174.187.211] (10.174.187.211) by
 dggemi758-chm.china.huawei.com (10.1.198.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 28 Nov 2020 14:56:48 +0800
Subject: =?UTF-8?B?5Zue5aSN?=
To: Ying Fang <fangying1@huawei.com>
References: <20201127074116.2061-1-jinzeyu@huawei.com>
 <87zh33ruzd.fsf@dusky.pond.sub.org>
From: Zeyu Jin <jinzeyu@huawei.com>
Message-ID: <dd691d4e-ae9a-3497-0b2e-4069f64ecc2d@huawei.com>
Date: Sat, 28 Nov 2020 14:56:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87zh33ruzd.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=jinzeyu@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/27 17:48, Markus Armbruster wrote:
> Kevin, Max, suggest to skip right to Qcow2CompressionType.
> 
> Zeyu Jin <jinzeyu@huawei.com> writes:
> 
>> A multi-thread compress method parameter is added to hold the method we
>> are going to use. By default the 'zlib' method is used to maintain the
>> compatibility as before.
>>
>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
> [...]
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 3c75820527..2ed6a55b92 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -525,6 +525,19 @@
>>    'data': [ 'none', 'zlib',
>>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>  
>> +##
>> +# @CompressMethod:
>> +#
>> +# An enumeration of multi-thread compression methods.
>> +#
>> +# @zlib: use zlib compression method.
>> +#
>> +# Since: 6.0
>> +#
>> +##
>> +{ 'enum': 'CompressMethod',
>> +  'data': [ 'zlib' ] }
>> +
>>  ##
>>  # @BitmapMigrationBitmapAlias:
>>  #
>> @@ -599,6 +612,9 @@
>>  #                      compression, so set the decompress-threads to the number about 1/4
>>  #                      of compress-threads is adequate.
>>  #
>> +# @compress-method: Set compression method to use in multi-thread compression.
>> +#                   Defaults to zlib. (Since 6.0)
> 
> We already have @multifd-compression.  Why do we need to control the two
> separately?  Can you give a use case for different settings?

Generally, mulit-thread compression deals with the situation
where network bandwith is limited but cpu resource is adequate. Multifd
instead aims to situation where single fd cannot take full advantage of
network bandwith. So compression based on multifd cannot fully cover the
cases for multi-thread compression.

For example, for migration with a bandwith limitation of 10M
bytes/second, single fd is enough for data delivery. This is the case
for multi-thread compression.

> 
> If we do want two parameters: the names @compress-method and
> @multifd-compression are inconsistent.  According to your comment,
> @compress-method applies only to multi-thread compression.  That leads
> me to suggest renaming it to @multi-thread-compression.
> 

For the names, my original idea is to make 'CompressMethod' consistent
with other multi-thread compression parameters, like 'compress-threads'
and 'compress-level'. There is truly some inconsistency here, between
multifd-compression params and old multi-thread compression params.

For now, I agree with you that 'multi-thread-compression' is better. It
is more specific and clear. I will rename the params in next version.
Thanks for the suggestion.

> After PATCH 4, CompressMethod is almost the same as MultiFDCompression:
> 
>    { 'enum': 'CompressMethod',
>      'data': [ 'zlib' ] }
>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
>    { 'enum': 'MultiFDCompression',
>      'data': [ 'none', 'zlib',
>                { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
> The difference is member 'none'.  Why does compression 'none' make sense
> for multi-fd, but not for multi-thread?
> 

When you set 'none'in multi-fd compression, you would not use the
compression capability in multi-fd.

In comparison, once you turn on multi-thread compression capability, you
have already admitted to use compression. In this case, member 'none' is
meaningless.

> If the difference is wanted: the names are inconsistent.  Less of an
> issue than member names, because type names are not externally visible.
> Let's make them consistent anyway.
> 
> Hmm, there's also Qcow2CompressionType.  That's another conversation;
> I'll start a new thread for it.
> 
> [...]
>> .

