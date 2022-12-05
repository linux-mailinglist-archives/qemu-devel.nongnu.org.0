Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6F64238B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 08:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p25q0-0007iD-L5; Mon, 05 Dec 2022 02:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p25pv-0007hw-9Q
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:24:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p25ps-0005ii-Sc
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:24:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id f18so17199844wrj.5
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 23:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a64FMmvYA9LA56rAJfmS8XtvM3POkRLaZ8OGGgjnFrs=;
 b=vUoJMDQ6fMnrrfiRj6AFwZa7P62vf21Fr1tmnMn1Fl2o+NOkAElgZY41olCvuqiJvK
 KtmTmRAEOAQPFtoTvV9/LDg1OoevNlu0K2s294zqcqKkGzb5DGLGACdpIorkF3DQ/c3O
 bX2tzpbS0qrxdEXqqdCo0yJFP4GPNYNXAk+hunksd9FaL+XDSqjzPyIJ3nFzheYsaW8O
 vfltJ/YtHiwPqv9zcTKiYzG0ta0gGtnxcMNdj6yp1NCLJAO3OyS50GK5S/BwqNxDKdk/
 dxSrPmPc+MbQ85fK/Vsct945xT60If4l9LT0g3cP7dngfaBy5wB6MgnkItA7QekflPmW
 Q/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a64FMmvYA9LA56rAJfmS8XtvM3POkRLaZ8OGGgjnFrs=;
 b=wIUhRtYkzYPDduQKtYsgQD2eGs0BNBJUxGnEaWXdwYV5HtbA8Q2m7mmSTvsUO4vH1R
 GszEzPbJfX3a8mZYUD2tacNaxyylIMw3grqxsUuBjHNQlqpg5Dzmnq087YPg8y5QuM14
 uJM/GCjI5C6gNttA1PBMMZVLoebGJym12fpFmHupsZlJ68Nd2x1aMOEuIfYT/PPVK8hh
 9f1aE2QwFbcMybgGJwX7nLjCOgiMd+gn3U0MIAFTbxJEnMEtHl94WGyW3dIeva/XYFTw
 mkeXEnLbELl8bYpoTlXQTpo9QWBHrQF7KzolGYg1Vq/qRNf+JcjXMNyBQ84JdbsCEW94
 3NoQ==
X-Gm-Message-State: ANoB5pk1PgeSuL3OKLWkePd5/4ORReS4xmX6EsxTieQmgobKW/3jbqFj
 JGYimfunmYVQPXiIx/52YbUFsA==
X-Google-Smtp-Source: AA0mqf5ojXjD5N2Yxzi7gKRX7f+VQn/y3EBCUx3+5St1Nh2XT2+cO4PruAerQKWAQ1YHPy230r15JA==
X-Received: by 2002:adf:f288:0:b0:242:1ab:2cbe with SMTP id
 k8-20020adff288000000b0024201ab2cbemr30504804wro.573.1670225059224; 
 Sun, 04 Dec 2022 23:24:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c349400b003d069fc7372sm17229090wmq.1.2022.12.04.23.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 23:24:18 -0800 (PST)
Message-ID: <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
Date: Mon, 5 Dec 2022 08:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221202102550.4107344-1-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202102550.4107344-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 2/12/22 11:25, Song Gao wrote:
> The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
> 
>    Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
> 
> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0fd:
> 
>    hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05 +0800)
> 
> ----------------------------------------------------------------
> pull for 7.2-rc4
> 
> We need this patch.

FTR this is not a security/regression fix, but a mere feature.

Certainly not justified for a rc4 IMO.

> ----------------------------------------------------------------
> Xiaojuan Yang (1):
>        hw/loongarch/virt: Add cfi01 pflash device
> 
>   hw/loongarch/Kconfig        |  1 +
>   hw/loongarch/acpi-build.c   | 18 +++++++++++++
>   hw/loongarch/virt.c         | 62 +++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/loongarch/virt.h |  5 ++++
>   4 files changed, 86 insertions(+)
> 
> 


