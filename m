Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E72623016
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:23:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnr4-0001p4-41; Wed, 09 Nov 2022 11:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnr0-0001k2-UJ
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:23:06 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnqu-0001hJ-TE
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:23:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so2376545pjd.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GjpFdsiYxrpzhBFhzJHPHA3kUlnfz2b0p8I7aiWm8Kk=;
 b=IhmLoQ4b/j8bw0+aXCId5ZGcGPTW/AwTCKiHVjyTn2rrxFl4zwa9mXZebMXPzoyItE
 4jxh9wS7ONxdOod/DPSwabT5N+jIJXWe4fb/oJyI64wQWowRWML85gcdF1Sinkl0/rSq
 VQfrDoJR7SlDt3VGfoUoviXYzciD5vA+x8p7l2wlXAtn89WgMP7ywSkUkPDPT9yst4WI
 chu3QkP+/oAmkrcyVeum5icjGlxjvRPFzjjVZd//aLH96xkmBlFqZwUwIeNbe4OMGnTJ
 GSzxzESsceAYpHNbmCmLk4P8bQsGbJGp90WYnI1k/dCep+7tA+VSNNaEk1CS9q4Hr4sk
 INzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GjpFdsiYxrpzhBFhzJHPHA3kUlnfz2b0p8I7aiWm8Kk=;
 b=eduZepjkPQ4GgQUEbIua+mJ8y1qVtcFn4Px86Z2t+lluXyrloAZeR7bKTbVSC4N3OA
 Gf9VoT9aDhCxZufAf0o5/UoCl1l6FuUHCGtFLD6cooHxWK6xNcO31f+lj07N4Qj6ARj0
 EpbUq9J+1SJt7Q7aDVmc+bGZdsw03uCXDbD8+62uJyULOsh92EaENzHHp0tfuyDa45CN
 Yj4PX0/BTbhv3eUcUWvITJExoSgeI/jl+IoX0rq3/NHBLNpAShFu6qe16NklTOrE8EJO
 3RT0f8uKmF01n7rnEVw2S1m0G2qTZ5SEqRkGKl4WwVIfUlR34+PdamKc6fjYReQwDTnE
 insw==
X-Gm-Message-State: ACrzQf2ik6jfs3J/1k6trcuvApdE2AfskUyuxup+Rq5mmEeZp17/9xBI
 YQGNxvIW2Jf8F35IM2nsSbvb8MRQf8FAFVE2hcB/dg==
X-Google-Smtp-Source: AMsMyM6oSO60sBwPFRdkDmeDcg9bupGejG/PnPaJ9RmncwsWoqBGZpV/tVWVzwwoMSXtLFbbgCHhFtgamlyqOYq2/1w=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr61487265plb.60.1668010977431; Wed, 09
 Nov 2022 08:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221108162324.23010-1-cfontana@suse.de>
 <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
 <38bf7a34-826c-26d3-5978-21da1d37bdef@suse.de>
 <CAARzgwwgMkGiu_NTY1O3j75cJdObjLdWwpt8KqLYSJOkMwG20Q@mail.gmail.com>
In-Reply-To: <CAARzgwwgMkGiu_NTY1O3j75cJdObjLdWwpt8KqLYSJOkMwG20Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 16:22:45 +0000
Message-ID: <CAFEAcA_sZ8ym0tOuDt3nuUH8UhBca3UUkO0N3OmFA6=xsdDdAw@mail.gmail.com>
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
To: Ani Sinha <ani@anisinha.ca>
Cc: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 9 Nov 2022 at 16:21, Ani Sinha <ani@anisinha.ca> wrote:
>
> On Wed, Nov 9, 2022 at 6:09 PM Claudio Fontana <cfontana@suse.de> wrote:
> >
> > On 11/9/22 09:04, Gerd Hoffmann wrote:
> >
> >
> > Thanks Gerd,
> >
> > I think at least for our packaging purposes we'd rather have it as a configure time option,
> > so as to not put functionality in the hands of our users that can potentially lock the guest.
> >
> > Is someone going to queue this, where?
>
> Unfortunately we are on a hard code freeze at this time for the next
> release. It might be better if you can resend the patch again to
> remind someone to queue this up once the window opens again after the
> release (mid december at the latest).

We are in hard freeze, but that just means "no new features".
This patch is fixing, or at least working around, a bug (i.e. that
QEMU can hang), so it's OK to go in during freeze, assuming the
usual code review etc.

thanks
-- PMM

