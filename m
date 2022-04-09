Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024314FAADE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:54:40 +0200 (CEST)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndI6Q-0003fn-VS
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI4c-0001YF-5P
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:52:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI4a-0005tF-FM
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:52:45 -0400
Received: by mail-pg1-x532.google.com with SMTP id s137so8066289pgs.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=odrOnon5EKcC0+USPzJhvV+OwKagfJMjbcWnLcR5lMo=;
 b=ELZITvqWiVRlgxNfq2w9OiBg8jFCoDkyfdyUWlq9tw0hsu32N6QlWA6EEMzMZUkSKz
 KLiSnXSW+R2t8freJp9p/Mu+Kz0yvV0kF39ioMuwARapA6d5O2ndobCpzFIZcmPxiLtb
 mS3qau0W+hUAATzbPcF+KhYSsPEKTAnlqx7pT/ZGpmlP3L1b9nH53NbVhjV8iAeKHdRP
 MkCaLmZD/8u/oh6LsYXFD2/ORHMIA3Ryp1R9YVCuUWXrl9nZ9lJBPKaoVatMreb5bWeJ
 +5uQecPtHLoUr15LcmexAFIKiuriJ8xKwDeyMOZrosIj63ryCnIK0aDaMER11TiwxACS
 qFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=odrOnon5EKcC0+USPzJhvV+OwKagfJMjbcWnLcR5lMo=;
 b=pK97Ah3CuotBNNAijzO+2M7WdU5fBjvE9Tu0I08NeDBEUv90PcDB0mZXMLO41ds/Eg
 CX9Qt/dAdrCPGvmdxFe5nvu6nrlJ6de0b0qWpvzrQad0SgYl/sB09DdIFMTC35LXi18J
 Mic5s6V0MMS6IvQsJ5QCNoOVY4vgHdQbkjtTkcv/z0kdSvnjSPFQSTNq7T5l/E4EcKqW
 pFdFb7CMKhxNP3DIoLb2DAWX7kfBqNBUIzG64uPm/1hfGcP2sR7p/vTHIFYXgvAgzMHo
 g2gIXWPqS+QDh3gkOhIanC3Sy97xLGw34JznWfJxXG4y8tvyd8Br6ij4RMuRLxAlKNO8
 8x2A==
X-Gm-Message-State: AOAM532/4aNvb3BuNTOxcP2A72favn1IIOFN2o0my/CTHYupfNamMcRT
 dsP4OGU/ERxsFGeGiQyCHVvF+HtRcjxwlg==
X-Google-Smtp-Source: ABdhPJxqQnTHLXNMPmhOt1W3wqFX6mOkM47i9Amk4dsGx+eSH8/bfyi31ARPId7rFfM9yApsGvrU8A==
X-Received: by 2002:a63:e20:0:b0:385:fe08:52f9 with SMTP id
 d32-20020a630e20000000b00385fe0852f9mr20812587pgl.99.1649537563274; 
 Sat, 09 Apr 2022 13:52:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l67-20020a633e46000000b003986e01e982sm24842680pga.67.2022.04.09.13.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:52:42 -0700 (PDT)
Message-ID: <d1547369-9f59-9f1a-1790-062cbfc10e08@linaro.org>
Date: Sat, 9 Apr 2022 13:52:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 39/41] hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in
 create_gic()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Everywhere we need to check which GIC version we're using, we look at
> vms->gic_version and use the VIRT_GIC_VERSION_* enum values, except
> in create_gic(), which copies vms->gic_version into a local 'int'
> variable and makes direct comparisons against values 2 and 3.
> 
> For consistency, change this function to check the GIC version
> the same way we do elsewhere. This includes not implicitly relying
> on the enumeration type values happening to match the integer
> 'revision' values the GIC device object wants.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

