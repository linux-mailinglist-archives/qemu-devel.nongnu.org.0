Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C215A0229
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:36:48 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwBC-0006cJ-Uc
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw9A-0004Th-Hq
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:34:40 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw98-0006Mb-L3
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:34:40 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3375488624aso457659797b3.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=v/xqGJyvZYMKKfbROmLr2EAVrKfTClhX5pgkPYTRyeQ=;
 b=e5wKHKjgagG6++ESRTSOqUqWaAH2SK8vcLJqM6/IyneHg19uyTH/YDy3iTBYUsKyGQ
 X/u4vIebWMksOhZcdfo+NKvL+1rBLQzHPNk+23h5yu85HHJGWu3wiVhuxuIh2ak1oNpb
 joA2MWkaRmMq3W/UKEu8rVph3LrzSvd8qM7THb7oculOEIQ+fc0drXTAck95J6xlVLYo
 S5avXvy2IIuPI1C0OTEDeL2JbRtSPLa2nNfnyHg4bvxa24RXhlD1yShR9/q9yyM5IX78
 36devAIzDqEnn1D7WlLLR09NJJq0D86ucJCMkbgsG4PxAqHZFo8sshmit+an4o6gouPJ
 wcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=v/xqGJyvZYMKKfbROmLr2EAVrKfTClhX5pgkPYTRyeQ=;
 b=AxhNzpv8MlLeGIy3IOy8F28w15o59pCdvc8iQ3yF+8ikub2EmQWIHVOQhHx1mN24Y0
 QsamBLGCnnIlxsoePQFw8hoO8U5Z7UoxU0wkKvi1QWMwo5KwQqCzQF9joQTiM/ccc5Lp
 yCY0qvhdePuRmasnV6mjd2EzYDDyUEqzskva4n+UcP7cBzkKFfiTKiLlhYS6qDsDNCDg
 5x7S/Kwz9VNLt1TP2uTHPhZONeL3JeAGxpdfIQ61Y0a2tPZUrKEEKxfXZn7BEjqpynBJ
 rCtVq4qb0fDOg91p8ISqYSQ7DziHPEwnBSkjfdYhGC201uytPrUijFlFoWwzEUFuXVoS
 UFww==
X-Gm-Message-State: ACgBeo2ELitBApAs61tIY9Y5x46EhEmTa3APNUm5SCZA/xp1D4JjyhVD
 DrsMDyi9oU84V9Z2jQ4DgQ5UamWydfWxksRFClXVow==
X-Google-Smtp-Source: AA6agR6PIJVpHv6jZCMS9IMUNbBoJwjugiHgODA5HXghkZ+5s9rgw/wI0g8SE1hiaZwcdNu3G90KMTpcnyRXU3kU3aw=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr742302ywf.455.1661369676566; Wed, 24 Aug
 2022 12:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-3-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:33:54 +0100
Message-ID: <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> dt-validate warns that an implementation compatible with arm,psci-1.0
> shouldn't have arm,psci in their compatible string.
>
>   psci: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
>   From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..527918227e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
>              const char comp[] = "arm,psci-0.2\0arm,psci";
>              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>          } else {
> -            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
> +            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
>              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>          }

This doesn't look right.
Documentation/devicetree/bindings/arm/psci.yaml says
"arm,psci-1.0" means "complies to PSCI 1.0",
"arm,psci-0.2" means "complies to PSCI 0.2",
and "arm,psci" means "complies to pre-0.2 PSCI"

If you want to drop "arm,psci" then you should be arguing why
we're not compliant with pre-0.2 PSCI. Maybe we aren't and we
shouldn't be advertising it, but you need more rationale than
"dt-validate complained".

thanks
-- PMM

