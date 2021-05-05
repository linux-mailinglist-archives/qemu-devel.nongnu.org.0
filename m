Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF751374AFC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 00:08:54 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePhN-0006Cy-NA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 18:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lePgQ-0005dZ-J2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 18:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lePgN-0003Ps-8Z
 for qemu-devel@nongnu.org; Wed, 05 May 2021 18:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620252470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwqRZwR10D97bFmnM0IsWKuvOVm3FB7MdD0LuCq28tA=;
 b=aYi6zJQN1qyS06CWXf16Abn+t6L12wJQ8Q+CTYT9pv1aBRTtPMMd/gOCcJn/3zLZH6x6dZ
 SKgy2MLdl5BgxfONkn3KnN73bM/+JXYqwO+INnsFyxiiWNLK+lf7Ugez2fxkUOpG3gP/RL
 4GVpvcoB2dZaBHEHvpmNt4oJgB5NXyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Hef9n6bPOZK9wtzhOmRbCg-1; Wed, 05 May 2021 18:07:48 -0400
X-MC-Unique: Hef9n6bPOZK9wtzhOmRbCg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so1281523wri.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwqRZwR10D97bFmnM0IsWKuvOVm3FB7MdD0LuCq28tA=;
 b=C0nq+NfIIy4D7RdkrTZoDIYchJk2OJBcOJ9Zu1miHrCkh4OTwvCbHznpARyIofriVM
 gZjQUVG6W2KN0IW/NA0qeXC5D7RhPY3Lt7opubfd4bGB/4DQYpv4iUMiSlguQgvcHXbP
 92tV5QFHKEXeJZRf9Pxejv4i3wHu0rE7EFeNdlfUDw+sRWTPFwsebL6QeL6ORXXxHgc6
 /Na8jIRbFqozizHgFciMzi8ci3yIq9hPL9XIlpCuric9febR0Ltvk/w5bDUKpEBIwLh/
 S+M9aemgkXGDDu5Fq2XXMACkq8/vuMbvL/QYDxu7K4hg0CmLwBRlVxcQtn34UwZcpkrA
 1TgA==
X-Gm-Message-State: AOAM5317+6ZWLhe18FG502s8FYrnQeMhaMnqIt7/F5ftt364SpaDAXS5
 EG9iOL2Y03FtQ+m0/eP4cXgxA5Gy19vFgf0YjeCH/+GgDI7uoSLsQ+e7saLrNUi0R8pPEFilsSJ
 Qvz8vkuFygcS40nQ=
X-Received: by 2002:adf:a212:: with SMTP id p18mr1230225wra.353.1620252467109; 
 Wed, 05 May 2021 15:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuq0Sqb3gue3GiyAYVrfUmpyPYWxI5zdUF4xzIO/LJWYRAWc//r6YKppQIREolmLJQcStEwQ==
X-Received: by 2002:adf:a212:: with SMTP id p18mr1230187wra.353.1620252466731; 
 Wed, 05 May 2021 15:07:46 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id z7sm933734wrl.11.2021.05.05.15.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 15:07:46 -0700 (PDT)
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
To: Keith Busch <kbusch@kernel.org>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
Date: Thu, 6 May 2021 00:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Eric

On 5/5/21 11:22 PM, Keith Busch wrote:
> On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daudé wrote:
>> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
>> a constant! Help it by using a definitions instead.
> 
> I don't understand.

Neither do I TBH...

> It's labeled 'const', so any reasonable compiler
> will place it in the 'text' segment of the executable rather than on the
> stack. While that's compiler specific, is there really a compiler doing
> something bad with this? If not, I do prefer the 'const' here if only
> because it limits the symbol scope ('static const' is also preferred if
> that helps).

Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)

Both static+const / const trigger:

hw/block/nvme.c: In function ‘nvme_map_sgl’:
hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array
‘segment’ [-Werror=vla]
  818 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
      |     ^~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/nvme.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 5fe082ec34c..2f6d4925826 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -812,7 +812,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
>>       * descriptors and segment chain) than the command transfer size, so it is
>>       * not bounded by MDTS.
>>       */
>> -    const int SEG_CHUNK_SIZE = 256;
>> +#define SEG_CHUNK_SIZE 256
>>  
>>      NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
>>      uint64_t nsgld;
>> -- 
>> 2.26.3
>>
> 


