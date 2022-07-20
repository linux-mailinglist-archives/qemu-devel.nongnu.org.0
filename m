Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31957B803
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:01:36 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEAGc-0001xC-Sf
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEADo-00088I-GA; Wed, 20 Jul 2022 09:58:40 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEADm-0007LR-Lk; Wed, 20 Jul 2022 09:58:40 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso8062302otb.6; 
 Wed, 20 Jul 2022 06:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4BcrDtNLoViTcF17AFem+OBUgyMvZ6bINf5NqHwxdig=;
 b=B7mhrK9rmoN/UuzW/48SqSfa51LWCy3luEQqneXIiVRKhSEHoPSxHDf/H+mxaeC9Jl
 wrrVgGXST8X09cySaxjx0EXkaWLWMzbe2W3VOWNypHHqVahsK9U0rbc8NfN9I+o3GJFt
 wZIsVKgceuSN8Esu/zA30ReLFO3ml2tMq7/jOtJE9zOR2F07HqKzLy0sqEBmQEr+ufTZ
 eWBIiTvsvV/l81Ysk/dlcjc07R08kbcBM/e5KxBUUbMIe4oSqUS2DC2e4s4ubEBp3y9o
 EoY8CfpaG7O6pj6s2ZnTR11dSbQHS8YQrm8uVmXNgDVo6CFQF8MTTTJFw9PP99wE8xue
 6Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4BcrDtNLoViTcF17AFem+OBUgyMvZ6bINf5NqHwxdig=;
 b=syBhwtIn9zwmSndYr6Ng8BrXEvKfhQBxJ5/vTA9Z4VD6oV9tleH6O5bZaYiTNIllTx
 KIc7UUHNhK9CTxDa9i8cMzCxZ5Rl28MF3BhAyCeXrbcGOt7nKGvLgWF6rAFW3i5bDAxy
 nFmAoXOwf5bSr088VGpTY8lng+T19Yiup/hLNG+rfp8nA+I+Ei6Gi2Ifq6oYwnxYJ1Wu
 gtmQXtfMrx9FmO9Ajxuk6LCg6O2tGHOR0MRXCimJ4eCvTheDMRY2jbD0qcHFScB1MWWF
 V0CHtnFSdYScdYeIWcUehc2CCJ134RM1IudszcEuGjtSBNSZktkqnKyLbtzWXfU8iVsz
 sVcg==
X-Gm-Message-State: AJIora/mVwBdvfhJsWHoXEMW3VOWu4AdzRcx5mZHs0TAUl5xTmgY0Etx
 WiJhkE/XKTlXl1Ay8YynqYc=
X-Google-Smtp-Source: AGRyM1sIIitp00je6+T1nW7qa0iVXkCNxj52H7DHt4+2vQLVC0NaiVnBgZJVhMUsx6ZK9M+7zfZ9MQ==
X-Received: by 2002:a9d:1711:0:b0:61c:ad2b:ddb0 with SMTP id
 i17-20020a9d1711000000b0061cad2bddb0mr5188488ota.87.1658325516618; 
 Wed, 20 Jul 2022 06:58:36 -0700 (PDT)
Received: from [192.168.10.102] (200-232-202-163.dsl.telesp.net.br.
 [200.232.202.163]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056870340f00b000fb2aa6eef2sm8938083oah.32.2022.07.20.06.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 06:58:36 -0700 (PDT)
Message-ID: <e3c7cc0f-fc7e-95bf-59b4-2d40f35b6f0c@gmail.com>
Date: Wed, 20 Jul 2022 10:58:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] hw/ppc: check if spapr_drc_index() returns NULL in
 spapr_nvdimm.c
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
References: <20220409200856.283076-1-danielhb413@gmail.com>
 <20220409200856.283076-2-danielhb413@gmail.com>
 <20220720151649.203abd3d@bahia>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220720151649.203abd3d@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/20/22 10:16, Greg Kurz wrote:
> On Sat,  9 Apr 2022 17:08:56 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
>> DRC object returned by spapr_drc_index() without checking it for NULL.
>> In this case we would be dereferencing a NULL pointer when doing
>> SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).
>>
>> This can happen if, during a scm_flush(), the DRC object is wrongly
>> freed/released (e.g. a bug in another part of the code).
>> spapr_drc_index() would then return NULL in the callbacks.
>>
>> Fixes: Coverity CID 1487108, 1487178
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
> 
> LGTM
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>


Thanks Greg! I'll queue this up as an eligible fix for the soft freeze.


Daniel


> 
>> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
>> index c4c97da5de..04a64cada3 100644
>> --- a/hw/ppc/spapr_nvdimm.c
>> +++ b/hw/ppc/spapr_nvdimm.c
>> @@ -447,9 +447,15 @@ static int flush_worker_cb(void *opaque)
>>   {
>>       SpaprNVDIMMDeviceFlushState *state = opaque;
>>       SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
>> -    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
>> -    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
>> -    int backend_fd = memory_region_get_fd(&backend->mr);
>> +    PCDIMMDevice *dimm;
>> +    HostMemoryBackend *backend;
>> +    int backend_fd;
>> +
>> +    g_assert(drc != NULL);
>> +
>> +    dimm = PC_DIMM(drc->dev);
>> +    backend = MEMORY_BACKEND(dimm->hostmem);
>> +    backend_fd = memory_region_get_fd(&backend->mr);
>>   
>>       if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
>>           MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
>> @@ -475,7 +481,11 @@ static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
>>   {
>>       SpaprNVDIMMDeviceFlushState *state = opaque;
>>       SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
>> -    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
>> +    SpaprNVDIMMDevice *s_nvdimm;
>> +
>> +    g_assert(drc != NULL);
>> +
>> +    s_nvdimm = SPAPR_NVDIMM(drc->dev);
>>   
>>       state->hcall_ret = hcall_ret;
>>       QLIST_REMOVE(state, node);
> 

