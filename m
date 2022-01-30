Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6E4A387D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 20:19:58 +0100 (CET)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEFjt-00083V-Nu
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 14:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEFgc-000606-93
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 14:16:30 -0500
Received: from [2a00:1450:4864:20::431] (port=42801
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEFga-0008C7-FQ
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 14:16:30 -0500
Received: by mail-wr1-x431.google.com with SMTP id a13so21319898wrh.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 11:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=786odt0MBCPgHhoAvPJl94aAcQNzRFjPIyzZ+gtMG2c=;
 b=PBzBkyoPvK8GqboPjv/j5YBiCpZX7JsRGrPQT6wNvwA/EaarUP0RVqLaGdTcWHs7+Y
 lbSyCSUVsPWPZulB1ec1CSPNsqChcGU5I8UMhoS4o9Lg+vytgJCsK5f5niXUk9OqaTzt
 uA0fbSgYScw+t+TZqWdK2gqbQsp2Pc5+wzekYgsjm/EgPQXAEYHcx3Vxrj6KPmWHCj+7
 hCqGCcwqKmWCK3MLXB6bg+EersypO3gbOM0EvnsxGEZ3TxCKCQEYTWLGiPgKs9PjNJqx
 32Kev90kFxHWA0Onh6CtidHLEzWtNBjeO7Ge3p1sUO9ZHgzp/dcUqx60PrIs0YswQ9D0
 YtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=786odt0MBCPgHhoAvPJl94aAcQNzRFjPIyzZ+gtMG2c=;
 b=nY1fAY5KMdjZ9yUAIbxDdAC3qsYVOZjSaWljDxITJ6H9rkfN3cT/fXDJgu0zkzKOFX
 iXTYtD/H2FW8c5haTRsvj8kHAOLyquiJWDhPuqy60ycH9ibNLVdILSuHDxaSHwHL/Cho
 Y/k0Nk9tbXHGJR+VwPb17lP5gC7p043wxpQUoZK3VxSUYRrf5JWx3fb82646IxeSPc0x
 /JDmOMFMzKvSdPZMw7Q/H6mh7wZkFC0YDHrR5jdgycu7Pewds2A80KC5XAv3Fsu6CRl/
 CnsskCipR6huLDl3PqxREUYmcG7I4g3UTvjNuW+XuFfg+r1y4VJ7909cxd7mCIZ3CHVv
 eX9g==
X-Gm-Message-State: AOAM531wmyFqydwyDX35xabNtuCYwpuwmyydYgGWjELiblm5buBQpRB+
 imIyrQ5vlLh742nkf1tkRyk=
X-Google-Smtp-Source: ABdhPJxaOOgvMftCpFFUqlES1X/MCHnh2j0DZEzS96JMsBunA680cIm459lGpXMcRaRHtzUMXoon+Q==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr6476771wri.345.1643570187000; 
 Sun, 30 Jan 2022 11:16:27 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g4sm11052356wrd.111.2022.01.30.11.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 11:16:26 -0800 (PST)
Message-ID: <17584a77-c2b8-680c-5596-61a5825e9900@amsat.org>
Date: Sun, 30 Jan 2022 20:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: should we have a Kconfig "device group" for I2C devices?
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <CAFEAcA-VUOa3R8_BZzJ0d3+RQyZJgwQ-P+3RWPHBoJQYUc7_Mg@mail.gmail.com>
 <ac920f6c-de23-b93a-4d5a-db807aeace3a@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <ac920f6c-de23-b93a-4d5a-db807aeace3a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

+Alex

On 28/1/22 15:30, Paolo Bonzini wrote:
> On 1/28/22 15:17, Peter Maydell wrote:
>> Hi; I've been looking into what is the right way to handle in Kconfig
>> an i2c device which is intended for the user to specify on the command
>> line with a -device option.
>> (It's the lsm303dlhc magnetometer, currently in code review:
>> https://patchew.org/QEMU/20210921093227.18592-1-kevin.townsend@linaro.org/  
>> )
>>
>> Currently all our i2c devices are just pulled in by "select FOO" from
>> the Kconfig stanza for a board which has that kind of sensor hardwired
>> on-board. But for at least some of them it works fine to just specify
>> them on the commandline of any board that has an i2c controller that
>> allows pluggable devices. (For instance we do that kind of commandline
>> plugging in our test suite with tests/qtest/tmp105-test.c.)
>>
>> What's the best way to structure this? For PCI we have the "device
>> group" PCI_DEVICES as documented in
>> https://qemu-project.gitlab.io/qemu/devel/kconfig.html#guidelines-for-writing-kconfig-files 
>>
>> and PCI devices say
>>      default y if PCI_DEVICES
>>      depends on PCI
>>
>> For ISA devices we seem to make them say
>>      default y
>>      depends on ISA_BUS
>>
>> I2C devices currently just say
>>      depends on I2C
>>
>> Should we have an I2C_DEVICES, which boards where there's a sensible
>> user-pluggable i2c controller can specifically select ? Or should we
>> mark the i2c devices which are sensibly user-pluggable as
>> "default y" ? Or something else ?
> 
> Yes, I think it's a good idea to have I2C_DEVICES like we have 
> PCI_DEVICES.  This way we can skip them on x86 (where the SMBus 
> controller is mostly a legacy device) but include them by default on 
> AVR, embedded ARM, etc.

My first reaction was "Yes, generically each bus should have its
bus_DEVICES" switch; but then I wondered in which use case we still
need this switch.

- In the default case (--with-default-devices) if a board exposes a bus,
   we want to have all the devices compatible with the bus to be built.

- If we use --without-default-devices, then we only want the explicitly
   listed devices, and PCI_DEVICES=y here seems dubious to me.

- If we use --with-devices, this is similar to the previous case
   (--without-default-devices is a specific --with-devices case [*]).

Paolo, in what case do you see having a ${bus}_DEVICES config useful?

Thanks,

Phil.

[*] Actually I think --with-devices replaced
--with[out]-default-devices, it is more powerful / customizable;
we should only keep / maintain --with-devices and drop
--with[out]-default-devices options.

