Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FD53E4F7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:07:38 +0200 (CEST)
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDOL-0006MW-Ql
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCja-00007j-Tv
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:25:31 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCjZ-0002vd-Er
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:25:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ec42eae76bso142757317b3.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PG5BLRf+s3MS866Vujfdfb6AgiJolKj9pgt66MCgEI=;
 b=F42HkAaTfh6Io7wBdebUlkOETz3gZvJtEcO9M7xlg7yhBKPbsKA6KXYEhFo3Bd5OvV
 hThxn5eZRmuai6GTWpwnTg7RQcqyO1mOuSbBLf5whDOiC2otYcDwHqgNO62NYgFkGEFe
 gERPHy4x5DxPD/BR2rekZvpCdPROlE3FWashI96fchp/yAvldySRwRLbUB29IEGaxzzw
 AggxxRNb9+2BLbRRAUbhbcOizoEwc7hSHT3tJ2IbkQfefcw3tUjY76UicDqiwOmdfnPh
 FRWhfHhFQFxAOXi15If758O1kY6EAcAZVELc0sM0hevbkwfrI5HPEhZNGtYuaJ/eMpbZ
 40tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PG5BLRf+s3MS866Vujfdfb6AgiJolKj9pgt66MCgEI=;
 b=CqNCLy8h9OQWpyijNF9vdvjjjPb+g7FNyz4q6UTpHLLVUNw26qedMa/jGPEWKOZDj2
 hKFa7pbz6rIZtsSBGpuAS1X1OF1gkDrxqVHiEYFwISOxxPeE06Ei21xATmuR6Kbnkj2o
 R+Qediv/WrSTxQCOHiGwQI1SxDAYbkgtumPAGY4KyW2KClzy9xmyp76S7p9KYGHGj+mX
 a+kS27+JTdy+P+saXrqR43Dap8VKopf1XRB6mvIpwDsi947ej6VBbckqfoA7eMhTFSyk
 DutmQnINvW4zj+ddbcu1OV2hCZeRBhzkYy2xhc10jryoDofUUWFODPEh7LRe1eU/Rfqs
 yrwA==
X-Gm-Message-State: AOAM530qheauDzWByqFolFUR0I/igNcEuN3CR72H1EBzE/hAbUOn98PV
 XYX9mmHcMazrJLQB91X0H8Zju8WWdfOlVd3K3M8WLQ==
X-Google-Smtp-Source: ABdhPJz9tMyUX6ug3W5cJ/n4DZmYKYIwILZDWB56oMkMbklrm3sR6+RUfdhCHrERL2jcaHs1sqVRHkAd65K7WoF+NTU=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr27184276ywd.469.1654521928331; Mon, 06
 Jun 2022 06:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-23-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:25:18 +0100
Message-ID: <CAFEAcA853A-n7w9_jZ5VgQrLCrcE-JLHHQTcbHmdMiEsyxJhSA@mail.gmail.com>
Subject: Re: [PATCH 22/71] target/arm: Add SMEEXC_EL to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is CheckSMEAccess, which is the basis for a set of
> related tests for various SME cpregs and instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */

Cut-n-paste error, should say "ESM" not "EZ"  ?

> +    if (arm_feature(env, ARM_FEATURE_EL3)
> +        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
> +        return 3;
> +    }
> +#endif
> +    return 0;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

