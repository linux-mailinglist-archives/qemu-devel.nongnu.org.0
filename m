Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EC309C86
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:06:22 +0100 (CET)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6DMr-00062z-6D
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DLC-0004jX-4U; Sun, 31 Jan 2021 09:04:38 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DL8-0001XZ-Iu; Sun, 31 Jan 2021 09:04:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d16so13689019wro.11;
 Sun, 31 Jan 2021 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cJX72J3UvuKiu8Ak5/uZvAAJ3jzijZdbCsTVEmJPwmc=;
 b=OPDaQdcJ8UcTsiozKw+qoKX4BwChfhcngEiVLS0NRQcUmlWu6WnvSfSQmKRNsyK4jb
 pTvxU1kcrvxSlaE8cV5GdPCDAo7bOoe+1oAAgPo97OtQ6T5eI1/t2VxMEo+76k+v7Bkt
 eANX7FpSbCic/9DVZOncq5dqol3gQrlhDtghRKx5c4lV/QtBnDmt9WhhvYKj99704JvZ
 aXcBwmwdFetF8Ob6sdDEdUu84J6+u3ReYQAMnbuqGXX36X6rXUEbdcuhhRowsKbkQrsI
 akhYbk+G04YkF+YYz4S2EgdZu5qatfl0FvvfFyO86P9PijxuP+pPaDcarCvO3T+aiIQw
 P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cJX72J3UvuKiu8Ak5/uZvAAJ3jzijZdbCsTVEmJPwmc=;
 b=Q2ls/1GRbbqZ+Apg6w+ve2uVIZLYWoM6AtNl/3WWzIggOABHBkuC56R+WnqUTkhQWD
 oWmTsLetMiyZO4G1SqR+xEZg4SzrFUxBN1DUMMcpExn+TzwDXadBm9KsNXd+Oyd+YU8j
 LLFwykfUkIkY1bK1C8xMIQ8dHeWMHEQtY7V1BgnY2VIwnmCo3Wvn06GfWSDk1PLpGRnS
 G63ku878xC1doi70YYMX90jEu6prL8kGbfmbCZB7oTwhdKT1z9Sf9VNcyAtfLlcE2vgO
 nXdHn9uEvypIOJq/Ej37e/epmHdBFZ6dz+jgZ2rs87B4rQnm81ldjj7grJ1yKuydxJ63
 me6w==
X-Gm-Message-State: AOAM532seuGYP/eaEQFRmrEuaEJKviwDfur+4P5qia6NLjsGlxQa5hDV
 e/JlunnNPgtxrw2ovejzFCM=
X-Google-Smtp-Source: ABdhPJxh3NHwQNS16/DxuqYzgsc99/H14QfN1Z7x2Fe/ZOiHOcS38/15IGemcneXbJ9eDWfs6+UVvw==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr14038383wrz.109.1612101872430; 
 Sun, 31 Jan 2021 06:04:32 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 9sm13768746wra.80.2021.01.31.06.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:04:31 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-2-f4bug@amsat.org>
 <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f0653cf8-bf1a-48d4-7242-aaec4b31f6c5@amsat.org>
Date: Sun, 31 Jan 2021 15:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 8:59 PM, Paolo Bonzini wrote:
> On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
>> hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:
>>
>>    /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function
>> `ide_init_ioport':
>>    /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to
>> `isa_register_portio_list'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ide/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
>> index 5d9106b1ac2..41cdd9cbe03 100644
>> --- a/hw/ide/Kconfig
>> +++ b/hw/ide/Kconfig
>> @@ -12,7 +12,7 @@ config IDE_PCI
>>     config IDE_ISA
>>       bool
>> -    depends on ISA_BUS
>> +    select ISA_BUS
>>       select IDE_QDEV
>>     config IDE_PIIX
> 
> This is incorrect.  Buses are "depended on", not selected, and this is
> documented in docs/devel/kconfig.rst.

This is a kludge to deal with the current state of hw/i386/Kconfig.

I tried to clean it twice (mostly because unused things are pulled
in the MIPS targets), but I eventually gave up after accepting the
PC machines are Frankenstein ones built for virtualization, and I've
been told "if it ain't broke, don't fix it".

