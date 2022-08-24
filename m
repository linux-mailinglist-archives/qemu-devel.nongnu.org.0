Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B75A024C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:51:47 +0200 (CEST)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwPh-00009T-GR
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwND-0005aa-5J
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:49:12 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwNB-0000Qq-Mh
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:49:10 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31f445bd486so487688627b3.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=frS57omZcQBWNsTqgKADA7Rlnp01wL2uTLt64NMkP60=;
 b=i/sAfHIvb2psd3OCXX7uB3e+X71GMqJ7MZeHTbxPMyvxYtRBXUuMGduMbKr2wDxkYV
 Brm4qLJ67Gi/PnoVyWqP4W5NqjCJGzaTWzJmvDzMz7rHb5NpdrQRefQak2M5sJGnO6xp
 gJibjdA3NXOQBkrdV2RrWYQmTdVZ1z4ZLAAu2By8vje9zubDMoF0WXLXz3iL5rH2SzyJ
 C8w2k/0fy+OKMRr37XF1i32S0G7Rw6Luf3C7ZN6DvFWw3QtURfgfGIu0De959mReO59t
 79+X9/fumifKxGFtqsDpxW1PJ70qqSC95G426FeDszlhtDAZXnOPYhEctWPWD6nKQERf
 UBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=frS57omZcQBWNsTqgKADA7Rlnp01wL2uTLt64NMkP60=;
 b=JXwDRncTKYTH6nWpEjvkOzuNErC9p5We8DLNfWK8dZA9Qu2vMA5PymkcAIDqP/EYzY
 +4XJmQ1ChF0p1mY5krj9IrQaQdYiWuEoqx8VORzHUazHINREnNBKPevLPKeInL8RYPw9
 GUmnH7ECuiE+c9pVk1TJmsgr19OutPr0bCM4BIALluz7VO3BeZ8G/X/Lb9VUFvno3QOd
 GsvfjfUOZ5P1+sSqbVWG055onnEM0/nUWUoKpFa37xy1qJlX7fzB09gPfpvHrcLrdZKV
 YylDduohd2tQOMXYjQ7Lx44RG4JkNozulYR9bNCVlCWY0mIUdZ4z4XVBp3V/fZaIN2Qr
 COyg==
X-Gm-Message-State: ACgBeo3NcKZW3M3sGBzkSTzKocR4MCiLR8BXSYbPSCnOA0RTCEMsrpBf
 n4oYLmCBb2JJL+LAQDykfX3ePy6FOK2zqMEi6DPwbe1J9tc=
X-Google-Smtp-Source: AA6agR4z7qvbE4f/haDBzau+YswOdBuDkK9u+MXg74N7yHzlTHOg80uXw4gchTVKoMMFVmUEQzvhATgkQyR6SKvKNVg=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr709482ybq.140.1661370548772; Wed, 24 Aug
 2022 12:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-9-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-9-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:48:26 +0100
Message-ID: <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the GPIO
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The GPIO devicetree node is missing "interrupt-controller" and
> "#interrupt-cells" properties:
>
>   pl061@9030000: 'interrupt-controller' is a required property
>   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
>   pl061@9030000: '#interrupt-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Why? This is a GPIO controller, not an interrupt controller.
It seems wrong to be advertising in the dtb that it is.

thanks
-- PMM

