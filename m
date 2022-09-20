Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430E5BEEBB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:49:03 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakAv-00015x-Rl
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafr4-0000VT-Cj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:12:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafr2-00075u-M3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:12:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id go34so7414543ejc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MTZQ0ZKgObtmtbYGay8TqRoKaepCg/5wsIJnL82JaoY=;
 b=lGazIORBG2kmJ95qYHD9PS44EVpHRmI8l53fnYdVjNwHmBisyNpgT1J4oa74owvEHa
 bS0rKYDDJh0RKwx+TxwRIFyDkzhdojT0vo7G9QFcZt+/4MsH65fTlYTNFuhMUOFZb0+I
 uETisVs5Plj4z4vglx/SjYB97u9mC1eY8s/yIyL1WgEQYz3Re0dzRVuQEvPwJ5vCofb5
 0STUrR8rVGHdm30zNpBzTTXs6cuYxpm6HaMziOWB+OhSmONWFnIW7kWDP2aYStV/qr33
 insWnepw9rhet/O1zugbLzQcTQw1Xeyu9CVSEgAJu1ny/kaYWZSCkGaLl9KW6m6jbCIt
 sw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MTZQ0ZKgObtmtbYGay8TqRoKaepCg/5wsIJnL82JaoY=;
 b=b2lCBU9/+HGTl2Hnzi4Hf31GJXz1B/7wR9TZ6qLg4BUAVyWzCS2NrgphpHrRgBwm23
 3odqwPNnP5Hx0uo8XSYgDyhAOBNzxPpKg4SXwh0YpgsSuy/tbPTU8nRasmFyjyvAGQie
 7RAzzfUGf5IPvUIU3/ZuxRFPa13C6KsS0EuNE3fpKkduFBnspVPN4ou5byIiNUP60HCw
 Sckv92gYh0VGdFL5NF491Yf+xwmIn23/bbiiAadn8d/GVesHIz91Op19PVDR8mzBbR/P
 nNKrR/GJR7aFGtqCVOmMoOtVjtVLvaVKUGlKHmoZLPe6T/UVVar/PCgzdLjsK8MAzcZb
 LvaA==
X-Gm-Message-State: ACrzQf0/VRt3rvoIlAr9853shPvq9EW45EPE92FqFQGy3kmHzDCdJzQw
 3B7wZL6OByU9reQJ5BRzUZRZV6reNhBiBhgaVtZm9Q==
X-Google-Smtp-Source: AMsMyM4pCs0f6zQ9ZfL4glTJ5IQB0QftKkDowPSTU9bnKlVQjiOgSOo+xB8u91LQyA7cbt9Ab7gcektTMWNDvXBcWnE=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16839389ejc.504.1663690331120; Tue, 20
 Sep 2022 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-36-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:11:58 +0100
Message-ID: <CAFEAcA-_gtGO2bgR7G-eUrcq+vH0__ixBMDR1PB33AeMDDkpmg@mail.gmail.com>
Subject: Re: [PATCH v2 35/66] target/arm: Split out get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Mon, 22 Aug 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
>  1 file changed, 74 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

