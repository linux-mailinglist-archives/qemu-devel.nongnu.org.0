Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631E424E5C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:56:41 +0200 (CEST)
Received: from localhost ([::1]:41748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOGe-0004ii-HH
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYOF2-0003mt-It
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYOEs-0002Wu-9G
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633593289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsKafA704tdEtDr5Om5uy9l3gFDT8yzPylTrBe9poLE=;
 b=hllrVsAsl8Kh/i7wmk5SAgZ43J3/25xWT3PiRSNLF1sO4L1HTN/eE5cWi7y9/s54UuyXiR
 /QFAbVv60cxbtpfSnmgzQXJginDFGuUqxpH+vIwDdQCm7YMPpx/tPgmzNRF+kGClaXgkyK
 obMoPJRZTpBg19qRGZd2pfQM4iXf28M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-V3s-4alNOGq0c3Vd3hxHJg-1; Thu, 07 Oct 2021 03:54:48 -0400
X-MC-Unique: V3s-4alNOGq0c3Vd3hxHJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so3984254wrc.21
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 00:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gsKafA704tdEtDr5Om5uy9l3gFDT8yzPylTrBe9poLE=;
 b=pshLb7jKadrFGZpFdPu6OEyyFX/oEDZa4nYZiLCFd0sAmZFlrOsR+21oBmSV4UmFtf
 NNUf/MbfJf7MX/zp+9RpqiojwZX4ilawQfr/CrcRMSoGdydNLt1QSFEETVl1JtXWQGlK
 AosJHhkgvZ8/CZ9ECsSbZPWDqPpvfDzVDzrifPkicsjxT07Y9HOaatenWYHYH0VhvGn+
 q12qkYvQnzWR/v6z1qnARhsnbcv9AuEqiA2ExbNzqcfNJ6tbWaaQ6n1VK8KJDxLj1ONG
 IxlyIzOIDlySoPS87LiFZWLh3hemAxvIVIQjDFzEwgpFwasKlNPkMtWzoY3EAzBiGP2m
 nvzA==
X-Gm-Message-State: AOAM533C8sIugvdHs8ncudJKzCyPbTEFmU4j8Bb+1SmCMyu8hOkOM5Em
 tvT4inBbPX1BlNxC1B+Kj1HnnI4LjzXikBOOygzhoGcR2aKolgJWRVrGSPCfeMFnhZhcn/2Ylki
 nRkOaJfQO2M/LChc=
X-Received: by 2002:adf:a114:: with SMTP id o20mr3349497wro.95.1633593287302; 
 Thu, 07 Oct 2021 00:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrKIekHs7gUlZ595HBVQXV4QkadVxyfr9kSBWE3PXXX1gNGR/Q9c00+JyQk+O2wpLChSp9Ww==
X-Received: by 2002:adf:a114:: with SMTP id o20mr3349476wro.95.1633593287081; 
 Thu, 07 Oct 2021 00:54:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k17sm23355954wrq.7.2021.10.07.00.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:54:46 -0700 (PDT)
Message-ID: <0ae79bf2-4e97-07b6-2197-9b264d07f86c@redhat.com>
Date: Thu, 7 Oct 2021 09:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <871r4yf9eh.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <871r4yf9eh.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 17:40, Alex Bennée wrote:
> 
> Damien Hedde <damien.hedde@greensocs.com> writes:
> 
>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>> Right now, we cannot load some binary file if it is bigger than the
>>>> machine's ram size. This limitation only occurs when loading a
>>>> binary file: we can load a corresponding elf file without this
>>>> limitation.
>>>>
>>>> This is an issue for machines that have small ram or do not use the
>>>> ram_size feature at all.
>>>>
>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>> to access `current_machine`.
>>>>
>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>> ---
>>>>
>>>> Hi Alistair,
>>>>
>>>> I found this while experimenting with a ram_size=0 machine.
>>
>>
>>
>>> Where are you loading your file?
>>>
>>
>> In a rom.
>>
>> The loader does not check at all that we are loading to the machine's
>> ram. It just check the size for the raw binary file format.
> 
> It does beg the question of why you don't just construct your ROM file
> with the image in place there? Is this just a development convenience?

generic-loader is designed from a CPU perspective, it uses the CPU AS
to load the image.

If your image is in ROM, I'm not sure this is the correct API. I'd try
to do this without considering any CPU in the picture. The rom_add_*()
API might be more appropriate.

My 2 cents anyway...


