Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72083CDBA9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:30:48 +0200 (CEST)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VEF-0008V6-NF
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5VCg-0007dn-Uq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:29:10 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5VCf-0008Ha-HC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:29:10 -0400
Received: by mail-ej1-x633.google.com with SMTP id nd37so29386523ejc.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+EUD+jkGMlz9G2KAc85rFEOmUwo3IRiFL7mZwVnLzQ=;
 b=RzLKDyEy3g17YBG3AZqpJfOf8fuFy15iewV+xQni/w4SkjMlvTS7oAtCTedKCMaACn
 a3D66Sc8zfyvUBbABWAljzN6ei99dOBOQ7XmD53oCJm1RCeRQDPM+Ug4dcTHgqiSKOly
 hCR44IKOHmL6JtOl3JwyxEOu7PS94UbLvfQSIAMoNb8pQbyNFmbBYXgnASZWjXMUoOdS
 PT2nys9ap1ciwUxETBR2WLamE589QryTuFw1oYsaelPAsl1bElPADTV1O8eUtVIvTuYu
 ty7abbnlXEhhI4JibAGKg6dGWeFcmVPuPcCZWIMNF7BsO8AQbtecEyR3GR81b14XFr6p
 66qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+EUD+jkGMlz9G2KAc85rFEOmUwo3IRiFL7mZwVnLzQ=;
 b=X3psFS4K9FZlIzhRQBW0m+iWQaPXoBpGANbmrI95oDWxSROi9TZ0TDu+0Nu8rogm80
 WktuVZtF7G4aMtPlLNgu7h/9Rtbte8sbsGUfhWri8h6nIST1+TRRzq7GIMQ0jKodxNW7
 ny1Q1IZe9HuYBoSkGSoxWS1y39r5xi3iawR8tRDWBuqq4vHmXQEkAf5089/RfDd+6WFE
 Mt9pdp8BTgPy8HZ3gSZyzB6+3WekUvhonZdm/qqA8nZiSKlgQj0CsLtl1/7BYn9IR9tI
 9RSwRh79g/FhUZ7+B7a/jmkXiF2AYdYik+IeH9KMSznn+yyYvIWtE7dk3JnO4ZpPbyxQ
 i1rQ==
X-Gm-Message-State: AOAM5312mJb+rOqeDlgALYAokbbwV+a3wG8HhG5kobwhZQxZofSZ9OzR
 o/f/QGonb3cHIhrN6yKb22tCA+Zsnwc97ukyeAtvVg==
X-Google-Smtp-Source: ABdhPJw5BNioTGG5t2A69eCOhYVNv4dKSea/MlyGI1XbN+BCyNY+K5NvNMDq3pNqRTZjWPVz2ZHojXNhS9lKA0oXz3Q=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr28317714ejd.250.1626708547931; 
 Mon, 19 Jul 2021 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
 <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
In-Reply-To: <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 16:28:27 +0100
Message-ID: <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 17 Jul 2021 at 21:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +/* Max and min of absolute values */
> > +static int64_t do_maxa(int64_t n, int64_t m)
> > +{
> > +    if (n < 0) {
> > +        n = -n;
> > +    }
> > +    if (m < 0) {
> > +        m = -m;
> > +    }
> > +    return MAX(n, m);
> > +}
>
> This doesn't look quite right.  The n operand is extracted unsigned, and only the m
> operand is subjected to ABS.

Yes, you're right (this patch does always extract ra (here n)
unsigned, so the only case where it makes a difference is
VMINAV when the input ra is negative). I noticed this wrinkle
when implementing the FP variant of this insn, but missed it here.

-- PMM

