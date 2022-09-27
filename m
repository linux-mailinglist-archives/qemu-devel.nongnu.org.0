Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C695EC35C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:55:45 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odA7k-0008N8-OZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8l8-00025K-TW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:28:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8l6-0001r7-8J
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:28:18 -0400
Received: by mail-ej1-x633.google.com with SMTP id lh5so19980184ejb.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fyr3HBxQzrlGmi7Goxs52hE5WCcTMKbyWhepeUcM1QY=;
 b=UIEhepmfY9j8ufXvJBuA5VyB8Fv5Ttldtf5GMpz1pJVX7DzyHxDnolLOu2N2tuuMS7
 2XiUtBQ3Gyx4ooPaQwCcMlVixv2KDgfvX1heEKPSOCRX3+SXdstMIzP8hChLp3jDIkYn
 xeeXMlpGlYCgkE1bqgqWpnrn96f/4p7dfjxsNIdbU1bghs7eRhCRSXNpv/5O7HtYVdXA
 WQ2zSpCSOjozOgsE3RqWJ6alu4h7wKyaM/Qd0dLdEAvEeLUwGs853rc0kIC/f8Io5iFc
 2COvdRI+mMagBaI/Tf3Gfrf35tapleRhGCvgU2D3xVZiW8vt4N6qfiNZ/i2k4ruc+UCx
 AWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fyr3HBxQzrlGmi7Goxs52hE5WCcTMKbyWhepeUcM1QY=;
 b=Fa34uuemt9F0w254byHJFd+E2YbT290p1EWxDwSg83FwqKaEPiIdtBHshoaz/QWAeS
 lnQKFUEkac10QtEmUomTLmXstgQiTF5xdMKScVmV77Syvi1zWgK6YKiQImxfa5FOqeUf
 u/Bc/CjJAM+MH/7FU2yAoi+kbyaoHLDALqcIAHnsJq+DM3Zz+PwT1dMTMbA/UUGzQfKm
 wpQoY8FmCbZfIqqYWMqz7Lr6YxywDjIxMyp58J3vDVZ8fuK3qkZWZpu9DgsTcjY8p7RA
 BC+C0/UEP3LiWu4LuYs2jd2QcaSUKDNwfB29r6bBwiwRjHf1x0zqkCn2K684C2CkCngb
 J80Q==
X-Gm-Message-State: ACrzQf3LFc7K4xv3v2FnW+exycuvRgnauhNQ3Vhq/KxdYnIuNApG1y25
 7F+48SEDbFW+CUOhTzPYgHTBGrsSftqLgmRnSW1mIw==
X-Google-Smtp-Source: AMsMyM4QM1h1yie+HywtXBHCY0k8QxZW0YpYZFrQNSRftU9ub+kG+WpYcUZ72fu0uLP3YITEq3JDE1jdDK0ZoKK3TiE=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr21816379ejc.619.1664278094911; Tue, 27
 Sep 2022 04:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-9-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-9-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:28:03 +0100
Message-ID: <CAFEAcA8uuzcHS3B3VY=J38gSrZUhnaTDKq1ei0rwtJtoG843bA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: Fix devicetree warnings about node
 names
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The devicetree specification requires that nodes use a generic name
> where appropriate. Fix the corresponding dt-validate warnings:

Either:
(1) guests are looking for devices in the DT by node name. In that
case we can't change the node names without breaking them
Or:
(2) guest look for nodes by compatibility, in which case why
do we care what the exact format of the node name is?

thanks
-- PMM

