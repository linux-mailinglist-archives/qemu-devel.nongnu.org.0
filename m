Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270255EB3B1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:57:44 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocw6h-000094-AA
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvrf-0003NJ-2X
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:42:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvrd-0006Bo-ER
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:42:10 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLRI3-1ouKQJ34Pz-00IUBN; Mon, 26 Sep 2022 23:42:04 +0200
Message-ID: <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
Date: Mon, 26 Sep 2022 23:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
 <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rmS7G+wqvFmGDzi9InR3ESnQmpnIU9A1yKPeAciz5Ir2Ga7eqfc
 kOOZ0/Q67vgj3ajBPPoJACWJP1gcj3Bcm4zXWtSX+KHyTvGH1+Jmhocj5LkmpTpRpEWotcD
 DMZDgw5PMKFxVXSs2Ys3Z0Gpe00gZUm5PQDcjcDhw7SDlu3rrcWTkAQky3uSpJI5TDMS1O9
 NnGluHrWR+Ay/Pm2Ga29w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nz0mczb1mqw=:6LLZ+MUavioibJ6oXFuReR
 aBe5e2/diFzTV4AXMsqmEazH424/MI2l2NjA+Uvw0xZ6JATYthsZ95ulzBLfptUgRnrxcjU7Q
 74j5zzi7pKGda4Qf9ocpIxCem9WXa1O1cIU0k3eAM+rPFpKR5L4u90yiwXhA9oorKT5lk3+sD
 zfjBc2nGw5cPFEZ9r6A4EDBr2Htxq9RlxPGfPSvIJxAT4uxBUB8AIpCiRu+g1VTpd8cxJamXi
 /ikWCvIC3Gj5FMkqr422qrekDoUDAasM1yczoAlyjzc4IWo5TCXnMIIDX9f4AyvnDvo9X1toC
 /d9z7clyD75xMdtu/j/zf/a9xUxpUTnAEOZwEHix6co9Iywcb+HnXboOrjxKEYyTjcV+kueuo
 SHI9IHPcR82+4Kz8dXC3OtvEafwMN5Aq3/wsXzksY2CDt1MC2iWCJBcRokQGIfFvNGq9vVa55
 ISy/OG0zvzkV+YoF9xd1ybh2SihNdi+g5rDeck4aimzo0Mf0Jg22PVOd+SfGPiX0KEhlgtwnO
 O/dTy4tukpkgzaZR9SQCWDfr7A0PvEaJq9WYsYM92qnbM2cnD/MhgchyGtcRKaGtLU/7L7krr
 31b1C4TpU9DprVthgQcFOR9zbCc8xHueZ5IWIdcjKEghvIkClXnMmmN2eb8SkcoMkvB8dHSzy
 rHxhdc2x8phrpk2AsIEYho6sBVjVSpggCYqeAzT2cbYZ9HVi2F4Mn1h6KPAsHe9N0OLNcXg1d
 miSDCP5cia/EGPBVIQ+PaYSB8IPzVDyciwk9EHBIcda26QqkBPQQ5x1eqRlMz5i6+2dFUKoeO
 B7rHS3P
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

Le 26/09/2022 à 23:40, Jason A. Donenfeld a écrit :
> On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
>>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
>>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
>>> padding to fill this out as such.
>>>
>>> Also, break apart the padding additions from the other field length
>>> additions, so that it's more clear why these magic numbers are being
>>> added, and comment them too.
>>>
>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Cc: Laurent Vivier <laurent@vivier.eu>
>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>> ---
>>>    hw/m68k/bootinfo.h | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>
>> Applied to my m68k-for-7.2 branch
> 
> What about 1/2?
> 

I'd like to wait a little to see what happens on the linux side.

Thanks,
Laurent

