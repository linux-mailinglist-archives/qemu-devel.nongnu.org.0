Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB663D1C2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JJM-0005JI-Oq; Wed, 30 Nov 2022 04:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JJH-0005Iq-MK
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:23:21 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JJG-0007l5-2f
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WjJrG7Jf7sFJlIh55CwIXqXTgwIZ+hFcp4YpZpOWR/E=; b=yInGjV60XoJH2DIPqKD+Uwhrv2
 o7BBBQpdoQtk2SGkgNJJ9Sz/0pYymk+6UPIGFl1Un/KE4VnGetg1KQdN6ps+GvwJjAWq0qgsd6qlY
 kdd8HoY0lwEw3o9DNNfnNYDJWdR/J8fP2dFnc72lm+UfcFQK9RY/NEuwuxJWYfg7N2kmrFKuctKPt
 6E3PEpIuOifQCM49z6olvDVkOgFXBo1lcF76tGeKZUBw7cH8U1q2WXcuvcNWMdP4J3u5kfvK8TNY5
 C1KmeyFDCBvqABMSXZPY2yJjK4YDWEGsWq3B8teL+enodGZFOj3pNHhfJPLmqi6gUd9kE5r70LUw7
 k4v4qnDliXqDLxBahyQowrD6a7CCfc44P0ST3+3OuT5CSoduzGI9ggekVQtGOcrohsIpdezzOYSk4
 vMVnHJscE04lyt2oua3fgEUc9qCWfQYDjn9QnSNeRDUEevXjhJjoQi5lqlaGu/+2iB+xeDgRwCprv
 3Y9tj6BDjqCW6WPVD+i+DZWIzn+EPMv5Qu7dBgggfDkO6Tum5uyUwND6BrJR+GlelAW4fYCaOVVeB
 Sqz9LTT4HzhY2UTaS/bwVdtj85xVePYc8P/k4uD0eVZ3tMXXU5XTiJoY5907Bnjgj1Tw8k8DKCyyh
 eACotjofTURoboEOX6M6USkdkjQeVnLNTshjhNioc=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JIy-000AmE-9M; Wed, 30 Nov 2022 09:23:04 +0000
Message-ID: <9bb475e0-e048-3dac-c86f-ed2a3423ce8a@ilande.co.uk>
Date: Wed, 30 Nov 2022 09:23:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
 <20221123095445.31970-2-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA-3sfsCDA7O8y_fa=amKSCBO0CW6y4=ci_rrqkm=D8xaw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-3sfsCDA7O8y_fa=amKSCBO0CW6y4=ci_rrqkm=D8xaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/1] tcg: convert tcg/README to rst
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 24/11/2022 13:21, Peter Maydell wrote:

> On Wed, 23 Nov 2022 at 09:54, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> Convert tcg/README to rst and move it to docs/devel as a new "TCG Intermediate
>> Representation" page. There are a few minor changes to improve the aesthetic
>> of the final output which are as follows:
>>
>>    - Rename the title from "Tiny Code Generator - Fabrice Bellard" to "TCG
>>      Intermediate Representation"
>>
>>    - Remove the section numbering
>>
>>    - Add the missing parameters to the ssadd_vec operations in the "Host
>>      vector operations" section
>>
>>    - Change the path to the Atomic Operations document to use a proper
>>      reference
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> 
>> +   * - ctpop_i32/i64 *t0*, *t1*
>> +
>> +     - .. line-block::
>> +          *t0* = number of bits set in *t1*
>> +
>> +          With *ctpop* short for "count population", matching
>> +          the function name used in ``include/qemu/host-utils.h``.
> 
> Because we're using line-block, any newline is a literal newline.
> This causes some odd looking linebreaks because you get a linebreak
> both where it is in the input (after "matching") and again when
> the browser auto-wraps long lines. I think it would be better
> to not use line-block at all. Instead, we can just put in a blank
> line when we want a line break, like this:
> 
> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> index 0d90f3f7a00..e8a51ed1459 100644
> --- a/docs/devel/tcg-ops.rst
> +++ b/docs/devel/tcg-ops.rst
> @@ -252,8 +252,9 @@ Arithmetic
> 
>      * - rem_i32/i64 *t0*, *t1*, *t2*
> 
> -     - .. line-block::
> +     -
>             *t0* = *t1* % *t2* (signed)
> +
>             Undefined behavior if division by zero or overflow.
> 
>      * - remu_i32/i64 *t0*, *t1*, *t2*
> @@ -339,8 +340,9 @@ Shifts/Rotates
> 
>      * - shl_i32/i64 *t0*, *t1*, *t2*
> 
> -     - .. line-block::
> +     -
>             *t0* = *t1* << *t2*
> +
>             Unspecified behavior if *t2* < 0 or *t2* >= 32 (resp 64)
> 
>      * - shr_i32/i64 *t0*, *t1*, *t2*
> 
> This will result in slightly more whitespace between lines
> in a few places, but I think it's nicer than the mis-wrapped
> paragraphs.

I tried this locally, however without the explicit line-block:: everything was still 
placed in a single line even with multiple blank lines. I think I read somewhere that 
all table content is forced into a single document by default, which explains why it 
was necessary for me to add the line-block:: to get multi-line table content.

> If you really want to keep the line-block formatting, I think
> you need to use the vertical-bar version, which lets you
> specify which lines of the source are really new lines
> (they have a '|' at the start), and which are just continuations
> of the same line (they start with a ' ' instead), like this:
> 
> @@ -325,11 +325,11 @@ Logical
> 
>      * - ctpop_i32/i64 *t0*, *t1*
> 
> -     - .. line-block::
> -          *t0* = number of bits set in *t1*
> -
> -          With *ctpop* short for "count population", matching
> -          the function name used in ``include/qemu/host-utils.h``.
> +     -
> +       |   *t0* = number of bits set in *t1*
> +       |
> +       |   With *ctpop* short for "count population", matching
> +           the function name used in ``include/qemu/host-utils.h``.
> 
> 
> But I'm not sure it's really worth the effort.

This approach seems to work well for me, certainly it feels easier to maintain 
compared to switching everything over to use grid tables. I've got a v2 update which 
I shall post shortly.

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


ATB,

Mark.

