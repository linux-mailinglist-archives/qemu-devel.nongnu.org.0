Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768336ED39
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jul 2019 03:40:22 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoeMH-0000jB-LF
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 21:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.weiyang@gmail.com>) id 1hoeM5-0000I7-BI
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 21:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.weiyang@gmail.com>) id 1hoeM4-0003xG-7B
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 21:40:09 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
 id 1hoeM4-0003wy-0r
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 21:40:08 -0400
Received: by mail-ed1-x543.google.com with SMTP id v15so35939713eds.9
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 18:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4h2PJCWyqKRTXUNUSJlOiBiLMGMqhkvDgdCgjSw9Amg=;
 b=NAzQ0MUqtrW1O5RT90dmgMgK3ju/Jgw1cXBEzij/cEM5uVS0CnhUcosQx9F2qyj3H7
 ZVNRv16M0K/TlpoMr1e9SJGOTNiIJJgfWIFePKVcXzPwleMuTfs54eOHNRu72sga/yao
 1GiiDwj9NmXuMEcZ9+vEUocJKG/8K2kBmv3oBgL9qbBSyLOWPHsSwdbyJMOtqrquELQs
 vGPfnNORwWt7wf9AxJ/5QwfIE9H4hGzczEM2WCh9q5IWqY9UPEAwI0A/0735wy0kjzJ+
 MQpns0V7CEGb4GOEHvPfRg/jW0wDFKRFytR4FTI6bPsCDdR++unOjL+nkwHXo/Duh7hw
 6LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4h2PJCWyqKRTXUNUSJlOiBiLMGMqhkvDgdCgjSw9Amg=;
 b=lhy1hXwObAbac7fl3BYeAYOonQJHV5HFgtXKaBiI/EQzsiQ9AfvK7UcJGnedJT3+Ol
 BrjuEhF8G7sx/J+GER0h9bhEhkZK4aaV0zOly1peMlLYZADnEUNAdjagl3p2xZ/lwPU/
 PNn5bCJt1T5B6keCU2i0zbXKK/GVnGbK3kjsBiXI5I5TUH8Ho4NxJkXN8AGhbO7TV0tj
 zSyUo2QrWPo9wO/KX/sfMsLr5/abr+tRdomMSy6KIp+DroV02cjXlYgMgIZmTcXdzXt6
 cbVYZP8sZH38BWv14lSgRqsz9S7WzedhpDFdDLITGo1sxY6W8v/vSr62BQHh2nkxoANN
 RqiA==
X-Gm-Message-State: APjAAAUwzdpe2zx45bUqNtez0taP6xsdWKSjDfs3wJSzpxGfgfLePxhQ
 pcvU7Aalt2xYe7ZWb1qApgGnY9Oc
X-Google-Smtp-Source: APXvYqz/+9vNH6HgO5Z/PDd1PaaeDBTdILSEVk+6mBbx/JSkPNraOJQ2aOw4eYj4/WVry5axADMGEQ==
X-Received: by 2002:a17:906:e11a:: with SMTP id
 gj26mr43891469ejb.95.1563586807074; 
 Fri, 19 Jul 2019 18:40:07 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id u9sm9149907edm.71.2019.07.19.18.40.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jul 2019 18:40:06 -0700 (PDT)
Date: Sat, 20 Jul 2019 01:40:05 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190720014005.zxmiv4dwbyufn23b@master>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
 <20190709140924.13291-4-richardw.yang@linux.intel.com>
 <20190719165950.GH3000@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719165950.GH3000@work-vm>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-devel] [PATCH 3/3] migration/savevm: move non
 SaveStateEntry condition check out of iteration
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 19, 2019 at 05:59:50PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> in_postcopy and iterable_only are not SaveStateEntry specific, it would
>> be more proper to check them out of iteration.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Worth it just to make that big if statement simpler!
>

Yep, the original one looks a little hard to understand.

Thanks for your comment.

>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
>> ---
>>  migration/savevm.c | 13 ++++++-------
>>  1 file changed, 6 insertions(+), 7 deletions(-)
>> 
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index c41e13e322..8a2ada529e 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1247,8 +1247,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>>  }
>>  
>>  static
>> -int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
>> -                                                bool iterable_only)
>> +int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>>  {
>>      SaveStateEntry *se;
>>      int ret;
>> @@ -1257,7 +1256,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
>>          if (!se->ops ||
>>              (in_postcopy && se->ops->has_postcopy &&
>>               se->ops->has_postcopy(se->opaque)) ||
>> -            (in_postcopy && !iterable_only) ||
>>              !se->ops->save_live_complete_precopy) {
>>              continue;
>>          }
>> @@ -1369,10 +1367,11 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>>  
>>      cpu_synchronize_all_states();
>>  
>> -    ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
>> -                                                      iterable_only);
>> -    if (ret) {
>> -        return ret;
>> +    if (!in_postcopy || iterable_only) {
>> +        ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>      }
>>  
>>      if (iterable_only) {
>> -- 
>> 2.17.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

