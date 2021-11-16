Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD5452CC3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:28:19 +0100 (CET)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtpC-0004z2-RC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmtn7-0003cc-Ps
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:26:09 -0500
Received: from [2a00:1450:4864:20::333] (port=51769
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmtn2-0005dW-K2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:26:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id z200so16134864wmc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=omFdcoxY4Q2dE494dd4Nwh/X6uc3rwe8XdBaT3RtD3w=;
 b=MWexpZ/anu50S5leo84iyHGZmOsnohMPpPuoFme3rWi1qJjlqf52SQAi0qIFx8jT9H
 DENHeBQb+8fRu2caal7OLN4FNZH0jHbMW3/554R/l31y5ECwjjtaQVsKkQVDq+ClgRAT
 yj/jedugbXA42eeZlCkNS+x2TrdCSbn76+AY+Fb+NN+/PcPcb9Uis/QrAESwmghIU167
 4118Wkmx+vFz/xwW7mxChQ8dV23rgoArlIaRJL8Gflw+MT3K9ggmDKyPhKr/YLE5pP5c
 Px2iqH2sltn10akpikV6b9RYHHQ8yrz9U9TpvBPgOauIp/S7yMwcskzEeUH3/ImY8Z2P
 oBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=omFdcoxY4Q2dE494dd4Nwh/X6uc3rwe8XdBaT3RtD3w=;
 b=p2yhaoaON9AEp4jpJCrcJ+z7cay/gHvvhHCEp2tipTFdJGm71ue2j9yrFA77VAySWl
 O3LGcExlRzdewqXvXcq+tg/nLsNU9jkRDI2VeMYo67TQE/t4FfhyQiXAy8ayexQS29ji
 oHtT0EfV34gav2Z9vGc58YYiyn0WsClwbziSIua3B3TtgVS6tP9hyPPyUhWMl9FD5L+r
 DOXFUSTB5lbe9AAjsPFs5UBRkfWJWGAEU2dmd60G3bR/CnlmK18gGi50NswnOMlMpxu3
 44aBurU8FXK6TKB1jsEmSAwulPNBHLhnMHHuoyWJFSTUyoK6whbhacuaYE/TD8Z+AN/P
 VSug==
X-Gm-Message-State: AOAM530pBojebEzx4WzrqlmSujlozChtVPJJpUHgfbTb/0cGXGOUpM1j
 Ma3aJQ9VSsF9NnXPQDlUEMw=
X-Google-Smtp-Source: ABdhPJzNIu50GyQCfrgwKFDj2m/+cUsv/RqKvR6X1op9A+VT8uETV/n784zOBJO+fTQLCtCC32Wq4w==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr5666836wmc.63.1637051163081; 
 Tue, 16 Nov 2021 00:26:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y6sm17677950wrh.18.2021.11.16.00.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:26:02 -0800 (PST)
Message-ID: <623c1883-4ac9-e615-7a58-b0d781e19aeb@amsat.org>
Date: Tue, 16 Nov 2021 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211115140623.104116-1-thuth@redhat.com>
 <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
 <CAJ+F1C+kTL_thUHtaQ1pxPN360E39aYA81m=8efaYrKhzXyaFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAJ+F1C+kTL_thUHtaQ1pxPN360E39aYA81m=8efaYrKhzXyaFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.446,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 08:05, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Nov 15, 2021 at 6:31 PM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 11/15/21 15:06, Thomas Huth wrote:
>     > Gitlab also provides runners with Windows, we can use them to
>     > test compilation with MSYS2, in both, 64-bit and 32-bit.
>     >
>     > However, it takes quite a long time to set up the VM, so to
>     > stay in the 1h time frame, we can only compile and check one
>     > target here.
> 
> 
> I wonder why gitlab does not offer the docker executor. On the
> freedesktop gitlab instance, they have windows docker executor, which
> speeds up the build time. Maybe we could also have our own Windows
> runner for qemu?

We could, foss.org provides the QEMU project with x86 VMs resources
we are not using. What we miss is a sysadmin willing to setup &
maintain a such runner.

