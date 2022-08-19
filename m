Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743C599ED8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:57:16 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4N1-0007aA-CP
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP4F6-0004UK-Du
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:49:04 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP4Ez-0007Sl-7k
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:48:58 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-33387bf0c4aso131468627b3.11
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Exxc/hnK0XGx+QDCfFlGgFUo5+l1QPVgPrN1nU4pmcg=;
 b=IIeUA8gGtRtPZbUYur3RW8TCKLMJQ6+MxLvExHWT2rj2rgAsKB1ssC8pLVYeOKVcYZ
 J/7KDS43ddeOsL8szmY5d27QChAvHQ3n5st5aV5ePvxgLCpGtiNakeC3grDNcSlK8gX1
 iXPBa6tlENRGZXAH2tY0WulBqLTx+3A+IxuFUEXt/nqoh+XnXDaZbb8OphWi5L/GD2J6
 WhNC82xqtnnmmsPN2VdUmLneBrtIAwD1qfNjG8SuTjnYwsWvZPubkmHb0cSVf/bSMQrZ
 yiZe+92ZH3B+w/D0L5WNcfQtTCRJots1wSQ26xZ9WF/RXExfgAc6i6mW0m5SXCQOeUI/
 Pllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Exxc/hnK0XGx+QDCfFlGgFUo5+l1QPVgPrN1nU4pmcg=;
 b=CNw+U0ZrwXCO/J17e+dBCV1AuwdMb/dGoAVfy4yIm4ipArBCBKXge8kSEZ+CLaBIjP
 YdoF9OniF//HmOTpfpd+AlQeb0o8wnTr/GCsUe0xJNN0Od3Sqt/iZ+Bx7bAdJDEjk4ho
 9EAm7q73Iz5m4o5ADhfJvtdiBBDbgAlyqGAsxovTAKELT0vYwdgXWkKlUB1F52was+T4
 mLwToLfRkkWDGGMcuEKD2Z98Ai19DEQFPo1lMi3kkiToXrS8ypZXMoIPWPB5BXxreove
 X28QgijW4P8w68AxChAL4CLg91eebuKLh67cvarsme1O7kX0+Q0wIC4A+JQyaXbn+7s1
 aZ+Q==
X-Gm-Message-State: ACgBeo38BT7Eac8LY5mOOokomi7EF8qrTD2z/dlXKOnl+6aYnzNaRtC9
 13yu+byZt1wclWSahFIs4Wv7iTqTO5wiws2tD3aUsg==
X-Google-Smtp-Source: AA6agR583Ax0ZTTwU0fc7KDYPekqC7XE+Cmeub8NvXk3dEvG6wLehCpdrueoGN2JBKJepbbkhITQ0hSDvc9n/JNgEiE=
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr7748083ywb.10.1660924127744; Fri, 19 Aug
 2022 08:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220819002015.1663247-1-wuhaotsh@google.com>
In-Reply-To: <20220819002015.1663247-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 16:48:06 +0100
Message-ID: <CAFEAcA-K4gFor7-YeiHRaiCAe=Yu0BMoRHpR7tFzYPj-793Mcg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add cortex-a35
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Fri, 19 Aug 2022 at 01:20, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add cortex A35 core and enable it for virt board.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

