Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FB6885CB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdqz-0006Pt-GF; Thu, 02 Feb 2023 12:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdqx-0006Pb-V7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:58:31 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdqw-0002PI-HF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:58:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id e6so2627680plg.12
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WDUufeD4urBHxMtx/WT/mhl2y4uXGjnOKa0DWhCPUIw=;
 b=yWM9/Ii1UvhP2Ai16+cQgGMKKNTjAfiO3MGtu0Lg5HYNIC2pr+a6hpfFxqo8ONcbDb
 dp+0o5lBwh/JQ6Lur1o74aPmPqPBclfL+ejeCMci6GC3XSnEMH5zMn92jq85xQDHvuZ/
 Lw+o6PnoQ3jcUHe0Jrg/5G7o7rcoK4z1O+NWkSNgAusaKav1MqXMmQHMt5KVlA1Yqo23
 79MV9UJbjh+M6Im/LvlhHsiXLs3j2xVGc7bP4AMuZ0Yo+B9jYfbOgEXc0ORXOeZHnuAZ
 3tV1z5BLWADstbEa/RI8UpsT52jDL2uZy03WzMyyS73urgZ8KoegU3PBKQvIHwrvaAQd
 uCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDUufeD4urBHxMtx/WT/mhl2y4uXGjnOKa0DWhCPUIw=;
 b=k2ZYY4IVlASD2HJJWm8qG9XJjLihiosOsOjnDL77GOHQlA8UaxFdyWVp5i5GG28kEK
 VJ3XiDcGD6cemYyuxda4Leji/qXv8EAK5s4hzdRJ+k6J6qffAlCnnBydcrspLd4j1KBA
 cCWKQ67CYU24Rc3V5iohICmsjJYMMpkXMYLtSineKpDeTSlOomtnfAJQhxNGtJyZzmVX
 ndQR1GMOQdJdlssWjnyKdWU/8+dmUEB9EnP12cVanJsK3KCxVUD5phRaUTcXHzkL1HfQ
 a3LkqWKtaGFg/n2KTMgz3QSUasZB92EBbtzoQXtfEVuAnbomUhFsgMNFGodqnphRPpB2
 5zYg==
X-Gm-Message-State: AO0yUKVDhvjPfeslX4sv8mcAwUOuuwFjmcK41wdiXpptiBzjeAJaVsft
 M/eMaydxbpHzH7QQSIHWxkCi6l36RTspFLAikeEMBw==
X-Google-Smtp-Source: AK7set+v/yTKiXCg6kSni8yZ8DBLivu8tJ21ah/wnNTes1s3smVi9S5we1sYX4AhyKBFbgk5p2wbrrKJHoVZuck0eHo=
X-Received: by 2002:a17:90a:5a42:b0:22c:19cb:9489 with SMTP id
 m2-20020a17090a5a4200b0022c19cb9489mr670657pji.137.1675360709161; Thu, 02 Feb
 2023 09:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:58:17 +0000
Message-ID: <CAFEAcA9fwuSNBX0oY_Gr5jXAQQwufzkaY1zkySkTtB8Gyh30SA@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 26 Jan 2023 at 11:44, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM

