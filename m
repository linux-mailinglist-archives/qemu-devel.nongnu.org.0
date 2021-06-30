Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FD3B8522
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:36:53 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybKe-0007Nh-C1
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lybJI-0006Nu-PY
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lybJF-0001ZG-5I
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZeAKcyKiA3YAF20ED9L6A38UgejzCBUrNskpVDgCiQ=;
 b=WEpCOFitE4GhmklAygqa3NvcUnFGSfxenkXN6BBzUFD3OnpWgvKkD/HCZLgficMus5yaYg
 2TVZR8gnMxl3/h9hZ6+d/7UcK67GfRKMbN2Pt3qYGyxUdm9PjHNEWZeM28a2HndcYt4nzR
 cHUweONZQvtSlmtQzdCUCC1G6/tfR1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-THqiVkEtN-W7pj_H8IY-9w-1; Wed, 30 Jun 2021 10:35:22 -0400
X-MC-Unique: THqiVkEtN-W7pj_H8IY-9w-1
Received: by mail-wr1-f69.google.com with SMTP id
 j2-20020a0560001242b029012c82df4dbbso175557wrx.23
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZeAKcyKiA3YAF20ED9L6A38UgejzCBUrNskpVDgCiQ=;
 b=eLKv+yhiuoghLfFEvpqhYkfFE4zOlkl82nduO//21AkBJQPLoFM2+Gi610wJrwAG+c
 km1TCOkK8SZKF36Qx2fdqju49KXhPdsDGaaH6nAWvPKfO1o0P1VnIOT6TuwRVsShBHsB
 nkpV2F7eHcy1hmv8lk/J20tATj+izDXnSEH2lF985nf1q6nQ9XR+MCB6jvsPRNGMzXFq
 xMPK96ZYLCc5PvcBBXLzG1LTp82J/7SlLNbqmVZwb7Q2ftgpOXFkRVFLY0hj50kegCU7
 HS/ONh0BCZale7bLVM1lWjS6GfDeeBxS2j+ckMCafklWKBuIW+w8bba6jsHRtmK3pfBY
 OS1Q==
X-Gm-Message-State: AOAM533h+DlHINWjcBkiXUBNIuY4Ba0tBqY2/jZLR8CaT8SHfRbnnKuh
 tdb5/fHnWvuN6VOOyTfxEaGN6e75Msk9bnnLXpm+ICDWm8OJgjLnskI4U4ljCqwRQbHTIubbnhL
 3XEg1CS2YrJl0UKM=
X-Received: by 2002:a5d:4522:: with SMTP id j2mr8409935wra.71.1625063721311;
 Wed, 30 Jun 2021 07:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz54xbLUsn+lOm9B9mdWvRhK/dGQrsbe5PQy1doZqABoVymV3HMWeGBCXMHGJ617HtR3zex5w==
X-Received: by 2002:a5d:4522:: with SMTP id j2mr8409918wra.71.1625063721151;
 Wed, 30 Jun 2021 07:35:21 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-55.mobile.abo.orange.fr.
 [92.184.110.55])
 by smtp.gmail.com with ESMTPSA id y3sm22525488wru.78.2021.06.30.07.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:35:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: Tom Lendacky <thomas.lendacky@amd.com>, Dov Murik
 <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
 <20210630054625.3424178-2-dovmurik@linux.ibm.com>
 <563e4b65-b120-3232-cbe3-74299da6c351@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e363fffd-5383-a9fa-459e-02e65be1bcda@redhat.com>
Date: Wed, 30 Jun 2021 16:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <563e4b65-b120-3232-cbe3-74299da6c351@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 3:38 PM, Tom Lendacky wrote:
> On 6/30/21 12:46 AM, Dov Murik wrote:
>> Add assertion in pc_system_ovmf_table_find that verifies that the flash
>> was indeed previously parsed (looking for the OVMF table) by
>> pc_system_parse_ovmf_flash.
>>
>> Now pc_system_ovmf_table_find distinguishes between "no one called
>> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
>> and "the flash was parsed but no OVMF table was found, or it is invalid"
>> (which will return false).
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> Does the qemu coding style prefer not initializing the bool to false since
> it will default to that?

Indeed, you are right, and checkpatch will block this patch:

ERROR: do not initialise statics to 0 or NULL
#33: FILE: hw/i386/pc_sysfw.c:129:
+static bool ovmf_flash_parsed = false;

total: 1 errors, 0 warnings, 28 lines checked

> Otherwise,
> 
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
>> ---
>>  hw/i386/pc_sysfw.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index 6ce37a2b05..9eac36b830 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -126,6 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>>  
>>  #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
>>  
>> +static bool ovmf_flash_parsed = false;
>>  static uint8_t *ovmf_table;
>>  static int ovmf_table_len;
>>  
>> @@ -136,10 +137,12 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>      int tot_len;
>>  
>>      /* should only be called once */
>> -    if (ovmf_table) {
>> +    if (ovmf_flash_parsed) {
>>          return;
>>      }
>>  
>> +    ovmf_flash_parsed = true;
>> +
>>      if (flash_size < TARGET_PAGE_SIZE) {
>>          return;
>>      }
>> @@ -183,6 +186,8 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>>      int tot_len = ovmf_table_len;
>>      QemuUUID entry_guid;
>>  
>> +    assert(ovmf_flash_parsed);
>> +
>>      if (qemu_uuid_parse(entry, &entry_guid) < 0) {
>>          return false;
>>      }
>>
> 


