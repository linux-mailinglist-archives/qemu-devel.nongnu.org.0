Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A91855C8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 14:22:34 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jD6kL-000348-82
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 09:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jD6jb-0002ff-Nh
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 09:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jD6ja-0007Ki-In
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 09:21:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54574
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jD6ja-0007Jc-D4
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 09:21:46 -0400
Received: from host86-185-91-43.range86-185.btcentralplus.com ([86.185.91.43]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jD6jt-0007O5-LX; Sat, 14 Mar 2020 13:22:11 +0000
To: Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org
References: <20200314084730.25876-1-pannengyuan@huawei.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <8c5ff9d4-83e8-4ee4-d6d1-27d1dda60b95@ilande.co.uk>
Date: Sat, 14 Mar 2020 13:21:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200314084730.25876-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.185.91.43
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 0/4] delay timer_new from init to realize to fix
 memleaks.
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/03/2020 08:47, Pan Nengyuan wrote:

> This series delay timer_new from init into realize to avoid memleaks when we call 'device_list_properties'.
> And do timer_free only in s390x_cpu_finalize because it's hotplugable. However, mos6522_realize is never called
> at all due to the incorrect creation of it. So we fix the incorrect creation in mac_via/cuda/pmu first, then 
> move the timer_new to mos6522_realize().
> 
> v1:
>    - Delay timer_new() from init() to realize() to fix memleaks.
> v2:
>    - Similarly to other cleanups, move timer_new into realize in target/s390x/cpu.c (Suggested by Philippe Mathieu-Daudé).
>    - Send these two patches as a series instead of send each as a single patch but with wrong subject in v1.
> v3:
>    - It's not valid in mos6522 if we move timer_new from init to realize, because it's never called at all.
>      Thus, we remove null check in reset, and add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
>    - split patch by device to make it more clear.
> v4:
>    - Also do timer_free on the error path in realize() and fix some coding style. Then use device_class_set_parent_unrealize to declare unrealize.
>    - split the mos6522 patch into two, one to fix incorrect creation of mos6522, the other to fix memleak.
> 
> v5: 
>    - Fix two other places where we create mos6522's subclasses but forgot to realize it(macio/cuda,macio/pmu). 
>      Otherwise, this will cause SEGVs during make check-qtest-ppc64.
>    - Remove timer_del on the error path of s390x_cpu_realize() and simply use errp instead a temporary variable.
> 
> Pan Nengyuan (4):
>   s390x: fix memleaks in cpu_finalize
>   mac_via: fix incorrect creation of mos6522 device in mac_via
>   hw/misc/macio: fix incorrect creation of mos6522's subclasses
>   hw/misc/mos6522: move timer_new from init() into realize() to avoid
>     memleaks
> 
>  hw/misc/mac_via.c      | 40 +++++++++++++++++++++++++++-------------
>  hw/misc/macio/cuda.c   | 11 +++++++++--
>  hw/misc/macio/pmu.c    | 11 +++++++++--
>  hw/misc/mos6522.c      |  6 ++++++
>  target/s390x/cpu-qom.h |  1 +
>  target/s390x/cpu.c     | 30 ++++++++++++++++++++++++++----
>  6 files changed, 78 insertions(+), 21 deletions(-)

I just gave this a test on qemu-system-ppc -M mac99 with both cuda and pmu, and also
qemu-system-m68k for mac_via and I didn't see any crashes there, so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

