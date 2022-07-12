Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE06571AF1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:16:53 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFkz-0000Cd-01
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBFY8-0003Zl-K2; Tue, 12 Jul 2022 09:03:36 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBFY6-0001XS-Su; Tue, 12 Jul 2022 09:03:36 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10c0052da61so10161783fac.12; 
 Tue, 12 Jul 2022 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ViGZrTgJKlpF51bi254UO1Kj+EbmXy4QwwzxNf/XCog=;
 b=emh+5VkbmNf39yrn0xIswgyvRGc0zXx1X7n8YWHksrJmhtb9vqoRXVFPrTqqPyX3+f
 RId8Oi0byAabRaiEhP1k7qJgkWHUS74Fm3cS4Tz0Ww0P/q4AyD4zJJ+S9Mm0LdPIqJBF
 M8VEEw5xaCambmLl6dXZ3aL8YESPkldBOzzA0udt/F9N7AeHYU6hDhnsDDoRrecOgOT8
 5AB9BrTDYb+tV2Tcst1iiBIhJ/Oz5Ntc0G0+XnaI4I0U7/Q5qHJ2S3KY66gNx71S+5MW
 J5oPBhdBLMUTQCnpkE7cvfBdYIPQ638UTotn4ESjVWaNr3m5z4T7p7eYf7G/hs6d3s71
 Mcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ViGZrTgJKlpF51bi254UO1Kj+EbmXy4QwwzxNf/XCog=;
 b=BjBozOabZ+yJGnFNohOveiwLX4HCyaFkIIDSiCiOLOOW+/cOFGVMUki2YSmzlLLDVa
 kCqlD587x2Jl/QlX9kMlTwvHv66Z2zohl9SEmsZIpOXgyr77lBphiok+oLFR2vfynyQZ
 iFmjExTb3cXmn2epQgiPM5wz84Q/7csFAmP0M8BvlFRpE2eBfVGFXrPuQivELXXU6ZQ4
 YrHiSHWHK4CAgTDw/l1+LRwSBgxMBt6ynD1SAKsytcpKmzisuKbQswNSjueF2Qgs8j3y
 JHiderqXeXZ9y0CqrQAHYbgLL8x+rM28D/vb7vo5wjdmNUv60dNdxioljySC2/LfioK8
 VRcA==
X-Gm-Message-State: AJIora8Dmiha1n1DQ58r73p/bGd+rGrOxJ5wJEsswqOkvYMdEzVEvgQg
 8zK9qR54mA85sqVHF0MDcrE=
X-Google-Smtp-Source: AGRyM1vT1hsQ+U2hFCGkoe5as5dt713iz+jLdvy+wOG3cEflhRqCek5i9uRFRze4cPUTKaRpmUwzmw==
X-Received: by 2002:a05:6870:2326:b0:f1:7485:2a92 with SMTP id
 w38-20020a056870232600b000f174852a92mr1748415oao.291.1657631013200; 
 Tue, 12 Jul 2022 06:03:33 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 n9-20020acabd09000000b00333f889c9c2sm3935645oif.33.2022.07.12.06.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 06:03:32 -0700 (PDT)
Message-ID: <1c11f8ec-5635-9812-a091-d9a1e9f11ce5@gmail.com>
Date: Tue, 12 Jul 2022 10:03:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/kvm: Skip ".." directory in kvmppc_find_cpu_dt
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mopsfelder@gmail.com,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220711193743.51456-1-muriloo@linux.ibm.com>
 <YszugDqguoCKti0j@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YszugDqguoCKti0j@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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



On 7/12/22 00:46, David Gibson wrote:
> On Mon, Jul 11, 2022 at 04:37:43PM -0300, Murilo Opsfelder Araujo wrote:
>> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
>> this is not the expected path for a CPU device tree directory.
>>
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/kvm.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 6eed466f80..c8485a5cc0 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
>>       buf[0] = '\0';
>>       while ((dirp = readdir(dp)) != NULL) {
>>           FILE *f;
>> +
>> +        /* Don't accidentally read from the upper directory */
>> +        if (strcmp(dirp->d_name, "..") == 0) {
> 
> It might not be causing problems now, but it would be technically more
> correct to also skip ".", wouldn't it?

Given that the use of this function is inside kvmppc_read_int_cpu_dt(), which
is used to read a property that belongs to a CPU node, I believe you're right.
It's better to avoid returning "PROC_DEVTREE_CPU" as well.

Murilo, can you please re-send it skipping both ".." and "." ? Better be
on the safe side.


Daniel


> 
>> +            continue;
>> +        }
>> +
>>           snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
>>                    dirp->d_name);
>>           f = fopen(buf, "r");
> 

