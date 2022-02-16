Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53B4B8FB1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:51:21 +0100 (CET)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOSW-0007Th-Jv
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO8Z-0001Wx-8F
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:30:48 -0500
Received: from [2a00:1450:4864:20::42d] (port=46671
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO8X-0006N6-FK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:30:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q7so4613838wrc.13
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBUm0YdV2EE79xpUeJWWQEnL6VxDFYRjfpbc3mKWXw0=;
 b=y9rIHPlXNoi+KrqaNOSYDqpysoZfMXwoe1WigX/ec4GBMQTKw1bAEbjFBnY5zj1pgr
 u8FoRd9McNI543zi190ApODe4meOHTeB+4fMkBowEk+8915K9KyqEvgBRa5PC6wJSEop
 lXDqEjykdx61dVcXpm+RNSxGkjat8VDFRScbOqrjIwmnjlm2GALK/xyLBJuPw15OIRVd
 qM2YdJuGKlSIA5YjxFs1+1jfgo3266hDyLRDnWBPieg89jJH2IHURpwRFfcUir032n4B
 l/pnUb8Bj8z1PEm47z8si8Fnmb8LgBxgGAIpcmEVZ7AHPo/FeyYKvmJd2gdt0TLzjsYy
 Fl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBUm0YdV2EE79xpUeJWWQEnL6VxDFYRjfpbc3mKWXw0=;
 b=vhZyiFJgCpXmoPKqE/HNfIo5cXOnvmfNZr5YYQxRsRx9sC8qZewgxalEYO2XKsedXw
 shhmDp+g0XF/e+yh/ZZT/552jOmaBnXjtCW72KP4mpYDtIMWoDRfk44sCHSWSueHro3u
 4Fe/W1xn9dw8dB87ZsCH3FQB4/YpRRdcZsN99ODPNCMtYaXXAJvHrQnmSI9Erpgor0GQ
 uNDxc5sH5ZpItQDic9K54FQNiyQ+AMRvOXZMmEwiPO9E+jWMgV/YrUweEfa6JzhVaoPE
 SBjSejY6SFAZJ/+n4iKx8LvK9rxPh7TAb/EWvclaHcbTLmNk8WrCLOkMp4+C9//IfmNj
 5LVQ==
X-Gm-Message-State: AOAM5313KgconK29K2c2Pi/WrpZL6yu6So1P0dqDHV6dCzWFeTdN/wgF
 mM2p37sRa1DBGeoIkxNMIJ584uzcbO5iqhQjfL2ftA==
X-Google-Smtp-Source: ABdhPJxnRCcy/Ye3OKdkB3SV5RECGk1d6n3DQI3hq2DwSF4E0Z/7SEVU4dyllEMl0ANx8NCjsK4EXkqhuEemOZdnYDg=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr3188214wrr.172.1645032622226; Wed, 16
 Feb 2022 09:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
In-Reply-To: <20220208181843.4003568-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:30:10 +0000
Message-ID: <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 18:18, Patrick Venture <venture@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

