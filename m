Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7F5E624A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:25:05 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLGK-0004PJ-Bq
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obK1q-0006Ui-Jm; Thu, 22 Sep 2022 07:06:05 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obK1k-000368-VZ; Thu, 22 Sep 2022 07:06:02 -0400
Received: by mail-oi1-x230.google.com with SMTP id c81so9722912oif.3;
 Thu, 22 Sep 2022 04:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=hoWqJUwl3QL6+Fzd3cYG0K3Dcya6Mo5wlScy8Jr0f2U=;
 b=BIcR9ftSyOV1216HgBZglD+LSRwHmexX5+kpoSTN8Sq3M0fVMOEpi9Lm7EQnECgqbr
 2mBNoLjGJZ4U4fSrdL2jNl+3DHVpvVjqETweGmKMTFXqN0RPkWaeS3xQSGzOabwEiIUo
 TvgJ7i3ZJ7j3TV887yHCSofgL7S2hqnIUGto8WyCBVzoYvfi4dE+9EQI4cHM8C2lnWjX
 SzCcB/9fi0n2k+gNLfe2IOIdL5CIKz0UVlqpWYIATxlBkp+F/inuw7bsBo/WLCeokmVz
 JGXnPHZxt4HkadriMaIac1V9OX7EK4Bwr+5/TuNT+1QzqmwG/6aL2PH+YscsxeX4JtXw
 aIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=hoWqJUwl3QL6+Fzd3cYG0K3Dcya6Mo5wlScy8Jr0f2U=;
 b=YqOrEAJ25UqepVlsxg9nQmDwbLAODHDVHcpvQQKZJ979ZaCqgiiAevSG3+1fp3S3py
 N9k/satk3qqj23YzthVaQuMvdiRKIGYkZh8ZBkNIoP8VWmkyghk5CWHX0Y6RKGVR4jP5
 bZ389jSOnKveaBYoRhc4Zi0IQo9cYDNlBA8aujDmltsPOOBkYZUuzgcEftjL2dbFbYAK
 JZXXDZ8oB4DptuljEsgO37wJ9+lrlhTSLPm7SMLg6ZbeOM27PqAXUdXtOibX2RLeDbaj
 SUMYmWAbm1M5vb8Ftf6gaWZu51x+PfPe66fyos9IroVEnhoIKkvAGTlNSlwaj+kIXxb6
 +uCw==
X-Gm-Message-State: ACrzQf2pUu3OlWPKcdWN9utt+uq3gJqjkgHBmvJCpLPiQNpwM6k6+jPc
 PvFK+IY0W1lAkQCw8EVELmM=
X-Google-Smtp-Source: AMsMyM43sYzXTQMAbSL1gXvuFM/TZz7vrA5VmFlv6zGEHCA+odsm9ZWmxGdENqk9MOWHFfeT8xPGxQ==
X-Received: by 2002:a05:6808:bd5:b0:350:3e56:12f9 with SMTP id
 o21-20020a0568080bd500b003503e5612f9mr1307233oik.258.1663844754896; 
 Thu, 22 Sep 2022 04:05:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a4ade8d000000b0047634c1c419sm1637041oou.12.2022.09.22.04.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:05:53 -0700 (PDT)
Message-ID: <e00b049e-795c-26ba-c04c-6a5fdd343e52@amsat.org>
Date: Thu, 22 Sep 2022 13:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-15-danielhb413@gmail.com>
 <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org>
In-Reply-To: <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/9/22 12:47, Philippe Mathieu-Daudé wrote:
> On 8/9/22 21:40, Daniel Henrique Barboza wrote:
>> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
>> With this property set, the machine saves the FDT in <file> and exit.
>> The created file can then be converted to plain text dts format using
>> 'dtc'.
>>
>> There's nothing particularly sophisticated into saving the FDT that
>> can't be done with the machine at any state, as long as the machine has
>> a valid FDT to be saved.
>>
>> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
> 
> Typo "parameter".
> 
>> FDT is available, it'll save it in a file 'filename'. In short, this is
>> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>>
>> A valid FDT consists of a FDT that was created using libfdt being
>> retrieved via 'current_machine->fdt' in device_tree.c.
> 
> This sentence is odd.
> 
>> This condition is
>> met by most FDT users in QEMU.
>>
>> This command will always be executed in-band (i.e. holding BQL),
>> avoiding potential race conditions with machines that might change the
>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hmp-commands.hx              | 15 +++++++++++++++
>>   include/sysemu/device_tree.h |  1 +
>>   monitor/misc.c               |  1 +
>>   qapi/machine.json            | 18 ++++++++++++++++++
>>   softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>>   5 files changed, 66 insertions(+)

>> +void qmp_dumpdtb(const char *filename, Error **errp)
>> +{
>> +    g_autoptr(GError) err = NULL;
>> +    int size;
> 
> fdt_totalsize() returns an uint32_t. Maybe use "unsigned" if you
> don't want to use uint32_t?
> 
>> +
>> +    if (!current_machine->fdt) {
>> +        error_setg(errp, "This machine doesn't have a FDT");
>> +        return;
>> +    }
>> +
>> +    size = fdt_totalsize(current_machine->fdt);
> 
>         assert(size > 0); ?
> 
>> +
>> +    if (!g_file_set_contents(filename, current_machine->fdt, size, 
>> &err)) {
>> +        error_setg(errp, "Error saving FDT to file %s: %s",
>> +                   filename, err->message);
>> +    }
> 
> Eventually:
> 
>         info_report("Dumped %u bytes of FDT to %s\n", size, filename);

Or refactor qemu_fdt_dumpdtb() and call it.

> To have a feedback in HMP.
> 
>> +}
>> +
>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *filename = qdict_get_str(qdict, "filename");
>> +    Error *local_err = NULL;
>> +
>> +    qmp_dumpdtb(filename, &local_err);
>> +
>> +    hmp_handle_error(mon, local_err);
>> +}
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


