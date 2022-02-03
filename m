Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6964A82C0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:54:55 +0100 (CET)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZlO-0005oi-KY
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFZcc-0005F0-Dw
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:45:52 -0500
Received: from [2a00:1450:4864:20::429] (port=44775
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFZcX-0002fi-KI
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:45:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id k18so4135378wrg.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BCn/bBH/9rDiq4cqAadL0VdAEadNPEIEhhF2HZJ4TO0=;
 b=rhgLG1btCNuXGP2638V46xfUaCF3dmy7TCcoikko3FBxrFRz9xUpUxVLFxuHwtunnp
 5+ZaCT/x2gE98Fu8RyfMaNKuA+NaSyV7DIpP+TiKT8KHc6e7rnf06TOgS6X4QW4iXSmZ
 GyQBPf2DHRuCRZnJnS2//uFrxN2WCfR09XmmJWw5aK3jBXQZfvMQoUD3mey1v/ZqvntZ
 v1RHiXHyph+7InFrSl7ZEevXFMxH96E533sp3uOaoDigjEut0E5GIQFjLDaW9fjAQhDw
 e3+RB4hkkDHpkbciLgzO/y0JKrmRwSajP67QlFgxqfr3RTVt7PQKkDyqDwxd1JLfRNHO
 j/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCn/bBH/9rDiq4cqAadL0VdAEadNPEIEhhF2HZJ4TO0=;
 b=W167cvWVeLO3RdkF/y2Cu1meQELJf2Yjrce4Tw3jRs8OFAs+nix6czXr8cV1NqNlsU
 jJ1XYHvZwQD9CdteEqZwBtAdcWx9z/bvvA324k/IgkpFjLnAlUbqLzt8FUcigUdW+Zeg
 KfPr69d6R8Pqam9Wr/UrA4T1D3fTYwHrxWIHXQHvz6xWL2cGtXy6Sh/Hvs5Gc+QTd4M5
 YV42Sj7nXCwOvAxBZdqADoFVcPgxTzeSELlJ3dqJxTEzuF96tMe1LSYxk4P9deJ7NQVF
 K+ML2ad53nnFp2/rEs9werQr0m6KmZdMrLv9w4YW9F0/CTzZeKXk57Zo372ahlfv7roN
 C8kw==
X-Gm-Message-State: AOAM532W/fWba7/ob3fsOzu5vl4KCozICoIBdzv1oYLy7byYkevF3Gq5
 grF5coxqs1+DZixEV+31Hm4dbT1aDKSgCo14DRN86Q==
X-Google-Smtp-Source: ABdhPJzIETsTVyzHDV4S/CheMuhDu5lAV+4M5e/nnf/uX/Q7gRuTRfn/C2ACmiChu/1epuJ2LUFrATp+3KvNAMWdTKs=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr29663952wrz.2.1643885131879; 
 Thu, 03 Feb 2022 02:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org>
 <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
In-Reply-To: <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 10:45:20 +0000
Message-ID: <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 03:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/2/22 06:32, Peter Maydell wrote:
> > In get_ite() and update_ite() we work with a 12-byte in-guest-memory
> > table entry, which we intend to handle as an 8-byte value followed by
> > a 4-byte value.  Unfortunately the calculation of the address of the
> > 4-byte value is wrong, because we write it as:
> >
> >   table_base_address + (index * entrysize) + 4
> > (obfuscated by the way the expression has been written)
> >
> > when it should be + 8.  This bug meant that we overwrote the top
> > bytes of the 8-byte value with the 4-byte value.  There are no
> > guest-visible effects because the top half of the 8-byte value
> > contains only the doorbell interrupt field, which is used only in
> > GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
> > cancel each other out.
> >
> > We can't simply change the calculation, because this would break
> > migration of a (TCG) guest from the old version of QEMU which had
> > in-guest-memory interrupt tables written using the buggy version of
> > update_ite().  We must also at the same time change the layout of the
> > fields within the ITE_L and ITE_H values so that the in-memory
> > locations of the fields we care about (VALID, INTTYPE, INTID and
> > ICID) stay the same.

> This is confusing: 5-3 is titled "example of the number of bits that might be stored in an
> ITE"?  Surely there must be a true architected format for this table, the one real
> hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this
> properly.

No, the ITE format is implementation-defined, like that of the other
in-guest-memory tables the ITS uses. It's UNPREDICTABLE for a guest
to try to directly access the tables in memory -- they are only ever
written or read by the ITS itself in response to incoming commands,
so it's not a problem for the format in memory to be impdef. This
flexibility in the spec allows implementations to minimize the size
of their data tables based on how large an ID size they support and
other potentially-configurable parameters. For instance if you look
at the values for the GITS_BASER* for the GIC-700 in its TRM you
can see that its Collection Table entry size is only 2 bytes, since
it uses the "rdbase is a CPU number" format; an ITS that used the
"rdbase is a physical address" implementation choice would need
more bytes there. (QEMU also uses "rdbase is a CPU number", but
we have rather profligately opted to use 8 bytes per collection
table entry.)

thanks
-- PMM

