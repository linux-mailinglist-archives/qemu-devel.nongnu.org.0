Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E236C1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:33:35 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbK62-0005zv-FZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbK2o-0004jh-R2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:30:16 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbK2m-00052H-Mw
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:30:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so88524353ejc.10
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9u2x5D3SOubZEe3RPaRcH6N4VCiHCuSYmkbJnihiIk=;
 b=UvSLacxnw2uKejNpLSUzJnZITiwpJusQp0SCD/z0aZ+5reuuo5go0MstucPbi6LBcE
 0qnOZ2vcnzV4N3xPW5jfPK3sIZpp2yJhGIMB4zZB3m9aLvw5i8YRpOng0p9xw5RQgIEM
 8o5WHBAsh0lSOFAciZH3gMSeO/cxiRObCrojN01F+QuKWk7ltqaCW5BteME3ukxejRI8
 tsU4Uyl5325f6YPXhu1A4oSs8f1GvbW3diiXKQLSDtmK05Y1GVzoOVBsF9iUHDYQ20aq
 qgpsaFAnxek+xTBFWqB8BdSIpxbV/LWLyzEAZQd5Ho1YzYUnjVwzDADjLAa5annEvAms
 Ixvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9u2x5D3SOubZEe3RPaRcH6N4VCiHCuSYmkbJnihiIk=;
 b=kT9aDcuKXV/xOnusJ40iaw58Wu9OxommRpoq0FVTGqrfbxZCWpHQcUn8iVVK6cs1Wg
 NU07iLXLbrVuQ4dGBaZ91ZZDSIjaVzAnDTK1p04jwk66q7/BGJf59C53e29SyiwmkANg
 pMV4VptZktrGcXNl/Sv6n7jqiHdvR6ZTO3ZbfhHm48CcB8zlbgDL31Kr23U7F1t6ZkiY
 Jry5VtT8L5oA1xVUmqqawkeiBUBEP66gYzcG04JY3waTuhOBnZsWNl/p7ZlNM2ZHDq8d
 N4ER5wTCf4sqYozfvnAHqKtG7/9ei33jOMzlqr8+QvIGFNa7UKXCbGyvmgQ4smAqypZU
 FK9w==
X-Gm-Message-State: AOAM532S+cjw2Cu+d9Tllg/GuTSKaagR7H69zJOzD9sBVvdS3kEuLeJD
 a6PRcwKn4tOok1XzXNl4tJWjCu46OKqQSc6vkzrOqA==
X-Google-Smtp-Source: ABdhPJzJZfE+7Z3DBjjlitoNnW0LtS6FGvBzRe2CA4bO8ExtLHww2hKX5bDLEpf+Zs8bkCl+MDSSglwYtWc9aevcXIM=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr22721695ejt.482.1619515810486; 
 Tue, 27 Apr 2021 02:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
In-Reply-To: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 10:29:11 +0100
Message-ID: <CAFEAcA93EC1+ctNi3uh7vXP3F+zV8kunEXdXTHkBHqd5L1Q-2w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/6] target/arm/kvm: Add an option to turn
 on/off el2 support
To: Haibo Xu <haibo.xu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 13:55, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> Adds an el2=[on/off] option to enable/disable el2(nested virtualization)
> support in KVM guest vCPU.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   | 11 ++++++++++
>  target/arm/cpu.h   |  4 ++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae04884408..30cc330f50 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1349,6 +1349,17 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>                  return;
>              }
>          }
> +
> +        /*
> +         * Currently, vCPU feature 'el2' only supported in KVM mode.
> +         */
> +        if (kvm_enabled()) {
> +            arm_cpu_el2_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }

I don't understand this. EL2 is supported in TCG as well...

thanks
-- PMM

