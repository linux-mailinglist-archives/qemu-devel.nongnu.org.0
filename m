Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9423E118C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:42:31 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZtW-0004SJ-6I
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBZsa-0003ll-LU
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:41:32 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBZsY-0007nL-Pr
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:41:31 -0400
Received: by mail-ed1-x530.google.com with SMTP id d6so7437862edt.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ACTjsB/T8jctS8/uFUzccxu3omtkMmAQ6epJJHcrMo=;
 b=QmQC5ThJimlpyCdVNPGJITXfW5VEcIquWYLXlYXtFZhKIAwvV6NvRYvdHQmNLVazZb
 IjD/es0HsL2Vnm0j6dRleI3j1GVFSvLdM6N2jULEZaS+urRHCBJL+4l3e58952PJYxGQ
 6TNHOpbrBk9pOnCc84maC66TlWV803lLLirCU7c5p5KkRin/XSKNhVpE77pqnapZtHiQ
 ufj9PJ5R3/i/HgTHgPNEuX8qghz5GuaKPeGNH8xPFHhnlzToALRgtcsQoJ24iScoKJxe
 +16XzOjAO3Tha/z/5KgcomzsA1wrDFWvo3rHOkGeXJRSf5xWi6An1ou2RBouM/oRgXdX
 nOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ACTjsB/T8jctS8/uFUzccxu3omtkMmAQ6epJJHcrMo=;
 b=porbI/QF8qeylb4CJRUnPDCiu52Ypr4GrpPJORk+Q0wWTCmyOnKpalt0aVsJC4LeU0
 ka2KkKrUZ5Ws5vfyMUN+2m2GMnKucpJSmWwyBd2CGckgeZi52qc/PV9xIqBzdkxkByhl
 vOUnfnUXI0rlWUod/jnbRg4zwsXAOo8birUtiBl1zLtpqPUP/u++2fbIVG86eQPSGeTH
 K/LZQxkCd5tpN1hs7ZwI5xpt3HH56jyF31CIWCvK9BYpFU9m72suIy9EU1l/3xBW+z4P
 JUzGGkjrfy7jOpNYKZZFZufmLMkvzh2hYImW0UCOzIBH4XRRwPdTr+MxWIbKymbFHntw
 wiFA==
X-Gm-Message-State: AOAM532lOj13BzP/2AgfuOYKrNYJPA7J20QCj8UQDLm7KeSPMjpM01n0
 NaM6T9KTdwLlHT47NAHOJctKS1J03DBoobSovQ/kVt2yfHk=
X-Google-Smtp-Source: ABdhPJzthvpwUm+zF2DH3NFur3ULQ8Iaq35v1ugTj99oj8StGsL5e31TJ8HzTFCTpc4OmZqmiGzKe5KuiuNO6WBWQr8=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr5313837edr.52.1628156489266;
 Thu, 05 Aug 2021 02:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210804005621.1577302-1-jsnow@redhat.com>
In-Reply-To: <20210804005621.1577302-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Aug 2021 10:40:45 +0100
Message-ID: <CAFEAcA_uBwwRC_ye3xoUCGqD68_ci+5p=UxWm0s52iraxbBq-A@mail.gmail.com>
Subject: Re: [PATCH 0/6] docs/devel: Organize devel manual into further
 subsections
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 01:56, John Snow <jsnow@redhat.com> wrote:
>
> It's a bit cluttered. On my way to converting the QAPI/QMP documents to
> ReST I thought it could do with another organizational level to help
> make sense of things a bit more quickly.
>
> John Snow (6):
>   docs/devel: create "Community & Governance" subsection
>   docs/devel: create "Developing QEMU" subsection
>   docs/devel: create "Testing & Debugging" subsection
>   docs/devel: create TCG subsection
>   docs/devel: create "Subsystem APIs" subsection
>   docs/devel: create "Miscellaneous Topics" subsection

I think 'decodetree' should also live in the TCG subsection;
otherwise, whole series
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

