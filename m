Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00340D703
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:06:55 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoIA-0001aO-3i
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoDa-0006qI-9N
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:02:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoDV-00075n-L3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:02:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so8542162wrq.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPlnvWwDJmBGYDY064GS1S31c3Nx6YEROSxkxDU+k+w=;
 b=A7FQKZHqnh4oMyKLMRlS0c27yw+juxxQ09nwuGURUTvPsUeQfIZmGblvYJH2znkXfa
 TM+GDaGBzzNGLIWB4lJzyljb6fkIKfq1h2FFdiPYpZqwqvfTZ4ZRmGEaBwzpeCeVlhxG
 AFtCRkDe4EYV+IO0C65sxz1dvqwbikuFYHBmzAQhNuau8w4FSoaV/OvOk7vHQFzhs5iV
 rduEXNRJVl1EN4hOOHfrH0T4ehIy8RXjADpDrhiE4FVFScKR8V1QtEy0A3N/n5EJCCvr
 tbgKbZK0RHRt8itMJC/s67i0kV7rjorfBeh2EcLV7wQ2aU+K425S2Rjc+FTZJWIEhV/P
 7abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPlnvWwDJmBGYDY064GS1S31c3Nx6YEROSxkxDU+k+w=;
 b=5TpPqV+4x18ZJ/w+PFZF/sM3y8tL9VVkmdMxO/0Sq5/O0dAowbaOXUfaVLmFCAI4SO
 ywJ2iDUVpxRos65MpmYJnvqcT64SQ6hQNpsQGzMaJEI/w8Yj7yRfkvZv5N160WcaCs1e
 dVxMwlNCL6BFIPeLxUAfHtuDA4G7d8E4yBITfkqe5coPUjSaijrr0mrPmV84hNtUW2TR
 t9hdcXICSLFxnqe3M1O73BGJ10Vsq01IkWPPbnakBgKhU+vCNxBlyF+nWXKBgV04jMok
 F6ZBq+bVHe4k6gd+8qNm9TuIXmJbO6881Lm3qhfdPbMQuNs+iRePGwa79ahQf6Ij3j9F
 gvqw==
X-Gm-Message-State: AOAM5307Vf0mPzqzCgaOsV7uxGjU0aGLbIc/+jjOL3S78cGEaj10v4Jg
 wi91J8g1YMWMHKyt1Dd5l9nDMe7VmbmnjuT++rwz5GqkX3Y=
X-Google-Smtp-Source: ABdhPJwiR+vjEApCr5+tH2PC+ZqBbnYVxzDZ4zez8L4zWTa5PldkVBP+wI6VsQjuIL7lDaIqLcjVBEWZtT2e3K7fChY=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5055802wrr.149.1631786523815; 
 Thu, 16 Sep 2021 03:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
 <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
In-Reply-To: <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:01:12 +0100
Message-ID: <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL,
 VSHR immediate forms
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/21 7:21 AM, Peter Maydell wrote:
> > On Mon, 13 Sept 2021 at 14:56, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 9/13/21 2:54 AM, Peter Maydell wrote:
> >>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
> >>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
> >>> +{
> >>> +    /*
> >>> +     * We get here with a negated shift count, and we must handle
> >>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
> >>> +     */
> >>> +    shift = -shift;
> >>
> >> You've already performed the negation in do_2shift_vec.
> >
> > Here we are undoing the negation we did there, so as to get a
> > "positive means shift right" shift count back again, which is what
> > the instruction encoding has and what tcg_gen_gvic_shri() wants.
>
> Ah, I misinterpreted.
>
> >> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
> >> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
> >
> > I'm not convinced the resemblance is close enough to be worth the
> > effort...
>
> Yeah, not with the negation bit above.

Could I get a reviewed-by for this patch, then, please ?

thanks
-- PMM

