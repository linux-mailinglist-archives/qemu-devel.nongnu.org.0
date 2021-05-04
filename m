Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2D372797
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:51:28 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqm7-0003gA-6W
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldqi0-0008WD-67
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:47:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldqhx-0001e4-UE
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:47:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id a4so11946714ejk.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NhQk0wmpJRy/c9hzYii/Z9TS2lsQEYgVkTDPJn8B/GI=;
 b=D/qFIzLw4Ls+d2GqWPMTKx2bcH9sEXWNZDJz+BULEARsjGlklL/bUwc7MrAuGX3WBB
 VDhqhK8WkPlWmcGBTRE3h2qkLMOFjpw/J1z9x9+n/y6MHd27JZBdzmQIXHxVR8KAThEy
 U6ZWuNm7tFKvC9XmniXhwWfkLBpyWQ54LN3RbgMBtnNeJg474OL+/qVuFNErYx+S1WOM
 josdGExcmiqZzKDXaHcT1GQ2vAB56PpJi3IPHUxvXWOkcgngf9Rnwg8hDuTtDLUibZLS
 DL6FNihidbJUdc1s4m9N6OaAyiNaEKKc8+FqXaGb45Euy5uaMBS28N2S1kBNcYN4euKV
 w8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NhQk0wmpJRy/c9hzYii/Z9TS2lsQEYgVkTDPJn8B/GI=;
 b=lhJ3XrNHsEskpbXblPTxeS+BylWfxyPEwbiSktPnA3sx8KkxbyPJQByEs9l3Nz2c4S
 tcQHulMeBRWnHkkow53n9uP5niqNdy/V4y7luZJHKQs7CHruDl2z1F0YvWwghialKT5Y
 qI6s3ERTnNlB6FaATVWtJpNiTjpSihPg8IZzbvIV3C3eOr3scOeYeiHo4T4quzkWNcVk
 dqc43YYQsYrWhGyjBjSSGizOBAn/vUc8QwIsKg4UQyhb7OpQy/URQUXI10vgmJCvHbov
 zIDdQ6MJPPM48OlOsDSzzPhBTzJOh2wf6smeVW0+brTfnykPfnP6Crr4trL+csEz8/o2
 OOfg==
X-Gm-Message-State: AOAM533JLTDs5mbpx8oRUp5yMulhgiAmnm8QBJff3DHC2cI9h+VhKSkg
 RolPZIe9AENXs+beG2WfgpQdSOil7jED3r5V8rB3oQ==
X-Google-Smtp-Source: ABdhPJyFen5LgKtGMqEp2ppjF3DdtFa/jK5tE1uo+Bk6lHR3jpt21FjeKDgWu53Bp1LeUXmrY0lHgkP6pft7a2fpDbg=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr17888644ejb.407.1620118027776; 
 Tue, 04 May 2021 01:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-4-peter.maydell@linaro.org>
 <3b1e76eb-43a3-5ff9-e4de-5ee32c3bf612@redhat.com>
In-Reply-To: <3b1e76eb-43a3-5ff9-e4de-5ee32c3bf612@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 09:46:02 +0100
Message-ID: <CAFEAcA-m+kKGq5HvFPZD3_R6BDBz_TL5EN1VmwQ-QFBB=kVOdw@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests: Avoid side effects inside g_assert() arguments
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/05/2021 18.55, Peter Maydell wrote:
> > For us, assertions are always enabled, but side-effect expressions
> > inside the argument to g_assert() are bad style anyway. Fix three
> > occurrences in IPMI related tests, which will silence some Coverity
> > nits.
> >
> > Fixes: CID 1432322, CID 1432287, CID 1432291
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
> > index fc0a918c8d1..afc24dd3e46 100644
> > --- a/tests/qtest/ipmi-kcs-test.c
> > +++ b/tests/qtest/ipmi-kcs-test.c
> > @@ -73,7 +73,8 @@ static void kcs_wait_ibf(void)
> >   {
> >       unsigned int count = 1000;
> >       while (IPMI_KCS_CMDREG_GET_IBF() != 0) {
> > -        g_assert(--count != 0);
> > +        --count;
> > +        g_assert(count != 0);
> >       }
> >   }
>
> According to
> https://developer.gnome.org/glib/unstable/glib-Testing.html#g-assert
> g_assert() should be avoided in unit tests and g_assert_true() should be
> used instead. So I think it might be nicer to use g_assert_true() here?

That probably depends on what we decide about whether we want to
use glib-testing-style "assert but this might not stop execution" in our
tests: see this thread:
https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/
(I should have cc'd you and Laurent on that as qtest maintainers; sorry.)

-- PMM

