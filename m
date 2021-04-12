Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF235BFA4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:11:41 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsbc-0005fM-Br
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVsYz-0004cy-77
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:08:57 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVsYj-0001X2-7F
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:08:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id l4so18983512ejc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 02:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HkL117L0NGX6ld7vF/27lucS+P6ofJVh50IK/9dVZXg=;
 b=eXjMVVuYHQbvz28PTDJbdHk4axbRiQyc1mu+UL4fxTMGZ7f1CrGHdxoVG7dPv21u10
 XFW2dgK4UDy93LdwTaKJxh7I3oY/EkVc4+eNhXtjvwV8WaqK1QmJlL1Kqyqo9zXrendn
 MygPYsQZl93nSsFSXez4uC+rIYmMXV3F51hAona1mdp4k8noQGKs5SBBtopV+jmMXB/L
 oc5bVUY8SyQlrcYsPLxnEOtYawayXB1+wWR3mNycsSyuF20sjs2gK4aNxtOoJxI1eMqR
 cqMv/59qF4ugzhr0ctc/+GDIuerUdHKfntY0QCVdRLt1COfRy4BefWXGfCTPIhQM0FyX
 srcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HkL117L0NGX6ld7vF/27lucS+P6ofJVh50IK/9dVZXg=;
 b=W7DIB+pk7V6MEwXvo8HaPui84z4gl3d5vqcLlq7fsctheYz2z+nH5B9rEEnlZEXkTa
 qOXP/LtF/x7aOAvPPLQ6RQeQCbCypjtTIjDT70L5Xss3iBepKfQ+5bwZ/vMnIlymeVox
 LaIDarbYYmkkIL2cgU6ex6c4qkTxPoT95MkQ2hx9Tt52iX1i2xCQkUDHmsGv8jh39Pua
 O04ADEarE3Qz2Vohk+hLrpd634J1Xs2U0tvk5vZZvIrx0MB1NQLufQs0WDM+V1Zei9gf
 TzoHFm9DOvPAAhn7T73DRNteK/FlrCT0U3hCDQ8jpXxYtk+KPIgOCiT26jEjeZmZYg4E
 +vHg==
X-Gm-Message-State: AOAM531z7HfmHOabIRedFl/VUboaeXCbl2UMVVJegIuf8/ZcetbI35v4
 pgja7ISIlUcvBXSRBk9uDUSJHJ0RLIK+2j8bOGAC2w==
X-Google-Smtp-Source: ABdhPJxtZ2OWrAp20lT9cXhhGdBrO7E3xfegzrKgmu7/iA+gYaH7QMLu42yi4trTjglsI+TzsmZMGhuLAz7lDHkYIaQ=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr26216693ejh.4.1618218518196; 
 Mon, 12 Apr 2021 02:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
 <YFnjLbU9+itpbvsf@work-vm>
 <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
 <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
 <CAK4993iPwu2ESggMx05C0USrnSigHJq=-iP=BU-FhDXDcRH5gw@mail.gmail.com>
 <a57eed31-78c3-8ea5-579a-cb4edd1afbd3@linaro.org>
In-Reply-To: <a57eed31-78c3-8ea5-579a-cb4edd1afbd3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 10:07:54 +0100
Message-ID: <CAFEAcA-ccgKHzgxvK_Wb8hD4ce=KYu2NbZ-3UGhaW447JTVgAg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Richard Henderson <rth@twiddle.net>, Michael Rolnik <mrolnik@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Apr 2021 at 16:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/10/21 10:24 AM, Michael Rolnik wrote:
> > Please review.
>
>
> The first 256b is i/o, the next 768b are ram.  But having changed the page
> size, it should mean that the first 1k are now treated as i/o.
>
> We do have a path by which instructions in i/o pages can be executed.  This
> happens on some ARM board setups during cold boot.  But we do not save those
> translations, so they run much much slower than it should.
>
> But perhaps in the case of AVR, "much much slower" really isn't visible?
>
> In general, I think changing the page size is wrong.  I also assume that
> migration is largely irrelevant to this target.

Migration is irrelevant, but every target benefits from snapshot
save-and-restore, and I think that uses the same codepaths ?

-- PMM

