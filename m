Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E360405A45
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:39:50 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOM9U-0001cy-LD
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOM7a-00007v-13
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:37:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOM7U-0008LO-UU
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:37:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id s24so1661390wmh.4
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OS8ksIHrl5cxpYquyMqPycBMuXaauIsbMs/jxQ4ygdk=;
 b=zz6BaqiQ/Pl8IazdhwNCj3+5FZ76se+X+L/SKPdokIf1OJ80EZe6u8PxnCt8hu3K6U
 lA/Ot8YoD6FQRlaGQ14E5YqDgCBvHbkAv896BW/fsbFfAgODSP3pfMkhIeVp3XlzXGXR
 MPF7EpY7ITAnNEBPV94Fg7ObZ0AEoK+ptmCnlJKGP0y3FrMEZ2k5E0nwp3zttQrEoL/J
 ymwoFXVUm64+Dv66+ZoCjmDJ8w40wN1iU/p8ABcVcX7LsWH77chZd9CUbRrg0zM5lE4/
 wg2tudTcI5uWnBP0oMj50UTtakjP8SPoQvSQIatOa193zWvAc/tkMOETP6pCgdYiz5bd
 mLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OS8ksIHrl5cxpYquyMqPycBMuXaauIsbMs/jxQ4ygdk=;
 b=EP9m4Ru+WxXa3eOl1lg3kB2ESYCCq8zXYWKpyTAiuw+3qtIiku+A6C7m0it9XhXUoS
 Rj+Q2CsjDyyB8UMwrckGlg7rsmqXmKm+B5rHKGM7zerhLrip+H1ECn66pdQjaF+oq+Vi
 lFaUR8axu9YsTErG5IMsZXpfj7gCQmp0T7ZJUdTEAxag2Gh0w5YzyQbbIA0zBPzpoLQo
 hALnuvtZ1QUxHVjC3natvfNcq3QUYdWscv3fclKYhTS/70j0yoo93/ksIxvaoaHMKOL9
 9kOJ2Po9UQXsawEhWExpjL0CGqV8qh9JOKA/6oKqCJLpPxsYKtLaOooirzSwmwkYtgd3
 XCnQ==
X-Gm-Message-State: AOAM532Nz0PyiduWvTa5leo9NABy1R9P4vBL8DIi4CWzb2BazstDcnpM
 RDid/xsPXblp4ofDCDsO4wvgBHRV1xX3785ruI6g0w==
X-Google-Smtp-Source: ABdhPJxkjH+TCrCACj/xvDEVZ0Cp2uQA0ZvxlXhcd9ApVTLzza2Wtc+UdmjvzewxmFMmlgIEuFgmMQr+zS0mGlvwO2E=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3810647wmj.126.1631201863462; 
 Thu, 09 Sep 2021 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87k0jpn57m.fsf@secure.mitica>
In-Reply-To: <87k0jpn57m.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 16:36:53 +0100
Message-ID: <CAFEAcA9YHHYWtpJRwsXY6dqwEFTAS4swrFjUEzqQy2bNqjadeA@mail.gmail.com>
Subject: Re: [PULL 0/7] Migration.next patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Li,
 Zhijian" <lizhijian@cn.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 16:23, Juan Quintela <quintela@redhat.com> wrote:
> From 964e436bdb8aef7dbebc28415e4ac3c5822b552e Mon Sep 17 00:00:00 2001
> From: Juan Quintela <quintela@redhat.com>
> Date: Thu, 9 Sep 2021 17:07:17 +0200
> Subject: [PATCH] rdma: test for ibv_advise_mr API
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  configure        | 28 ++++++++++++++++++++++++++++
>  migration/rdma.c |  2 ++
>  2 files changed, 30 insertions(+)
>
> diff --git a/configure b/configure
> index 8adf2127c3..70054fd702 100755
> --- a/configure
> +++ b/configure
> @@ -339,6 +339,7 @@ whpx="auto"
>  nvmm="auto"
>  rdma="$default_feature"
>  pvrdma="$default_feature"
> +rdma_ibv_advise_mr="no"
>  gprof="no"
>  debug_tcg="no"
>  debug="no"
> @@ -2918,6 +2919,29 @@ EOF
>      fi
>  fi
>
> +# Let's see if enhanced reg_mr is supported
> +if test "$rdma" = "yes" ; then
> +
> +cat > $TMPC <<EOF &&
> +#include <infiniband/verbs.h>
> +
> +int
> +main(void)
> +{
> +    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
> +                 IBV_ADVISE_MR_ADVICE_PREFETCH;
> +    struct ibv_sge sg_list = {.lkey = lkey, .addr = addr, .length = len};
> +
> +    ibv_advise_mr(pd, advice, IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
> +    return 0;
> +}
> +EOF
> +    if ! compile_prog "" "-libverbs"; then
> +       rdma_ibv_advise_mr="yes"
> +    fi
> +fi

We don't really want new compilation tests in configure:
anything new should be done in meson.build. I think Paolo
has work in progress to migrate the remaining configure tests.
Something like

config_host_data.set('HAVE_IBV_ADVICE_MR',
cc.has_function('ibv_advise_mr', dependencies: rdma))

in the same bit of meson.build as the other has_function tests
is probably sufficient.

thanks
-- PMM

