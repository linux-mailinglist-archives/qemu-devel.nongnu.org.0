Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0055BA17
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:36:52 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ov5-0006dz-50
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ot2-0004IV-8A
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:34:46 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5osu-0002EY-OD
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:34:38 -0400
Received: by mail-yb1-xb35.google.com with SMTP id q132so16735460ybg.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qAEZcZ8Ew7ErxhkIETEF94pv0xdlvOq+KlyYLzRTcFI=;
 b=PZaBdJPr3RSYSo9OBFAdHEFlwOY3fjLMdH8+rKXKmQkYejB1cEDCyy0ISxAyflYYKn
 sjA782OtiejJNbobIfO0MJFNZN24WGIMKcEb5Ya1PcuxPIHtGypXPEfIuuuQCxuIAiW8
 +NiYA+TnH10IpX5DcHu8GkrmHHj9OS2QWJgQYjc8RlSkT4QLjz/3PAduEPR6yNf3123u
 23Y44d/7zXYZkAJ0tBosFL4z4iJmt8oP+EIRbny6GizSD4fvztV+rKLHSB9jSbfjmBQW
 ZLuQdSLwP/4vsmvaMDmVI245f837/vKLOsBhBjVuXMHRlW4uXfyM6ffwg9gOaOqWRFtZ
 yT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAEZcZ8Ew7ErxhkIETEF94pv0xdlvOq+KlyYLzRTcFI=;
 b=GHw6TOGNBysguJbmqdnGTXYBPeT+Qw1+XL2j9e2Nmalxw0/eu7eFjq1+sJdCSO4j5a
 eYFBAdnTY1pqfqIKlp0yEyrdw5TACgfR24+HM8b7wZd7cmE7W8Jkg4KVbXf37EKY6J0p
 PHjLnCdvLcAoomMnkpUg2De7puAcs9kS/S7uy9xF/S9MA2lId6dsM9bOTPxz9JvpQlY4
 YCbcdD99KgT88aMVCrs3MVitDwTLt5dQgZJVGzGmR9UytPgvpRrB8KxofVNv1XeX/c0a
 u5FMQMWU3wGCnSc8j4wBv7uFB/sEZ5dZWKkhMU7BprSeqUUmas/uxTMeWHlWkEpdX64Q
 uwXA==
X-Gm-Message-State: AJIora9NaZYFt0k59vDxuBKzbi0l/8S7dy/RaeLejaJubRtyzwkC0ZuP
 5TdaR/3OTUZmwZwCgytyEzCsKTcDgY7ZXRrhOGH5Ow==
X-Google-Smtp-Source: AGRyM1sKPde9AM2J2wccAGccZkBKpNYqWXnIVGRr1aO6xlTHgE7Sdl1oQWy8Ygi0dbQtR5Yy7xnzcuKhhOcmRMi3Gyw=
X-Received: by 2002:a25:83cf:0:b0:66b:c7e5:faf with SMTP id
 v15-20020a2583cf000000b0066bc7e50fafmr13587039ybm.288.1656336870206; Mon, 27
 Jun 2022 06:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
In-Reply-To: <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 14:33:52 +0100
Message-ID: <CAFEAcA-OBz90QjcDFCjm=gEZOnS1RRwEVY6=5+QBZNwvo7hD-g@mail.gmail.com>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 1 Apr 2022 at 09:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> On Thu, Mar 31, 2022 at 7:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Coverity warns about use of uninitialized data in what seems
>> to be a common pattern of use of visit_type_uint32() and similar
>> functions. Here's an example from target/arm/cpu64.c:
>>
>> static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>>                                    void *opaque, Error **errp)
>> {
>>     ARMCPU *cpu = ARM_CPU(obj);
>>     uint32_t max_vq;
>>     if (!visit_type_uint32(v, name, &max_vq, errp)) {
>>         return;
>>     }
>>     [code that does something with max_vq here]
>> }
>>
>> This doesn't initialize max_vq, on the apparent assumption
>> that visit_type_uint32() will do so. But that function [...]
>> reads the value of *obj (the uninitialized max_vq).
>
>
> The visit_type_* functions are written to work for both getters and setters.
> For the leaves, that means potentially reading uninitialized data.  It is
> harmless but very ugly, and with respect to static analysis it was all but
> a time bomb, all the time.
>
> The best (but most intrusive) solution would be to add a parameter to all
> visit_type_* functions with the expected "direction" of the visit, which
> could be checked against v->type.

So do we have a plan for what we want to do with this issue?

In the meantime, any objections to my just marking all the Coverity
issues which are pointing out that visit_* functions use uninitialized
data as 'false positive' ? There are a ton of them, and they clog up
the issue UI and make it hard to see other actually interesting reports.

thanks
-- PMM

