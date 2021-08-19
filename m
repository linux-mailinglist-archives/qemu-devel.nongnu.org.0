Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC43F1A53
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:25:44 +0200 (CEST)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGi3D-00009l-Um
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzs-0004UG-MF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:22:16 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzr-0005kj-5e
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:22:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id x11so13041188ejv.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CUPej68+qV9NOcnmJyYg6aATIpM96MYKxG1Yepjz6vQ=;
 b=xmYMDeP/RK8n2rHNEsFKMKar74mtyvlRhShH/+9R8adlrDErdeNIe7l255kguTnzYa
 ePYUnIHsrKqOOvn0gUDzvxEPa/2+V3cgBLv4DgABdYkTKuSfeQ8okIlaknSUX/IPVPDF
 zdbn3AXwz1n+Ne6MBvlLy0bmQ0onTS+vQvQBxnUV/HfbNTHk0qhuq6XENsqyirJQw36h
 7giBd4gf1w5M7P/Yi1dsvxkVfgKzatMpUD1lajS2pwfPrS8HoqzidmfHVGVpiaZepbHw
 jqymECnQXjVpTt6v28CvNUIgm5b/HJ6gL4AEI3LSld7pu0QhV1V7ZRmGkqSO4/Ofo+dr
 Lo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CUPej68+qV9NOcnmJyYg6aATIpM96MYKxG1Yepjz6vQ=;
 b=O0BnupBz1+fuhWQRY1dkV2Hd7IUp3gjdU1SqAEQvbDT5bPnBj1MqaM8Na6f66jIXfL
 3OSU0xDSUUjhDGk2AWSck2Oz0aupjTghClBbxRXJmJJo1d6ALdWFJwwgMC+cIlq9fFSB
 bTELe+FGok83fCpm+AWfNihNne9C7KGPoBezzmd51o0h+4qj8SfjsiqAfMXenAaI8i1o
 PzFCxNkOl9zuL5+w2gK/eV9f7OiWAWg4OHrTrnsWMlPGJ3WxQDAB+quiuiA4BtPt9l8Y
 bvMWIdX1vBAhosxMDbrew/6RD84bgldRpgS0uSUT6/p99VsLeF3p2rm/5M3WiyM6irdD
 tVkQ==
X-Gm-Message-State: AOAM5330we8KD+e07ge6FsGB5Lu50gWFn3P9Ozvoz+lpT9NmNnW39Sis
 qEufGvYybSNUUAwI8W2Dr5MQv8Bh7iKZV3GjFnPYYQ==
X-Google-Smtp-Source: ABdhPJy/AiiifUyobI3z9zTmVuXRKuYlbbwXAtWv1SnhlIABlSwaQ+FL9U9oFeXRabTSf4lSC/JZGYMhchkHlA2M54g=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15330712ejb.382.1629379333709; 
 Thu, 19 Aug 2021 06:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-9-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:21:27 +0100
Message-ID: <CAFEAcA-MnRq1TpYO_FVvpH9i9U3cfnU4KkPydc87v7MpsSNiuA@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] tests/data/acpi/virt: Add IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added expected IORT files applicable with latest GICv3
> ITS changes.Temporarily differences in these files are
> okay.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

