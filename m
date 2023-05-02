Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330E6F41F1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnUW-0005gN-56; Tue, 02 May 2023 06:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnUQ-0005fU-28
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:44:11 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnUN-0004Pe-Cd
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:44:08 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso612815566b.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683024246; x=1685616246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=frTW/9pU0unhnt5M7rbEYbDEq9e8rrOIq0ujF9oM7d4=;
 b=ReUV1juYC10ioIoBMIhn8nuNc2VcNxIMJfARfYJDzyFsW4ahvYv+giM7x0lnRhejl8
 sWbyAaVhjHXvQF+lnAPXYB4xO5yhtct6dQcMmRUKMPyAuy8CLndXL0GUWSRc8IYmMd/J
 Kr6vd5U9bo6Fb4U6w2MA9ecNLZkz/v+Qw9QdCn6Ec4r8ojflgE8KCN1VzQvy8ltsjIBM
 Kgj1vosD+doJYqXsiKOoz48rXu+gx/KbUkmNDGbij1HtFvC8/4ShLHAIh16hmMAfrNuQ
 NLZCbk3zlRtSq+u1ktPDY9UHDWdrFY9hCDCyYI/wreox5yGUrWwRgnMIjQfieXXOBaXT
 c43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683024246; x=1685616246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=frTW/9pU0unhnt5M7rbEYbDEq9e8rrOIq0ujF9oM7d4=;
 b=BHB1cnpdGBs84mNFv9ntHJamp5IKYaOojTjARuTHFQMmXcrit/yKP//+QU3u5JSEpH
 p22m0/YTFUrqA0RGIZ1WGQdugoS8fHKsLFa8dK3iZmWiw06j/L3XzG+ootztcoujSnIS
 WXhC5tOua41kQ18GtaIMEp4215sIHSAzFER+4yZ0c6EfcXgdKL2QtxbigZ4zym3J+e1c
 TK9LrjmVNYvaKDDRhVqanVFR0bQp6u2r7564IO9Gy0+zJZuQZU5VyEGEQCiEoyJPYKuh
 luf/2ZG9p6jVTwj8DWrqkbI9zFCxsleEAtXD9/TSoJ2KU2DdbMFpFrvA+eHwwynO0jxC
 HVjQ==
X-Gm-Message-State: AC+VfDy4j97M+WFeeYtYWG4t5Eyxoc2rkPNeLh3tTB6M3BtNl6h/NSr9
 Qq9MPE2uiUf2CeK/7miSIKWB7d3inAL6fMKHNEULOQ==
X-Google-Smtp-Source: ACHHUZ7k2aNyh5ivUasjVQWOaiMjQN+0WhyOwEshdkxZAtYiWgTuWYj/Y1qf3R2tcLjJnwgUqmZWqx0tqhdvdCF2b/w=
X-Received: by 2002:a17:906:fd8b:b0:94f:32ed:637e with SMTP id
 xa11-20020a170906fd8b00b0094f32ed637emr15079954ejb.59.1683024245717; Tue, 02
 May 2023 03:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
In-Reply-To: <87jzxrt3u7.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:43:54 +0100
Message-ID: <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
To: quintela@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 Lukas Straub <lukasstraub2@web.de>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023 at 11:39, Juan Quintela <quintela@redhat.com> wrote:
> Richard, once that we are here, one of the problem that we are having is
> that the test is exiting with an abort, so we have no clue what is
> happening.  Is there a way to get a backtrace, or at least the number

This has been consistently an issue with the migration tests.
As the owner of the tests, if they are not providing you with
the level of detail that you need to diagnose failures, I
think that is something that is in your court to address:
the CI system is always going to only be able to provide
you with what your tests are outputting to the logs.

For the specific case of backtraces from assertion failures,
I think Dan was looking at whether we could put something
together for that. It won't help with segfaults and the like, though.

You should be able to at least get the number of the subtest out of
the logs (either directly in the logs of the job, or else
from the more detailed log file that gets stored as a
job artefact in most cases).

thanks
-- PMM

