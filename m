Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0F2FB693
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:06:21 +0100 (CET)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1reG-0003UL-8X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rVc-0005Q3-4U
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:57:24 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rVa-0006JB-In
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:57:23 -0500
Received: by mail-ed1-x533.google.com with SMTP id d22so10604440edy.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZbbtS1Y/3BvfIT2cNgTPtmCIDC2L9bBxQocYg5yGi7Y=;
 b=F4WAJCJEndFV/5zcnK7O/K4+NTciSjo+clPgUsTbIyu8AFri909lP1vJ1N4P74dn/5
 Z2GWPGuxaBhLOiOdwbsayce95RYzApq/x6Wf5JK8WIP1IWWshas/otR3yZ/QguWWINal
 Nf5Cmj52nR//1RsSBszc7lO6a/ITwfFzDyZkj8SNzlKtolEP+fo3OArthFObAomhrlVg
 IdQQxpslcUq4myRZYxSS/oIuxS2LJ309ZFbhZI353aukfuO30VzUAJ3CXQBugzMQkqKw
 YnoEThURuXxADJldrLM2rWTWZanNswTLu1TBPLtvXaMDHGsIZD9bMrk6D/yiQdjjWy0p
 xx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZbbtS1Y/3BvfIT2cNgTPtmCIDC2L9bBxQocYg5yGi7Y=;
 b=TcWly03LlejzqsrDSwhSfNnWdWqGIowxu9a9DHDVRWcGWGDic4li147f8SiUkso5m7
 GAZAgmasE10OhJwl6Cl+Bng30LwEAgwhgm+BWDi3VyFjqXB756rzKf7AjQQ+K1RG56gs
 psjaEOiOnqzAPXup34IlQ+oyzI/+bqKncHvhTmdUSV+8yynep0ANgL1PLpEIb6F3lLH6
 4Gn0vwjBlCfgZel/H+TXgWkQFNwAj+eK1fM0QHTsAR+KsAUZWFzlOai+DNoka8gKoo1k
 Fhl2omIMHOzGE0dJfOS6/caKRGvL9uQnwWS3IyrCAuc/+T5vQRjt7L6byBhB0jEHVPWE
 soTA==
X-Gm-Message-State: AOAM531pnnfbohOnHuUpYHGMzcwenIpGY62fViwuB+ufY7SaYIdCF1kj
 Taq+IUNiNCEg+Wmbl0C1JmkajI8MX3Twoy/bBWQepw/yamM=
X-Google-Smtp-Source: ABdhPJxv/gwxmA+zxKZ90dzYZsQGuQ/ErQMsdsLgPbW9nE2DRg3CUB8rn7pmYw+5Y6pQZVhU3afWNfkMVVf8c/TK/R8=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr3421534edu.251.1611064640994; 
 Tue, 19 Jan 2021 05:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20210115154449.4801-1-peter.maydell@linaro.org>
In-Reply-To: <20210115154449.4801-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:57:09 +0000
Message-ID: <CAFEAcA8pSXcxEX=_j+rNos5Od+sqZKBNetPoh7NPAWpbvSDMUg@mail.gmail.com>
Subject: Re: [PATCH v3] docs: Build and install all the docs in a single manual
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 15:44, Peter Maydell <peter.maydell@linaro.org> wrote:

> Changes v2->v3:
>  * just the addition of the .gitlab-ci.yml change to fix the Pages CI job
> Since this is a 2-line change I've taken the liberty of keeping Paolo's
> R-by tag on the basis that it's not a material change to the bulk of the patch.

> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -622,8 +622,8 @@ pages:
>          -t "Welcome to the QEMU sourcecode"
>      - mv HTML public/src
>      # Project documentation
> -    - mv build/docs/index.html public/
> -    - for i in devel interop specs system tools user ; do mv build/docs/$i public/ ; done
> +    - make -C build install DESTDIR=$(pwd)/temp-install
> +    - mv temp-install/usr/local/share/doc/qemu/* public/
>    artifacts:
>      paths:
>        - public
> --
> 2.20.1

I'm going to have another go at getting this into master via
target-arm.next...

-- PMM

