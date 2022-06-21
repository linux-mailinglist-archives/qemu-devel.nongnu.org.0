Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4F553547
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:10:51 +0200 (CEST)
Received: from localhost ([::1]:36762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fWk-0006Hl-2Y
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fTf-00035i-J1
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:07:39 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fTd-0002w7-OA
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:07:39 -0400
Received: by mail-yb1-xb31.google.com with SMTP id t1so24964954ybd.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bh/+VgyEnBAWXbPoCZemyEMFawVlEjneAZ1GLT2QwAc=;
 b=gP2QiuZEld2I7sJJSqftPluo42pEYx4HCOLX9OGrOQsvdJhNIZEPFnVgGeJSRC7KHP
 XisHx25p6J5buEmHaH4eAsA1fI7PJQfP4Rtzp+jGei6aU1+x4IjuEl/TcNYUbo1p0RXM
 ol1dhBBfWXnru7luoCUZQk5TZyWMhG3LMxJ7L4pzbnbeyYHygTmWUUHv2azBPgcR977y
 j0cMx6eYyC8FkZEBnEYe7Hudi4sLjc08ktIc/EM3njn4SeGa8BgHoMnX4HOtJbXvItEh
 KlxSiOZu6CvEIIyIfFOiEyb3hbXZ4/ebWZPvGU9VSaw2kqedQFVSw/nrWj0UDFRyXSIn
 ZLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bh/+VgyEnBAWXbPoCZemyEMFawVlEjneAZ1GLT2QwAc=;
 b=SyVbVCSS0flCuGHmzUt6hzlqLXZF5RJkSaWXDvm9IQMvcr3ZORZ9JVzXntaLqqp2Ux
 UzYYPnHT9w+gNCDtf5j+vtXp8Rs6IhHJr/u76e6ah24i3fXoZYCtsDVjhkA1MNmzP5/S
 k55N1HH9t5Q9yGBspEvl3Bs7b8aWUlH+q7vg0dJO6oEZUmQYpCYSJA99I7HEe7aQskfV
 lLQbcDAFzqf7Bt9U8uE4wC/E5SkcYc0x1+SyGcMjz+GfI2af1PkcZ2ibYUkdmwyxJ6k7
 zH87228WFqcieBfn5RsrSKO/w1f9AOoSHQ93eJyiNyFuvxQOuzigsYUqh1a/9dgaewwZ
 +RHg==
X-Gm-Message-State: AJIora+3OSRMaT+cCWWy2zfOxC7RHafwhhme3y0TN74WBU9AoQekifgn
 OR6sOE/ZPhAQ6bQIp9qSJICDzqnVcBLuKXxuTaN2Ow==
X-Google-Smtp-Source: AGRyM1sjyEU9DCWKDYpzFAuuXwSvs6TM6+iu9mFVSpoZ3bJXP/4pXuNzH340lwrwNo2nKzN5YK0rYo+FC+CujiZsi0s=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr13587391ybr.39.1655824052548; Tue, 21
 Jun 2022 08:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220615163846.313229-1-richard.henderson@linaro.org>
 <CAFEAcA9FvaJKD4=jBuWijd3ym1+aj=RJfr=7mugrFTLMCEfq+A@mail.gmail.com>
 <fa9f1337-e294-524c-5988-188b503171fc@linaro.org>
In-Reply-To: <fa9f1337-e294-524c-5988-188b503171fc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:06:55 +0100
Message-ID: <CAFEAcA_ndXgKWCTfMDxZoEDV43xBZ_SL4AQwqzCSukhwvEctbw@mail.gmail.com>
Subject: Re: [PATCH] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Mon, 20 Jun 2022 at 17:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/20/22 05:52, Peter Maydell wrote:
> > On Wed, 15 Jun 2022 at 17:43, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> The bug is an uninitialized memory read, along the translate_fail
> >> path, which results in garbage being read from iotlb_to_section,
> >> which can lead to a crash in io_readx/io_writex.
> >>
> >> The bug may be fixed by writing any value with zero
> >> in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
> >> the xlat'ed address returns io_mem_unassigned, as desired by the
> >> translate_fail path.
> >>
> >> It is most useful to record the original physical page address,
> >> which will eventually be logged by memory_region_access_valid
> >> when the access is rejected by unassigned_mem_accepts.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   softmmu/physmem.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 657841eed0..fb0f0709b5 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -681,6 +681,9 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> >>       AddressSpaceDispatch *d =
> >>           qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
> >>
> >> +    /* Record the original phys page for use by the translate_fail path. */
> >> +    *xlat = addr;
> >
> > There's no doc comment for address_space_translate_for_iotlb(),
> > so there's nothing that says explicitly that addr is obliged
> > to be page aligned, although it happens that its only caller
> > does pass a page-aligned address. Were we already implicitly
> > requiring a page-aligned address here, or does not masking
> > addr before assigning to *xlat impose a new requirement ?
>
> I have no idea.  The whole lookup process is both undocumented and twistedly complex.  I'm
> willing to add an extra masking operation here, if it seems necessary?

I think we should do one of:
 * document that we assume the address is page-aligned
 * assert that the address is page-aligned
 * mask to force it to page-alignedness

but I much don't care which one of those we do. Maybe we should
assert((*xlat & ~TARGET_PAGE_MASK) == 0) at the translate_fail
label, with a suitable comment ?

thanks
-- PMM

