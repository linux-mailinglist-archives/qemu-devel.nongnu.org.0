Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C23024A8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:08:05 +0100 (CET)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40f6-00041Y-6O
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l40c5-0002aH-Eo
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:04:57 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l40c2-0007nK-Ms
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:04:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id l9so17642518ejx.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mq2sYW+X3zjixnMV2JLKme/WXTLmWOa5cl8/THcBA4g=;
 b=TRUvnAp2PZCnJTZEDMa/qFr6bllay2Y4/tvsO49B7nS+nf1HmmIG24HG23Ms1eK0x8
 FDgXPoD8K35xsKs4UGFiMS/VM5tVAM4GpKmRadDLRKBSKeZOGaEh3Lgj5HIQEFL+O8db
 838jppq1bIbXe0NmSrW6qDAVWwpyjIzVC2z9FUtNT5OyE/rLV9uea9TUHHsYkdcnjlL5
 zgtZIC5xzrknWaD/YSIJtmZYZlR2HzXrV2vpvSMi0p0wMwvDu8mAq8lVdIPHuVwS+dK+
 YMc4ADJqw/ZvIKf2+aZRwHZlJ3k0zIgE6Q1v5YlL2Uv+3Q6CXavd3m6Wt78TQ22nje7k
 BlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mq2sYW+X3zjixnMV2JLKme/WXTLmWOa5cl8/THcBA4g=;
 b=W0kcnb83BEo3zEurUTfMXCOK74jOKmVwUmNOp/rBj+a7KdWJmsmZIbstnaPaHrsNOh
 3MXgpLnZoEJUn0LD5PyULfAQk0yMczsrJQ8joHWo9bJZ4WOsqdLFaVgrcSZhu/W2JzXn
 Uhj2rIf6NllZhhFXotmtqYdzgHAd6vdWzguN0iK2n2ezjpoIHjgNuG6HX2BlVgrAYuAV
 Fq9cwzVTbAeFIAVQbSrmGb+BB+/3ADRPW4XxKN/axe00iCBi3vlBNqBY937g2VizZ4sS
 3UEJARL5//IAkcV6QtoSZ3TaXVly9JxdlkBaCTq90KlDxOBhrnsYc8Rd3+uCMlQQ8V3p
 rY6A==
X-Gm-Message-State: AOAM530UX2y4UuFnU5Ph/NTFzsQBEJKU8jRZFa497PbHI5GMVlh81MkB
 /jhMrJ0AExuG+462J0xeLhs6sLd+Onq7LIaEo96EgA==
X-Google-Smtp-Source: ABdhPJwkV/a74N+FWEFk00/M2U1h/GY/3p1N0gTn3ANYrxbBKjuCHpYqnfTfP+wDHTewo4pp8tHg3C5Bba+M0vultyE=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr169876ejv.4.1611576292866; 
 Mon, 25 Jan 2021 04:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-19-peter.maydell@linaro.org>
 <CAFEAcA-yMwWc6vtA=E1ysZtxuT3w_h4Kquuj5pqxZB0sRD9HJg@mail.gmail.com>
 <CAGcCb12vAYYUvKHCdmOf2PzSHfHYz53kqEtT6cwtfXAVuUMvUA@mail.gmail.com>
In-Reply-To: <CAGcCb12vAYYUvKHCdmOf2PzSHfHYz53kqEtT6cwtfXAVuUMvUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 12:04:41 +0000
Message-ID: <CAFEAcA-khf3Y9STUrR+iuuQmyUDoFg2s+uCzZpV57Hciv82ZfA@mail.gmail.com>
Subject: Re: [PULL 18/21] hw/misc: Add a PWM module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 17:13, Hao Wu <wuhaotsh@google.com> wrote:
> On Wed, Jan 13, 2021 at 8:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Hi; Coverity reports a possibly-overflowing arithmetic operation here
>> (CID 1442342):
>>
>> > +static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
>> > +{
>> > +    uint64_t duty;
>> > +
>> > +    if (p->running) {
>> > +        if (p->cnr == 0) {
>> > +            duty = 0;
>> > +        } else if (p->cmr >= p->cnr) {
>> > +            duty = NPCM7XX_PWM_MAX_DUTY;
>> > +        } else {
>> > +            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
>>
>> Here all of p->cmr, p->cnr and NPCM7XX_PWM_MAX_DUTY are 32-bits,
>> so we calculate the whole expression using 32-bit arithmetic
>> before assigning it to a 64-bit variable. This could be
>> fixed using eg a cast of NPCM7XX_PWM_MAX_DUTY to uint64_t.
>>
>> Incidentally, we don't actually do any 64-bit
>> arithmetic calculations on 'duty' and we return
>> a uint32_t from this function, so 'duty' itself could
>> be a uint32_t, I think...
>
> Since NPCM7XX_PWM_MAX_DUTY =1,000,000 and p->cmr can have up to 65535, The overflow is possible. We might want to cast NPCM7XX_PWM_MAX_DUTY to uint64_t or #define NPCM7XX_PWM_MAX_DUTY 1000000ULL
> duty itself could be a uint32_t as you point out. Since p->cmr is less than p->cnr in this line, duty cannot exceed NPCM7XX_PWM_MAX_DUTY, so there's no overflow after this computation.

Hi; were you planning to write a patch for this?

thanks
-- PMM

