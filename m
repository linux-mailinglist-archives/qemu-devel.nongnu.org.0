Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B085EB345
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:39:35 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvp8-00082p-0F
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvku-0003Aj-HY
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:35:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvks-0005Be-Qb
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:35:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTikV-1opP2S2nVt-00U6Vr; Mon, 26 Sep 2022 23:35:05 +0200
Message-ID: <7cf555f1-8bac-bef3-cdd4-7b8294082cb5@vivier.eu>
Date: Mon, 26 Sep 2022 23:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
 <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/J5rKXGiO3FISZB9jwc4ZFaJCGqAH1RFs5e/gx3fnomu1JTlNfk
 wD/m+UzNOkbE77jDh6wOxeGv9dMWMVUugI3xqMcfI1K4JU43+tyvU5V+RfoO8oqW+WX8oia
 NJ/ruC7qxVHr4SQdiIAhpbxqXPIOoc/JoKH5QyEp0AD/c80ckPT+0NIvkpvOLsUkbnMbN23
 T2koz7estYHkheWlon49w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y1yy4xjsE5s=:OUE9bEPg2cValMJFmpGL+U
 lbnkTK2AEEZ/wMZYCXT9naPFVLtxdIWCaeBpHoJ31ljtvChp6QbYuiINRAMQXWJFiQkJ6qDrt
 OOD65pVznW0FcjPEjWoDGzDzlsIYavMvESt2ub6TEVXyDYfJyzW63KhP/mj7N3kChg96uECk8
 tjaI5vhia8fl0dEfYqq/Wldg0NULlrmCUH2IPJkKClJ7U2vizWVU4RnPOgikzzwRa9AmDIWEE
 hiAddHVpxoIBGGcYmgY8vF56x1naSMhPlxZ6b28EgLvVzYMGWot0kAUkQQzaFWMXMXd0G/c/B
 J+KDwWWXs0H1oJFEwGxY8vodEjEnXH2SWum5gs/vNcz0AP/Y/TBjxZsXa76hq5sLTwMVO+0+4
 ZrY9hJp6JB1APYLxwbxq18JNgzdp4WRfZKJuM20yPD7oNa2f2xitdqTknMJB7yajYdG3kHpTI
 S3yX9sBTjPZijxjhGvvwmnL7Gvgox52BPIvL4OQW5EDjKUp+/MIhz/hfXYTid5Itc+N7W05OR
 XV4lVCK2TwyrsncwfVKi1zO0B588cvzo8lFOERt+wI2qtHJQmS3h5vosHO9hPwlpljWVNqhPw
 OhQBlsIXq3lh7GDYUvvABscErMVs8qtGwfnMWiVjxBkNRgz6idScJvZH3qup5VMiS4Iy9Fz8G
 BBYkK7TmkKWct9dULQOhJkVT7siK6B/c7zbU5v/uam5Rfw7X+Jr8q3v5uxs48i34z/fyPxbrH
 HSkH+dovAa/ReKEzWaAagC5B+8GENI4mjVo0rlzvLuaBiz5yyTkzc41cKYJV8NBxybogeSRlz
 ruSebdB
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 25/09/2022 à 15:48, Mark Cave-Ayland a écrit :
> There are already 32 feature bits in use, so change the size of the m68k
> CPU features to uint64_t (along with the associated m68k_feature()
> functions) to allow up to 64 feature bits to be used.
> 
> At the same time make use of the BIT_ULL() macro when reading/writing
> the CPU feature bits to improve readability, and also update m68k_feature()
> to return a bool rather than an int.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/cpu.c | 4 ++--
>   target/m68k/cpu.h | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)

Applied to my m68k-for-7.2 branch

Thanks,
Laurent



