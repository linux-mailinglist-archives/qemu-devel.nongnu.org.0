Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F06714F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:18:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2hy-0000k4-9q; Wed, 18 Jan 2023 02:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2ht-0000ax-Ht
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:18:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2hs-0005Gs-1g
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:18:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so784972wms.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 23:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bi3ogI3L8Dx4Er73SZRL9lcKEuxkkgFyLRB/+wjx2H8=;
 b=O36KF+x8+RpSbWThJDNxrfescgb+bNQqBj0EUf/kZbgWCtoVx6Qaa39KOrkBvlZZNX
 7PWXncOCaUjyocNZadp7lW39rshO2MzU0AKMqSC85hUoa/O0cURDej3uZzG7VNYs+dd9
 LnTJ7CvLBa4EDPkqS1U3q54HcB3iaYjUPTMg/CFvAAfAPHu1xAAecbYwS4vhy+yPul3d
 Diu6khzRAjVV6f4v4rGlSc38jTeXFEFjYovZvfunCpOG8lZKq7JOAFbHvRNIfZ8RfIgE
 RQHR5h5Ty3glsevcyEf2IqvZTi937k2xqBMw68ydLLw4BjpEDdWtspkBYvh2FdsOxinR
 8U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bi3ogI3L8Dx4Er73SZRL9lcKEuxkkgFyLRB/+wjx2H8=;
 b=dF8/UKBqgK8NBIOPVgiTGMgI6cjkxzVP+DOeSvNZnGWAGeL+oMvjQD+KXbzx/wZraF
 LnVB3t//yIBiJV+C/VT4k4UWdiPCmTNUlDvJvi0M1W4Uu7SVNIfcvsdj1KsoNdV4BEWL
 kKa0FaBCGjd44LZUup28XUjzLDChxvmO4JjR+LcHuaKf2EQ4qBDyXK+KWXY/cCDZDl8t
 wfDvpuOSTYpqEVx2kw/Tn6O5QecPyseoPS7RFsbQ4fni1wkGniPcV8WfiDI0ZQUWhjXr
 WbOiTfd5uZE0enWBDXSPweNMHGpCjvDd53EyKCydVbrtvQT3/7IjQQrbS4voJVYycbaj
 JExw==
X-Gm-Message-State: AFqh2koYieZ5GB50xjtTM7R2AhpWT+LHsaeMqD/C8BKZgy++cHaLW4ON
 Y53IQCRXVAmMNi00MT5Naoi2bA==
X-Google-Smtp-Source: AMrXdXuyICzBwaAjdczcFRqM5ZsfjMxlCJtUN2go/nDJC7cKJtCN+70u162GEohG5Nz6OxtXOaXPVw==
X-Received: by 2002:a7b:c5c4:0:b0:3d7:889:7496 with SMTP id
 n4-20020a7bc5c4000000b003d708897496mr5498117wmk.17.1674026278647; 
 Tue, 17 Jan 2023 23:17:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003c6b7f5567csm1630991wms.0.2023.01.17.23.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:17:58 -0800 (PST)
Message-ID: <3268c792-bb3b-89d2-f748-40ee562e9a66@linaro.org>
Date: Wed, 18 Jan 2023 08:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] hw/misc/macio: Remove some single use local variables
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 18/1/23 01:32, BALATON Zoltan wrote:
> Drop some local variables that could just be substituted at the single
> place they were used. This makes the code shorter and simpler.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


