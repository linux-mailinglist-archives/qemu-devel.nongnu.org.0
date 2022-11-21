Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14164632921
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9Pp-0001hD-GP; Mon, 21 Nov 2022 11:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9PX-0001We-U1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:12:48 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9PT-0006lA-Bb
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:12:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id 5so8817807wmo.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oIQgaw2ApRQxFC7xKrJRpgvAriZfiZO5EZu5Vbf3dcg=;
 b=xmuKu+mIRsI3riOwe/ULJf6yTOuRfNVHOiMXPm998jKx70dfg1/aQBeQAYtR++awp0
 68qSjs72TkLpVMl8f7uaNH08Y8R+zNHhGiTAo+lay35JOKF32sdyKbYPBnsxBvqxu8qE
 3AjJK5ul+VxPiV6VJZVcbBlrekhYHee55KkZDET6ADx8mBh8Z83GX2EfUnW3cDkr8JRu
 IpURyoq2UifHRJekwv4woDZA8CegAZ67agALrRfQX8UPnUwbX4AADKGRU4xF3D7Xpdpa
 +QR3UmGdJgNB/8f1/yr1AjsggrdPYlYthKjbHF613EFan7VrgugE/CdoZDB/SOZl+INN
 H+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIQgaw2ApRQxFC7xKrJRpgvAriZfiZO5EZu5Vbf3dcg=;
 b=0nHr9ECVsRPvjcDTIzGp0FRSIN22bf+rGV1ZRcFywXDHnU/l4nCPY5iA0IBXtucyOf
 Cs/mcjw24gK3+a3sIbAReAulmoQkVtnI7sg1U13ONta6w36RXjC1S7yjWOsxyXJUYA3t
 Efl5d7AVghmtkuv0XPk9M3/4SIeFbJBKZELin48jeQ/d+05ANIXTL6mBGAlIZGzdwv/o
 BAQNOSrLkgMzZrOIPB9XHYAbLtjfcEhyoqc6dxcx/rW2or55NGeK+glYXtRLLSArsk/u
 gMPPXTR3nxafIZoaV1dD0EvjohUICioQn6YkH44DF7Nh/ryjwxztNNpVbkl6GqkmX+aZ
 +ARw==
X-Gm-Message-State: ANoB5pn+5RPyx/rguKucLQTDJINm4vesmyiLbB2cZ5RnnJF5rSXWvDjV
 /MkV0Wk44QMzYZjG76tikbnurA==
X-Google-Smtp-Source: AA0mqf7DEIPYELFWpLyajWRDnozKWROuBAYECUjffM9RRbfQNn4F5MoYEz9iJ3s4RDzXbWO2RwiC8Q==
X-Received: by 2002:a1c:790d:0:b0:3cf:935a:aaab with SMTP id
 l13-20020a1c790d000000b003cf935aaaabmr6648199wme.159.1669047157817; 
 Mon, 21 Nov 2022 08:12:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm27606630wms.3.2022.11.21.08.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:12:37 -0800 (PST)
Message-ID: <a31a5acb-e499-bbcb-fe6c-00519e291071@linaro.org>
Date: Mon, 21 Nov 2022 17:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 19/29] tcg: Introduce TCG_OPF_TYPE_MASK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
> that we can add TCG_OPF_128BIT without requiring another bit.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            | 22 ++++++++++++----------
>   tcg/optimize.c               | 15 ++++++++++++---
>   tcg/tcg.c                    |  4 ++--
>   tcg/aarch64/tcg-target.c.inc |  8 +++++---
>   tcg/tci/tcg-target.c.inc     |  3 ++-
>   5 files changed, 33 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


