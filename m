Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520D3A89D0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:54:09 +0200 (CEST)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltF8R-0008Tz-HY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltF7Y-0007mx-8v
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltF7T-00007y-Dl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623786785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofEOSt/bhJx2RqehuLT5/g7fYy5e7SGdr+rCepXvpBM=;
 b=M89JNP+P2alOhP0ZoWxA0BYg6+ummGBYY0gqbNtNVxVyzxOmUz3NoNoEK5/eoCTcyAmzOm
 wONU91IQ37P5/OxZnpqv/mGc7bNk9ALrgwtP7SalA3apmyVTofzySbGj3boBYQeBKJyNpi
 jSD4QHg50R0+qBn/iPxxWLX9i/R/ucY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-5vSdcC4YOgiCqdjV44CsPQ-1; Tue, 15 Jun 2021 15:53:04 -0400
X-MC-Unique: 5vSdcC4YOgiCqdjV44CsPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so9130291wrq.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 12:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ofEOSt/bhJx2RqehuLT5/g7fYy5e7SGdr+rCepXvpBM=;
 b=WojYniJvTFwPj/2t9l3QZ8pXI604jI78MfIF50eDc9MrWuwX/h3l7InXbRkXq6NG7b
 8sQEfpfQPSzJ7eRY7KEWRut6xw3sX9K1rPveQ8zjxr2QmyaBI64aCQFbrGV0OwX95Rdr
 Ecd+HIMNWT0e8TQgqOw/be9efIjlU4nnxeUvcEArBbjBTV+Y4hONX59vTkCvUf12rk/p
 wtz7CMCShmU6jSAZLhCQ7YWUVpZAbANVHsqQAP/dqHrBgsFyCberAo2bEBd+Zz+UsOpK
 MXWbnBIng/Ez6WFJilpvFDRbwNtGi4O3YhjAtIIqFOXtxgFuJAlIYOITtFMNXDDj7tKe
 WYxQ==
X-Gm-Message-State: AOAM530rmtwAHNNIulf/iAVAmvVaLufeW2sR5mb8cveFSfpmg6tZd+F/
 qMGoASYOQ7E2WNH1YbJ8K9lU8+CnkAomgoF5I+Cl0ktJPf04Ad4qudjNjYr6JEV+nUo2lCJSKnF
 ltjakAW0O65GI3YI=
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr895261wri.409.1623786783125;
 Tue, 15 Jun 2021 12:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxUs7ImKIteypgAFdywHRNi3+7jflRQ26se2H5Dqx9Yab78JTFTbEomuVrhE7IXHNYiC9mRg==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr895231wri.409.1623786782922;
 Tue, 15 Jun 2021 12:53:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x7sm2430217wrn.3.2021.06.15.12.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 12:53:02 -0700 (PDT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Dov Murik <dovmurik@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>, 
 Connor Kuehl <ckuehl@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
Date: Tue, 15 Jun 2021 21:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615152033.czhsaz44yxtc5ext@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dov, James,

+Connor who asked to be reviewer.

On 6/15/21 5:20 PM, Eduardo Habkost wrote:
> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
>> From: James Bottomley <jejb@linux.ibm.com>
>>
>> If the VM is using memory encryption and also specifies a kernel/initrd
>> or appended command line, calculate the hashes and add them to the
>> encrypted data.  For this to work, OVMF must support an encrypted area
>> to place the data which is advertised via a special GUID in the OVMF
>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
>> in the kernel/initrd/cmdline via the fw_cfg interface).
>>
>> The hashes of each of the files is calculated (or the string in the case
>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>> table is GUID identified and since they're passed through the memcrypt
>> interface, the hash of the encrypted data will be accumulated by the
>> PSP.
>>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
>> strings, remove GCC pragma, fix checkpatch errors]
>> ---
>>
>> OVMF support for handling the table of hashes (verifying that the
>> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
>> to the measured hashes in the table) will be posted soon to edk2-devel.
>>
>> ---
>>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 119 insertions(+), 1 deletion(-)
>>
> 
> This is not an objection to the patch itself, but: can we do
> something to move all sev-related code to sev.c?  It would make
> the process of assigning a maintainer and reviewing/merging
> future patches much simpler.
> 
> I am not familiar with SEV internals, so my only question is
> about configurations where SEV is disabled:
> 
> [...]
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
>>      const char *initrd_filename = machine->initrd_filename;
>>      const char *dtb_filename = machine->dtb;
>>      const char *kernel_cmdline = machine->kernel_cmdline;
>> +    uint8_t buf[HASH_SIZE];
>> +    uint8_t *hash = buf;
>> +    size_t hash_len = sizeof(buf);
>> +    struct sev_hash_table *sev_ht = NULL;
>> +    int sev_ht_index = 0;

Can you move all these variable into a structure, and use it as a
SEV loader context?

Then each block of code you added can be moved to its own function,
self-described, working with the previous context.

The functions can be declared in sev_i386.h and defined in sev.c as
Eduardo suggested.

>>  
>>      /* Align to 16 bytes as a paranoia measure */
>>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
>> @@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
>>          exit(1);
>>      }
>>  
>> +    if (machine->cgs && machine->cgs->ready) {
> 
> machine->cgs doesn't seem to be a SEV-specific field.
> What if machine->cgs->ready is set but SEV is disabled?
> 
>> +        uint8_t *data;
>> +        struct sev_hash_table_descriptor *area;
>> +
>> +        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>> +            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
>> +                    "no hash table guid\n");
>> +            exit(1);
>> +        }
>> +        area = (struct sev_hash_table_descriptor *)data;
>> +
>> +        sev_ht = qemu_map_ram_ptr(NULL, area->base);
>> +        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
>> +        sev_ht->len = sizeof(*sev_ht);
>> +    }
>> +
>>      /* kernel protocol version */
>>      if (ldl_p(header + 0x202) == 0x53726448) {
>>          protocol = lduw_p(header + 0x206);
> [...]
> 


