Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22C67183E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:54:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI58W-0008B9-G1; Wed, 18 Jan 2023 04:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI58U-0008AJ-Aa
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:53:38 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI58S-0005I7-BA
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:53:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso1061656wms.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=crBi9JWK/ADlyxvGC/6xunYf8sykPkdyS4Kfb3+sGxY=;
 b=qooR/QUOF1snyQ2oCNcWxXLDegnbXgbS86Y4ps3gVSDORxhQhjGN8h9eJpdmwV+Rd8
 7V2fjk2l+6w7BYfqobTXK1B3CvtHnNwIm8bPueJWfUl5StU0H0uX8vp4+Er8nN9MOm47
 gQc0aS4/GFikAT2hCoW3vvfzpBKe04FZQTzTvHK9l6rPvwe+6ILlR4LJlVKWyrW9eCxU
 MPhdGNjJ3kLbmRqMBYAt8SwOUTd60VqCMexXOvUkEt1ddRZfpTpUZC8VtSY277zvKrsz
 AYJzrrO2SVz8GFn6aSR+aiZ0gUpOce4o0+UhcKzaM3aqe6DvqG2xFCQWRVhuMxWOaItU
 N0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=crBi9JWK/ADlyxvGC/6xunYf8sykPkdyS4Kfb3+sGxY=;
 b=FabiNmEgsqvnhUtO0+61OnutNfly2FRQpNmE8wxOpY4Dumr9g3woRIVpNyGBF9d9Ds
 DJ4RPD3tSUsPechZT4rXWQTMA9L23i1i9S7ekFsoBYd10H6ZS94FowP+2fI29anqUZRE
 JFOGknupw3o+JSayozlgv5YgSp0tO6N7RCMLWwyulWNQh2sZ7MUpAFvJPXk/pqCi8I61
 lg4Yk28njoM/cnTQMdjXPrgGIBL3KQBChBj38sUnil9gRbVUHxpxlPqK0aeQP7WSNwAc
 pojpMHlbFYtXK8iapsYupz4CXYNqLT/u468LZMryDNzmNFkNBCmuct0C1tEzkJ7c7qLu
 85KA==
X-Gm-Message-State: AFqh2ko2B2HlPdVOx8z6MygzliquCAEHokZ0B0yrjbUAGPNdmIE3MvpD
 KEuEKlBqGIzbH2ZJvieM/R+5Y3CfrPq6BH7P
X-Google-Smtp-Source: AMrXdXtAJldXBeaJRjUtUHBgxHPduX68qzitph/cx4LTCHtYBYIpCCXGFROYGxluXTrsmZNzGUD+mQ==
X-Received: by 2002:a05:600c:c85:b0:3db:1a41:6629 with SMTP id
 fj5-20020a05600c0c8500b003db1a416629mr30546wmb.22.1674035614832; 
 Wed, 18 Jan 2023 01:53:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm1799323wmq.1.2023.01.18.01.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:53:34 -0800 (PST)
Message-ID: <23d9c095-e116-957c-15b3-9e82d8567235@linaro.org>
Date: Wed, 18 Jan 2023 10:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ppc/pegasos2: Improve readability of VIA south bridge
 creation
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230117214545.5E191746369@zero.eik.bme.hu>
 <a168c8d4-4c0c-f933-7293-4fb3bd08f21e@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a168c8d4-4c0c-f933-7293-4fb3bd08f21e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 17/1/23 22:57, BALATON Zoltan wrote:
> On Tue, 17 Jan 2023, BALATON Zoltan wrote:
>> Slightly improve readability of creating the south btidge by cnamging
> 
> Still left a typo in "bridge" above...

Also "naming".

> This is alternative, inspired by Phil's patches, maybe I'd also need to 
> add Inspired-by: tag.

Not necessary.

>> type of a local variable to avoid some casts within function arguments
>> which makes some lines shorter and easier to read.
>> Also remove an unneded line break.
> 
> and "unneeded" here. I wait what Phil says then correct these if needed.

Fine by me, so with the typos fixed:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> hw/ppc/pegasos2.c | 14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)


