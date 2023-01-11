Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D217665FB0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:50:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdMS-0000ul-9n; Wed, 11 Jan 2023 10:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdMK-0000u8-A7
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:49:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdMI-0007Fk-DY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:49:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id z5so14425964wrt.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kx+2PZuL7bFr6pO8WocnRiw9rL7dEOWCj9OvCwcs8pE=;
 b=w4c8VsJcrRYnU9CnL5i5kAdkMGao5vgN1BHAT2pyItUKlaOT5BCrNcLO/2I5//YRKV
 lOF2j+7NvgZPbT6hsYwgugWMqD4V0xlsENLfTgMCYid+U1Vj4sgHCnieGvIsQtC7NzY9
 SnrACV+ndCKc2lrEO9dceVIe+NAkVj1qQd0S8CUTxIXqgwVWlWnV52ZtH8KizRfGIKAa
 o1GEntZaAiQ/mE6J+ussnZWENtigREHk4HiuYc6iCuRiO3gBvThJgcRLkapBfG0+1Qpq
 sDrQa1Fs8+9TBHAlFsdhrgvcRoGk9rVnhz3YYHbBQ17Jlmu1wNMEK8U0dGyhN0/Ct6qa
 po7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kx+2PZuL7bFr6pO8WocnRiw9rL7dEOWCj9OvCwcs8pE=;
 b=YbSboSxcCzwn4Aj5BwV11PrBVGvpJViUj1pgcRQAk3f+TUfni1tuMabMov+Liyj3cA
 glYRmmdD8BmDzwY0klf8gt9FXX3etQ8KvSkltx6zfmc8FHk8vXtGz7crJIxhl5JieCXq
 4sV4LXIZ9e2bhi96A8XKexosi9sMLD/0MaybGbgZZf4/sJ8I96jop2FSc/y1RxGPWHKs
 r5dro4C46lZGaYD7VkaxBalKAXYuKPQ1yySHvHyLkWWWwsyYTLnusGSyqlhEaCPnVQ/K
 g/Lq5OGgEo7KZtA5wCZCHsRHT1w52in/PuGFeog/KrlpIhYtrhofW/LLbh61wv58MHOr
 lL/w==
X-Gm-Message-State: AFqh2kqfMthrMRwsHlC5X4yntIy1q6p94mfP/Wrdl/ghWqQN6RIUJO/1
 kqEfjsokHEgqcRnPc8C7dbsuedbxo30dE/RE
X-Google-Smtp-Source: AMrXdXul+AB6ToQixj6ikqTMGn3v0zg0TZP5f/ppvrfkzZlJygOrcGx2TnWGlAVtLBcxhWdZcYn18w==
X-Received: by 2002:a5d:5346:0:b0:2bd:c499:8f7 with SMTP id
 t6-20020a5d5346000000b002bdc49908f7mr1595323wrv.27.1673452184630; 
 Wed, 11 Jan 2023 07:49:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d6686000000b002bb3229a03csm13010875wru.34.2023.01.11.07.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:49:44 -0800 (PST)
Message-ID: <68f9b74a-b0e7-c5a6-7b99-ce4f96d79f36@linaro.org>
Date: Wed, 11 Jan 2023 16:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] qemu/bswap: Add const_le64()
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 11/1/23 15:24, Jonathan Cameron via wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Gcc requires constant versions of cpu_to_le* calls.
> 
> Add a 64 bit version.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   include/qemu/bswap.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


