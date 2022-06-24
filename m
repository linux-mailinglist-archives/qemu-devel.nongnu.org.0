Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1863559D80
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:40:48 +0200 (CEST)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lQN-0004IO-Qk
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lGt-00021P-H2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:31:00 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lGr-00079A-Ro
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:30:59 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3176d94c236so28470007b3.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cmp6pTyRdEQS9MnZpBdd6ok0105PVmUMmDnaaYrip7M=;
 b=k9IDKPnZnWY2XDAlp4gDORJQxtMjKBzZRLFHnZb9WNpucGQaPMUsw08fJC+xFSyvoE
 DKtjHLP+tJu2F0/fZlPB9QK0t1z/NS2LSzjsDFFsRDzDg8pzHnKaBXyOw4138TAMK9tf
 zcbL3tqkfIfeuEBS4inHerVU8HhvWp02nw7J317eBiriAW8gvWWfqYAi2IIWdMMWVdVW
 cVTq5Y0YUavErA3cdr5aaMZww0AjEiJTVg1A7vTvKeWxdCT8gSlOgl/UYUuNfn1OLI4b
 Zy63/MPW53jLLi7pILixis3Vi0/m8WqmDz4ZP/gFa3E8MI1X4yW8ty6PMbQYm/jIe5nV
 mMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cmp6pTyRdEQS9MnZpBdd6ok0105PVmUMmDnaaYrip7M=;
 b=o4K9N451p+sRzgDT9kFF9bohwN52cVNRc3vSHiX8pGNpP3Aax7UwgctAjV/WuZDBR6
 f+4psG7Tk6XmYQlXVtJK2IPEPv8jSxEy6rlKEAq6aVqOEYM86P5EEW93QPmEmuEnn+i7
 fxKI+4wq5nB5jzSohYr2ZAqKjj7IkOBOcM/uyHmMfPlfkq/PCaXtJPD1bdFUevJbLM43
 zG6Zr9KyHJ/AHbhZznmZjQlqVtp1iCmIJcUk2oWAA0pj3rKGeR9N+BeHl6R3Lf0LwN7p
 LRwbIeVX5OSK6SctH7vJ9h7AnYoDszasROWep4X3tL7DrhCrhSEUNcd8nlocQEOh9/xp
 /WiQ==
X-Gm-Message-State: AJIora8hkMVzSYtjnRqu9n+xw1fMSqVkxPhJ8ODf+gDchXNK3ALxOyGl
 0WCkJs/ImY5N74l+R2S5JYZCh1XNmhGD3iI/Yjpdzg==
X-Google-Smtp-Source: AGRyM1snc8xIuAKlWCmP5Dgu9QjPAh1/fO1PJD81THm9poY0iQz20saAaVpIGei/QDJhRxKjDdcqZkCEXbtRoxZcs1E=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr17181574ywg.329.1656084656515; Fri, 24
 Jun 2022 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:30:18 +0100
Message-ID: <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Jun 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This new behaviour is in the ARM pseudocode function
> AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
> via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
> the trap would be delivered is in AArch64 mode.
>
> Given that ARMv9 drops support for AArch32 outside EL0,
> the trap EL detection ought to be trivially true, but
> the pseudocode still contains a number of conditions,
> and QEMU has not yet committed to dropping A32 support
> for EL[12] when v9 features are present.
>
> Since the computation of SME_TRAP_SIMD is necessarily
> different for the two modes, we might as well preserve
> bits within TBFLAG_ANY and allocate separate bits within
> TBFLAG_A32 and TBFLAG_A64 instead.

> +# These patterns are taken from Appendix E1.1 of DDI0616 A.a,
> +# Arm Architecture Reference Manual Supplement,
> +# The Scalable Matrix Extension (SME), for Armv9-A

So the thing that worries me about structuring this this way
is that the SME supplement appendix includes this caution:

# The instruction encoding tables in this section [...] will
# require correction if subsequent versions of the A64 ISA
# add new instructions which overlap with these encodings.

My guess (based on how the H.a Arm ARM has incorporated
SME) is that these tables aren't going to be included
in the Arm ARM and updated going forward. Instead the
behaviour will be documented based on whether (existing
and new) instructions call CheckNonStreamingSVEEnabled()
or CheckSVEEnabled() in their pseudocode.

So I'm a bit uncertain about how awkward it's going to be
in future to maintain this transliteration of the SME
supplement tables into decodetree: we might find that
we have to look at new instructions and kind of
reverse-engineer back out any required changes to the
tables here, rather than simply "write the trans_ function
for the new insn, looking at the pseudocode to see which
_access_check() function it should be calling"...

thanks
-- PMM

