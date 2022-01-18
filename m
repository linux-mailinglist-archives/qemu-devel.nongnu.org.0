Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A8492C44
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:26:05 +0100 (CET)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sFA-0005DT-Dw
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:26:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9s7X-0004Rs-Dw
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:18:11 -0500
Received: from [2a00:1450:4864:20::32f] (port=39453
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9s7V-0004R5-Qk
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:18:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso7483983wma.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q22wl6OCD19GypMuT9QWRHowipst+oy+Pq7cX65GDBI=;
 b=XUFayqN3S6FO4rPKr8roe5K/9ilHZSe4lyDj0PGBjfxYK5UPUK9yVoOP1cuzZi4978
 EL7ELnSrMVQtL1DugrfPVtAtJSIY9W+fs7/RXfkHB2QzccKaNTJw8Quj6AapJKw7kBCy
 zZ+HMyYgZvn9L1V9WWHUmuzT0IOQLDQJqJbGehtZvALfgf8Ff/QezpFCPRx7KvGTEUH6
 G8cfFfn2dpLENFi+QttOleeMdDgK8352iOb30OOWBVbWR4NbhjndWOglswuUnm5+5zw1
 J8KquigKXGiv3hUXXABfzkZgl4Gx9eJG63UzqSQX9HEQrxdrwRGhEI0yrIoK/Eh4r+E7
 p9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q22wl6OCD19GypMuT9QWRHowipst+oy+Pq7cX65GDBI=;
 b=YWX87RjLhmOfbPBZrN65wLiedtKRhvDqNCRXJ9KqlIcyrqgR6AJSL57xIVjgSWEd2h
 123Xi1ZfdwMJlXIggQTjWei4x8sd8kWweIZ4k7TZiKyN5l5ZkG+mBN0YB/1Z56HWl+YI
 lI4Rl3rRx6ELitcMvs8gcNgVH+sa5hJREVdUZYt7ygtXValfLssTFIiGD1kno65cWqiD
 vtCwKFTsMyFSWPfSi/wCbd1bz5lrLGVtkcm0hwYuElfJr37iFfKIWErRW2SfZDUafa31
 zu9VfZHPJDbSu/Ykkoy3JcoI1YSn+XGrhzNzGYuoMuCSy0kueOyOc46eDY0a6rqtCV00
 fVJw==
X-Gm-Message-State: AOAM5327i+JEnMoEe7WYzhcLP1T+c5/rAvL8LJBkwF8eB1rjzQzme+ki
 1dXmptw9kuND+5AgDpZR0B9IjHcKUZNf+oEQs9OV9w==
X-Google-Smtp-Source: ABdhPJz8MsvFIKOMo3v6OXCZ/Gti1AwvjDfQH2v2OENrYDIXl+aE+R5HUBYG9wft9NNF4CAYxEC9y6k8jNSNNSoXMnQ=
X-Received: by 2002:a05:600c:4f51:: with SMTP id
 m17mr11463648wmq.32.1642526288443; 
 Tue, 18 Jan 2022 09:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20220114140741.1358263-1-maz@kernel.org>
In-Reply-To: <20220114140741.1358263-1-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 17:17:57 +0000
Message-ID: <CAFEAcA9dFVUY5a9WANrS1UEPrbsUueYaUzneMYhjdn=XTKDGvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] target/arm: Reduced-IPA space and highmem fixes
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 14:08, Marc Zyngier <maz@kernel.org> wrote:
>
> Here's yet another stab at enabling QEMU on systems with
> pathologically reduced IPA ranges such as the Apple M1 (previous
> version at [1]). Eventually, we're able to run a KVM guest with more
> than just 3GB of RAM on a system with a 36bit IPA space, and at most
> 123 vCPUs.
>
> This also addresses some pathological QEMU behaviours, where the
> highmem property is used as a flag allowing exposure of devices that
> can't possibly fit in the PA space of the VM, resulting in a guest
> failure.
>
> In the end, we generalise the notion of PA space when exposing
> individual devices in the expanded memory map, and treat highmem as
> another flavour of PA space restriction.



Applied to target-arm.next, thanks.

-- PMM

