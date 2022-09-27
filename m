Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BF5EBEBB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:36:07 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od70X-0005dY-SW
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6jz-00031a-PF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:18:59 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:51405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6jx-0001jZ-2C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:18:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4384-1od6jt3wHI-0000VJ; Tue, 27 Sep 2022 11:18:54 +0200
Message-ID: <b8f297c1-f615-d03b-1808-72e65548c178@vivier.eu>
Date: Tue, 27 Sep 2022 11:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Jon Alduan <jon.alduan@gmail.com>
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220725110035.1273441-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1KLwoYHrvQprI9CiJZfO/2aDfHB91U6HSYYxApu+UfPNTUNdRFP
 /+Si8oY5i1EcC8pzYMe9n/RQLz0jFnIJfb3U6QJweqbJlD81driCoNIfk93rawv7T1BrXNO
 Z1EHt4lMZDZYtD2bhyqGRiyOeYP5CgnpAHIZ+QU3U1l8iCiO8dFrTulTI9o1I4WLrC9JS2F
 9/i/f7Z97/oA40NtszRnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KwjDPTTLrwA=:OpUZWBo9ThBwfv0WuiM9FO
 XP5cs0QdmRAyFSq7AN8PMLws64cg6BVnmlYcClyARW1HTstIYcv1j4H7sysIz2BhMXHIwGw+k
 71aS9vWn3FY/hFqKCO8OzLdhJLCFeOe+fCzaWXLzsv17AEdPfmXJlgDzmiBN//oYyMYDvuq3H
 4SzrY3hXjoYVXTfVXyPL0WuEQ89nrMyY7hj02m3AYgUVkPUo67xVScg56NVGMiZxzGD7KY1Ha
 dWdLmlQYGPGHmOGFfVsQIbPNkSI0kChPO3pO4ilg+QtA/qw640AlnhN1qUuG7Ja7c4h4p6eyn
 VVxJ3Amnqg5tnKnU4N5pqEKg1Cx0LiV/j0iol7273ZGEuFuhMScKbeD/dPeNggcx0FCZOqcGi
 L3iB+dsPfUoBppbdPDeVpm3oS2DBxl7w1Dl3wISOHaSL3+fLi+9y/U/lAxXZ97jxf3ZEoBMm/
 Ht72x8NfHQVMg+Zo73yjlWZL3fsSJewbA3xwiKu+qjt6R4dl0kub2KLQfKpKVRBFkhNRzTI+k
 o7MZykfHGbULHJA2IzCI/b+Cwe44NNazUdJ1hdT4XrlvhZZGpixTRBZqZeysYKqunSMAMtWXu
 qrbd55bXsBS1uzCQinGe92v9NO+SFqFXno9Lys8+TChKK5OONN3NBGxh/DRV8xC+gqivqUtNH
 zg823Zaz+68fUxBcCDjJgUlK98KpwBO3LpNR3okCoS6H3qvwfM0QVWxI2mNMafYhaaM1NkvVw
 CivcwDf9S/XN6SPEuxnDM73oqjY66suGpJpLdDiT329qlFYq4VOTzfF1oPGIiXmlDyKbGkkJh
 Okq5LZU
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 25/07/2022 à 13:00, Peter Maydell a écrit :
> For handling guest POSIX timers, we currently use an array
> g_posix_timers[], whose entries are a host timer_t value, or 0 for
> "this slot is unused".  When the guest calls the timer_create syscall
> we look through the array for a slot containing 0, and use that for
> the new timer.
> 
> This scheme assumes that host timer_t values can never be zero.  This
> is unfortunately not a valid assumption -- for some host libc
> versions, timer_t values are simply indexes starting at 0.  When
> using this kind of host libc, the effect is that the first and second
> timers end up sharing a slot, and so when the guest tries to operate
> on the first timer it changes the second timer instead.
> 
> Rework the timer allocation code, so that:
>   * the 'slot in use' indication uses a separate array from the
>     host timer_t array
>   * we grab the free slot atomically, to avoid races when multiple
>     threads call timer_create simultaneously
>   * releasing an allocated slot is abstracted out into a new
>     free_host_timer_slot() function called in the correct places
> 
> This fixes:
>   * problems on hosts where timer_t 0 is valid
>   * the FIXME in next_free_host_timer() about locking
>   * bugs in the error paths in timer_create where we forgot to release
>     the slot we grabbed, or forgot to free the host timer
> 
> Reported-by: Jon Alduan <jon.alduan@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/syscall.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


