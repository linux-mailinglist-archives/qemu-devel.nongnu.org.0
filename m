Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754C2E9CFC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 19:27:35 +0100 (CET)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwUZi-00039I-OW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 13:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwUWm-0001KH-Qy
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:24:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwUWl-0007Dj-9Z
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:24:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id c133so133108wme.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 10:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSvy+sQ3wWDuOghnrvTBcwpdROOOWk2SAHFw1SfN+wQ=;
 b=PrVhtrXzqIznPuD3q2df52/GFu/pK3jc7N8h79gvZ2HGZnNs8nUt1nB4SA919/KWPM
 rexHw5UPwDn1h374LJZtb+Ka1++TVefiP2zQWoSx58Zt3Cuw+vd7RWJhqqrRwdymqQCe
 R526kSB1Wmn6/9hzfBN0cEhLHOEf9cJGLey464170C6DxDYzClBpc+5b+ZvXJQ6QbMIo
 nzFDHBrYtbcUOaPQOajGFy130vQSiGp4JMaF8TQPA6f+0KDcVlG5PwOXTwUPeNebC/bk
 JOJ+NfYSn7Dr3zUHgyz3LoBdv0CpgEJ+wBtTHVzv3ciLjBIoc06cLrkvJOFF4vylTRsi
 mQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSvy+sQ3wWDuOghnrvTBcwpdROOOWk2SAHFw1SfN+wQ=;
 b=BTEH/C+ALPsIRSowoC702rBG9Z9C8zzky6YH/09r+wOuSCxt/kGlZFqZ9FFGMvJJBI
 TuQ3yjBy5HIgWAzBWLg9KueijiPgTwX6hXWP9bg3jYcXNQ4NE1tlfCTWngt2ud4Ts7G9
 iL0uVXcZLN4cXjSI6S1xRu9hAIWWEpiiC2cGvmEtYxecp1WtEw9rRaFg9CWcbd/XP32Q
 EPxeUUY1NamFhEHY+wyT2QEdWtcZ2Obt7FQlLCtmgIRttdiu40i5E/wjDSClkppcVEiI
 QoUIjIUk83QuRqy+SqPqSf4ebdU05Zr79tY1+KqxxbeMHlc+RZPIdHVB4G97ropuPWfA
 2TdA==
X-Gm-Message-State: AOAM533E9+aZQm6HfPyuMsVbUo2sV1X5Fx3+CEetSN+TbRHT+xBlzBsd
 Ch8u1q99eV6s3YYDEDBZtqI=
X-Google-Smtp-Source: ABdhPJysktMWg7LtBZYY+s9fNFO3IBdznFu/h3SUhlZav4fFUJBZRQr7ae4D+HcoTTEyH1foh8HRmA==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr158581wmh.132.1609784661112; 
 Mon, 04 Jan 2021 10:24:21 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w18sm97622711wrn.2.2021.01.04.10.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 10:24:20 -0800 (PST)
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
Message-ID: <1b7c8f3c-f124-ad59-6eb0-ce29803b1327@amsat.org>
Date: Mon, 4 Jan 2021 19:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

On 1/4/21 6:39 PM, Philippe Mathieu-Daudé wrote:
> On 1/4/21 4:01 PM, Peter Maydell wrote:
>> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> I don't have access to OSX host. I'll see to install an aarch32 chroot and
>>> keep testing (not sure what can differ from an i386 guest).
>>> If I can't find anything I'll resend the same series without the Loongson-3
>>> machine, which is the single part adding QOM objects.

OK I guess I found the problem, we have:

struct LoongsonMachineState {
    MachineState parent_obj;
    MemoryRegion *pio_alias;
    MemoryRegion *mmio_alias;
    MemoryRegion *ecam_alias;
};

Then:

static inline void loongson3_virt_devices_init(MachineState *machine,
                                               DeviceState *pic)
{
    int i;
    qemu_irq irq;
    PCIBus *pci_bus;
    DeviceState *dev;
    MemoryRegion *mmio_reg, *ecam_reg;
    LoongsonMachineState *s = LOONGSON_MACHINE(machine);

LoongsonMachineState is never allocated... Accessing its MR lead
to BOF.

