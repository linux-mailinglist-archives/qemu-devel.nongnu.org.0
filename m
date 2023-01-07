Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9E660B41
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 02:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDxhq-0004X5-39; Fri, 06 Jan 2023 20:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDxhh-0004Wb-Iq
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:08:57 -0500
Received: from sonic314-20.consmr.mail.gq1.yahoo.com ([98.137.69.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDxhf-0003DS-6j
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673053731; bh=RM3OQ5SqcJacBinVYA5gdpDbq4pClsj3VLZOZHffPJQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=dq2vESZ00s4dsw8quVaRQcy0BZg2MMAe1up1U3Xu4SS+hChXr+soZoOJHNf72JNnUmRqIjZt7CPd2Wj4o16s1l3suRFko0+555Qm/GJQUZh2HjjSazpYQJ1/LAUbMkGqx/X3S0Vyo76UZOVcJAThz9ZyUTQGW1cI3dr9adL6PpCIvQC4ggbq00a0lnAVdZKtotM38ldmUgdci/qQaNVTEtphM6mYYxBNpEQu2sg4TsDl7SV6bqpWlskF008qPLCTG639brYeH26TDogN/Em/C+B1hg8vg7mu9Nxi7FakyqhUVtyHuVLLMEmF8PRhctor2tNjooWG5+wGk8BYxg9dyA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673053731; bh=4KfaWLub71iH+DxRqHsT1oed9V4ykxAI+tvjzwupahF=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=dIzK4EfUtagvwewOlyDYJzaHBeOE1dd6FxKhqKRJHVS1XT7ETQpsMvLowXWgauUyCvsxFlGI6+6e8MFwk/TI50wNq1ZXzeXmDSV/iCDRkf3wY9R3KKl6vHknczVpZ0s4J74pn+B4GpUDjRbb/pQPBuYODrX4Gtq5FGvTUCaRcHaVL/T0BFDK4uTWqCteGzMw3NVAyCMYvuK4EkIMlCfg42OU0hB8vIClBrgKzep1tnt1/wpkZXo5zWhj2invPMg/vpZkWiLuudUfdQrRyCGTCvxybLAI5mkDjaDwBr5OoGLZgIAYWtBgUlRLVi3XqnuWQWdT2HWXS9uSzMvKnTIY9g==
X-YMail-OSG: gR.45zEVM1llY6rhNVg5om7pz3Lkij.kCFZX_Kf25.wujBsPXCa1drYl9VuuuST
 YImZ77FlHMRfjIC1BGeqBxNRH7W2cztj2fMryxh1TrjLPKpqzStbkiTq.hAWlA60D_OK2aaB2H3K
 GQpHFXEbv_ZycZ4fsAl_bs6hf2RMs7uMzOnIwKScFbuh8uPFHt6Q8Q9TeP6ZiXV3TEDcES0CeW4S
 fKbH27Wltwp5WU3JxJ38ID_VEk4N9JCos4IpLgX4tMRhi7VAu4gnujuSOTdpE0wbSHjrMDpp02ng
 .CBmPYzGveJWvlhmuTyo12Bb0urBmQTv9ri0hiQBW7RMYkGiyJFWic7jjALj0obWu4jBVV5x_tmu
 lXIK6AvTTwSL1K4HwFUw5G3Qt9pvUYIT7D4scKSqI8Bp5BXSaC3Bg63AjTqkRKiH1Auoe7Tmafmt
 rPma.QIljJk2Xifb4BCnXGXIQE2TfH2jyZs6JYnIC2omcMLTFuzhdLIwg6iVyzyD0GMv2HpABup9
 hhls2QFdnGr4w5SvNKcUR1fKdYwb9x.cGFVjGPrHOJbwlJnEjqJ.3vjXJRhfJRN9EyP9oUsCHj4Y
 5e6eWr7KZdShlzd3M44mBNe_WKhNC36jzzaEwOWEXdoedNWAcE_4GSPbHFj0vQHYXINASFj2P2Bf
 89w3EZvwOLctiVKy0DlINKGn5Phb391wMG7OGYrTBulQzHjZlFaoGvbK6b5Kxsp0Anv3Y2hpyOtq
 otM_OqibOXCPToBMd4gw2ZdfX3N_CsSUI9fx1emlXlr9bXDOnAet7Fgf2m0m4B14ZpFBFHNIC1NG
 9p5Kra2XccUh6EaSc_UYsGRQZH1T.bdO_zFJdRlOF1RE2o6GaSuKYDuNUYRlRn_WSZWf5QbQDCK1
 nzUuCJXeVkNfLQ_Klg5x_Hbs65CPm93SxWJh7_7tESbDRtAQk78slvLnIjA780llDOYgQ2AYMCox
 a90nymUlZw35b2LJItaQ7GczJMGKffoZJTrYrmTfIyCDdK0FpWQigQ3zcTi7XJVRLBSggobCiLMa
 U_G._NxtXd1N96SLaRrVw4kC7Gx67e9.Ft8uuwNKP2R5tzHceuO799VezVkW1KO2VydGrIalChkd
 u23.VU1wj2v_1B6edEJesBz_geqdMmsj5mhBRWoR21uYIMcn7YEyzSNA7TSZNVNTXqFeFPP_nedR
 1KGzYcLklAbq0r7rb6MEvj64NaZXJK1NWaPg20O9sDLhkE9Q0UiyGfFmDN29jfIzA.WDcRRbnfxX
 oCnR8gpRN5BaOigpo823oPwNolA1hbQINhvseJYJNEt.zaBcRPA4mY1etTDo4CBRem.ebisB38CG
 UJpAZ.T2Eer6GG1T6O3vJ06TwxDDy1s_OQaDSknq8krl1ny1njz8L3wLlCaJU8L5uCc.b20SXTCu
 QErbEW0hCmlo5zZsOfisDKfc8qat0ifJda6jrddbx7u75idAVMrN.vvf_0Ve8D2PG5advZg1wr4.
 lOWkqxV9IBWo3uO2nWq3webNXgS7K3Uq61Xy4yOhWgtVvR.FmB66JFz9ppo6WeZaaw6IHU7C1cm8
 zRGTErBUkx.Y24QPJWA7x8eI5JB4xr9tf9jPf7U52P1PcHab5_XrmjpNwZxKTmDhXpGgTstEvIoy
 E8oXy_NEBSLLWK5EPdBluUMiRVGDi61rUdnP7LFarcokxhBa0kAjdEtLOFXFqHQ0zA6oeKaEyYXX
 vHTOyE_6y_q3bYQzPL7p2ZfelWIVyqglLXgj25iK4N3ULo6tuowMO4YrJOs3DAir0XtgpfjasbCo
 NLCDLeY6.mWLYdSDitC_3jYBUYxkB5Gb6vl8gZ2Dq1V1eciYauuLzHVU7mZABDJStVjnSkZ2FUO0
 ZaN.UZZDfEN_a.neb34EGqqOX_pb6j6EhLe7bny3xvMiRGmt7jWbdRedQPqMZ65LoErRHSLoqvaa
 hyIqXMnIUsJZFEF1Qbwmf57ZbINnAIB4rgiN0Gm7l04pzGNaGy1I1Wn5E5fUlI5ahJjhBmWjhQ_p
 GHq22mn6lmS6MAgwfiJIgEklqCtf7y44im619ABPT8PHX0LzFJ327Zl2E2FudwOrV_FzqOk17y8w
 BZXqo.YCW1jF50HKpvBIFepTKvzDe2hgn4IrnNoeDMy3kjDhCm3K80ab87O2e1HrnDjxoCerLOe3
 E7_FDFwJAh16fA6KrQSKTbSM3sb4rcflYoDfrZa_VyVoRpIg8.ZGdQl.FCRg9Tf7CpzhMGLAEARJ
 zmXpMh4QfV3SA.BWDwKOCeQ--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Sat, 7 Jan 2023 01:08:51 +0000
Received: by hermes--production-ne1-7b69748c4d-g8q5j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 34031321042cfd49358cba9e2ea3354a; 
 Sat, 07 Jan 2023 01:08:48 +0000 (UTC)
Message-ID: <00ff4875-62e0-05c8-a13e-5a52d4195cc2@aol.com>
Date: Fri, 6 Jan 2023 20:08:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
From: Chuck Zmudzinski <brchuckz@aol.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
 <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
 <d9e2f616-d3bf-fc6c-2dc5-a0bf53148632@aol.com>
 <30337c62-a938-61c8-3ae5-092dbccf6302@aol.com>
Content-Language: en-US
In-Reply-To: <30337c62-a938-61c8-3ae5-092dbccf6302@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.83; envelope-from=brchuckz@aim.com;
 helo=sonic314-20.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/6/23 6:04 PM, Chuck Zmudzinski wrote:
> On 1/6/23 2:08 PM, Chuck Zmudzinski wrote:
>> On 1/6/23 7:25 AM, Philippe Mathieu-Daudé wrote:
>>> On 6/1/23 12:57, Bernhard Beschow wrote:
>>>> 
>>>> 
>>>> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>>> +Markus/Thomas
>>>>>
>>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>>>>
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>> ---
>>>>>>    hw/i386/pc_piix.c             |  4 +---
>>>>>>    hw/isa/piix.c                 | 20 --------------------
>>>>>>    include/hw/southbridge/piix.h |  1 -
>>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>> 
>>> 
>>>>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>>>> -{
>>>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>>>> -
>>>>>> -    k->realize = piix3_realize;
>>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>>>>> -    dc->vmsd = &vmstate_piix3;
>>>>>
>>>>> IIUC, since this device is user-creatable, we can't simply remove it
>>>>> without going thru the deprecation process.
>>>> 
>>>> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
>>> Great news!
>> 
>> I don't know if this means the device is user-creatable:
>> 
>> chuckz@bullseye:~$ qemu-system-i386 -device piix3-ide-xen,help
>> piix3-ide-xen options:
>>   addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
>>   failover_pair_id=<str>
>>   multifunction=<bool>   - on/off (default: false)
>>   rombar=<uint32>        -  (default: 1)
>>   romfile=<str>
>>   x-pcie-extcap-init=<bool> - on/off (default: true)
>>   x-pcie-lnksta-dllla=<bool> - on/off (default: true)
>> 
>> Today I am running qemu-5.2 on Debian 11, so this output is for
>> qemu 5.2, and that version of qemu has a piix3-ide-xen device.
>> Is that this same device that is being removed? If so, it seems to
>> me that at least as of qemu 5.2, the device was user-creatable.
>> 
>> Chuck
> 
> Good news! It looks the device was removed as user-creatable since version 5.2:
> 
> chuckz@debian:~$ qemu-system-i386-7.50 -device help | grep piix
> name "piix3-usb-uhci", bus PCI
> name "piix4-usb-uhci", bus PCI
> name "piix3-ide", bus PCI
> name "piix4-ide", bus PCI
> chuckz@debian:~$ qemu-system-i386-7.50-bernhard-v2 -device help | grep piix
> name "piix3-usb-uhci", bus PCI
> name "piix4-usb-uhci", bus PCI
> name "piix3-ide", bus PCI
> name "piix4-ide", bus PCI
> chuckz@debian:~$
> 
> The piix3-ide-xen device is not present either with or without Bernhard's patches
> for current qemu 7.50, the development version for qemu 8.0
> 
> Cheers,
> 
> Chuck


I traced where the pciix3-ide-xen device was removed:

It was 7851b21a81 (hw/ide/piix: Remove redundant "piix3-ide-xen" device class)

https://gitlab.com/qemu-project/qemu/-/commit/7851b21a8192750adecbcf6e8780a20de5891ad6

about six months ago. That was between 7.0 and 7.1. So the device being removed
here is definitely not user-creatable, but it appears that this piix3-ide-xen
device that was removed between 7.0 and 7.1 was user-creatable. Does that one
need to go through the deprecation process? Or, since no one has complained
it is gone, maybe we don't need to worry about it?

Cheers,

Chuck

