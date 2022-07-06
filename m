Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3F5689C1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 15:42:52 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o95In-0006PZ-Tl
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 09:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o95Gr-0004Kp-TV; Wed, 06 Jul 2022 09:40:49 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o95Go-0000vA-DH; Wed, 06 Jul 2022 09:40:48 -0400
Received: by mail-vs1-xe29.google.com with SMTP id 126so15068353vsq.13;
 Wed, 06 Jul 2022 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tiD1fzCzmRACmDsRub/mNlL+z536F4vmi4w4s1zJKJ8=;
 b=Rz0tHULEbukpkAnVHddqZ2hbocUGQCUxo8ADSkotjjkKfHadaQsX01ZbhMUGDD9Ccw
 MYiyUR5ZW/omJY9P69lR28ddUm4nXIQgy0iTFxD/2kRXAZr+8GSUXiBKDiIyPvNJh0W2
 PvimhYEYSTyQOeYt6RT+ODbsVjOjJnM4++kHbf6PGWSLLlK/m9ex36NHZqI0mo9gkxHg
 JHXPgcS/tJAbeG7dallyp/U8wOs6YfnZcHKt80lKN1HFThNWgOW649RLxwjTxpxlbInW
 7Gwx5HxzYHTD6FEmFFTgMqd8PLL2oxftfR0zmo6fLYBOi2f3a5x0SP9JdsuTa8/+1fuk
 ySxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tiD1fzCzmRACmDsRub/mNlL+z536F4vmi4w4s1zJKJ8=;
 b=tORaFZzZcUFwGAk8Hn7JtWNaMrKB/eIwYJ/scq8Z3e6zVL5OEunLC/eyGhudXqy7Bb
 2PAzwwkZd+vsd1URmgejGT3eA0jDTsdVT1Z8szC0nurOFFvAswdEH1E73EK8psQqpf/z
 3tRSKrLq878GD03ZjfS30BWr+eLYZQ3+jqwFKUfM3FFsGLdl6XG5Y7aie1qbkSl91RSV
 M5apMuKjvCK+gtKBGls8rrscS9r3CPk/5Ed4AsEu3zcdFxl4oJjdz0bGYBhAqf6OwxZF
 FpzR7ciH0hzo2mVQFg627Aj+eK8wC0KbFTNkUkdUDF2kTA1J1HuqagyYYHxc2cgxzUR6
 P93g==
X-Gm-Message-State: AJIora9iyyAu8G4c/igGpyymfIHQbU4VhU9An230DXGd08bbs+Is1tr9
 WxEh/cgAsNYNw3MPpMwh2lo=
X-Google-Smtp-Source: AGRyM1vMBuJsWj7iU7GGN8K3jKKRAfEHN8+8Swh6h8PQY6JQ6TuAdxiTMsTk7JJQnJ6U/8EG22mhAA==
X-Received: by 2002:a67:e188:0:b0:356:febd:3943 with SMTP id
 e8-20020a67e188000000b00356febd3943mr4297943vsl.57.1657114838276; 
 Wed, 06 Jul 2022 06:40:38 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 g17-20020ab060d1000000b003690c3ce68asm9278475uam.10.2022.07.06.06.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 06:40:37 -0700 (PDT)
Message-ID: <4d1a6e4a-bf90-74aa-6591-e53d59de0a43@gmail.com>
Date: Wed, 6 Jul 2022 10:40:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20220705151030.662140-1-thuth@redhat.com>
 <CAFEAcA99=bjEzS8=aF7GrHezWwK9BsQACSy73DV_104fvMaV1g@mail.gmail.com>
 <8c343308-2cfe-6e45-2843-f832d607c773@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8c343308-2cfe-6e45-2843-f832d607c773@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/6/22 03:31, Thomas Huth wrote:
> On 05/07/2022 17.53, Peter Maydell wrote:
>> On Tue, 5 Jul 2022 at 16:13, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> QEMU emulates a *lot* of PowerPC-based machines - having a CPU
>>> that is named "default" and cannot be used with most of those
>>> machines sounds just wrong. Thus let's remove this old and confusing
>>> alias now.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   target/ppc/cpu-models.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Do we need to document this in removed-features.rst ?
> 
> Honestly, I don't think that anybody ever really used this in the past 15 years. It was likely used with the "prep" machine, but we removed that one a couple of years already. The only machine that is still using this class of PowerPC CPUs is its successor, the 40p machine, but it has a 604 by default anyway, and I've never seen anybody using "-cpu default" with that machine. So IMHO it's not necessary to document this - but if people here have a different feeling, then I can also respin the patch, just let me know.

I'll queue this up as is, don't worry about it.

You can send an extra patch for removed-features.rst if we really think it's
needed. I don't mind the extra documentation, but NGL this is the first time
I've ever heard of '-cpu default'.


Thanks,


Daniel

> 
>   Thomas
> 

