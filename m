Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1326CCA00
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phE2U-00032f-2r; Tue, 28 Mar 2023 14:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE2Q-0002v8-9z
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:27:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE2O-0002kG-Pz
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:27:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t10so53311329edd.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680028035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TYguWfh+37fhYDpY7uw0msis6sE1Qef/hZCA1oZumgk=;
 b=CrjiLkyMUPJ//A69ZIwZ8OjrhrdTQvSq5FS1VgsvYGbD3VWeicOUp+891h7zIjCU4r
 uzmSn2HR4EJVAzi2LOkFnsOtvXr1SCAC27XS5puOBQDDobEOdh83OAFZo0489b7UgUCF
 qu2Ny5J/kglC8Z9z0oSqMz4E1Of1swjlSNdi7JgdpupIvdWlMWoGS2h8lOtX6Me4WkNk
 It1NHQrilWBFiwK2GbzEG0iOKybqNoxA145zyHrdHlONKGnlHjMPA7wd5tEZNS5DmElU
 tbe81B5I+5UU6DFNb83hgBB6HOg9wBtkSxOfmeosYcCYP1GeelRu7HMxE71BUk9fxpNA
 +8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680028035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYguWfh+37fhYDpY7uw0msis6sE1Qef/hZCA1oZumgk=;
 b=LGQqforbO73Q+b9n94vI2JXw/1P7mwqXnvce2fCPWtPWTWztT6mpj717v7Xx0fU0YV
 gqFApoBSfkK1r3XWFef8rhPQNwNRUkHZb57S/rkG5tpC/HIUsgOC6Zf0nwvbMOgRl3PO
 rf++XDm7o0l5qNl//c67KA8XUGQ82L18GPc91mKEGpkmggH/gZVMGIWo3oRbkhveK9Tf
 tOK3jFVqEoNNZv3esyEJXHFhARr6blIGmXQb9Mfx9rpcX5WvjiwW9dhKNMviBSJ68jCI
 +zP+RKJuiO5GqCRARGwKHW5wWNT/Kx0GXWVb1MAQiGWePbEh6OhexYa5w3yKY+QCeEn+
 Uqbw==
X-Gm-Message-State: AAQBX9dI9Rbz3BdRliQVm4tPjm+y0R6uriUC4/katwAW3+dabl/kiiB0
 9p5xjvsO6iy84gRa0PK//iTuafPAc+xsCmu7FnjMyw==
X-Google-Smtp-Source: AKy350ZJHHY+yy0T2QcKpnr5cFHKUzTCaeYhimQbJWri5ysmeBLw7SJqDrG7D/L64TtZJ00EwIbU0swTucOLcJ/YBUU=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr8670975ejt.6.1680028035009; Tue, 28 Mar
 2023 11:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
In-Reply-To: <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 19:27:04 +0100
Message-ID: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 28 Mar 2023 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/28/23 09:28, Peter Maydell wrote:
> > +            /*
> > +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
> > +             * but since we're conditionally branching over it, we want
> > +             * to retain the existing value.
> > +             */
> > +            old_is_jmp = s->base.is_jmp;
> >               gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
> > +            s->base.is_jmp = old_is_jmp;
>
> A third solution is to simply set is_jmp = DISAS_NEXT here.

I wasn't confident enough that the previous is_jmp had
to be DISAS_NEXT to do that -- there are a lot of
different values and it's not clear to me which are ones you
might find lying around in is_jmp at the start of an insn.

I like the set_disas_label() idea, but maybe for 8.1 at this
point...

thanks
-- PMM

