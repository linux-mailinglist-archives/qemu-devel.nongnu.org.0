Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3E5BE7E6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:03:53 +0200 (CEST)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadqq-0006ZP-8Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaajJ-00017U-P7
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:43:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaajI-0006vO-9R
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:43:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id 13so5145110ejn.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5mr4Y5RdId+omuTpYV9/bPWYx6x+e2AED17JsG4+Txg=;
 b=Xho2FtAbi5CM7MYsV5lo3JQXMQFN2hyEv+L2P0klhQbQWoRFX7yvbO4RlKGLuARTGg
 RgzSG+zc2WZxl32iGma3UQXinKdHFwEnWnv2aBMPh/R5PsCz4urj6KRh/2oCUdAiyuhu
 WQ+8SVO1GH0IQJtHeLm2LVK8mgy/bFYhjKeUydvs1fvhNj9i+miZzhguZxhx4DdXWTtj
 FXrz1jSiRJ8Gt9wU8999DUiQdaK0Chhr85I/fW7VELn0KN9j27duug2LCoEJHfTYk8wJ
 +nTgi8QTM0NpOLhilWLatGGElDRA7krBciZ9gyrMQBvsVJ1yWmekgFV2otOuAsW17j/R
 ViFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5mr4Y5RdId+omuTpYV9/bPWYx6x+e2AED17JsG4+Txg=;
 b=6OxDspjXgA/sRBxu3pEEJOs+elpFYyYXlUD0uB1Il0x2OucjHDLXgbAGCZpcyYilex
 Tb+dJ+bUHLwR+kSAtsNJwUxWjORDaXbUM91ftRzTYEyGyxQWjHHTDBY203BvNalU/D6F
 DFOb/0b46nhidhO7524NWt+5AhRWnoZ+OQaWejaRZasOeYD/RdKR0HIShIEiUJUENPJ3
 3e1U6Sc47IN3HFONiLW4SDO9/l1LHdTa5Zt8bZzCO8EqfqGtaKm9eWFhSBuxsBcO0OQY
 qPAhPjafUHyaKadq5kOCbt3k3jv3kZ5uCJrUM+yxWhBaWNa+nNbC3uiPs3SdBik6ghln
 Hrww==
X-Gm-Message-State: ACrzQf2iEm8FIOBac/wPhakJJg+2W2QFgnhLPabCPEDvOVmVBGUgtsvT
 lrfSiLJGaTcy/mD0GY8WneHPrT0fkIddpAcEE4y/T59326E=
X-Google-Smtp-Source: AMsMyM7AErh78/oEhLlv6DI2oXf1/PYXUIfimAYe7tRvHvCJQgz8AuWZvGzNtsycIC8vy+P9BrmLdU/4ZlO5gxKv6L4=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr15672770ejc.504.1663670630722; Tue, 20
 Sep 2022 03:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-3-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:43:39 +0100
Message-ID: <CAFEAcA_mNbBujzBQFvs4WLkGCnmzjWJq37NRn3e+7qN8470NcA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] accel/tcg: Drop addr member from SavedIOTLB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Mon, 5 Sept 2022 at 21:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field is only written, not read; remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

