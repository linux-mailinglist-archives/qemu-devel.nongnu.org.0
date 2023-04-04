Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A556D6D1A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 21:27:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjmIO-0001Ol-TQ; Tue, 04 Apr 2023 15:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjmIJ-0001LT-Uc
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 15:26:15 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjmIH-0001W1-St
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 15:26:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1CFAE7462DB;
 Tue,  4 Apr 2023 21:25:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D5528745712; Tue,  4 Apr 2023 21:25:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D383A745706;
 Tue,  4 Apr 2023 21:25:07 +0200 (CEST)
Date: Tue, 4 Apr 2023 21:25:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 092/126] hw/display/sm501: Add fallbacks to pixman routines
In-Reply-To: <CAFEAcA_mmZUoeCaA7AJLecxt8J_Y=GVDex-OQ0aOSv8vdXH_sQ@mail.gmail.com>
Message-ID: <eeb107f5-eb95-6f82-99c5-6289e57f0595@eik.bme.hu>
References: <20230227140213.35084-1-philmd@linaro.org>
 <20230227140213.35084-83-philmd@linaro.org>
 <CAFEAcA_mmZUoeCaA7AJLecxt8J_Y=GVDex-OQ0aOSv8vdXH_sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-933704865-1680636307=:12425"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-933704865-1680636307=:12425
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 4 Apr 2023, Peter Maydell wrote:
> On Mon, 27 Feb 2023 at 14:38, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> Pixman may return false if it does not have a suitable implementation.
>> Add fallbacks to handle such cases.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reported-by: Rene Engel <ReneEngel80@emailn.de>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> Message-Id: <20ed9442a0146238254ccc340c0d1efa226c6356.1677445307.git.balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
> Hi; Coverity points out what may be a bug in this code
> (CID 1508621):
>
>> @@ -868,13 +891,19 @@ static void sm501_2d_operation(SM501State *s)
>>              color = cpu_to_le16(color);
>>          }
>>
>> -        if (width == 1 && height == 1) {
>> -            unsigned int i = (dst_x + dst_y * dst_pitch) * bypp;
>> -            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
>> -        } else {
>> -            pixman_fill((uint32_t *)&s->local_mem[dst_base],
>> -                        dst_pitch * bypp / sizeof(uint32_t),
>> -                        8 * bypp, dst_x, dst_y, width, height, color);
>> +        if ((width == 1 && height == 1) ||
>> +            !pixman_fill((uint32_t *)&s->local_mem[dst_base],
>> +                         dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
>> +                         dst_x, dst_y, width, height, color)) {
>> +            /* fallback when pixman failed or we don't want to call it */
>> +            uint8_t *d = s->local_mem + dst_base;
>> +            unsigned int x, y, i;
>> +            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
>
> In this loop, the on-every-iteration expression updates i...
>
>> +                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
>
> ...but the first statement in the loop unconditionally sets i,
> so whatever value the loop iteration expression calculated is ignored.
>
> Should the iteration expression just be deleted, or should the
> statement in the loop be updating i rather than just setting it?

In a previous version I've tried to update i from the loop but that did 
not work too well so I've reverted to setting i at every iteration which 
is also how this is done elsewhere already. So the increment in the for 
line can be dropped, I've just forgot that there apparently. Should I send 
a patch or you can do it?

Regards,
BALATON Zoltan

>> +                for (x = 0; x < width; x++, i += bypp) {
>> +                    stn_he_p(&d[i], bypp, color);
>> +                }
>> +            }
>
> thanks
> -- PMM
>
>
--3866299591-933704865-1680636307=:12425--

