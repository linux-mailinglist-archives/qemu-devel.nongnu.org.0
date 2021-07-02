Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD593BA11D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:18:35 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJ3y-00055d-32
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzIpx-0006IQ-EP
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:04:05 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzIpu-0000cE-S8
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:04:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id r3so6645485wmq.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c5J7eSxD0SQ0YoaA8QGNA1Ikv9hdPfaQDlbhbkpWz60=;
 b=BwFi8bu4pPCBKMLATjkZ7CSzPb+VYw9nTJ10Fedah47xmGQTmZt+XFa5RtjJf8IzCv
 5LCto6xmcK+z4P5KQE1cqCsJRrPN2sUWgNRPPTHjSv5AQbj5b5pjmrpnwUCjwudtz8DO
 jJPvRrSklyFjOgNKq/Ufcxp8iGrCOO5+ZHgoIPEtJNotEWyigZhPbZHdijGCDaQ9rl37
 2PvR9TkAtQEemy7hvVHymLNOywlvseS8CmRxqRyby6Oy4uvcxapo6Dv6D2AMbkwR5Yw8
 p2bn3rGSAeBZyPOKUmkEIu17/gDIPvzUH1x5Yx3ysiTYy6rClEQje2AJ7EHRWI2xLu1k
 GPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c5J7eSxD0SQ0YoaA8QGNA1Ikv9hdPfaQDlbhbkpWz60=;
 b=EeSRcuMACeamyEKPFIo5SwIdQDo/Jo7BbqPxS1JnORUgQ64Bz/4ACKf8t2uJ1V+cFV
 7TaoQ8nZLewFVABPLWiFEdBab4UfD4ttiP6TXC12o0MwHlar5PoLh2dW65x54POYmYdV
 hRnIlJ/awcIy97Fm7odG0WZgyF6488GjALbNaiY0Gu19a29CoV3dlq7MYjOba+Q6TBIM
 GHZ6/177JWgUXHuZ+jxXY4uYHAovcJ4vr5Csf0hZ7r3DsMaxUjHbuOQc60PkNOXbnhtH
 uV9gov9saG2QYPaeB6qt88M0V0T0lXnNij+v5sUOXUWZWcMmSV76SCziYpbVoDFc/U6j
 BzoA==
X-Gm-Message-State: AOAM532VjD+r9UsQ9j1S2bds2vExByJx1vmD4KLvgZJGolt8VtKIxbYR
 33vEYbpKaWvTRNjKHS9Kiig=
X-Google-Smtp-Source: ABdhPJyHQu2SSCWMrMXugWwpHpHkhIifTsLX8bl1CMZ25/toKcywLBNc+rR7RskZv7uXICIjiG4Vmg==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr16518368wmk.124.1625231041538; 
 Fri, 02 Jul 2021 06:04:01 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id w8sm3174716wre.70.2021.07.02.06.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:03:57 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] dp8393x: fixes for MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b4487676-d04e-14a4-2cdf-5c3aaa78212d@amsat.org>
Date: Fri, 2 Jul 2021 15:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> Here is the next set of patches from my attempts to boot MacOS under QEMU's
> Q800 machine related to the Sonic network adapter.
> 
> Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros to
> trace-events.
> 
> The discussion for the v1 patchset concluded that the dp8393x device does
> NOT have its own NVRAM (there is no mention of it on the datasheet) and so
> patches 3 to 5 move the generation of the PROM to the q800 and jazz boards
> separately to allow the formats to diverge.
> 
> Patch 6 adds an implementation of bitrev8 to bitops.h in preparation for
> changing the q800 PROM storage format, whilst patch 7 updates the MAC address
> storage and checksum for the q800 machine to match the format expected by the
> MacOS toolbox ROM.
> 
> Patch 8 ensures that the CPU loads/stores are correctly converted to 16-bit
> accesses for the network card and patch 9 fixes a bug when selecting the
> index specified for CAM entries.
> 
> Finally since the MIPS magnum machine exists for both big-endian (mips64) and
> little-endian (mips64el) configurations, patch 10 sets the dp8393x big_endian
> property accordingly using a similar technique already used for the MIPS malta
> machines.
> 
> Migration notes: the changes to the dp8393x PROM are a migration break, but we
> don't care about this for now since a) the q800 machine will have more
> breaking migration changes as further MacOS toolbox ROM support is upstreamed
> and b) the magnum machine migration is currently broken (and has been for
> quite some time).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> v2:
> - Move PROM generation from dp8393x to q800 and magnum machines and remove
>   the existing code from the device itself
> - Add bitrev8 implementation to bitops.h so it can be used elsewhere in
>   future. Use a shift/merge technique rather than a massive table lookup
>   as we don't care about speed
> - Add patch to set the big_endian property correctly depending upon whether
>   a big-endian or little-endian configuration is being used
> 
> 
> Mark Cave-Ayland (10):
>   dp8393x: checkpatch fixes
>   dp8393x: convert to trace-events
>   hw/mips/jazz: move PROM and checksum calculation from dp8393x device
>     to board
>   hw/m68k/q800: move PROM and checksum calculation from dp8393x device
>     to board
>   dp8393x: remove onboard PROM containing MAC address and checksum
>   qemu/bitops.h: add bitrev8 implementation
>   hw/m68k/q800: fix PROM checksum and MAC address storage
>   dp8393x: don't force 32-bit register access
>   dp8393x: fix CAM descriptor entry index
>   hw/mips/jazz: specify correct endian for dp8393x device

Since a MIPS machine is involved, I'm queuing patches 1-7,10
(PROM cksum) to mips-next. I'm leaving 8-9 for further discussion
after seeing the guest memory traces.

Regards,

Phil.

