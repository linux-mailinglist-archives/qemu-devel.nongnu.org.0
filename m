Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97F442060
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:57:07 +0100 (CET)
Received: from localhost ([::1]:56814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcUU-0008Bp-Cv
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbNp-0003rF-Nt
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:46:09 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbNn-0007n8-Jc
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:46:09 -0400
Received: by mail-qt1-x829.google.com with SMTP id 19so15004354qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XzX08mkc8lICHGgJm+2F9Q1wLQnL+YOVx1G6IsUiEWY=;
 b=VYuogH6wHZspmYqmf7Rk8Lb1QNvxtqccOmSqiuz6np/fAfEzxNqH0pA1eigGwHlCBs
 +UwKacUVFB1H+DK0h5k+IUUjLYL8fSkhDdWKE8qCDuOB+QaaS651g/bwp6G6LKOlRPZW
 yKr+boseW7JJMFEFsijmXKiTj4iJz/tvOg9r18BjFB4vtomLwNXb//kpEsW2jaMCQtA1
 4pLaQxOQ/WGPfrFsWJHjQRhkhHRRBVXd/tAPGSnlXiPMf164tHCYiiJMlgq52poFbG84
 IV6Y/WqptPpRT2PGP/G0/jg8xHxABwP3wvonwh2iSLyjyO/o7TsA9lM3qaMDfX/Qa+w9
 AvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzX08mkc8lICHGgJm+2F9Q1wLQnL+YOVx1G6IsUiEWY=;
 b=v1gc1T6H2FWksYSOphlD/08bGuyVzji+/pWmu8jnxrOuuwW8tq7d+/sJ4iF8szom3X
 brPWqvgdp8SyRIy1umbHHpd8LNg3DGi78tYsORAP7NGCrVB3DjofudF462tXo5r7y24j
 pOxVmVZG3w9Ry8ahg7/3lHC8pR7Tb0BI06I3RjaVlzzxYoP+H0ZZzfsE1W4W2v+qX+r3
 p3hVzyGApZ3y7ZnWW7y02vTsIyZB0jSJT3ghtDO0lBPSfZ+qhtVMghYSa7CjrdZnRt7v
 4BMaQoWcIDeQ1QUjoa4yq5Wb4DjJwkhNdw9EmJznpt8O5hJehog8zEypgOSORf4booGq
 W3yA==
X-Gm-Message-State: AOAM533oglKqkcmYqG3v94Hr8oxxhuGCh3Z9zm47KeZwVgPOqVIUqH9W
 9S80fB9Y1Uv1HT4pI4p2KsIe4Q==
X-Google-Smtp-Source: ABdhPJyytIcJUe4ZANuJGiXz3SHOLfaHVvVkNSzunLCcK9s5IcbXYseWKhf4ArhENkvfrCrh8LXAaQ==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr31310734qtx.194.1635788766511; 
 Mon, 01 Nov 2021 10:46:06 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d9sm6654321qtd.21.2021.11.01.10.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:46:05 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/virt: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20211026093733.2144161-1-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d3143ba-e91b-0f85-bd8b-4b551e966ff6@linaro.org>
Date: Mon, 1 Nov 2021 13:46:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026093733.2144161-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 5:37 AM, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
> 
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
> 
> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 
> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Reviewed-by: Eric Auger<eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Tested-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
> v2: Resending to be merged separately from the equivalent x86 fix,
>      already queued by Paolo [2]. No change other than added review tag.
> v1:https://lore.kernel.org/qemu-devel/20211013160607.649990-2-jean-philippe@linaro.org/
> 
> [2]https://lore.kernel.org/qemu-devel/55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com/
> ---
>   hw/arm/virt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to target-arm.next.


r~

