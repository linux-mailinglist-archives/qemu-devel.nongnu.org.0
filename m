Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680C3ED0CA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:03:39 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFYWv-00081r-LW
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYVG-000744-JQ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:01:54 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYVE-0007EL-O9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:01:54 -0400
Received: by mail-ej1-x62c.google.com with SMTP id qk33so30340515ejc.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKv6O7tJZ1CGMonUqrM7I0GI6tpHegsnUhEZuNJqaYE=;
 b=zFOCQm7c+iwXLyGm7s+Z1LHWLB9re9rdz+i8sgsDqU6eQBn6cbfAC8xgVNKKngywYS
 f1gWiY8EQwvsPxHUNJdQYrwMQPpOmDvFkPRafYitvoIPMRDf24HXA+fZBbZ6H717ag0t
 TUygLvgpeu2Hz3GCGIDD88HiEP+FfDTc0RnfMAtxcvqqgZRPDE83jR+9+oRPBoEUeOmM
 2ZZ+P9ckYR6uf3SODUnIlwT8Be0pCrlE3a5D3L8jER1AY5gjEXoWhiXbh20ld56Q1oi5
 jebwrgKKFlnnNShYOtERGH2ZfDqtI40HX1ka3Sh+79SRB7xdRmkCwDPRzj3p5YSDgLwq
 o/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKv6O7tJZ1CGMonUqrM7I0GI6tpHegsnUhEZuNJqaYE=;
 b=bW6s7Jcx46MaxpRgG/XmNB2OtnJ4YRerI4a1XXuYp8JiMA+aL5dGP60sPbJKUb0FHZ
 4vrau/VRM4P151tt/eYlvTlVZgOSj++5hD/HnFu71Ox1PlzrZ6b/2RPS509AF79FiSeJ
 /wYIvc+5EjCVIn/cnvqkF13X+3fhcbDh1dm1+rifW17MssG6j9ahY5y4fxxPLu1wllOx
 CHtkMttYcDOQvjiM7S1Jeuqfsz7jF//d0J/uqnHT9Uz9UNL10zsryK022BfakewijQRt
 VJ+v/evgtMO87u95C/R5bx8u+V2HMbN2Z6+z2HicqBhI9ErJZMW4I5rISk/jWG1ZZI8+
 xi1A==
X-Gm-Message-State: AOAM531cNovPvrMVlHsHfvaoiUUMx9b1jtChHs8lYLdTdNst2K5J8mbk
 g3BISTmAXF4Aw7g9sOpKt1eCLJ6qczt+etdXMyFkXw==
X-Google-Smtp-Source: ABdhPJwq/zV1a5EWsSS+fZcHW11DEov+QCmY1eSdW+yBxoIm95LcKgEBuNhDxgocmN/9nN+IbHElT/DZWXnIT2Znmts=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr14663595ejb.382.1629104511078; 
 Mon, 16 Aug 2021 02:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210814060956.12852-1-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:01:05 +0100
Message-ID: <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Sat, 14 Aug 2021 at 07:10, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> in case we're going to have an -rc4, here's a pull request that contains
> the fixes for getting the gitlab-CI green again. I also added some doc
> updates since they should be completely riskless. But if we won't have an
> rc4 due to other reasons, this pull request here certainly also does not
> justify another RC, so please ignore this PR in that case.
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-11
>
> for you to fetch changes up to 36b508993c4dcc6b3ef4b5c00e293ee9560926ee:
>
>   docs/about/removed-features: Document removed machines from older QEMU versions (2021-08-11 15:39:09 +0200)
>
> CI run can be seen here:
>
>  https://gitlab.com/thuth/qemu/-/pipelines/351602605
>
> ----------------------------------------------------------------
> * Fixes for the gitlab-CI (fix the hanging  build-oss-fuzz pipeline)
> * Add documentation about features that have been removed in older versions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

