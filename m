Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AF93AB52F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:50:35 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltsPi-0000c4-Kr
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltsNE-0005Sj-DR
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:48:00 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltsNC-000124-NB
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:48:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t7so4098257edd.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 06:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pg/2E0TUjGXLACtewWDG7dJgOojq+eLznTHhtoCT9Rc=;
 b=q32JsHCO6KJGfShO655DMzSfGuLc10HjA4UUBeogM/TeJxfiyagvGXyEvakQHRdQQQ
 djdzpoIaJKbQ4qFibk1lMiThwXhGUCuuJojuo76UQYToCoJBsGmPqwrSu8lf5wjqDC/D
 zaslXloihF3aWoQtF3RJlLHAzCFTyHQIuEDWT/pthX8r4mHti87vcclQEzgvvPmsWm8k
 IdIv0BrvhMGSvFipHn1HBke+uyztF4IK9+wlQJVZ7TxYXpBeVPsVv3c8mSLaaOWLnqYo
 94//6DmRHbf18lsWJekgqHY3LO+ioNpgFqXPTbXJ76HGg1w/pnRNsrvo8Jnpy4I2ZEfI
 QiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pg/2E0TUjGXLACtewWDG7dJgOojq+eLznTHhtoCT9Rc=;
 b=GsivaEN1RiZRWIU0FswPeGoLudPRBRfQPSftZeTJ3F/4pLysQcxeARj/ALtkueR+yU
 osLkAw0GwpiQvaB1Y5KwQrcW8Nn7NXzlFT8Gk6g2dfyCeMX7Gy8RwFxNFjmFwAut+Ntc
 Aktqjdo4WproadKv2h499YF5LSbZATMYeTMeAuQ8ks+HNiV8LTnyugnMjZTEj5aiU8Rs
 8dkh8CnOiS7L3wtP1//NhiHF/1jjcuuGPQgVxFRDzxp9aRdum8m4/vPQ+CbCfZ1WcOEq
 rPHnF1xzoAgUShRtqJSoUHp+iDxEDKV7Beda6bqW9mEjl/YMiP86deSlpSPiFQsIcnXW
 QjDQ==
X-Gm-Message-State: AOAM532gu2+Xb/ycypnqmsSoZYOsky5Quxkujnc948uDdMCeNueRhOzp
 /lfi05ZAz0mZW4cS4MiFNPbspeng/CDmDwuVJtpkgQ==
X-Google-Smtp-Source: ABdhPJxxwmpXLccpL4ypNSSFXwyHdpe/xRDLHWKZ98XZuCq4xcqU2p7vOhrQ3On0KB0W1s1Jvs4xF1f/uCIAJiFxqGE=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6541051edt.100.1623937676555; 
 Thu, 17 Jun 2021 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-2-peter.maydell@linaro.org>
 <8918d342-4e17-e5f0-e18b-ae39b17cffac@suse.de>
In-Reply-To: <8918d342-4e17-e5f0-e18b-ae39b17cffac@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 14:47:21 +0100
Message-ID: <CAFEAcA_V_=-q1bjVEu4mX-NGBgH=Bq3GdDAcBxEFQ8gJHW9dLA@mail.gmail.com>
Subject: Re: [PATCH v3 01/44] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Liang Yan <lyan@suse.com>, Alex Bennee <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 14:30, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 6/17/21 2:15 PM, Peter Maydell wrote:
> > Implement the forms of the MVE VLDR and VSTR insns which perform
> > non-widening loads of bytes, halfwords or words from memory into
> > vector elements of the same width (encodings T5, T6, T7).
>
> This is if I understand correctly, M-Profile only, and thus TCG-only right?

Yes.

> >
> > (At the moment we know for MVE and M-profile in general that
> > vfp_access_check() can never return false, but we include the
> > conventional return-true-on-failure check for consistency
> > with non-M-profile translation code.)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > +/* Values for M-profile PSR.ECI for MVE insns */
> > +enum MVEECIState {
> > +    ECI_NONE = 0, /* No completed beats */
> > +    ECI_A0 = 1, /* Completed: A0 */
> > +    ECI_A0A1 = 2, /* Completed: A0, A1 */
> > +    /* 3 is reserved */
> > +    ECI_A0A1A2 = 4, /* Completed: A0, A1, A2 */
> > +    ECI_A0A1A2B0 = 5, /* Completed: A0, A1, A2, B0 */
> > +    /* All other values reserved */
> > +};
> > +
>
> I wonder if this should be in a MVE-specific header,

For an enum definition, it doesn't seem worthwhile. internals.h
is generally for "stuff target/arm wants that other parts of the
system don't need".

> and I also wonder, when looking at code using things like ECI_A0,
>
> what about MVE_ECI_NONE , MVE_ECI_A0, ... - would help the reader connect code containing these enums with the MVE feature?

You'll only see them if you're looking at MVE code in the first place...

thanks
-- PMM

