Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C23A5F28
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:31:57 +0200 (CEST)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiwl-0001t4-Iz
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsiuU-00015a-2x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:29:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsiuQ-0006rO-Ia
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:29:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s15so4653971edt.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5Eux1m4U6N1rCWSI9DedtBXFS45yz+0DQDjZv1ltvU=;
 b=gaJFn0hwtK9Pil4WRDF4bXH4D1qqHe1GcO593MwA4jJk1RcAtPHcCBK6/bPjsktjTC
 9yWGyiydM/2qNFpoRzk7JYhdKcPebdINEK24qUNrPuUefvVeqYVtpEqC7dwNHTNjaYT8
 cPCdAfGN6cWZ4PupnAVDpekzTQ722teijWHnr4vM0ax2iSvshLSoESp45ThTIOpJEfsI
 lWD+6E4+7oWsag/bD5OBK6VnaG6glUr6jnjl3b3i4VO2gYPEBEnNm87ynGaMjcxKgbYV
 njy0uUfbNp8DOVy0jCd+KV2Uruwykimg2TqzmccdoxJHIJMXLNyQH55nsoEvadgXOZ6j
 Kg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5Eux1m4U6N1rCWSI9DedtBXFS45yz+0DQDjZv1ltvU=;
 b=Pz5QaURPnUgyvY6VXnAfM+R/if4SR9CRB6nqu8pS4oP78FmBAMrwC4/y92pYE9rsRh
 Xm7gh2cRFZ9leddDUvYC0YIZierHndBUMyXQ1e4BZsBgBfFyGvD7Rbn63/SInzkL2gFF
 hvhmcGrOty6TYv0of9cMeQrUs6vJjwBAbPwjd6lwLjxPqBZbegdN380wO4TdN03QfPjy
 NvayQIux1KQ/PLaLTpy6KLvrsouDrkQL4Db3gSmRk2YYLOxeQa53RAKquizGbHpfAVOA
 +iJvlbD10yW4gsyi1kubZN8xYeDP8fklaDL5LYY09k66mdBi8fPdVginNWE53EsjCqMe
 V97g==
X-Gm-Message-State: AOAM531OIiKJfDpMvrVLAleO4B4JQDs45iOCfYJhYoGnUe3ERP8ugvqP
 vkNLCj9ne4v8+F7Pvm1Vkl+A7SMgw75Aev46wYaW/w==
X-Google-Smtp-Source: ABdhPJy1MYmgSKjUpfryN6nRRbUxkSevWXvxM0ijk/xuuutENxGUET8to3eE0uc9du1AQ9QQXLCK8EydlS4PgpkG0TI=
X-Received: by 2002:a50:a413:: with SMTP id u19mr15647684edb.251.1623662968451; 
 Mon, 14 Jun 2021 02:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
 <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
 <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org>
In-Reply-To: <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 10:28:53 +0100
Message-ID: <CAFEAcA8Z4wYjPMfs6cZE7EW1NQxgeGcMhJksQBuPB5JTbfJZzQ@mail.gmail.com>
Subject: Re: [PULL 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 02:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/13/21 10:10 AM, Peter Maydell wrote:
> > Also on x86-64 host, this failure in check-tcg:
> >
> > make[2]: Leaving directory
> > '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> > make[2]: Entering directory
> > '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> > timeout --foreground 60
> > /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-hppa
> >   signals >  signals.out
> > timeout: the monitored command dumped core
> > Illegal instruction
> > ../Makefile.target:156: recipe for target 'run-signals' failed
> > make[2]: *** [run-signals] Error 132
> > make[2]: Leaving directory
> > '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
> > /home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:102:
> > recipe for target 'run-guest-tests' failed
> >
> > but I think this is a pre-existing intermittent.
>
> Interesting.  I've never seen this one before.
> Do you recall if this is only intermittent with -static?

I only run check-tcg on my static build, so I don't know if that's
a requirement to see the failure. I think I may have also seen it
on the gitlab runs as an intermittent.

-- PMM

