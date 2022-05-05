Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BD51BF4B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:31:22 +0200 (CEST)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmadc-0008Um-S6
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nmaZI-0006Is-81
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:26:52 -0400
Received: from mout.gmx.net ([212.227.15.19]:47679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nmaZG-0002HJ-8s
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651753606;
 bh=HWmTxSbKfqtHeAyagURspH0+aLcN4SsETTayhS6FtyY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ghyYihOHa9T5TmdkqRiVH6jeWEKZjixbxINDdlGAJ6odsHRrahPXTygds/qVT1N9c
 jhEP25u0hNmv9Q+bHKJ4k7mLqU/AoL8mWYjbu/0U/o44aPPMmgSmIyUXpeUByUhaQs
 Q/qHO4LXXh2KjPs41YQH3VAuHmSEH8Gm0A260SWM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.153.59]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1naGuJ1C4L-00Eh2X; Thu, 05
 May 2022 14:26:46 +0200
Message-ID: <ede9e4f0-0972-c7dd-cc20-62579cac310f@gmx.de>
Date: Thu, 5 May 2022 14:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] artist: minor fixes and performance improvement
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, svens@stackframe.org,
 qemu-devel@nongnu.org
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jOrwnFpeLq6eEPgXO7tDQAMZ1Cyhe2Yazbtk9qmfmC9Z7HjQhld
 CnfjI3ie6t1PPcN52nb4kNHijyWYOHkwPLJmLHbj9EdoqJHIE/k8GkP6q3TeQ66CGZsQv2K
 gr7RdlpsQ/dH0W4W8ntUcRY4ConacThoNY5dL0E5NgdGfJwGUz/TC2Y4U+r7yNKT6aU+nXw
 VzMH0IdMfYvVgy0gBBgJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zgGeFfREPig=:mI9c794kgvlpu1CrNP5GCz
 8VF07vjJvF0aPIkPcyBnGU5BaEneAUUFXO5L5C41wk2WBoUdiJ2ZO/g7/VSiVoYo5M3n5ruW7
 HBfJtlc9O4wvXeSUyTGnUU998SlVPGHs2/gH8gW1IO0c8o6oSURKuBvlvycMKqYPR2wMCDfwP
 IEBgIxAQ/JPzRa9b9DA6Bq8kM62+eZrfiXoFZ9R1T3dmeNFnFI3+QVyEIVB0Uh6jQszL2AlAC
 C/PHKvKne7PrkuxFEzSomsJ/bKhtQRtzeSgnwlr0XIWU/iRV+YKS7FnyLeoRJJ8KPuG1eHvVA
 p/ph63Fp5+f+6gekEjgZ+2XLQvvAL6jtzmFUScmEXgR8j8SA5kWTRfoKow6rft2FK6MdlfJix
 /6mCEq4i8XNTenwR45HTY3A1dL2/DP8FLbdgLu0vX180siLOA0PptUfzv76HIzbWaNULRDMZr
 8RBQaCxFT1FPgJWItHOdk6YuBm1U04CzRWMwIzzS/Ga9EcP85AWlVf8uuuwF+EX+VOKnImuBQ
 qxbYBSHqR/O/jxWzlLuf4ynQRecSAeBwOsAaqM377AZU7jyj8+yfeYfHx0E7/EMr+9Km9Bb82
 WPcPpI9v6yGUiQEoahtO/6rw8tHTiUP8zY0fKELDPggdTL+QziNZpBHHN9hS2G779kCkTuff8
 H7u8dihLfs1ZstUDJmIZe6j/jpOxrYyKFQl7PZKhzH9lZBYGpCOfgS11FYlEa+OzTr7dcMvjl
 3q7qkZK/IvWi4IUaBx2M6xLG1s6DgorW5ZKQjjdCos9wQCNi1CrW6GZlZpWopCqaRejdYKJOk
 J69jkz9vgmDFfsJ+DmQaJAQ58vfwFvFuAbqUWhZTqD40Z4QSvt1Y+Q7ZESEWap7pO9fNB9luM
 wjFnnXcUkirzckDQm4eLxgko12A+ROoZSAjYzvB3luHFN4Rl9IkO0pRElEDuWSPbf45WkY7R+
 WsEw8rcsUS4KCqqbDVKt9hrCvs1Htts1UVsHxCxD9JxS/gOd7DqykTo6r3igcHzIj2wkX3r7W
 jAj+KACUJZJBynFV4FdnJux4yBHO4KPddiTa1vUMpstLB572XX5h5qvXL3ubY2lckMtF3JUbU
 m85MfdZId8SDSU=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 17:37, Mark Cave-Ayland wrote:
> Patch 1 updates artist.c to fix some style issues and ensure that artist=
.c passes
> checkpatch for the remainder of the patchset, whilst patch 2 removes the=
 ROP8OFF()
> macro which is currently unused.
>
> Finally patch 3 is the main reason for this patchset and improves the pe=
rformance
> of the artist framebuffer by only rendering the dirty scanlines to the d=
isplay
> surface, which noticeably improves boot times and makes the GTK UI usabl=
e on my
> fairly modest laptop.
>
> [Helge/Sven: if you can provide a Tested-by or Reviewed-by tag for this =
patchset
> before the weekend, I can include it in my PR containing all the other H=
PPA
> updates]
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

I tested it and indeed, the GTK GUI is now really much faster, even with t=
he
GTK window forwarded over X11.

Ideally, can the patch #3 (the GTK speedup) be backported?

I applied, reviewed and tested it. Please add:

Reviewed-by: Helge Deller <deller@gmx.de>

Thanks!
Helge


>
> Mark Cave-Ayland (3):
>   artist: checkpatch and newline style fixes
>   artist: remove unused ROP8OFF() macro
>   artist: only render dirty scanlines on the display surface
>
>  hw/display/artist.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
>


