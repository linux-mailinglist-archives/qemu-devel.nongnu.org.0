Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EC55975B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:08:57 +0200 (CEST)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4gFE-0008Cq-Gy
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gD1-0007Cq-Ve
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:06:40 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:39893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gD0-0004cN-Du
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:06:39 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3178acf2a92so19784737b3.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngj7kujS66MfNn6Y0gGXaRBCJ9j3t+t6lRC1FxqQ1V8=;
 b=nqa11Ca8zAqJIexN50nhEF1S6e/eiczn+KGMvOLbhOg9Zu62XmmUoiByTfGoBhvRFE
 8xIQVHLRKWcaUq+EHpoHGJ5jYsC8rcNsMSEEKfqHDSnfh/vXwDY3anrmieTyzO9QcfA6
 F9pGEux/PbfexO4jwUynLJK7aVCvXNXmOIEb/Ij8CeK8KV3e8aM+lWfej+wBBegXajWH
 b9EVNsQRCI1nBgYB+wzHZimD55YCMluDa3Bvp6TZFA5iBx1i2ejU0wfT83ogPwmPN3th
 NxUiM6FtOekzdh+q5GFMmH0vqrzgxsVbA5kkb/92W+glCOuCbWpOULNfuMi3XkX3H1FE
 NynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngj7kujS66MfNn6Y0gGXaRBCJ9j3t+t6lRC1FxqQ1V8=;
 b=wIXUwytVTnWDWyOsSNb5FRws9ltXfoEl5Ly7g2HvUqKrqPFVj5UMy17SKn9U01MZZT
 8WwotNNlalluS5VT8X9MpQFFlpJEP502FhXC6IoXUYEp83OPp3gi39LBUlCwmCDFgv56
 sgxBnLse9tWxNvliggYUxrskFDy4yTWJ0y4lOT3NAokoScIpVcsdh3LZ8vRKCvC8phUU
 tS++C4vnEQ8qYY6I67h7+t46j883OvIj7gFWniXfwoEhblXGUicXwmNzbVbfKdALmOUc
 b4mKHnzTVPTpc2wzLLGO9Z/jSwGIjpQKcmD9+Yi3lD+06VWs8r9T8X5fHAxlbT3PudsE
 SjAQ==
X-Gm-Message-State: AJIora/1JYbRHzCfxZaztkHcc7nVB9O4Vxp5NCjU/aKHCuUeYZJAHwP5
 DL5QbduN5Mgc7CM9iZsGvvmwVvDSGf3/8IqvtZ+2dg==
X-Google-Smtp-Source: AGRyM1tc7VbGU5qiUrC8Bq2/XGdB6oUd2VuJ1pUUEuXX3/V8A3frX7i6iV4vef/buadqa6s6+15dBlJQO9bCPy4+9LE=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr15914138ywd.64.1656065197148; Fri, 24
 Jun 2022 03:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-27-richard.henderson@linaro.org>
 <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
 <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
In-Reply-To: <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:05:59 +0100
Message-ID: <CAFEAcA8nYEYjL4Go4tZJtGWU8F2uY1_AWKpn3ux+Z94+GD1mVg@mail.gmail.com>
Subject: Re: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Thu, 23 Jun 2022 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 6/23/22 04:41, Peter Maydell wrote:
> > We now have several rather long functions that are
> > pretty complicated and pretty similar handling the various
> > SVE and SME loads and stores. Is there really no hope for
> > sharing code ?
>
> I'm not sure.  Maybe.  The two issues are:
>
> (1) sve ld4/st4 -- arm didn't make z29-z31 illegal, but defined wraparound to z0.  So I
> pass in a Zreg number not a pointer to those routines.  So the routines can't be reused
> for Zarray without changing that.
>
> (2) sme ld1/st1 vertical slice, which significantly alters the spacing between the elements.
>
> One possibility for these cases is to perform the load into env->some_scratch_space, then
> copy into the final position afterward, and the reverse for stores.
>
> Is that preferable?  Do you see another alternative?

Hmm, loading into a scratch space seems a bit clunky too.
I'll leave it to your judgement but I guess since you've already
written and tested the code we have here that argues for going
with what we have. Maybe we'll come back in six months and
realize there's a neater approach. (The GIC ITS code ended up
being refactored like that.)

-- PMM

