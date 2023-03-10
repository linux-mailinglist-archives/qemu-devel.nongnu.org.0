Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C256B53C1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakr5-0005db-3K; Fri, 10 Mar 2023 17:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakr0-0005Pp-RU
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:04:48 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakqz-0001sw-8n
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:04:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id j3so4359441wms.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485883;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CXD62xJ6ZbOmrInsrZ23qVoixpil1w343KldV+Q55U0=;
 b=oxxxNgOGdmLZ8p6WFWoEZJStdZtcBo9GpjMGdha0sp7ar4IASKv6hWr4rgT+4cVIJ8
 WH1kD/VTmvszhTFVA9ETzdC89HRKPnRhp8dTrEvAn9sxYapwjrbwP5s/JYQprdRrbAca
 Xxc14H1f8UHYJzKPgUmAoiUjIsMG9zWMLa356fZexHOuLabyfBSP+YcWWmiMyJ6gJ/5+
 ygAGgXM2bDVoezDAYmsKFYrUgM1oGWluQ/VLTIRF++1789QSn7MgxhlKds4MPjYXYeo3
 A3ZESvtbG3RrqWl+WYfry4huANrLG8gfDWEvzyO5HG3q6cGJaNG4JBp0RrwZz3e4oLuT
 oDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485883;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CXD62xJ6ZbOmrInsrZ23qVoixpil1w343KldV+Q55U0=;
 b=yON23kHMlcEvOfPo0tKC//ZpDfcxINNLKaNmkcZdK6+c3mwi2ol2+VR1dk2M40p5AS
 JUhuPaS4K/5ZphTRPphkLeMZbLsW1XRmQAGWNBKHzfCuK1hPm8ChozEymY1yMQ2kHw0P
 3qUN2FZUSxnN5JiVgd7E8YwGAk/HNmpVLowxayuVCXPtR0FCZ/VcT5LMfYkEUDEEnXNu
 niEKp2v0Nqf1DXyzowKvMy2bC7S8B+nMSsrfg04dnXgMH0r9VNdP4zNDEszwM+ksrun1
 j5wyUsdiVhHxEsvcXNYjeCxG/AqWlaC8GT1biBGVy1KuN08+wvGA6rOWTSFAC45+ts5Q
 hGLA==
X-Gm-Message-State: AO0yUKVh5UUHuD2NSybrErtWgkNBLS4XwjQAVUuhzi5J9yX1sELM7c26
 DVlZC3XYFtPav5/Xi3Q4TdVmJQ==
X-Google-Smtp-Source: AK7set8umA48vUbvK0pAUNS72Nm2B2izwdV8q/QfeFfPkfJ2EaDGr7HZmi5efA9krJEQSdT16VGXSA==
X-Received: by 2002:a1c:f213:0:b0:3ea:d611:f8 with SMTP id
 s19-20020a1cf213000000b003ead61100f8mr4543571wmc.38.1678485883612; 
 Fri, 10 Mar 2023 14:04:43 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003e71a6be279sm1004840wmr.37.2023.03.10.14.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 14:04:43 -0800 (PST)
Message-ID: <5aa4acf3-f0bf-4dd6-927d-67fd323138a3@linaro.org>
Date: Fri, 10 Mar 2023 23:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 7/7] include/qemu/plugin: Inline
 qemu_plugin_disable_mem_helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org
References: <20230310195252.210956-1-richard.henderson@linaro.org>
 <20230310195252.210956-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310195252.210956-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 20:52, Richard Henderson wrote:
> Now that we've broken the include loop with cpu.h,
> we can bring this inline.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/plugin.h |  6 +++++-
>   plugins/core.c        | 11 -----------
>   2 files changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


