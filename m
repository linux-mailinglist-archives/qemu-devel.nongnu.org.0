Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5F4616D1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:42:46 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgvd-0001t2-7P
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgfu-0001zr-PQ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:26:30 -0500
Received: from [2a00:1450:4864:20::433] (port=36631
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgft-000773-8l
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:26:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id s13so36865979wrb.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wNfrtr4/7mjQw/0TXRMqEhEsBJL9QwYxUHkv85EybYo=;
 b=qsINIe2sK/DdugB5TY1ziuzscwt0i4p/zYWYd8QkzwvXesHH7hx7oFRuuvUHA9r6qc
 EpgOouj7NysgE8/5y9zppfZLAu62bZRLC1QWgfMeNiE/EGonxZUwaHKgNf2lFCENE/9o
 ORWUNk1WxpsQwvgoGHYmeP/nFlIPvI2FiuV3uS8Yrz+6FHlX3Xt7PSDN7geZrnSJv8ju
 3Bur7Lqq5MBAiD0srSc9kRN4NXk9rEzwZzoSdjJM08/XYH4jbmdcM4WI71MTeDxht1sF
 C6PrS9vRXVg+qAj02/E6mGuvhXqZ6atOYCnTLy7yOyyfFa7ZYtx6XGFzKGM6WTpJsAGn
 RkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNfrtr4/7mjQw/0TXRMqEhEsBJL9QwYxUHkv85EybYo=;
 b=xr1k3c0Oiq+ZUAcGgsprrp74PrG+EDdvi0H4L8e/ijNpbGcoFkq/OGHtE2AHeAHwMR
 NcUh/xYSf8d/0wCJXrauAsaRAMJ32pE3YYvIMUMiLjB25ZaOSCSa9DHq+Oy6d3gxsse8
 gXsyVvCzus5d5v+nbBJWSjPlfnfNO4EsAHEBYew8/SDahSHld6LODZ6AeU5LBKj6urIY
 9d01PWtND0tsz9gVI6oUiT3bu+CMlK90vqHUIdhVXhOOL9riwDtva+O0elzSSnjqzXPj
 jzZHkSsPDUqBKSjjyLKrgC66Jdekiua3ljz18kWvKbQ8eOt7xlIoQZHvU6Ny50ZyIKcg
 /XuQ==
X-Gm-Message-State: AOAM530NpGL+JN4XgXZdlWK8DV59bPyQS9SoIR4q1rlYhQ11UKT0tbVa
 18WlJV9heNUiTGGzPbM1NkRH8/tQk5CM625AGOyrdpiLGjY=
X-Google-Smtp-Source: ABdhPJwhoUqyc07VdSueMd4bPs/jynHomqKAOWd9J1PCSm33DfSAOAtGjeay/bzA1VuIthqE/sj2x8iLtjy+IK/blMo=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr32258976wro.484.1638192387840; 
 Mon, 29 Nov 2021 05:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20211117065752.330632-1-joel@jms.id.au>
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:26:17 +0000
Message-ID: <CAFEAcA8YH9WqQr4c8wXsjsSOEc52-LkG0Oj6TZxkgr=sf44jHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] docs: aspeed: Minor updates
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 at 06:58, Joel Stanley <joel@jms.id.au> wrote:
>
> Here are some small updates to the aspeed docs.
>
> v2: Tweak board changes, add patch to move ADC to the supported list
>
> Joel Stanley (4):
>   docs: aspeed: Add new boards
>   docs: aspeed: Update OpenBMC image URL
>   docs: aspeed: Give an example of booting a kernel
>   docs: aspeed: ADC is now modelled

Hi; I've added this patchset to my set of things to apply
to target-arm.next for 7.0; thanks.

-- PMM

