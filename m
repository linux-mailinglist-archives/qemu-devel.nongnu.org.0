Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC593A5FEE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:21:50 +0200 (CEST)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjj3-0005AE-B1
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsjhd-0004CV-Rh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:20:21 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsjhc-0002ge-3d
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:20:21 -0400
Received: by mail-ed1-x532.google.com with SMTP id i13so45771851edb.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLVP2KybRdHHflWmeeMgVJ9wHpwcSrblUuI8dPa8KrY=;
 b=Bu7gLVnPMtVPWWeotRzgGisuRuw3P381yNPImB4vAOip5tlFv7wwUJ8GPcr6PWwFsK
 j1aaFWMQnIGCF8KacKp5K9+4N9LhYh6SASm6A4ijb208300H1oxKqPVZMm4ZOjXlgBBv
 3topFwRVri4gQ0yF1XV6ut+OMHZzyWCMfGym3Cl+me+2KnUxNp0rt3P4ATGnwh/wkm6B
 5u+XcXAcxJ+hyh3PA9Qs8LwLcA6BhU7vqjvJ5hk2/pIBd1yVs9vEHrXZ2AbOQuH0bEIF
 gFSO23otdoDzXo6E6bA7F6vNBDqrn1zEJbDwReuyzawlsYjXpVmKeisUfQIuBpWRJFZX
 EoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLVP2KybRdHHflWmeeMgVJ9wHpwcSrblUuI8dPa8KrY=;
 b=C6rCoI/6z9arxF5t2fASPZMKsPDFUcpYjT0gf9Pi7/1/T8Xr/RuBAoFQM+Z48n9kL4
 NV9OKS1ZiDRoi1csbsqP67+xpCoztzqJJrarX4k+fFdtapFLtqA6CEU8YmT+sAAdkkXJ
 MxXQp5FPXEKcT/WMEjbPjJW8Ia0ASv+mbItzFSOVw19ckBOkZWJllkD8zs2lsaYWJc6h
 8+1y5BhWEHKo6eOhyJbLh6lcCnHgqNqAHYofNlu+akI/WlcJgG62uHfJaIRozaXQhbPK
 Y+KNe8GjrpGULuZy44pP/Ly6JlBy4f9hd6gxrTkC8E6UW6iADzPYbTx6mRgHLJgHVZEd
 qIjQ==
X-Gm-Message-State: AOAM532Q16aeUUTgGhL2yRNFvFPj7JsKMji8hz1yx5tl2YTbwBsRbVql
 NxyR1p7nsplrf7CB04CP4d45FYzJC9RYkrrSSpcSLw==
X-Google-Smtp-Source: ABdhPJxrt5UknhDb6qs542Y3D3g1jjNNP4msDrnz4uEGvRKt4pss85KQ02MoUG1Vut3+FWg6OYEEwByW6Ci1wTyuZYo=
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr15992050edc.44.1623666018404; 
 Mon, 14 Jun 2021 03:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-33-peter.maydell@linaro.org>
 <ff13c13a-0014-4930-5a8f-813818d6fcf1@linaro.org>
In-Reply-To: <ff13c13a-0014-4930-5a8f-813818d6fcf1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 11:19:43 +0100
Message-ID: <CAFEAcA9UqJpBU9crxWFQg-8U4XtnVK4tgAGR-mhUZyhiLN6ARg@mail.gmail.com>
Subject: Re: [PATCH 32/55] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +#define DO_LDAVH(OP, ESIZE, TYPE, H, XCHG, EVENACC, ODDACC, TO128)      \
> > +    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
> > +                                    void *vm, uint64_t a)               \
> > +    {                                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned e;                                                     \
> > +        TYPE *n = vn, *m = vm;                                          \
> > +        Int128 acc = TO128(a);                                          \
>
> This seems to miss the << 8.

Oops, yes it does.

> Which suggests that the whole thing can be done without Int128:
>
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> > +            if (mask & 1) {                                             \
> > +                if (e & 1) {                                            \
> > +                    acc = ODDACC(acc, TO128(n[H(e - 1 * XCHG)] * m[H(e)])); \
>
>    tmp = n * m;
>    tmp = (tmp >> 8) + ((tmp >> 7) & 1);
>    acc ODDACC tmp;

I'm not sure about this suggestion though. It throws away all
of the bottom 7 bits of the product, but because we're iterating through
this 4 times and adding (potentially) four of these products together,
those bottom 7 bits in the 4 products might be able to add together
to become significant enough to affect the final result.

-- PMM

