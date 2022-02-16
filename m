Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734894B8F1A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:27:33 +0100 (CET)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKO5U-0006Uz-8C
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:27:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO0k-0003JO-IK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:22:40 -0500
Received: from [2a00:1450:4864:20::331] (port=34552
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO0i-0004wm-7B
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:22:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2853413wmb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QORcjmEXUGfd9Xa9zPKbWb2nXbgIoxfbWbX9GxZufTM=;
 b=uCT9qOUppLiu1E4bU2x6FMO4oVCUxMAQj7Xl8NXd0Gzs3qxADI6fDT9vpJh/T7B+AW
 +kfoPMH7CRLbt+a5bddkWm8by8H4xsQ4snylvWml2s9jfmgMjD/qWPVAtHPEGEh3evCO
 pXLILpram1bVmvj4dyKvO+gGLnK5n0wU2CVBmwHXx3e2W09iNLMqh/A/j9Hiq0ync9r7
 EId7M9Zz0hj+kezcM9gNoKSVjsyJCkhhokqUBPRVIQlx5fLD/PcNwgRdxxjBJ6Bnbrt4
 W02lWs2+84cN27bIadI45Ioato5fgwDH7Ov/WTUUxxFklInxowss7fK4xOOyryMAxa7h
 902Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QORcjmEXUGfd9Xa9zPKbWb2nXbgIoxfbWbX9GxZufTM=;
 b=LtUQ/4wqX7gYWt1fa0/mJoGCF1dsoaD3b6Gis9VF5LHxBFXosm0ZAWLEoHfiXinzMg
 eQMS+Cw4WNp9ycXljXaoJhg0yEd9PN5+dyleBV+nC4Xe2kTWkSz1/zitFUEATwNS6zZr
 dGAZUZ1RsBeKQtsH4lVyiNISuhmPjxovJPxd9MxAH2myF2RpbCsFN6rwHpXnyrZAcgHE
 w/NZbvX1MNBgy0ccPv11t+2UrouJKi9xsTnz4JEv9pCeBiiwUKncGl/I+hmj06ECtzzw
 wvweKbnxpHbbNz0YE5OjximYrqK64IRc7ZplnaxntPLeTJVEsVCth3MaHOtYJV6rXSZb
 TA3A==
X-Gm-Message-State: AOAM532slseIbMoxp33I3P6Ql25s7gKGoMTcH/qghG+QcSrj98jPCtSZ
 azrN4GJFfmjiSb/eRHda8nt5wigY0NceYZ5dx5gGQQ==
X-Google-Smtp-Source: ABdhPJxVyl+27gpXSd96EU9dg0T7vjRDEP5YrEh2ZjLI7M1R7r3O8PNKy2zdItV8pu9Lw5rWfEqdFUzAyq5bi7I5h54=
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr2583928wmb.32.1645032153378; Wed, 16
 Feb 2022 09:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20220131122001.1476101-1-ani@anisinha.ca>
In-Reply-To: <20220131122001.1476101-1-ani@anisinha.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:22:22 +0000
Message-ID: <CAFEAcA-P1ectf3BNRq+i6z6RAgawJ=fSs7TZ_EkK0cALENq21w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Adding myself as a reviewer of some
 components
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, atar4qemu@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 12:20, Ani Sinha <ani@anisinha.ca> wrote:
>
> Added myself as a reviewer of vmgenid, unimplemented device and empty slot.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>


Applied to target-arm.next, thanks.

-- PMM

