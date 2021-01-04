Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709C2E9D16
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 19:33:01 +0100 (CET)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwUf6-0007e2-BR
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 13:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwUci-0006aR-Ef
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:30:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwUcg-0000kR-Ny
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:30:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id g185so164806wmf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 10:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=er8tIdt3pFpQS5r4cVaZt2QmC5yshMGQ189qP0RcDQw=;
 b=nslimqeashgAwKo0gtkDGG10qCQ9pJ26ch3R+mkApzpErZ/1yArg1ExZuxXkwCOsvQ
 GcSWy8pymtwY8KyjyvJ5LESoYuW6WvhoKe6xqlZ3sx56a2CVuhS626tynfQNUFMq99c8
 r46F2fj6KHpt+tOfDF+YABUT64hBydaL5foXz100VVwbQoCN47eL+EcN7w3FtX3U1iuD
 WH0HkuLwZPOrAlql8X8kNPA5ZIMUNDC21lInqcNhiaGnGduUW/F8+1A+No5TchQhG4e9
 +wN0bOIkmbmma8xa2SXyxEZAl0BFWf2hLalGipNbKE4ha4WSlHzUjwlQgwUzpipiIZZp
 zyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=er8tIdt3pFpQS5r4cVaZt2QmC5yshMGQ189qP0RcDQw=;
 b=o0hEJpBYZRNyRX65hKsIi9fJH7Wj6h0tPVYU40i7w3uBlSp1B3wc65tgKx8oPpRMv9
 AYVkJn3bLvNQct6LC/p9KHYKxpnU0/TRhn7ue58vc6vuIKx0YA49dH1WVvnFJZv36fo9
 a7fWSkedL/TuCcLSdTxNtmPeCK5IM/72ooOeCjvhqe8BFAZtyYjkj5HMzt+dTZIEPTHd
 CfJoRQEtslhiIGbWqgTt0UycUIQhiybKHT38nboSQrbOOb+QI25pfjvD8iRS+fdW/A/1
 aNqJQjjzwCl+nxIPQ0rMSwM9vZWmJuSzaGrUmbBjhpo6hdqHqfS9dRzOmi+Hc6ogTDrZ
 lYGQ==
X-Gm-Message-State: AOAM533PiS8NVpOLKImICQzFwEe+kVxfsmdvSAGs1ZTAHR7QVTCbPeUy
 zj9uDJjNYG1dVM//YPr2uns=
X-Google-Smtp-Source: ABdhPJz6gMcrA3D2fXN4KtSRTY/RyDYANLmujlItwhpdyM+vvhVG/zyloy1ueU/Hl1lccNr7aRW7Yg==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr145141wma.175.1609785028816;
 Mon, 04 Jan 2021 10:30:28 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z21sm241130wmk.20.2021.01.04.10.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 10:30:28 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
 <1b7c8f3c-f124-ad59-6eb0-ce29803b1327@amsat.org>
Message-ID: <61fb784c-0e96-b1ad-31c1-4ada4e849864@amsat.org>
Date: Mon, 4 Jan 2021 19:30:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1b7c8f3c-f124-ad59-6eb0-ce29803b1327@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 7:24 PM, Philippe Mathieu-Daudé wrote:
> On 1/4/21 6:39 PM, Philippe Mathieu-Daudé wrote:
>> On 1/4/21 4:01 PM, Peter Maydell wrote:
>>> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> I don't have access to OSX host. I'll see to install an aarch32 chroot and
>>>> keep testing (not sure what can differ from an i386 guest).
>>>> If I can't find anything I'll resend the same series without the Loongson-3
>>>> machine, which is the single part adding QOM objects.
> 
> OK I guess I found the problem, we have:
> 
> struct LoongsonMachineState {
>     MachineState parent_obj;
>     MemoryRegion *pio_alias;
>     MemoryRegion *mmio_alias;
>     MemoryRegion *ecam_alias;
> };
> 
> Then:
> 
> static inline void loongson3_virt_devices_init(MachineState *machine,
>                                                DeviceState *pic)
> {
>     int i;
>     qemu_irq irq;
>     PCIBus *pci_bus;
>     DeviceState *dev;
>     MemoryRegion *mmio_reg, *ecam_reg;
>     LoongsonMachineState *s = LOONGSON_MACHINE(machine);
> 
> LoongsonMachineState is never allocated... Accessing its MR lead
> to BOF.

I'm going to respin with this (pass 32-bit tests):

-- >8 --
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index e3723d3dd0f..d4a82fa5367 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -612,8 +612,10 @@ static void mips_loongson3_virt_init(MachineState
*machine)
     loongson3_virt_devices_init(machine, liointc);
 }

-static void mips_loongson3_virt_machine_init(MachineClass *mc)
+static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Loongson-3 Virtualization Platform";
     mc->init = mips_loongson3_virt_init;
     mc->block_default_type = IF_IDE;
@@ -624,4 +626,13 @@ static void
mips_loongson3_virt_machine_init(MachineClass *mc)
     mc->minimum_page_bits = 14;
 }

-DEFINE_MACHINE("loongson3-virt", mips_loongson3_virt_machine_init)
+static const TypeInfo loongson3_machine_types[] = {
+    {
+        .name           = TYPE_LOONGSON_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(LoongsonMachineState),
+        .class_init     = loongson3v_machine_class_init,
+    }
+};
+
+DEFINE_TYPES(loongson3_machine_types)
---

Thanks Peter for catching this (we really need a 32-bit host runner
on GitLab...).

Phil.

