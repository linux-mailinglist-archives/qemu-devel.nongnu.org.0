Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D552D175C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:19:47 +0100 (CET)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKAn-0003Vu-MJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmK7S-0000OB-3Y
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmK7P-0005tW-OQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZNhuRiz1HGV46gxIcxH7k8r/ZBQ0/jq73IAU+UAB48=;
 b=ZG3970tycsTirKrKjkfB1wwVfkAvKkY0hdkqf/C7WQfpaXz1W/VwIs7Gf2D7Oe/GMbM5xD
 GCKqx8T24mBdwZeePEkd6U8wfCTVQ9DFGLJOnpklCzbiaaoR9RDULjVPsNy9y670iiUKZm
 bWPaZIcTotN+r4vttFyRIMYxMiCfyZA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-e0uEtmbhOL2KQ9vXQvHaNQ-1; Mon, 07 Dec 2020 12:16:08 -0500
X-MC-Unique: e0uEtmbhOL2KQ9vXQvHaNQ-1
Received: by mail-ej1-f71.google.com with SMTP id u10so4102941ejy.18
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 09:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WZNhuRiz1HGV46gxIcxH7k8r/ZBQ0/jq73IAU+UAB48=;
 b=JU5ZXhxE1eRqgaii3DOyyOgxm+PdNMRjN8+/KN6eqC12/gs2aywJ6q8md/tqUd/IIc
 j5rGpmkx9NXHNabToWsxMzlJ0bFZVa8EYVyAurOf36CY/6v3uRks0/XXRWmSvEc6k4R0
 l9W8o1V7xYZlxegBOxU2y2jJrVc99yjjqAiHHaKT7wskAFVlJGfDTsaEjL5RQV6QIkB8
 BdV+P3Ckhoe/6LD2QVc/gfs3a0k+dkC63Rnl/sWedMuNi6luTfa3dTqPwesRERzBNH9e
 JeZMJ/h+fAFjnA5FFIrV/lEZ7qkWafLT6GWSDeBmmdSSRjhZL/d97M0cZZ1n+0B6SLOb
 9baQ==
X-Gm-Message-State: AOAM533ZC3Hgf8AGGIZSq9vL/67YEt5cbaXrw0HpwKVSQ49Be99irtP4
 oa/+OIGoV8M30HeElpTwj/4VuRGEfIuWZBDm3L3u5Ix9oJ2BfvcIp6X64AEjr76soBjgkY8uB0K
 kUxCYQhzI84gScBc=
X-Received: by 2002:a17:906:60d4:: with SMTP id
 f20mr20348948ejk.156.1607361366843; 
 Mon, 07 Dec 2020 09:16:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzLiXLeixQnlIDfZinzLpT5iC9dXHHfBV/qCisEtWv5Bou0dy7TIvqp7w/lpw/u2tgMDgg9Q==
X-Received: by 2002:a17:906:60d4:: with SMTP id
 f20mr20348915ejk.156.1607361366518; 
 Mon, 07 Dec 2020 09:16:06 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j9sm7898396eds.66.2020.12.07.09.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 09:16:05 -0800 (PST)
Subject: Re: [PATCH] block/nvme: Do not allow image creation with NVMe block
 driver
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20201204165724.2647357-1-philmd@redhat.com>
 <d1deeab3-251f-5081-7d45-0092b381bc5a@redhat.com>
Message-ID: <06e30ac7-e667-0b4c-4777-78a5edfe4069@redhat.com>
Date: Mon, 7 Dec 2020 18:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d1deeab3-251f-5081-7d45-0092b381bc5a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Xueqiang Wei <xuwei@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 11:28 PM, Philippe Mathieu-Daudé wrote:
> On 12/4/20 5:57 PM, Philippe Mathieu-Daudé wrote:
>> The NVMe driver does not support image creation.
>> The full drive has to be passed to the guest.
>>
>> Before:
>>
>>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
>>   Formatting 'nvme://0000:04:00.0/1', fmt=raw size=21474836480
>>
>>   $ qemu-img info nvme://0000:04:00.0/1
>>   image: nvme://0000:04:00.0/1
>>   file format: raw
>>   virtual size: 349 GiB (375083606016 bytes)
>>   disk size: unavailable

Maybe I should not forbid all formats... But 'raw' is kinda
dangerous, as there is no way to enforce the next layer to
access beside the size allocated.

Safe drive partitioning can be achieved creating namespaces,
feature which is not yet implemented.

>>
>> After:
>>
>>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
>>   qemu-img: nvme://0000:04:00.0/1: Protocol driver 'nvme' does not support image creation
>>
>> Fixes: 5a5e7f8cd86 ("block: trickle down the fallback image creation function use to the block drivers")
>> Reported-by: Xueqiang Wei <xuwei@redhat.com>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
> 
> Well Max didn't suggest the change but pointed me to commit 5a5e7f8cd86.
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Maxim Levitsky <mlevitsk@redhat.com>
>> ---
>>  block/nvme.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/block/nvme.c b/block/nvme.c
>> index a06a188d530..73ddf837c2b 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -1515,9 +1515,6 @@ static BlockDriver bdrv_nvme = {
>>      .protocol_name            = "nvme",
>>      .instance_size            = sizeof(BDRVNVMeState),
>>  
>> -    .bdrv_co_create_opts      = bdrv_co_create_opts_simple,
>> -    .create_opts              = &bdrv_create_opts_simple,
>> -
>>      .bdrv_parse_filename      = nvme_parse_filename,
>>      .bdrv_file_open           = nvme_file_open,
>>      .bdrv_close               = nvme_close,
>>
> 


