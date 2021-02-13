Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F117B31ABCD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:32:33 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAv2H-0001MT-27
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAukf-00024C-57
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:14:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAukc-0001cB-TS
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:14:20 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b3so2938616wrj.5
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CPsDav6E8XHsrKagKg9vwrJ26wgur9LIk7vYzrhgnKk=;
 b=jDcLK4v+4VIKZqHyvX63o16hmIpgVfF5jpRAm1figxx6MciucHmLYMD+eDjQ+ZynVe
 7y8FmKgQqQxdNivrOytu4f3LFzhQsMRDw9bcd8G0iWjx2ibXVFYXbwdOlaTQy+ZOkHLR
 7QvK7ktPdCqHGrXpVmdqbqsHwExg7wnrAreqaiOO9QuhXDwywE9jfvINDd5w44O8DSaY
 toTytGN9dk25ih5Wx3QdNUcsRPkrYUS6UOPWBmRMHUgktsQ7DgjFridRqyNWLEtWlBl5
 4kcTpCkpgObKXVVT92sIRdvSVjv8a7OWKj40Bi6y+Ckr0TSl6ZzNSob4GGtGaIFjjirh
 WrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CPsDav6E8XHsrKagKg9vwrJ26wgur9LIk7vYzrhgnKk=;
 b=WWg589IW4oOp6VLytrO8Eqv0xuoFSGTAagD144yVif1Wlkosm7vxgtbl/R1P2l3h4b
 fuSwb7pgCtA1GVsJ5fPUvHieVpCtCTTpWpnu9BVA3WFqOk1mcJLtyTLx3b5aub3cSHNu
 0kMoC04J1S8fPrlDKOd/zvqaJDDDtKEPAXs5NQc8l9d2p6wA3Ltrl4Hz00MKTClfXqmn
 xo9BiHhZzeUWV7VfMmby3UsWiOuoqMiENQ/iJOqJKi/0XCX1hhQgKquOtX4CMGqm5F+b
 S7zSmLcfDX+Uwg4YrUJWd/PnGirxov9zaF3oq9diGoFy6Rd4ygmCrbiT00V0dM9Adofh
 yWOA==
X-Gm-Message-State: AOAM5300vPfQ7HD7sHyhbWtrvjxAPwLcDBA9asP0o6AA17cmtpKWw/22
 IdH59LxUTA9DRh5XFl8EUhTwl8cL8Pk=
X-Google-Smtp-Source: ABdhPJyp9rVxPuGoQKxgzirBq5S/0WJC0RcBA6O5sEvSTpM6nz+FmdLVnk1jxRSZ+d/Pzn7s2XV37A==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr8537928wrp.177.1613222057203; 
 Sat, 13 Feb 2021 05:14:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d20sm15377090wrc.12.2021.02.13.05.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 05:14:16 -0800 (PST)
Subject: Re: Qemu mipssim patches, mips malta and virtio bugs
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
 <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
 <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
 <YCekTE6Aik0OoLLg@diablo.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b86fcf3d-8be4-0d6e-e85b-7b4137fc7238@amsat.org>
Date: Sat, 13 Feb 2021 14:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCekTE6Aik0OoLLg@diablo.13thmonkey.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 11:05 AM, Reinoud Zandijk wrote:
> On Fri, Feb 12, 2021 at 10:44:55AM +0100, Philippe Mathieu-Daudé wrote:
>>>> i'd like to get the following simple patches to the MIPS/mipssim target adding
>>>> virtio-mmio devices to it.
>>
>> Please submit your patches as a series so we can review them on
>> the list:
>> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch
> 
> Oh thanks, i didn't know that; i've created a new patch with the OR gate you
> suggested. We deliberated about the change here and we'll at least keep it
> here locally for testing and profiling code until a real `virt' platform is
> developed for MIPS. Until then it would IMHO be a good expansion to mipssim.
> I'll try to get a proper patch posted on the list :)

What I forgot to mention is that QEMU aims to keep models the closer
to the hardware, so modifying MIPSsim to some Frankenstein is unlikely
to be accepted.

The patch could be useful (we can adapt it to an eventual 'virt'
machine later).

> As for the Malta target, its missing its BIOS and thus its PCI bus is not
> initialised correctly for NetBSD to run on when its passed with -kernel. Linux
> seems to bodge around this somewhere but if no BIOS is found it would be
> better if it was initialised as the BIOS would leave it before handing over to
> the kernel.

Agreed. The current "pseudo bootloader" was developed with Linux guest
in mind. For anything else you need a real BIOS ROM, but even there I'm
not sure it works well, because the GT64120 north bridge is reset in a
particular state suitable for Linux.

> There are also a few Qemu virtio-pci and virtio-mmio bugs we encountered on
> Aarch64 and Sparc64, how can I best file those? Or should I try to contact ppl
> directly?

For now the bug tracking system is on Launchpad:
https://bugs.launchpad.net/qemu/+filebug

You can contact the maintainers directly, but if the bug is complex and
will take time to fix, it is better to track it with a LP ticket IMO.

Regards,

Phil.

