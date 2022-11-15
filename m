Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFC629697
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outgM-0002CX-0r; Tue, 15 Nov 2022 06:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outgJ-0002BI-FV
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:00:43 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outgH-0007z5-EL
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:00:43 -0500
Received: by mail-pf1-x435.google.com with SMTP id 130so13772815pfu.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9QqjCk2L+nj7eIZ356yG8jgjIu0kGvUmz8Q+GD6hdHs=;
 b=tqRGH3piQSSnGs1iqO6uJnSWeUfMbJVKDxTgC+nRaFT40Eh4+QkaYU2anfwoYqthW0
 ZUIb9C+kkLDjUWAXyCX/Ej2FgA4sSTQ8XKICdB0wcBjbxChPanM11NE1YlAt2QpiJmyw
 qsGQppxO1Z7XjPdqF5nnXqzXlFmIW/d1OrJGZ7RF+BAvPjvfVVCTwgYdatkVyaic/P13
 pW4JcGIPJ8xxGZKqD0gCMM/VDvyzC25AB1M9QCUQFJuvE2zcbBwfv8ttQc/0Sv7xSpWw
 uFDJ+EdUllNHbAP6BCri9wJCnt1QOjm6tpgaUrqzgwC8Or29hCS+MNpGIHoCqTE5pJV4
 4Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9QqjCk2L+nj7eIZ356yG8jgjIu0kGvUmz8Q+GD6hdHs=;
 b=xg8pe1PPpH3GWa7gWnf6Kn2jqgOAVf29W8KkuZe66Wk3AwVwVLfOYUs4AuPiXvKgzn
 qCdbG/JW6KMpECsvPUPj+sV8ikP9hpMh1UKx762LIrKQvQAvPkgUp6dspj2o4KLKRDh7
 XQDK96HKdCjciGn2UFAhY+w3aZh51qEczONJm08deDxgAOokvUTDE6MuIpqjmkzcufZB
 5jZ9PUgCTRbcZUnOQcFjTZwovZsVX7NeMIDfr/Ri3FW0vpmJs3rkIbCVt62DfmSKhGh8
 IrPujZbG5AGRDetmPj1yARfCG2YN1MaVQDArtMN8Y4+vs6s2SAISjoVnoS0IfNHXDbAN
 MbjA==
X-Gm-Message-State: ANoB5pk1cQICddmlnl/QNC1ENNtZrvuz2jsmy7PhKs+BtN+2T7ARvFZK
 h3iND0gU+JRbb77cDR8gG3J6d9AkAfjvuyGblKQ6rQ==
X-Google-Smtp-Source: AA0mqf67y6qMTyrEPFMJ/fcEG6gi0NYymUeV56EBJ5tbKSY2jGdDjLIAl4SzpuzQP39201t22YksB25hcHYLGBn9adQ=
X-Received: by 2002:a63:1665:0:b0:426:9c23:9f94 with SMTP id
 37-20020a631665000000b004269c239f94mr15364821pgw.105.1668510039749; Tue, 15
 Nov 2022 03:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
 <ba8aee1e-4b53-4c28-d77d-41782b56a5e0@msgid.tls.msk.ru>
In-Reply-To: <ba8aee1e-4b53-4c28-d77d-41782b56a5e0@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 11:00:28 +0000
Message-ID: <CAFEAcA9z564UNPqaMyuAemp_ctmh6eTZbSi5zR6w46Ndkq4u3Q@mail.gmail.com>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 15 Nov 2022 at 09:25, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 14.11.2022 14:59, Peter Maydell wrote:
> ..
> > We can do something like
> >
> > config_host_data.set('HAVE_CAPSTONE_CAPSTONE_H',
> > cc.has_header('capstone/capstone.h', depedencies: [capstone])
>
> This doesn't work, because has_header does not have "dependencies"
> argument.

That's odd, the Meson documentation says it does:

https://mesonbuild.com/Reference-manual_returned_compiler.html#compilerhas_header

"dependencies dep | list[dep]
 Additionally dependencies required for compiling and / or linking."
and it's not marked with a "since version xxx" tag...

-- PMM

