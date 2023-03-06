Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C461D6AC5A0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCtq-0004gL-I5; Mon, 06 Mar 2023 10:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCto-0004U9-2C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:37:16 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCtm-0002qa-D0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:37:15 -0500
Received: by mail-pj1-x102e.google.com with SMTP id oj5so10144586pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTnNTvfx3q8dEk5mRhMg4ajM0st2E0VqcWfp8xj/PwA=;
 b=VEw18cm1p1Wkd0Z1Mld9KjXSmYMl1zweSOcGLU8jf8b0iqeJgjUlXSlLdkV78EWrjD
 q5eV6ELZ8FvG4jGjVBLxM/fjqqSNt2qWL63pLu0xiArZ5322l+10HZJ+jm22GM+RHgFm
 kNx2kgshwnJRW0dA1DIg88pN8WtaM0RlO69f3jyCIBPv+Zj9Hi9Cuf1MylnNePxNJbwo
 uN97S34XV4CT42nK1rGEZE5QypK9Tzknse/Brn0Pl4qtcIeU1Aba8t5MQKRmTaqeaJiW
 2egCBs4xipWW4Uj/2JCU3iITzMSa2POSXfPD5bThoIv9aF3iJzn9+os75p7p8a9uuquh
 04Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTnNTvfx3q8dEk5mRhMg4ajM0st2E0VqcWfp8xj/PwA=;
 b=zBHsW+z02NbKQ1QRSrfUFY9eBPV8FPgoskk3Xa8Vwjw+bu+gKwXw22SeqiqhQulyKi
 UuPSfPoeGn71zc+4QejOgACC7hUVtkDNe4zJg4gVGnA/rUrtQysYGEW+NSHYTY2kzWwd
 njZYpDyOXFuodtmI32OIGaw1pdtoeSblezgpHkBwXKl0LBqRvp3UBUZ7vCyMkItzfojs
 kvirSu7aadACrBEj9iKZI3VkT8tpjELwBDNHb3TV9ztKvasqmLhgIP2NsiZiJsCQnVVB
 GbQKfH4TnOc65LxVoWujuIVbFZXyVT/a5BrfbZOEo7TE/cRQlFhSwM3jyZkxZttoxOVw
 RZ3A==
X-Gm-Message-State: AO0yUKVWqSZrFnGw0IZQisDrBVEhlnoIWFWONFVS7JUXxEbPWhzEElcX
 zvdgg/Ma8P580+7K2PMuJbP4K5q6uTm18dFhlpLDUA==
X-Google-Smtp-Source: AK7set+a3X+PAo9ajzSy0VtppzFC9lwWKRoJZxeHzgMQx+bnFlPP6OsRWP3Hg17/9F/zoDfe0qhrjN+ww3d+AwvYEPc=
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr4219748pjb.2.1678117032826; Mon, 06
 Mar 2023 07:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 15:37:01 +0000
Message-ID: <CAFEAcA8BJO2iVG_KQaFBV0hvAmWn4cV-vC8QA5CC+iChMuHyXA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 6 Mar 2023 at 15:12, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Did Marcin test this version of the patch ?

thanks
-- PMM

