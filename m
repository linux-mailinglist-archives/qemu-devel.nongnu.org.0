Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCADB50F9CD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:09:51 +0200 (CEST)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njI8k-0007Xf-QV
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHgP-0002Dm-Vx
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:40:34 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHgO-0007zp-59
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:40:33 -0400
Received: by mail-yb1-xb36.google.com with SMTP id m128so13952994ybm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcI+7vfqY6aiIhuUZjBSxvujZWoN83YBiCB4gXq3EdU=;
 b=ZC53A93m2cTM1XOlO1FK/reBcoE8OHThJEh8lV4NaCu4WBOs+U8Zz9KAwJMe6uA+YX
 8KQ77AA2pXCiK44vCf6C9wVIpL6Nqjx+GuFBek4lcUJl4hiEZ+7iRMCz3R9di0flliOI
 peO+zl8xkkGjTsWa66rgTwzW7q3ItTqGJoV0KqkX/UMookZw1hGmK1XC+IWaZ81e3BBH
 ixx3Eyp+8hevsRR6sBn0HY4gUzVN+lNtmbFlootzyZR0zH9BaI1J6K64cWLMEbxK/8Pi
 DSQBcnuJW2N8sBmoCCSQV5+t5g6LS0Dt9Ki+lirLp6/HcH+lHmY0v8IxNmk3+WDOimXf
 yY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcI+7vfqY6aiIhuUZjBSxvujZWoN83YBiCB4gXq3EdU=;
 b=HTGZsq2lQruj3ttV0eayhubW+Ws7ArRk2D3Ge2NdPXsoleMAOElGTeJKWtURyy6LlN
 0izyyNOLO13w/GfdJ73X+RuE+ny2/tncS6McSoUGE0zBWJrOVsVqdgoX5Kv4OVEYO6tq
 C/nfR60QAoBU6xiO/2liCwWXUetb9NbnS39VfIfOn2mCcfNKVM1KqHVBn6PiciMeCK8+
 fKCCpjQhdjuykzjdnDlPVEm4pIrnpQODALH+hul7A3Szwqa3c2NNSQ9tXL/+3ZMixwqH
 ttGb//fQV18yGDYtecArGayE1pkroaB6fiiG1KRYN6LNPp72sq9XZ8EmuLQ42ls5L3fK
 l9Zw==
X-Gm-Message-State: AOAM532HxpDdqRZDc5+3Bg/CVSLVOU6uITvx7pd2DDBMvj8EsVbBi33b
 fTK8GbiXgGb3sTH90N+Zp6A5cr552t6Lm0LsKBtjAA==
X-Google-Smtp-Source: ABdhPJy0H4uxH+4LfF1FlN3uFt6j8eMHx3St/1voTMLNyWc/HtxXcphghB7hs+lYEMRiuygav9MqoP9DG88+M17Bo9k=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr10032517ybk.479.1650966030785; Tue, 26
 Apr 2022 02:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
 <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:40:19 +0100
Message-ID: <CAFEAcA_LcPozskR9y6WtMopWFY4tiL1UzJXSmVNPeZnyG=4ttA@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> Just because
> the architecture usually defines that an _EL2 register is
> RES0 if EL2 is not present doesn't mean that it does so for
> every register or that it guarantees that it will continue
> to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
> don't have that statement in their documentation, which might or
> might not be an oversight.)

In those two cases, it probably is a documentation omission.

-- PMM

