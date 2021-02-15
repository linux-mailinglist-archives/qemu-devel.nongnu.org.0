Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E331B7B7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:01:25 +0100 (CET)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbd6-0004GF-0U
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbR-00038S-1n; Mon, 15 Feb 2021 05:59:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbP-0004pd-O9; Mon, 15 Feb 2021 05:59:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id n6so8313753wrv.8;
 Mon, 15 Feb 2021 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9rAk2ZDnqsOR4NohehipuZZofZLoCYTbc2iCcu6amdQ=;
 b=W6YBSBCSWa1DTLUoihdNq18o+UhKpGUXSHrJKMnRlovHiw0mmXs24vVNuAMt0uiRUx
 YaHbk4MBfHqiYYllC7c+HVNwq7OurcGCfqriO6pi5qvpFwGwEekP4K4Ol5GOtolcm1Nc
 RnB081057yO3doWA6Dx2jEZf0ejvwzG2PRmxwItiZhPT9kNObi5UsjDSevuDtceMyg9E
 CMDNEVnltHJI61JE2eSiy/taLDh/OP3MXxf9nDPBEXCVPAYHp/1e0yu/63DPfAymeoSz
 CLteMci1gj/KcQQGdcLX2mS42XOvhanFstmXLtelk/3Hgk2H7gu+F8KA4CArDj5Fj15I
 pqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9rAk2ZDnqsOR4NohehipuZZofZLoCYTbc2iCcu6amdQ=;
 b=BDZoSHhVWtDhx2wco6Zf0gEpgag1TUzSo5A59GZkDa2AYxmElVIVWS2J/N3sApMRWx
 HFC3Ka7BFVE7wtaQJcLUSKIziCWcy6qVUwNcP27kqa06US7WVPSE9NqYlllGiZaOUB11
 rfdD05oxXkDvOrYB5KRwDxxuoEArRGFzbCAMy5hy9UAv7PXwNhrfA5aJA6K/VgjW5u6Y
 IBj/URSCg3altk8zMvNLLikWalnH+QJnZ0EXRZRtEKDJ7bVmyZOs3sTlBeAN9neOxOh3
 o0uJ3UcK186aRSzrtnN4eQz64k9RYZLWa2kc5uXV+C8459CLtgRZu5TJMkojqPA3dacM
 fWdw==
X-Gm-Message-State: AOAM532gN/TFQfKoL2ELm7RR23Eg8uabPY+eWrMG6XKn5Hm8SslYF7JC
 5VJ/OjsXn9vNUojkA059PQw=
X-Google-Smtp-Source: ABdhPJzrDzWPe3iHTbt2KPgIW8Xg5EhFEAxPoMYSCnmvSBEk37JqjBNhE4ePEUUSl0FzTGQSnBYQeA==
X-Received: by 2002:a5d:5441:: with SMTP id w1mr18204230wrv.366.1613386778090; 
 Mon, 15 Feb 2021 02:59:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d5sm14709896wrp.39.2021.02.15.02.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 02:59:37 -0800 (PST)
Subject: Re: [PATCH 8/9] hw/display/omap_lcdc: Inline template header into C
 file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <593a13c2-33b8-45de-dd6b-7f3e730d5141@amsat.org>
Date: Mon, 15 Feb 2021 11:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 11:32 AM, Peter Maydell wrote:
> We only include the template header once, so just inline it into the
> source file for the device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/omap_lcd_template.h | 154 ---------------------------------
>  hw/display/omap_lcdc.c         | 127 ++++++++++++++++++++++++++-
>  2 files changed, 125 insertions(+), 156 deletions(-)
>  delete mode 100644 hw/display/omap_lcd_template.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

