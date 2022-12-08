Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1ED64716C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:17:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Hgb-0001OU-RC; Thu, 08 Dec 2022 09:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3HgO-0001NU-RQ
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:15:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3HgN-0007ao-A3
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:15:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so4174443wmb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=974RMRBrU08RTywMT98iYPCm+BUAxCZIE5SqJfaL4QU=;
 b=i6OAvdQwvXFo1MWopLClOUURI6i990HRPUrGA0/XnDDUozNfw0gWhi/SHlu0mlrtJQ
 3FZFO7iS/gkRoRGQ1a3StcL3DAQaBjplZ2p1p5VA1S/YglpDF1mszlS+WVjO0lAy/htc
 JPbc1Tn8HRdVcPxIs/S9qd5Pa2zFXHvHHt0nlwtc9++gpUK+ohTqD7ZZTYjYKuSsFHR5
 Iuzqth1VqbLyuVmo8mzW7gF3vuPa4/y4vsqktEWaQ7PsR6oNrsv6HWFYABfWQEbFQR8o
 NT0w/gyzwj1UTqwhGj1puiXFJyi5aQAzBEzk/DAeqBBG+TjbkZBwnvGb8qu0NHAbwicW
 EXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=974RMRBrU08RTywMT98iYPCm+BUAxCZIE5SqJfaL4QU=;
 b=pLgjkz6J6+raUsLzs+GkFnms1GETuOe3keRpBydOz5KfymhxCB/d4y5UkUU35i9OQQ
 ytyTtGfh4ULU2Kk/rC8TWBGIZ43vvYtiGwCozOIOj56dGXg1fKbA5o3ksxJ8uMAdYuhs
 U4aPOcmGX/rQFZ3EkySedoeuw8jVN0LEoWu+R+Up/cY2vK+nKXzWHYHF4t9dF+qqAQtY
 3xDO9hObEhmSna2BBZWtVm9IqETH1zTSDPgxp+fM9D79R6wyHcCbToyZzgAN68aYRARd
 439tSFl0ZQsAR2w5kwKC0D/YI0fXSsIxW5OL0eT3cx0xJBwHzDmhvPD57AvlVITRcNd2
 VYpQ==
X-Gm-Message-State: ANoB5pmHxCrsXzalo3Qh9a6kH6XtdT1aYRMFMxcqiDktezViuE+mWSOk
 2as+gGcFOfIZEuwIrhQiBxNftQ==
X-Google-Smtp-Source: AA0mqf7iwer/9Yxa1Ld6rXdcdNB0UjzJnzILnCelC5NXK09gRsL20M6pkP7f0D781FEnSJS3+9zVBg==
X-Received: by 2002:a05:600c:384b:b0:3cf:4ec9:385d with SMTP id
 s11-20020a05600c384b00b003cf4ec9385dmr2166571wmr.19.1670508924679; 
 Thu, 08 Dec 2022 06:15:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s1-20020adfdb01000000b002420a2cdc96sm21984923wri.70.2022.12.08.06.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 06:15:24 -0800 (PST)
Message-ID: <cc480ae0-81b5-b3bc-93ab-4f7edce451f1@linaro.org>
Date: Thu, 8 Dec 2022 15:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] util/oslib-win32: Remove obsolete reference to g_poll code
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
References: <20221208133257.95673-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208133257.95673-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/12/22 14:32, Thomas Huth wrote:
> The comment about g_poll is not required here anymore since
> the corresponding code has been removed a while ago already.
> 
> Fixes: b4c6036faa ("configure: bump min required glib version to 2.56")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   util/oslib-win32.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



