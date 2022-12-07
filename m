Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC7B645D20
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:00:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2vth-0004Hw-0U; Wed, 07 Dec 2022 09:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2vtb-0004Go-2m
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:59:40 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2vtZ-00009M-HF
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWXqj0l6Mnm6oHZpyLS4TgW0aLwSdm7TZvti1RRTJe8=; b=iVl9fBxHw/MG/qCmSp+VWg3DrX
 wK8nJ52MviK5sy8YanmMnZKnxQGCHMnWuK8YQXQXBdIqfflEtBa5cIz3P51GNaDzSUiya26I71yth
 E2pB6JJl5UPJd8893tSDUaJA2sMfng2ISXj9KXrX6krwGFN90nJFFqyK1KYqvMym8rHDut29kOB7e
 w4vxkm+i8Em7YBWFIUwieN31ePO5Yg0emZKKzRooMgAgNdThF4H1gsgvAoNwd8I0c73mXmkXsJeGZ
 yt7ne/fPq/QfMVPY4y6sxKAsuRnyLxpnnN/+fG9flV2HZhal/zsIhjtyM3bKtPNYv7FTtwTgQHpcC
 PqEXAyfxPMmgXixRdLdosFCOm18qmnAcX/i/H6njKZP8+0W0JbigGTY36H27gyDEx3CcGq15MuJj8
 RlIE8TTMaj9r8VAJwTo6FUomQXFkyVm7ehVpNTHgoZfS4ZS3TNvymx7QcjUBiBKg7GCZDeGqCcnjO
 TgDrey1cQoYtqWPmf3m82JchFHf7lXQz+MkHK/Gb7cnSL0NT/ybY6NWe5JEDYSJQed9mbATTi746V
 sGncoj9goQH048vcKKR4N9o+mMDFpmQrxTW2JPgqrAvdZDqWyl2XBG5HRc3yf8EFdoyy4F9es62ws
 HjN9dZKYegIAahm+vc/Vd7IvOqf5iXmqGrpTafmWg=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2vt1-0003MJ-TO; Wed, 07 Dec 2022 14:59:07 +0000
Message-ID: <221dfba2-eb63-c401-8ed2-e024906129bc@ilande.co.uk>
Date: Wed, 7 Dec 2022 14:59:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Fabrice Bellard <fabrice@bellard.org>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, QEMU Developers
 <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <Y4818KfGO7Y9Tsn/@work-vm> <3201e3f9-8b98-613d-5516-e0c6d89a9b9a@linaro.org>
 <CAFEAcA-WeEaMnL3CB1tGGM8jdscGBG+i_si0k86358kHaqdrsA@mail.gmail.com>
 <14e3dd65-f0f3-8d5d-4c0f-4dc8b1495aeb@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <14e3dd65-f0f3-8d5d-4c0f-4dc8b1495aeb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/12/2022 16:23, Richard Henderson wrote:

> On 12/6/22 10:02, Peter Maydell wrote:
>> On Tue, 6 Dec 2022 at 15:56, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> On 6/12/22 13:30, Dr. David Alan Gilbert wrote:
>>>> I don't know that bit of qemu well enough to know whether the cpu part
>>>> of qemu should be splitting the unaligned accesses or not.
>>> All I/O accesses are gated thru access_with_adjusted_size() in
>>> softmmu/memory.c.
>>>
>>> There is an old access_with_adjusted_size_unaligned() version [1] from
>>> Andrew and a more recent series [2] from Richard. Maybe the latter fixes
>>> some long-standing bug [3] we have here?
>>
>> There definitely are some unaddressed bugs there -- maybe this
>> is the time to work through what semantics we want that
>> softmmu code to provide and fix the bugs...
> 
> Yes, indeed.  Let's not forget Mark C-A's m68k bug[1] which so far has no resolution.
> 
> r~
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/360

That would definitely be useful: since Richard worked on this series, I managed to 
develop a hack that allows me to work around the issue for my particular use-case 
which is why I haven't been focusing on this.

The main concerns are listed in the above issue at 
https://gitlab.com/qemu-project/qemu/-/issues/360#note_597130838. Defining the 
behaviour doesn't seem too bad, but it is likely some things that unintentionally 
depend upon the existing behaviour will break.


ATB,

Mark.

