Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9B2F647B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:27:08 +0100 (CET)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Wh-00064J-25
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l04RV-0001Y7-Ns
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:21:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l04RT-0000ed-Sm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:21:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t16so8658791ejf.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=unNJJIDkzTftIm0+55s4Et+qCzbf6qOZ5XxSL8NlAKM=;
 b=GfN3f6XQWRpuEcSXDza8G0ffYoY6ECeeVxL9WH8TFv4quw/IJrW/m2qC5RTfhg3T67
 302+/MQs+9TAwcFu6rswMfSGqREL/KrcrqEazbNsfCjyeg/92ntAoCS+pIFUta2pBUti
 sff1EaFFC4Abb1OsyXdTdJpEGfsO+m+OWlXTGvjoyc2dWTpEvBs12T3dcaSwnVyRcwnW
 G0GxdHK56yNtJ8r1/ElmYoAmPczmLEBrx2Zxt4yguZA84SCYZZFR/RUVuXrxLHkFKUt1
 agBA7DkIT7sqFakGaQh9xn9d8dZQh+8afwmtSY/sqKKJ+UW0qnLGnYg/cqzuQY3p9qTj
 Tp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=unNJJIDkzTftIm0+55s4Et+qCzbf6qOZ5XxSL8NlAKM=;
 b=j/2rsRCBH7AtB8tioMpA/omMbIa2NwA+kbonKvvuDtkAxfps5GqocSTbwFULwhTaVo
 Aw4cj2LhG7w6aXCxYFrSrDc4jKO2bguOKN0lxNGlWtds2V2/hE622bDQAEWCrMHv7nZy
 Vqx/v5MW/qZ7jMZ4v++fPYBbSu712+1oV+wuFTS8QaXBWjwVsF3fULkwo8oZNVN2QyNd
 uFUpP+It3mLEzf4w4XTBHuRfx1Y7MwZzO1CbceexyEPnfU0c9i6uvIfb2e+lI9h/i1fC
 1MG312mYObEjE+IWLaPWYcHiUCfvTZGbw82jXdGWMN7Hi5nONpjciKJ/aqHDdvSkjyGV
 7anw==
X-Gm-Message-State: AOAM530QDzhDthHpkiv+EtNO5eIRQcu8eA2ztmXGqqX9Opef5rN4MFFX
 +CCiRSidFHezPjP0UM+nQ59DVEKSKD4dL/SE7ZSlkw==
X-Google-Smtp-Source: ABdhPJxj43dahrShvRbNOv21OFRMXfkdiXTlsJ8whTm6uD5smC1H4lirAAdg4ust4627Sua2Pd9VakA8m4xGpaalShM=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr5538435ejf.407.1610637702438; 
 Thu, 14 Jan 2021 07:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
 <20210114013147.92962-2-jiaxun.yang@flygoat.com>
 <8d1047c5-9049-6b4e-edb7-386de792f4cb@amsat.org>
In-Reply-To: <8d1047c5-9049-6b4e-edb7-386de792f4cb@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 15:21:30 +0000
Message-ID: <CAFEAcA8W2gOprJJ7r6bKgsG2r5a6_w5anTO77omuYTHqJcSSMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 15:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> A SysBusDevice should use DeviceReset. qemu_register_reset()
> should be restricted to non-SysBusDevice devices. If there
> are no other comments on this series, I can fix this when
> applying.

The device also seems to be missing a vmstate struct.

thanks
-- PMM

