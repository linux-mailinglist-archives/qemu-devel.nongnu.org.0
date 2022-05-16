Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B952857A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:36:33 +0200 (CEST)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqatk-0003io-6u
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqasW-0002jL-FV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:35:16 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqasU-0004Mt-Sy
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:35:16 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ff1ed64f82so2075787b3.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jbhyEbyvD+uYSBvHJ8EQP/lrd64If6VR1aJBV/+Npxg=;
 b=in4G59uA0irOQ75L835YFRIWJ33B+ZOW2yhmU2rTzacbBPaqmmT+15UPdLvkUg07dp
 mjCTGkZrrQJbrWu2csVj0cUS2nUA5btzTg4rEtVXpV0UkmdDB+oymShxkp+80L3/ImTo
 Rr4/l968itg/mfao6Z/UpmNpZFYMhOEUcGyWAGy8CGnoM+JgYc0i3A+RvthMtXV6djND
 7gtoHVzmO7ZVXFuQtdKkGyh5ZXymx1EhYEYKqd+h+APGI1xhuM8nxnRDepQPFYJeyneq
 33hcrJjqBqGrhGtmyNa8Lu+cUVKMxvuNqgWLF63MDUgHwB2SxFMaY/tuP2OTiDIEyEqg
 S5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbhyEbyvD+uYSBvHJ8EQP/lrd64If6VR1aJBV/+Npxg=;
 b=45K9HQr/hQy690c3UimeiPH09jdZwdbkfVNbKGXH7vsisxN/FZHQ3rMJS6stCNRwD5
 OcxJ0DNpBE0APgcX9mw+t1USKlobT5gv3WnDCjgC/mFW9Sbd7q4VUqtWtm72PIs6spjr
 QumiABRXtbCKzIQLmShecFTFira/96zhjMjCtAnwcZyNgVNnQlqSYzoG9XKnv6ZAjHL0
 C3DB8I/SuGVLkfCat3+S9chsyLNi7Dl+NMmF7jh6zZynDEBYFJso3NIN+RmZmGuzvzr5
 OetQB/VaXUHqhNGTEE7j911Eyg054hWVglp/LjA4+LYwR0OryxwirYDCTuS1BcvNNp2H
 e+fw==
X-Gm-Message-State: AOAM531jidMsA3Nt4G+Kt27EcaREvkIRAC2YHRZEnF0nh7g/yMsFLLFa
 QJPX1AtbnGcFrF9xIXoMZ4VMSuzevJpvVF6xCSQMzQ==
X-Google-Smtp-Source: ABdhPJwxMB2CJJvZBrrQvGMGuAmRbNbGoDRuKpDSoSOQ/gzDLBZXux5OdlOEZdZXy/WE+uHHx1WWDuL7at9FETgX3YU=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr20022111ywf.347.1652708113958; Mon, 16
 May 2022 06:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220516103058.162280-1-peter.maydell@linaro.org>
 <20220516131032.ykidzcfvjhxqmets@debian>
In-Reply-To: <20220516131032.ykidzcfvjhxqmets@debian>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 14:35:02 +0100
Message-ID: <CAFEAcA94EpfKrgYjupzDacvVn+c45ao_fdYaDjMp7mCUbacN6A@mail.gmail.com>
Subject: Re: [PATCH] ptimer: Rename PTIMER_POLICY_DEFAULT to
 PTIMER_POLICY_LEGACY
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 16 May 2022 at 14:10, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> On Mon, May 16, 2022 at 11:30:58AM +0100, Peter Maydell wrote:
> > The traditional ptimer behaviour includes a collection of weird edge
> > case behaviours.  In 2016 we improved the ptimer implementation to
> > fix these and generally make the behaviour more flexible, with
> > ptimers opting in to the new behaviour by passing an appropriate set
> > of policy flags to ptimer_init().  For backwards-compatibility, we
> > defined PTIMER_POLICY_DEFAULT (which sets no flags) to give the old
> > weird behaviour.
> >
> > This turns out to be a poor choice of name, because people writing
> > new devices which use ptimers are misled into thinking that the
> > default is probably a sensible choice of flags, when in fact it is
> > almost always not what you want.  Rename PTIMER_POLICY_DEFAULT to
> > PTIMER_POLICY_LEGACY and beef up the comment to more clearly say that
> > new devices should not be using it.
> >
> > The code-change part of this commit was produced by
> >   sed -i -e 's/PTIMER_POLICY_DEFAULT/PTIMER_POLICY_LEGACY/g' $(git grep -l PTIMER_POLICY_DEFAULT)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


> > --- a/tests/unit/ptimer-test.c
> > +++ b/tests/unit/ptimer-test.c
> > @@ -768,7 +768,7 @@ static void add_ptimer_tests(uint8_t policy)
> >      char policy_name[256] = "";
> >      char *tmp;
> >
> > -    if (policy == PTIMER_POLICY_DEFAULT) {
> > +    if (policy == PTIMER_POLICY_LEGACY) {
> >          g_sprintf(policy_name, "default");
>
> Hi Peter,
>
> It might be that above is clearer after this patch with "legacy"

Oops, yes, we should adjust the test name string there too.

thanks
-- PMM

