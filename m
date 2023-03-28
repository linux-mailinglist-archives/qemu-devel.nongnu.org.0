Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B56CC8C8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:04:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCih-00018c-PX; Tue, 28 Mar 2023 13:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phCiS-00012A-RS
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:02:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phCiQ-0006hw-CY
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:02:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id y14so12968259wrq.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680022952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IIqE3er23L67hM3PpH6XZTJKimpZ2PXoDyifednEfZM=;
 b=QK/JfEkFKxbY4w9i6J2WaImqj0Oz3YSpWB9ubk7IuZr9yMJZuoF9uJZUHNQtK+tSy7
 8O5cdiuhwIHMMiKs6wVjK+F9AAjv6lMaxeihLZe1s1tOrdXwwA4j7QC7U0+dmuFs56QJ
 WSkWbguKtjHXPPobSKifMW9tu6ZXbvcV1bOTxXqdEIa/pdlDMYo1W4Norv0YWtSNsTve
 t62edcSEgunWUBBbhpjaLWJjH1NnEBYUzDrOgu799sOyNkJyc9hXtLUfpgYfpngLfUY2
 NFKAUl5RGZio9kGJZIqS0sGkM84kLdGIPWFzGzRNwHQk6RNdfdDrbKLATzppTfl6J+fc
 OdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680022952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IIqE3er23L67hM3PpH6XZTJKimpZ2PXoDyifednEfZM=;
 b=yb2dPs/QErUgIj1cioXUJ0UceZS4+cIqrtAq8wEAVRq44x19eXbPnSxBf69PkSdIT8
 A3XUxbCBGxC9BqznC3lONifvfoly9vaVsZittSKuE2kwrm533klmBMrVBRXJH7+Twcyy
 qqYzVfD2i7x++dCQYTmG6xxv6sKmSpht3hML3wuUS4F0UZ/EcuSjtd/MxQpp5T4DUvob
 JXxZXbFr36r0lXT3+mjG5xvS+0aIjra1uOcsgnI3lnuY0KEXn+vYiFtGzi5IYHQdZ1mp
 /lEmWXaWI5IgFGZaNCYV/kxStoXe4nCThParmA/TbDQYgvu8/RLrtuWgUC1klfiCxd5E
 /E0g==
X-Gm-Message-State: AAQBX9eqkEbeanYT4NS3xLCCzgwhsmcERi0HvsgMPKHWX05MfK/1qpOd
 7wULchDhY5GULFMdg6wltqHO7Q==
X-Google-Smtp-Source: AKy350adCOLESWeXYDZBDAqjFO4692DXAMW//lWg4IpzJfSOFMns1LSxPwO/2adDcNY3s17d2Qx4rg==
X-Received: by 2002:adf:f689:0:b0:2c7:17e0:54f5 with SMTP id
 v9-20020adff689000000b002c717e054f5mr11746623wrp.13.1680022952083; 
 Tue, 28 Mar 2023 10:02:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b002c794495f6fsm25021998wrt.117.2023.03.28.10.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:02:31 -0700 (PDT)
Message-ID: <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
Date: Tue, 28 Mar 2023 19:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Rob Landley <rob@landley.net>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320165821.GA4064187@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/3/23 17:58, Nathan Chancellor wrote:
> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>
>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>> bit, it follows endian of all other ISD register, which means it ties to
>>> little endian.
>>>
>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
>>> endian-swapping.
>>>
>>> This should fix some recent reports about poweroff hang.
>>>
>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>    hw/pci-host/gt64120.c | 18 ++++++------------
>>>    1 file changed, 6 insertions(+), 12 deletions(-)
>>
>> So this works on little-endian hosts, but fails on
>> big-endian ones :(
>>
>> I.e. on Linux we have early_console_write() -> prom_putchar()
>> looping:
>>
>> IN: prom_putchar
>> 0x8010fab8:  lbu	v0,0(v1)
>> 0x8010fabc:  andi	v0,v0,0x20
>> 0x8010fac0:  beqz	v0,0x8010fab8
>> 0x8010fac4:  andi	v0,a0,0xff
>>
>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>> ...
>>
> 
> Is there going to be a new version of this patch or a different solution
> to the poweroff hang then? I am still seeing that with tip of tree QEMU
> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
> a release version.

I couldn't work a fix, however I ran our (new) tests on merge
commit 3db29dcac2 which is before the offending commit 145e2198d749,
and they fail. So I suppose Malta on big-endian host is badly broken
since quite some time. Thus clearly nobody tests/runs Malta there.

Is it worth fixing old bugs nobody hit / reported?
Should we stop wasting CI resources testing MIPS on big-endian hosts?

Meanwhile, queuing this again.

