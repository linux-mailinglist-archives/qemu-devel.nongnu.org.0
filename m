Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202B57805B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:58:01 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDORs-0003b7-J3
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOM1-00051z-W4
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:51:58 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOLy-0004cI-VJ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:51:57 -0400
Received: by mail-yb1-xb36.google.com with SMTP id n74so20082287yba.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dpxDoG2HIyOzF+h3BV/tnDau0651y1Vg8GeZp8E8cU=;
 b=FDxc46MMHzOx/BsxrPesqG+/FANQtnIY2y4OG3JUbkqpMmPiAHVf8wv6OY4m7YEwZt
 EmoiHuasOyT/MUoKz5PJBnCTA+KFQSjYwnd/pQ09QjQKKo/o3ekEb0Z7ziAJC56EKb3m
 s60AxA4xT5G/DZy0p8CaMspbd273UL9pS1QJN9JkaDfc7d30Ks8r810clJxJVSVPuxc0
 RH8TErGd3HONjQVBLjfRwU5QL3k6TqBluuGVWDuIb4WsN/2RUuZZ3q+rW7w19FZO+kFG
 t1M1d7kRFS/KzDCnWnDvc6HpRiG8KwpM5wGs7h+RSCIkZ9MGUslwk3wj8Qiqx0xwrcvq
 RipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dpxDoG2HIyOzF+h3BV/tnDau0651y1Vg8GeZp8E8cU=;
 b=gFcDR7xdMgV2TSWNIbWGHB7Hd7w/gBCLWFxDjsXPYhQayw56tz3GIpK47jOuAKtHn0
 iinizZhEhrQFLrBt2H87COljBy+1FucyoOkeHCB1onNYodqRgfoq0yCQfHa242RpyeeV
 Q2kLefl7tjV4jd0eFckpmr27EACj5iKPkAKtjNqnEEhyEae3qMSRYXPMIBC6gCR9A0iK
 J8sHx+XLI1Q4LPNdEgysAnYGhMbVdvlEf9ubnSc6k4oNp8P/62IyaIjl9zhykayJ76ET
 WDJsq8vmlRM9+mmP6urXxs7llTWMt0+kGdhIF/2mS+PKbEGLg5cPzDyR3eidEs2RtFxn
 Fhqg==
X-Gm-Message-State: AJIora/yg/n9oMB+K4ts4wScw3f7DGUd3j6ELwZdFI9k6L4qANd/o6DE
 ClPoMgVoTst3FEB9AlQCLE6x8NJQKUNBTqJaX+4lOg==
X-Google-Smtp-Source: AGRyM1uBZ3w5oaBeLx57vn6BNbVv1iRVz4m2mnya0M+NTLVjMKdTX0b+FawX0x0DvUFwPnmISF9TqxOYSu1AgkDviJc=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr27948865ybj.479.1658141513895; Mon, 18
 Jul 2022 03:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-18-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:51:43 +0100
Message-ID: <CAFEAcA-eoq7KVeKn354quvM=QaKOKvT2CwLpPbNVz4EZGPVfdw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 17/29] Add magic and size to the trace header
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Fri, 8 Jul 2022 at 17:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Sanity check that we're not getting out of sync with
> the trace stream.  This will be especially bad with
> the change in size of the sve save data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

