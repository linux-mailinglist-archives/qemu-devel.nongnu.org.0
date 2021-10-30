Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99081440848
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 11:47:26 +0200 (CEST)
Received: from localhost ([::1]:40908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgkxR-0007cf-OV
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 05:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgkvp-0006w6-70
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:45:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgkvn-0002ik-Js
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:45:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id b12so16111982wrh.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PB2DT0Vj876xSjCmAoOeZ4xjmM6XyElCsYyMitlQb20=;
 b=QKcYabndkLflo0iNUnIdxinih9Jnp06j6evjTnBjRSXpdbpRNsR+ZMaEClSbG9PNyi
 QCp3dnkYHHH4cwJrmdRmZcP3iXjuUAuywwEcd6zF0Vt10apbJ9bIoT//BWV98AHhJjiZ
 0uVBn/8htJARWIvDo0TmfqET8DhJ1VwRaMmMDSIhU+l91VCKSEmJk0k9Un13/eldELDE
 lMXkFsbWgYPA/VRo8Uae3MVbgvJrkRfMkV6I4mrx4xgBLOf4tgcfaEJ76NeXvxwlKgJx
 HIXOuLZqHAZR4Vvc02tkkh772+sdqt5GWdEmoFdw9J9pDFXFPB3r9l1nj0o4zB9A6d2P
 YdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PB2DT0Vj876xSjCmAoOeZ4xjmM6XyElCsYyMitlQb20=;
 b=ylITli7OFcNJYjW2ha6uAdxY2Nk+gpBrqgFNkrL28PkWS8cbwbasO25LlJSDgfL0N5
 ZNY5OmBn1MZnJgANKnHveHVrpFYw9il0u8QsBqSTkUeajiqhQ2RL44ICH2+d8mjplfhz
 m67DgRcSr8AbHSK0QD3RqzczRtcuIBFwFrFcueYfSVfFGA68JSKz6pWwkqD1AsqKn7Xh
 1Nv1o6xN7hfSWRhrwsmPV7Zp5MvvBFh70Sd7nMhJ1pngcAIl9oA2GWhqMkoJEMI2e08Q
 O3wYqNhERngxJU3YqR7513pO5mRQhwUhFpoCyBL2VhxW+ngxFAayhiagZldU2Osy1Sqw
 0T+g==
X-Gm-Message-State: AOAM5309UUL5Z/WS7vK7kpaZkSPJQ3+nzBquqGxhNbJYluJOQQPStdkk
 2MIgmFI4CoJESP9WV7VRf14=
X-Google-Smtp-Source: ABdhPJwns7/sxcE+TzrKflc/KqR6bN6gu0TyBCEYFRaj3mXJLRDvZ56hDk79xEOv9nm5mXZWntXfPw==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr21487443wrs.400.1635587141568; 
 Sat, 30 Oct 2021 02:45:41 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v4sm7776909wrs.86.2021.10.30.02.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 02:45:41 -0700 (PDT)
Message-ID: <b29e3ed5-e3f2-06ac-d4f6-05d78cb717fd@amsat.org>
Date: Sat, 30 Oct 2021 11:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 22/30] hw/intc/sh_intc: Inline and drop
 sh_intc_source() function
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <a98d1f7f94e91a42796b7d91e9153a7eaa3d1c44.1635541329.git.balaton@eik.bme.hu>
 <8ca6ad2d-c04c-b299-437c-1724c79c8551@amsat.org>
 <f43fa362-83f5-c62f-eb4d-9be130cf2827@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f43fa362-83f5-c62f-eb4d-9be130cf2827@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 01:48, BALATON Zoltan wrote:
> On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/29/21 23:02, BALATON Zoltan wrote:
>>> This function is very simple and provides no advantage. Call sites
>>> become simpler without it so just write it in line and drop the
>>> separate function.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/intc/sh_intc.c        | 54 ++++++++++++++++------------------------
>>>  hw/sh4/sh7750.c          |  4 +--
>>>  include/hw/sh4/sh_intc.h |  2 +-
>>>  3 files changed, 25 insertions(+), 35 deletions(-)
>>
>>>  static void sh_intc_register_source(struct intc_desc *desc,
>>>                                      intc_enum source,
>>>                                      struct intc_group *groups,
>>>                                      int nr_groups)
>>>  {
>>>      unsigned int i, k;
>>> -    struct intc_source *s;
>>> +    intc_enum id;
>>>
>>
>> Maybe:
>>
>>       assert(source != UNUSED);
>>
>>>      if (desc->mask_regs) {
>>>          for (i = 0; i < desc->nr_mask_regs; i++) {
>>>              struct intc_mask_reg *mr = &desc->mask_regs[i];
>>>
>>>              for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
>>> -                if (mr->enum_ids[k] != source) {
>>> -                    continue;
>>> -                }
>>> -                s = sh_intc_source(desc, mr->enum_ids[k]);
>>> -                if (s) {
>>> -                    s->enable_max++;
>>> +                id = mr->enum_ids[k];
>>> +                if (id && id == source) {
>>
>> Then you can drop the 'id' checks.
> 
> I've tried to preserve the original brhaviour in this patch and not
> change it for now. This will need to be rewritten anyway beause it does
> not handle priorities and hard to QOM-ify as it is so I'll come back to
> this where these will probably change, so for now just leave it to keep
> the existing behaviour. Then we can revise it later in separate patch.

Fine.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Thanks for taking the time to review my patches, much appreciated.
> 
> Regards,
> BALATON Zoltan
> 
>>> +                    desc->sources[id].enable_max++;
>>>                  }
>>>              }
>>>          }
>>
>>

