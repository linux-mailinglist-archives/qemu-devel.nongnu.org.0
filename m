Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F6258165
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 20:54:16 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCowZ-0006kj-68
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 14:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCooe-0003cH-8b
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:46:04 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:38949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCooc-00080O-Mp
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:46:03 -0400
Received: by mail-ej1-x642.google.com with SMTP id p9so4145269ejf.6
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngSNX6i61oKRCCMhSARmE2Ll3O7TRrfnNO3XpiZ87y8=;
 b=ZhI+ac9ejsHUUMkFwh0hePC85zvhphqVjUGlQMSw4Tedfe6r5A1idihtt8SKz7kFYt
 +W4GUUizaxdkFBSsO45eFJG9zCbF6y3fM1axByEwsfPVbdStE3orA9+kxpsD9GKVWLun
 Dof52xuwQoSthAV+yFF8ABJtzuaszbUfdGsPNOQdtIXhybb7zwJr/6d6q8nzn0xJEWvx
 yheQ+dOWFsQB/u4fdW99voiKaWjMS84mi+kP7+jYJccC7OT8XDyhOvy2Tf2QPxHZu3OG
 NuoJmpvBSG5ZIBvbVJeeRVWIIa8Kw38MqyVcag9pdBDGqP5WnYLGJeIrR/+dVqIzEkqr
 j6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngSNX6i61oKRCCMhSARmE2Ll3O7TRrfnNO3XpiZ87y8=;
 b=QNhXG7evUgEJPqIEXbF36QwCvoZxjQQzO7kYcBjX5VKbplBjiXEfkCir/2tUUJKEcE
 QtZLLarINK1op8h/AWuntjx2X+sPGU1a0f+SW9iTy3nObg0457X4e2NqKxRV/3XAh2s2
 hKBPoCFaudt3TBT3kf7h3JcMwO4B4zWlWmtjGPst+dU/WDRIPjrQ9eBjpR/MDgG/EG/e
 +ElstEJeDbuXNR23PPn0u0MXElJDi0o5xxq0cbU5tDzAvYJox/ZXmFStZvqtwN9WLdcQ
 LZXajwccKPQcZG60cHz5hc58V1+SNv0IyjhRl6MI41/S0DA9ZbOW1wbTHTiK0/mM6zhM
 rMow==
X-Gm-Message-State: AOAM530DC8ayp9SxEwnIg2JZCogS4crMahgJ1dyXY7Co9SUc4lO1jD6o
 zKDAJ/zsrXWdo7+FFnbTodYFTeg9o1WBwrd/2Wl6rA==
X-Google-Smtp-Source: ABdhPJyG9zsD/MOPkOT8rEnIWYNbuCNCRbuGsE+PjIeWeurv1ZXEVi1NeC2FZW1P199UAh67UobtO0uqbOlukLEM8k4=
X-Received: by 2002:a17:906:71c9:: with SMTP id
 i9mr2203762ejk.250.1598899561319; 
 Mon, 31 Aug 2020 11:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-45-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-45-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Aug 2020 19:45:50 +0100
Message-ID: <CAFEAcA_wEKdnYwy4PL0qCMRTwG82P8aJhg43Go9wSnbuk8N_CQ@mail.gmail.com>
Subject: Re: [PATCH v3 44/74] imx_ccm: Rename IMX_GET_CLASS macro
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 20:22, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Rename it to IMX_CCM_GET_CLASS to be consistent with the existing
> IMX_CCM and IXM_CCM_CLASS macro.
>
> This will make future conversion to OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v2 -> v3: new patch added to series v3


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

