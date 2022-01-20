Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E849563E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:08:31 +0100 (CET)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfba-0006aO-2e
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZPG-0004FA-UX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:31:23 -0500
Received: from [2607:f8b0:4864:20::436] (port=35504
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZPF-0005t1-63
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:31:22 -0500
Received: by mail-pf1-x436.google.com with SMTP id u130so1618172pfc.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fcazGOMfAzIwqFljxqr734p7+zS3v7B76osDgt6/wIg=;
 b=Lkr/Tay87i1CbkOk2ADDG4ILpxjSI6JN4ILiTJS4vKHyF343G8UEwOfveLDlJrPHFE
 czAcggHmGgJ/8/netOV7BWgLPcTlhmPg6hC1u/tlaadEGvwnlTr30yN18mL/TYS4D/EE
 oPofG3/vwSKU8E1VnIB+nu4NvVEGjZ85TR2uS7jLDpWMXcihrvwdyrnYVbR0dTIIbcBs
 QkFVrJoFofnLxPTnSdl4V12cWSEAkKT3Oh7x7pnMlEM3z2xdBtbdamH6qWkb1RV0pWIe
 ntIvn6ofltai4a60Y7cHYmNBRPd/43w4YnJ4FezrAhyIfDZG3OxMWh1hPg4FIczkD1UW
 3BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fcazGOMfAzIwqFljxqr734p7+zS3v7B76osDgt6/wIg=;
 b=e7DP1ONKzLQqSigw/0H6EfgDPjRbHqYQwXFOKoY77qfbLmzbKNoR9EWR/j7zVkSmR5
 f8wEIoHU6DXPUQPmecmA/byTUIEOgrY4QJpg5DzNjEgC/QJA8ooW0XRscNlilQwL1hXu
 tQQGPyKPXVi/DRA6SnCIi2c4mNJRf58AVMZGafPKUhIdR/KKHhwSHPaXYuGyQuuqHW66
 PddjxuF/KNQfp2s122LoDwcAzyev53cjmCmGl2bBsPRc6XMquLrSV3/9sTROoYCN8kja
 FdyJZpLkPGuzp6vkdzxzwVWvYHVHk4VSWpR7W7M1eGmNpW3PD9ybl13qk9GXxi2b8KDC
 7rmQ==
X-Gm-Message-State: AOAM5302XUiic9jQPMdqPBdGkkw3iB8ZI3jeiVxy9Xzrrycp65e/Cw6T
 7Q5x9mahWVgL1SQbO44lpwU=
X-Google-Smtp-Source: ABdhPJzWjsCikQD7kXEmadI9P+cKx05JjFtUrNsPqtHsAl4/Zh9yQrxIpJZ44HN0qaVyjzkPyQ+l2A==
X-Received: by 2002:a05:6a00:1a0b:b0:4c6:ec84:4103 with SMTP id
 g11-20020a056a001a0b00b004c6ec844103mr1079592pfv.76.1642692679397; 
 Thu, 20 Jan 2022 07:31:19 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 4sm2781582pgq.23.2022.01.20.07.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:31:18 -0800 (PST)
Message-ID: <ec7654fd-5c2c-3d46-1151-6254c3c6951a@amsat.org>
Date: Thu, 20 Jan 2022 16:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
In-Reply-To: <YeknCiBuMEaD3XP2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/1/22 10:10, Daniel P. Berrangé wrote:
> On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
>> The SGX NUMA patches were merged into Qemu 7.0 release, we need
>> clarify detailed version history information and also change
>> some related comments, which make SGX related comments clearer.
>>
>> The QMP command schema promises backwards compatibility as standard.
>> We temporarily restore "@section-size", which can avoid incompatible
>> API breakage. The "@section-size" will be deprecated in 7.2 version.
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   qapi/machine.json     |  4 ++--
>>   qapi/misc-target.json | 17 ++++++++++++-----
>>   hw/i386/sgx.c         | 11 +++++++++--
>>   3 files changed, 23 insertions(+), 9 deletions(-)

>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 1022aa0184..a87358ea44 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -344,9 +344,9 @@
>>   #
>>   # @node: the numa node
>>   #
>> -# @size: the size of epc section
>> +# @size: the size of EPC section
>>   #
>> -# Since: 6.2
>> +# Since: 7.0
>>   ##
>>   { 'struct': 'SGXEPCSection',
>>     'data': { 'node': 'int',
>> @@ -365,7 +365,9 @@
>>   #
>>   # @flc: true if FLC is supported
>>   #
>> -# @sections: The EPC sections info for guest
>> +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> 
> I expected deprecation would start now (7.0, and it would be removed
> in 7.2.
> 
> Also needs to be documented in docs/about/deprecated.rst

Isn't docs/about/deprecated.rst for user-facing changes *only*?

Machine-facing changes are already described in the QAPI schema.

Please correct me.

Thanks,

Phil.

