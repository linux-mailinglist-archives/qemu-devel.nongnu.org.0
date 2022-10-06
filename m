Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA25F6998
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:30:42 +0200 (CEST)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRtX-0007ou-RR
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRql-0003h6-0J
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:27:47 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRqj-0006IJ-BR
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:27:46 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 195so2053185pga.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kou65FK16ZFMmDAf8FfmX9E/o5JrpateFvs8B/giFAk=;
 b=Hv9S3bq6uKbYkPHcVnW/L+SL+Bmp1URGjAPRHaYPfaGIJIvmR8MX8z7vWTC+NCjfnn
 4qOGn0FOuRu4g1aE7P4n9CXwxTZXkO6+pQHEfCL6Nmplv6u1el4B8JIhIv25ueB4X5WS
 RAArpw2/Ixi5YXaiAeeH9mioFRntkwhqU4WDMlyGtMVj+wzNidOqUPz579zmLCl1/nE0
 fjgBbJxzrJyxuGKqJQCYncCcdRHL2RqPBmBC4fPtFSEWFCUM7QedQN7HyrsCRgHsVgpV
 +qmGvSF+jjzm/1a6hLahfYJdZQ279Kif69N3NndabDShY/s15pWLxC6t6xrCcMLnWlIP
 R9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kou65FK16ZFMmDAf8FfmX9E/o5JrpateFvs8B/giFAk=;
 b=6FbQAOoVmyOBYbXEXIAefiSeOojaZUfopW/kmxtijDaVGNrseerBnsZwyymNXAvr4F
 IT2hjBwBG/bpf9GyaUpG6lbZ7TtJdMyw0neeDFfN8R/0Tm08sZQi09bGoAmVRd60xDYx
 /GCkvHohf/VpYLxhxywH/HrdtVDf2wiU0E10/mEzuWgOuLAjaliniMbEeP43UHOmAfEZ
 tfEpWqdkO33wDnMmmuu0naVcxd28u0EwntBLoZM1hzRhgTpwZXdiskZkzb0++LP0ahFa
 4XuTRQK08ve22nlYroGSoofdGUYb6xd0paxv1bw3xQuM6zZUQ1DJVXPS9lVClbmOT+p4
 HQkQ==
X-Gm-Message-State: ACrzQf0bEitU2d9vGyljH5h333/K7lFq9UMTPnJRoPW4v4o1p8IvM6Es
 Toq+QOT2pgIllaW3oFZ5xUV9n5C77Yr01X9ckn8XYw==
X-Google-Smtp-Source: AMsMyM7WhUnxO/TJAZ77yRw/wakNcE9aMdbnMiRSVPJzdwy6nNfgLwG8eS33YTa8mgQg5bQAMBeDxnyzPFtwYJqlYAw=
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr204284pfa.3.1665066463055; Thu, 06 Oct
 2022 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:27:31 +0100
Message-ID: <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The starting security state comes with the translation regime,
> not the current state of arm_is_secure_below_el3().
>
> Create a new local variable, s2walk_secure, which does not need
> to be written back to result->attrs.secure -- we compute that
> value later, after the S2 walk is complete.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Do not modify ipa_secure, per review.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I did find myself wondering if we should explicitly set
  result->attrs.secure = false;
in an else-branch of the last "if (is_secure)", though.
At the moment we rely on get_phys_addr_lpae() for the stage2
doing that for us, I think. Having the code here always set
result->attrs.secure before the 'return 0' avoids having to think
about that...

thanks
-- PMM

