Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DF320D23
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:27:56 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDuOY-0002Sd-V8
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuLI-0001y8-VI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:24:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuLH-0007Jo-81
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:24:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so12475596wml.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6yQFVXNdfKm8elSA/a+gXzdS0uQslSYqzPBoXICHr0w=;
 b=fpaYTWB23uz7X2sETkpwI6vrN6Uox9JSk85fAKlkN7YGm9KW/bXpwgX1D7X2M+Y+Zj
 /BGF/Wv1g0x68cOGneqpsQFM750+kHPJA7b8egXAaM9rhAfHF1qGLpUJMm7b8awGapEf
 xqa0Nd6ONGpkHXqry/GZHhk0Hn5qtV8WkNMkaD8d7bKEVgY9pEq5gkXz3hahu/YdEeCm
 xQvmdECJdWNUXVFtgrODxhRiIfXKIOTh3qypWXU3n55b+oMLldtGulxWt8OQee2IZnFA
 cAsQlsGSz8WGnpnQKVIWAQaKUSKB2FA8j/TuT2z0u/jnRE+pcoWx/bPNg4z9fPKxolqe
 rpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6yQFVXNdfKm8elSA/a+gXzdS0uQslSYqzPBoXICHr0w=;
 b=saNeEfcaD8TMAORmEx6FszQ4gJX738m37jQoEC+XRiRYa+6LZzzRQbY7Hhq2n5mi2U
 eh141ni+n36dZ0DnkvaPZHAazlf1SX+hpf4v1oiIu/b9A1TaOQFCC/S7Wc4d0GialVc7
 QFNyWbLNMJwXn+w+IsIhJeBvf3s01t46h4E8zuuKhXKadSfQWPp13nQIZESqe1A2QAUo
 sVcYDtxnduRrtU1cZnzghyxU6SNgyNapD37tKeMdbp56z5awErWU+4Z1cNBp2QPB/jsn
 EpwE2SQe7mOrSFWZ9nsmmrikTRbKV9DblCGNuXEbJxMUoi52qDsY6qFv3qRdjnQ4XekK
 fCMg==
X-Gm-Message-State: AOAM531PbkjGDkA9YGEdBfVyYngHPVkqk1D0GgWdx9inUl1p6E5v5Fz+
 A7bLASonF8Ow1Yb8VEwi2P2TlHZ5aFU=
X-Google-Smtp-Source: ABdhPJzCqqh/IR/qIBx36OJSr9PNvur6n2Bup2t7BhOu20nPQhMIOxGT9pjwKeQp8dGqxB/BIhPLhQ==
X-Received: by 2002:a05:600c:218b:: with SMTP id
 e11mr11197109wme.106.1613935468947; 
 Sun, 21 Feb 2021 11:24:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm11067351wrb.43.2021.02.21.11.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 11:24:28 -0800 (PST)
Subject: Re: KVM Guest
To: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210203123425.GA9574@alpha.franken.de>
 <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
 <20210207193952.GA21929@alpha.franken.de>
 <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
 <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6266f24f-640d-b1e7-ffe6-e18babd10162@amsat.org>
Date: Sun, 21 Feb 2021 20:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 2/9/21 2:32 AM, Huacai Chen wrote:
> I think it can be removed.
> 
> Huacai
> 
> On Tue, Feb 9, 2021 at 12:40 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> On Mon, Feb 8, 2021, at 3:39 AM, Thomas Bogendoerfer wrote:
>>> On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
>>>> On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
>>>>> Hi,
>>>>>
>>>>> Does kvm guest kernel still work ? I'm playing with current mips-next
>>>>> and starting a kvm guest kernel inside an emulated malta system also
>>>>> running a mips-next kernel. The kvm guest kernel starts, but hangs
>>>>> in calibrate_delay (at least that's what info registers in qemu monitor
>>>>> suggests). Ayn ideas ?
>>>>
>>>> The current KVM guest kernel is actually a Trap-and-emul guest kernel.
>>>> VZ based KVM uses the same binary with the host one, so does TCG.
>>>>
>>>> TE KVM is current unmaintained. I'll try to get a malta and do some test.
>>>
>>> hmm, so it looks broken, is unmaintained, how about removing it ?
>>
>> Probably. I got remote access of a CoreLV malta but no luck to boot kernel as well.
>>
>> + Huacai as KVM/MIPS Maintainer.
>> + Philippe as QEMU/MIPS Maintainer.
>> + qemu-devel for wider audience.
>>
>> If nobody intended to maintain it probably it's time to remove it.

For QEMU the situation is:

commit 1fa639e5618029e944ac68d27e32a99dcb85a349
Author: James Hogan <jhogan@kernel.org>
Date:   Sat Dec 21 15:53:06 2019 +0000

    MAINTAINERS: Orphan MIPS KVM CPUs

    I haven't been active for 18 months, and don't have the hardware
    set up to test KVM for MIPS, so mark it as orphaned and remove
    myself as maintainer. Hopefully somebody from MIPS can pick this
    up.

commit 15d983dee95edff1dc4c0bed71ce02fff877e766
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Jul 1 20:25:58 2020 +0200

    MAINTAINERS: Adjust MIPS maintainership (add Huacai & Jiaxun)

    Huacai Chen and Jiaxun Yang step in as new energy.

commit ca263c0fb9f33cc746e6e3d968b7db80072ecf86
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Oct 7 22:37:21 2020 +0200

    MAINTAINERS: Remove myself

    I have been working on project other than QEMU for some time,
    and would like to devote myself to that project. It is impossible
    for me to find enough time to perform maintainer's duties with
    needed meticulousness and patience.


I don't have local hardware to test KVM. We have plan to add VZ testing
on Loongson hardware. For the rest I'll defer on Huacai and Jiaxun,
as long as it is useful to them, it is not a big burden for QEMU.

(IOW +1 for TE removal.)

Regards,

Phil.

