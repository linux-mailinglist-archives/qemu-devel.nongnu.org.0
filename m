Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD09564CEF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:27:31 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EcL-0007r0-K0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ER0-0006Ga-NT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:15:46 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EQx-0001Pm-GO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:15:45 -0400
Received: by mail-pg1-x531.google.com with SMTP id v126so7926716pgv.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xXlBTNtuZYRBM+TUVeDyr26HV5K4Dv9aXVUbd24G370=;
 b=yDxcGtvv4H50GBOkjb3Mddhtp3bEOTSEuXDujH/cBLRcj2VoZcrmDdUzGhLU4euXk7
 UX3dVos/5g/JgiRYFvgwwVCcl6FGB/Ua61t8g6Q5RpOQCFmT4pUbhe39YU9PyyDB1piG
 fYDtjBWWiEh8ijr8mf/S+yKKNNy1sAXyOvyTDl5iRicJi+t8nLmT72RzHlwzQI2mtwuc
 DkPjniGOh27EspXy23nPNM5HFf7PjQDFWFlGxGqWLfgTJeU6TYtmVBGIvkl0LSXMssFh
 itLsvCFKhU9483tL0DZxtgNbr5CZXEKy2QNNlYPAtQrndcPyG1apwdGb105Fp+PEAeeG
 qufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xXlBTNtuZYRBM+TUVeDyr26HV5K4Dv9aXVUbd24G370=;
 b=JlFbU/1cyIu8Er9Z3AriqSOHm5QGRr0/B2TedWgcLO6VHC1AYT7n+r6ot5NUNqR0Sz
 mHDOFakujyvPRwStEbYPg+kRrKGDOz3djFxJWlm2WBPNngi+QPVJZ06NBIFXyJEaeoFV
 cMyAEyybNe51+gNSsnD3kLI7k3CdgFmZRkhPFFeE0h3AzUFu9ZmtPYhEmw8Mfb4t6HbP
 AE/Dy5tNc9JHCBSmviL2MEJq8NHcUj5EgXCG6VhPqbFz1qp84LO0y/1g+4FSE/6jUa0g
 dvWzt7stuvwbpduvVttnvkU9ZxlFrSJn8h8JWzLC0pJSSmQFDly4EgPyF1x/WL04WPkO
 X+CA==
X-Gm-Message-State: AJIora8yybD6+xH/zLJZoOi2Ghmn4cN6dCT0bRUxHHiaoGA4pfOXaXAp
 ofTKn57XzpHz0VQ+/2MWCVFafA==
X-Google-Smtp-Source: AGRyM1vL/bvkHokB5ExTowzCD2KpFoDW+YIcMXBua/Ohnv0tp3hxVAmqBjVjWj66gAoD8L01LgPC2w==
X-Received: by 2002:a63:34c7:0:b0:40c:ffbc:4faf with SMTP id
 b190-20020a6334c7000000b0040cffbc4fafmr24141201pga.577.1656911742218; 
 Sun, 03 Jul 2022 22:15:42 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 mz5-20020a17090b378500b001ef88c30fbbsm920677pjb.49.2022.07.03.22.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:15:41 -0700 (PDT)
Message-ID: <1866f9fa-0581-e2ce-d409-8c8a0a03d70d@linaro.org>
Date: Mon, 4 Jul 2022 10:45:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/11] hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-8-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-8-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 15:04, Xiaojuan Yang wrote:
> Fix 'calculate' spelling errors.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

