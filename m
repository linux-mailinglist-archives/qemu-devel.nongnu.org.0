Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F858F349
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:42:25 +0200 (CEST)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLray-0003bt-OC
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLrZ2-00022b-5R
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:40:27 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLrZ0-0007dw-Ix
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:40:23 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q15so16292742vsr.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4qvSA9gCxuoIfslEoZUhK9280Sm/d99RvEp8ipv98bY=;
 b=alhjyfxAdskDMsFNuh2fEXPppdhLmMeTvUxttLzVbfpq/3m5AVLzJvXdL9ETVtPCVQ
 MXae20Jv2lrWadQXisYyIz1ulwDRWDtuPZBSqr+5MYkohOP1R/zFT3CHIvYJ35ERcGqw
 vTb44rYIlpIVp2aUDbZdNgYT+Efo5v53dQF+KSsXH5ZujTKjih2m+0PjZ2IfXuOkWmv8
 Lg+L1TAszTdzBbS9kHZ7UXeqSDPOIOengEiVNzVWXJdFCaNFfUAxVDXn8FAu0wpXcODO
 rVyyTkrblzdqoGpTdIiSoBbsA4UBKhbl/ve2mPthCuJTVqhaTDRiUIVf3cROkV8fBqTp
 Tclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4qvSA9gCxuoIfslEoZUhK9280Sm/d99RvEp8ipv98bY=;
 b=EMXR8ZEE7IvsEFDFII4n29YDwkNTReOG0BbY23fLTyS1EawnO6J1jlrTRt/qS7VUu/
 L+OefkRU4Zfj6ODjn2IOSAfeWL+n6R0oWHf8dJMhOBAJmhAS3omR7nkLhPOVgRBcrWmc
 KbSLrmhVdgWMnOaOYrp40W4vlU8aSKd944qAeQWYYCCXn0R7GB0IyGrBOqa7dM5yZiKD
 ywp2erMjZfrbk5dldK20eh56RJnLlz2T+WFV7XxpOtLZXIMEwIFJrF2oVnUyBSkIpQNm
 TdwxWfSHNsoEn4VOg9hpsH+2kLb2DbYMrv4w/S7Lwxsx5ak0Am0M6AvSyCwVG0waov60
 ITfQ==
X-Gm-Message-State: ACgBeo0Y4oVH9o9reSk6Z66BnHWk21M6XvJKF0ytPmkK6/kgRtZXCGQW
 IsqdMThVQFCDM1kZQr01bBA=
X-Google-Smtp-Source: AA6agR6ES1EoheyVb0o7I6KSw17BXd0bbfyF98z95jOC76itbbSVrgPaCZ3Qcv376GOLaV43tWUNEQ==
X-Received: by 2002:a67:c28f:0:b0:37b:43dd:12f1 with SMTP id
 k15-20020a67c28f000000b0037b43dd12f1mr13077778vsj.76.1660160421000; 
 Wed, 10 Aug 2022 12:40:21 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 i20-20020ab063d4000000b00382fc895404sm12929102uap.31.2022.08.10.12.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 12:40:20 -0700 (PDT)
Message-ID: <8512d624-d741-d4df-b729-9e3d4559e6c3@gmail.com>
Date: Wed, 10 Aug 2022 16:40:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 v2 16/20] device_tree.c: support string props in
 fdt_format_node()
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-17-danielhb413@gmail.com> <YvCSx8eV5jkMbD6C@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YvCSx8eV5jkMbD6C@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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



On 8/8/22 01:36, David Gibson wrote:
> On Fri, Aug 05, 2022 at 06:39:44AM -0300, Daniel Henrique Barboza wrote:
>> To support printing string properties in 'info fdt' we need to determine
>> whether a void data might contain a string.
> 
> Oh... sorry, obviously I hadn't read these later patches when I
> complained about the command not printing property values.
> 
>>
>> We do that by casting the void data to a string array and:
>>
>> - check if the array finishes with a null character
>> - check if all characters are printable
> 
> This won't handle the case of the "string list" several strings tacked
> together, separated by their terminating \0 characters.

Hmmmm how is this printed? Should we concatenate them? Replace the \0
with a whitespace? Or ignore the zero and concatenate them?

E.g. this is a\0string\0list

Should we print it as:

this is astringlist

or

this is a string list ?


Thanks,


Daniel


> 
>>
>> If both conditions are met, we'll consider it to be a string data type
>> and print it accordingly. After this change, 'info fdt' is now able to
>> print string properties. Here's an example with the ARM 'virt' machine:
>>
>> (qemu) info fdt /chosen
>> chosen {
>>      stdout-path = '/pl011@9000000'
>>      rng-seed;
>>      kaslr-seed;
>> }
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   softmmu/device_tree.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 3fb07b537f..8691c3ccc0 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -663,6 +663,24 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
>>       error_setg(errp, "Error when saving machine FDT to file %s", filename);
>>   }
>>   
>> +static bool fdt_prop_is_string(const void *data, int size)
>> +{
>> +    const char *str = data;
>> +    int i;
>> +
>> +    if (size <= 0 || str[size - 1] != '\0') {
>> +        return false;
>> +    }
>> +
>> +    for (i = 0; i < size - 1; i++) {
>> +        if (!g_ascii_isprint(str[i])) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void fdt_format_node(GString *buf, int node, int depth)
>>   {
>>       const struct fdt_property *prop = NULL;
>> @@ -681,7 +699,12 @@ static void fdt_format_node(GString *buf, int node, int depth)
>>           prop = fdt_get_property_by_offset(fdt, property, &prop_size);
>>           propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
>>   
>> -        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
>> +        if (fdt_prop_is_string(prop->data, prop_size)) {
>> +            g_string_append_printf(buf, "%*s%s = '%s'\n",
>> +                                   padding, "", propname, prop->data);
> 
> If you're going for dts like output, I'd suggest going all the way.
> That means \" instead of \' and a ';' at the end of the line.
> 
>> +        } else {
>> +            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
>> +        }
>>       }
>>   
>>       padding -= 4;
> 

