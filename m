Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC29635DD0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 13:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpEL-0000Nf-3T; Wed, 23 Nov 2022 07:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpEI-0000NI-EG
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:51:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpEG-0003fh-Pa
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 07:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4p6HWghbyXxZFlxpXRkxLvl0mimUMK+GVCkpLWUErl0=; b=kzsD0vj+SY8FQZ03PL3pHl4Viu
 heWmjFaVbEnATke+xt4QqYndLj8HM9IHPw5b+3rDLvaz3BH+Z4Yj2D7hkXB3tw4CSUf5uKGZ4Wlxw
 d3+ImdEmDLIrCcOpIOSZ4N10IIKEqhLBtJUwF/+gExJ2SRLC11WGxbe9j8OImgWXEIln+++pJMu1e
 BHR5C89XgU7QOyrZwazZNBk2XRz7MaoLUo/ihFjais94qnnLAsNfQNOK/jh2INU+V2DS79VEACRbg
 spzyNy0nT2oZjiMuudXNdwyYewMVKGbeY63sWd+D3ZTDU7O4RP5iqug3vK2CKgq4HIFnCYf7HLJVn
 4dhz7cmS82izA8VMFHZKoPCcYv0f5TQTFHBGaJt5pAm5RQpECvM2sJi2BuULNwwi04f9a0W8BbjYo
 Iqn7Q50OQ9g7c5N/CP9cmTbuiK81qKA81NaoTjt1irzPYA2XewkNbyumNK/TGv9wMzzSOLooYf4eY
 FzWh9PgUo02lXKELpVontPphoE6J3UqkcUwCwNbzA9ZR/twrWffwoAlyGPzUP6rgnTJOPcxRzpQ4F
 s9WhUB3j4Fl87nLGgVdEgxnjU+80x3cFxNYtFSQOhXIedYF7HI3CqBm2UbqbLe/4NKE3hfXDcZBss
 9pBEgARUfmrV102bvHBG05fjdlhtBF35o3srft4BA=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxpE3-00068f-2c; Wed, 23 Nov 2022 12:51:42 +0000
Message-ID: <5a755c16-6280-cce1-c590-d8e50741eac5@ilande.co.uk>
Date: Wed, 23 Nov 2022 12:51:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
 <361dd079-a7d3-a1b2-0753-177156ef833e@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <361dd079-a7d3-a1b2-0753-177156ef833e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/1] tcg: convert tcg/README to rst
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 23/11/2022 11:06, BALATON Zoltan wrote:

> Hello,
> 
> On Wed, 23 Nov 2022, Mark Cave-Ayland wrote:
>> This is something I've had lying around in the background for a while, and I
>> finally managed to get it in a state suitable for submission. The main
>> motivation was that I wanted to have a TCG operation reference that was
>> easily viewable online in a web browser.
> 
> Nice. Maybe including a link to the result could help review. Is this the right link?
> 
> https://github.com/mcayland/qemu/blob/tcg-readme-rst/docs/devel/tcg.rst

Ah no, that's a different file - the one introduced by this patch can be found at 
https://github.com/mcayland/qemu/blob/tcg-readme-rst/docs/devel/tcg-ops.rst.

> The second paragraph refers to tcg/README which is this file and this patch moves it 
> so that sentence does not make much sense. Maybe it should be dropped and the only 
> remaining sentence from that paragraph added to the previous. In fact the last 
> sentence could also be added to avoid one sentence paragraphs and make the intro 
> section just one paragraph.

I can certainly fix up the link to tcg/README in the file referenced above, as that's 
just the reverse of adding the link to the atomics documentation. I'll wait a bit for 
any further comments before posting a v2.

I'd be inclined to leave other changes for now so that the conversion patch can be 
merged sooner, and indeed it may be that this changes inspires someone to better 
tidy-up and/or reorganise both these documents as there is certainly some overlap 
between the two.


ATB,

Mark.

