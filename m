Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990DC45B923
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:35:32 +0100 (CET)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqYl-0008Ai-Fu
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:35:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpqWw-00076G-87; Wed, 24 Nov 2021 06:33:38 -0500
Received: from [2607:f8b0:4864:20::834] (port=38489
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpqWu-0007eL-69; Wed, 24 Nov 2021 06:33:37 -0500
Received: by mail-qt1-x834.google.com with SMTP id 8so2270703qtx.5;
 Wed, 24 Nov 2021 03:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nf7rqP02P6PGOgzRnrt7VRd+4/+2O+w/iykoQOZJQbI=;
 b=FjUrtqqmxLdvNqRYcUTDI2R9h1j1iu/AoNk5raK/Xk7v8CHxhkq/k8H+t+Q5WefnCH
 xRchm8jg63EJvwtT4f73pP3DprPtCn1128G3uhKgFk2BzxL2JI19/ZC69ct6jd8XgG/Y
 C/1GVpwoh/CFMXCBIV6b1y0jn/UW5hTl3foKQaQW+F5mcvMEj2ZJU5K35cf0patl+1TO
 yx+fopgmSLhxKYnVs97SFD7nBcRY3fLeX0LxKy8XRoTGYv1swcDcy7VoWxgwDXIZd3BP
 FDOd3Zle6DrbhVNJIpy7LJcnU9bxOsMn/rW1zj4exBaXbLzpkf/igTw5dzISSLnSd9lb
 I5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nf7rqP02P6PGOgzRnrt7VRd+4/+2O+w/iykoQOZJQbI=;
 b=PO4jwG+1yvF2kwNXx9KXcrtddsRZGzHje16d5zY/RR7yA7lBxqPLsy/BG6yLbulJ/v
 NB0mi9EFJOT0KEZhoUw21iUoHoXC9TTVhmWHZ2tlETIA0xzTbAsSaz65boUzvAY5cqsA
 PkUjiH4x0p3V18CfgtK2VIaoQv6eow2Xn4XBqk1N+an/B/K7VxEI2fGQ3DZDBScHzdlR
 6dSav/IhaxJcIZ9ddgra+JHOFMIeOzh1r5ab/N0AkY8x2rQz17MZ+lGY8MEa4Mt0S8Iz
 WoHQfbx7mbYWK82Qu2JqWo2qNiDQ592+wRysOOn0Us4dIewGQteKIMRkImRCWBm3fVvO
 1OHA==
X-Gm-Message-State: AOAM532xTNbZy0xr9i8n20tqnbRDADs+PU/Q7efCTX3a4JSXCWnPDX0y
 4cT4JguAtsSFq9CvUZ2RaX0=
X-Google-Smtp-Source: ABdhPJxMST5fJ6MZPh3LQSEWaDFYdMwxJv2teiG7KZxkvVrLqJcot+fvB2DygXBhJfmrtoyaw9ZKTQ==
X-Received: by 2002:a05:622a:1495:: with SMTP id
 t21mr6469108qtx.152.1637753614834; 
 Wed, 24 Nov 2021 03:33:34 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id m15sm7819104qkp.76.2021.11.24.03.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 03:33:34 -0800 (PST)
Message-ID: <cf2cfec2-876c-1dc8-50f1-0a79b490527c@gmail.com>
Date: Wed, 24 Nov 2021 08:33:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-7.0 v2 1/2] ivshmem.c: change endianness to
 LITTLE_ENDIAN
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124092948.335389-1-danielhb413@gmail.com>
 <20211124092948.335389-2-danielhb413@gmail.com>
 <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/24/21 08:28, Philippe Mathieu-Daudé wrote:
> On 11/24/21 10:29, Daniel Henrique Barboza wrote:
>> The ivshmem device, as with most PCI devices, uses little endian byte
>> order. However, the endianness of its mmio_ops is marked as
>> DEVICE_NATIVE_ENDIAN. This presents not only the usual problems with big
>> endian hosts but also with PowerPC little endian hosts as well, since
>> the Power architecture in QEMU uses big endian hardware (XIVE controller,
>> PCI Host Bridges, etc) even if the host is in little endian byte order.
> 
> Maybe mention commit f7a199b2b44 ("ivshmem: use little-endian
> int64_t for the protocol")?


Good point. I'll send a v3.

> 
>> As it is today, the IVPosition of the device will be byte swapped when
>> running in Power BE and LE. This can be seen by changing the existing
>> qtest 'ivshmem-test' to run in ppc64 hosts and printing the IVPOSITION
>> regs in test_ivshmem_server() right after the VM ids assert. For x86_64
>> the VM id values read are '0' and '1', for ppc64 (tested in a Power8
>> RHEL 7.9 BE server) and ppc64le (tested in a Power9 RHEL 8.6 LE server)
>> the ids will be '0' and '0x1000000'.
>>
>> Change this device to LITTLE_ENDIAN fixes the issue for Power hosts of
>> both endianness, and every other big-endian architecture that might use
>> this device, without impacting x86 users.
>>
>> Fixes: cb06608e17f8 ("ivshmem: convert to memory API")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/168
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/misc/ivshmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
>> index 1ba4a98377..299837e5c1 100644
>> --- a/hw/misc/ivshmem.c
>> +++ b/hw/misc/ivshmem.c
>> @@ -243,7 +243,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
>>   static const MemoryRegionOps ivshmem_mmio_ops = {
>>       .read = ivshmem_io_read,
>>       .write = ivshmem_io_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>       .impl = {
>>           .min_access_size = 4,
>>           .max_access_size = 4,
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Thanks!


Daniel

> 

