Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06025371E86
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:25:23 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcJu-00062n-21
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldcEP-0008Ah-UF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:19:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldcEJ-0007Hy-6F
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:19:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id i3so7212116edt.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRRMvqQpBTo4O5GFLW/0dX+GLion5dLBeKx13cdQ9yI=;
 b=oxsvDBjP5yD16xyzs0BhPt/TFFr4whng8zLOXynsQMqz8fvPazkSLPqbS7dWP/o1Fp
 D9MVV9Zq9M4JOIGbp0FGW4tbm35yB1L131fFrqe9jJlKC+dyz97ApLlBB1QF1L7CPpBP
 5MNvIXFwcHe14Z7MqSTzICKf2ErFt7vkzvL/0eaGHZ6u5BLr0BDrRhPeNKyxd/q/bEPF
 zwoIz1R7JwL153c+61Q98fqvSrldpJo8Gy/8fAUtQ5e2zmZDpnqDkShWDGG+kvWWRwxH
 IfovBkaz8N7/E1D+IQJvmW2lDmkjdu4NUBndFlKIpEqZdtZSZfNmN3ECF/7EDIqgc0cA
 wZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRRMvqQpBTo4O5GFLW/0dX+GLion5dLBeKx13cdQ9yI=;
 b=aa3kNUabSMYSbPt2vDGq+HlLqQfu9/quC+cHU3qYBlp4iGMWMLVWvYOG+bGRgGV2Ua
 hEvKlIGRlDJ7uvrPqWwxk2pDLu8VWnuD+HnaBcEW7nwffX+D7MP725s1EQOpwTUyw9AT
 9uJIOaQOhmuRj4LfgZNoFjIACHRRyBEmgxRPWUXbRTjW1Qlh3/jXV2/xhbMoFgD3AoGy
 motPMXJ1cke7m5vAqpQ3NAlrkhmikgx5saK4Lauiv0Yws1rIQHrrJTLEg7AImO29XgJm
 SQKw2TDvZcRF0vKyfN7ATmhdS/J75S1qI55iAEd7c2W1vHaPOVWrxnqz2drHLLGKO6Td
 GtZQ==
X-Gm-Message-State: AOAM530ElzQ76KOQvfu1yJJjeCSEdi0ewrtvjycxMP2Nhoq+fFOwKXEv
 yD+/J6JrWLq/xWa/geg9kc0ucbgQFlWm2+maZiQIKyZaOlw=
X-Google-Smtp-Source: ABdhPJxucjNOjhikaNSxry/9dWURaq8EbTpBZm+eQ6vwfBLP39RBfc8oQ2htto74D6PQUk7rc49H40mT0IygFQiuoFg=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr21042370edv.204.1620062373364; 
 Mon, 03 May 2021 10:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com>
 <c1fd864a-3fdc-1bdb-04a6-9c847eeba59f@linaro.org>
In-Reply-To: <c1fd864a-3fdc-1bdb-04a6-9c847eeba59f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 May 2021 18:18:28 +0100
Message-ID: <CAFEAcA_bVe5zZuyvy_RCTe+FMs+TMemLS1SJ88CMOi276LprvQ@mail.gmail.com>
Subject: Re: QEMU tests, Coverity, and g_test_set_nonfatal_assertions()
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 18:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/3/21 9:49 AM, Peter Maydell wrote:
> > (1) Expand "assertions always fatal" to test code, and add "panics"
> > models of the g_assertion_message* functions. Remove all the calls
> > to g_test_set_nonfatal_assertions().
>
> I vaguely prefer this.  To me, "assert" means can't continue.
>
> If we want tests that report and continue, we should use something else.
> Though of course could mean quite a bit of churn.

The thing is that this is fighting against the glib test
framework's intent, which is that one uses g_assert_cmpstr() etc
(but not plain g_assert()) to do the "report and continue" part.
We could wrap them all in QEMU-specific versions that rename
them to something other than g_assert_* but I'm not sure that
that's a great idea.

thanks
-- PMM

