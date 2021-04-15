Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF435FF87
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 03:27:13 +0200 (CEST)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWqml-0004ON-Tv
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 21:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lWqju-000356-Q4; Wed, 14 Apr 2021 21:24:14 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lWqjt-0004oe-Dh; Wed, 14 Apr 2021 21:24:14 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d21so5855818edv.9;
 Wed, 14 Apr 2021 18:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t+clK8haa/jfJkCf2nTPAp3hRgz37oMSnMj5wVYCaGM=;
 b=jJUOlnxZdPUyEFJFrxh1fS7H4Ksp9XtM70g9u2zbA+S3yWlGzgnBKiPfzGHBox/hi2
 YP7LrNdnzAP5o0GK3wHovtNrQqu1nsm5+pzBHr0PB3hlNJ4rGKnYtuzHG8b8f0VIOKWP
 8iLeE0uO1lD5/AjOyN3csfm/+1umR7PJs16YzqFPGCQppGm3zmDTminoC8PxCoymYVSB
 kn+DZlcBPZMsECVFFCk5ASCMIOJJ0kkVb/u7KUk8D7BsxcUKTHronozHY2DpUY559Ymi
 qfxXQrTu3HLq6zo4sExTZhpABzmxZUWrhFVBoSm9Hxs5CrqR3cFfTr5vipsVRS46nxvH
 C5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+clK8haa/jfJkCf2nTPAp3hRgz37oMSnMj5wVYCaGM=;
 b=jIPnnmSV6MyjIDi3a0jAGkeGaBJj3dic/mIzpU9SYo7kCYGo5jtn3fhn+A70Ku5Gny
 zoaV010/zN9yCmL/emVilFIDmpHzFQDTx8YwHGs1ruMp0GX+HV+nzIZpgxMiKJDTiEAY
 iEga93LCmBjtFueD/NTxrhp5aUBzKm3O5K6UkRnWtmMQwAeUfprrXMguQyX2whn0dMfJ
 Y7wOmUejp77kHGH9kSNnWZdLdOOiCYb2ggtaqs+6fk9gMQl/A+cNxzOdEbHUVRJw/xai
 1qzCav3QQmx0ojYrL18JKPcu7cGP/o/sLBNLtPk0mp43BMPqoWjMeMVoB+V4D/98G9qE
 wNmQ==
X-Gm-Message-State: AOAM533ManfwA3f9sVa+XPBr1PxtYbUksTuG9w9mLfqL3KLN8CaAtMVT
 m83/i6lOANkZCTXyD4ePEXAYQ2mqj3nL8/ns7Ds=
X-Google-Smtp-Source: ABdhPJyYz5vPWfDTMfAHZchNsBpJzt1CoAOQWsk7MJUg4Rwdo7Wt4qlsFZs3tbc5PSidgU/xjzBIA+Cn4GqQ+VGNpg8=
X-Received: by 2002:aa7:c694:: with SMTP id n20mr1118920edq.51.1618449847580; 
 Wed, 14 Apr 2021 18:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
In-Reply-To: <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 14 Apr 2021 18:23:56 -0700
Message-ID: <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 12:43 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/14/21 11:03 AM, Max Filippov wrote:
> > On Wed, Apr 14, 2021 at 9:51 AM Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> >> On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
> >>> Did you double-check the xtensa issue?
> >>
> >> Oh, I'm sorry, I completely forgot about that one. I just ran the
> >> test locally, and apparently it fails because of this new assert, so
> >> I'll have to write the 4th patch now. Thanks!
> >
> > Just curious, what xtensa issue?
>
> Returning from xtensa_tr_translate_insn with tb->size == 0.
>
> Basically, dc->base.pc_next needs to be incremented even for illegal
> instructions, preferably by the number of bytes consumed while determining that
> the insn is illegal.

I see a few places where target/xtensa may do that. E.g. it does that on entry
to an exception handler to allow for debugging its first instruction.
No guest code
is consumed to make this decision, would size 1 work in that case?
I'll take a look.

-- 
Thanks.
-- Max

