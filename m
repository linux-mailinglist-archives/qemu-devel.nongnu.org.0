Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8650B71C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:18:21 +0200 (CEST)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsEu-00036K-DI
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9p-0000iJ-Oe
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:09:02 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9d-0005UJ-KA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:09:01 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id b95so13872867ybi.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+91j+eyuLnBb0q8FeQycIi6f5Iut7p73vFWwqDQ+9s=;
 b=qBiAmSkmsWnpfAeahvQp78ztBjQxfGHMH3fLfiDWto6th4DZDD2n7qzTCzKAWmJb9E
 MGFG3CwBgV9GM2jUECESmb1t6TTRhVN2UUOcOauvv6ELxY0LOdi2ReOwMRiODERgoDyn
 qYJnnYkFvclyorywrShklZmzdQB5beWXjLdDUM8P1fkHt9Nxtt34XFhRgPZ55jMOkI22
 fKTBDDcC5KXX00K0DWrcVnDMAU/dTqbovVphWYzMyVjgDV+SqCnESeJyoVrPjnUiA+vb
 o+HUfu7D5F7T6L4BwUao3KbxFuS1u6d4KHhI/gXR2/rZtGe2CxvUnSSyel2Ykm6sR1UW
 oVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+91j+eyuLnBb0q8FeQycIi6f5Iut7p73vFWwqDQ+9s=;
 b=Xe2E87/6xU610Y5o/Bgr/iyV39Vn5paOJx/1ghi9JZTP8gIF+r4x4/Ma73bbPWrtAN
 aHfIL1hYYLv6Hv8vji/9xICx2SakEvS6RpaDJnhzRUC1tZdBI5Eu1b5lMNerBlkRoitd
 TVwBIo+s+wTxD56rtnJTMux/8bHEs23OZjM6H0T64gGcmjRoSqwMnhQ9GfYxeVZwZjnF
 3YNpb1jhSkUJKuGzVIvlp/hMfQQE/ovD8g+i7N3dKO4G3z95z5wPdzzn6Y6qa9uz18Nd
 GGaD9zeYfSR+2ul5c80/Z1l6s3LoIzejWIH6M/viRJ08r8heDr7E6ANIPO/jC8o9HjRQ
 yrSA==
X-Gm-Message-State: AOAM531w0SZpeptBhOU5lR6R9OxHSPQHKk+6HgULMdAGlIBnzfkNhIMh
 y3pHKgpW97opfk9f8wN0nvgDJx/oeRHruQv2GuuySFUQnyI=
X-Google-Smtp-Source: ABdhPJzCD5yrETdBcJtKcJj1vX1vMr2Ln5P02d31joHsyUp7a5WBo+WSkmw7YX0ECqgk+brEetTAD5S6k8Ie9eBTnmQ=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3806471ybs.85.1650625726246; Fri, 22
 Apr 2022 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-61-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:08:35 +0100
Message-ID: <CAFEAcA9GqUEyJKVeb9uJBV93LneGdRDeThX2fr_6sF=T4O_OYg@mail.gmail.com>
Subject: Re: [PATCH v3 60/60] target/arm: Define neoverse-n1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Sun, 17 Apr 2022 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the n1 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

