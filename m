Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF5065EA46
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOv8-0007uv-1L; Thu, 05 Jan 2023 07:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOv3-0007qU-Sc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:00:25 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOv2-00009v-Br
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:00:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso1801949pjo.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ORbf2A5Lj8jTXQAHE9kwkO8J1Lc6ISermkRtv19XiXw=;
 b=k33J116rOillFONm/UJWXAMZs+JDXMN67o46WekgBkmAq7w3a00CAtVRehwkA5PO4f
 3T3RxmzqesXdHJ78CaYYCSCmpTuScQrqvqoxd6tLN+dgbKEC56IwEWeqSqnGQ5FhoHTm
 a8pUlJjLHZhHRQpTzBl8zN5Lf77jXhs1x6HKLKasZ8OF6APFiKUWuRMoXqJQ34neDGNE
 4Bb059sQmR3PuPdNYURkPKoHTUaS1gbREGJKWq7siGKYcCmKZ9U1ciy7ux45hVOxnjAy
 dT+rofM2yXaMmeCSHUQlymOEesbctcYc9llbFoKtvTtnycdv51lPN4ulgBkb7upk39/x
 oK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORbf2A5Lj8jTXQAHE9kwkO8J1Lc6ISermkRtv19XiXw=;
 b=5+bCBYCYG9Y3UGKLg8YUpmH4/JGZy2NQOv/Kmzg6t/CGt2+wnDr6w85dDxfYpxY93S
 BBWIqLnp7lNaL6MQTEG/vw8+FgZVfxnuWrCmCyQ4KBBnDt0ButOqqcpHi8w1vx2uqtFy
 2PqABiuO2142ASYHm/0a/c2BdXYnTr27ym0/FL6+HNrezmgR8PY8ISja/Kl+RMV/zbP9
 o+UbVF2zTfh1SoqRDqw2k9ST+3VzkNZJU5FF3t5LUTNtLtOopwNuQZBcW7Xz6XCCZ9tB
 64idtJZ/m5OWb+f8SlvZhlCCNz99iIz9t5qdgttwWlBFsHNOKIqLWIYgJrqeQ0UXTppN
 b6ww==
X-Gm-Message-State: AFqh2kqoo6rU4uQipGg98xR4hb1Qgu+dDZIKqkStbAeg0i3Quyjl1Jum
 97RQblwg7PWQ6/mkd2IUzYxVqxuxtyraY4NNQkaMAw==
X-Google-Smtp-Source: AMrXdXuwv3+SZuJm3XxIeB1kSnmr9+og8Di0sBlrXKSWojS+mTK3FJpHJSt/NqpEYTRyQgB+osI2ARiYMAhNKOrBs7o=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr440185plb.19.1672920022646; Thu, 05
 Jan 2023 04:00:22 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-1@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:00:11 +0000
Message-ID: <CAFEAcA-4GJPHbcsWnY3Apqx8-Jix2yO=cY0DPQHduhpgqsO2ZA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 1/8] hw/timer/imx_epit: improve comments
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Fix typos, add background information
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

