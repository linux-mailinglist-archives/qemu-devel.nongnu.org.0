Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7B5ECAD0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:27:12 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEMQ-0001Vi-Mc
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDTF-0002TO-2O
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:30:12 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDTC-0006zL-Ku
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:30:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f20so13932667edf.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=g1F7fuHpLZ7RGuRxaxylonKdEjTJir09GHxfLK3EJZY=;
 b=u//SHZpZSSRbP+BjV/WTkSKZNDoLi8hRnLmikD4huT+8T5MZ3PfrWmMW2IIm2kSNnc
 CvFhhHAKYFspInoEsypJm7DJcnk9mn/dV3E2oIS1KzLqvAEuk+1WBT0GgamFspjtLRgk
 qT0qrChkmHBMBVr7HFQx7+iIvkzO3u94ca0NlSUszk07sDPSPjXdLqyCnzsTOAvLBjCj
 hbAy7h509QX/Z/mDv2291gFJz03dEujhZFRQWtla6L9PMa+W43O16cA4SgH6Lsd2iN9W
 QAZHVovdkV6Lgw7RWK8v96uv/uXrm0Ymw13yYDVtC0YQU/pIFSi2+BNwwKPvDafigzd9
 2nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g1F7fuHpLZ7RGuRxaxylonKdEjTJir09GHxfLK3EJZY=;
 b=qdH0osoFr/l7ggC9/yGrlg3kG8ye34iUUWiK8cPmc/VUQPWBrGsJQc9lliDOjx4wNW
 /9+9te4dfAIT6nYfZpkxqVQDU2Q27DiDT61XvpXg5m6nxId2FV/E4eqSu18f/nGwA1j7
 DGebEcEhNm8hQQB/cQ30BsOp8ASOtbIad8Gc59FiwQ3HuxeNoz95jv+AkQrBC10SbA0A
 Wk4U2XbW9+lcI94fP1xdsMtlolFGbhzQ1Quz2D6OSxgvy9gnhxSyBj2pxkfiKyQ3EyA+
 +U/IwjmT5L2Qqac6kNrqVt70HeMP3WUJICnDS52SQo0JRgIAQW42Apkq8WzRYQENU13p
 rv5w==
X-Gm-Message-State: ACrzQf3vllAad+V3G6rFruxOdOnZxpxVoc1T0erbtdluv5i0Di+g2WCn
 bGszBNBjMMALoQElWlDTG8dkw/pDusKKW4B4hi8bvA==
X-Google-Smtp-Source: AMsMyM7xutyKJ9wPay4onyX3bH14Sgjxou3G3fssRGAe7RoV7Oua3fQC2Je1S1iFaLb9ItA3uhA94ndf6Z6o1zQokyc=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr28712715edc.149.1664296204899; Tue, 27
 Sep 2022 09:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-3-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-3-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 17:29:53 +0100
Message-ID: <CAFEAcA8n8VjuTS8Z-aOyYu=0+9x-UoKNue+5kYAV6yzB2qxwtA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] target/arm: Don't add all MIDR aliases for cores
 that immplement PMSA
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Cores with PMSA have the MPUIR register which has the
> same encoding as the MIDR alias with opc2=3D4. So we only
> add that alias if we are not realizing a core that
> implements PMSA.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/helper.c | 14 ++++++++++----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

