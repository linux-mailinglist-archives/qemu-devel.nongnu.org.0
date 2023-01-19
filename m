Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFD673AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:48:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVGn-0002oN-FE; Thu, 19 Jan 2023 08:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVGk-0002nq-Sd
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:47:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVGi-0004KI-65
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:47:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3601594wml.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9bXHeVoIwT+PFteQaUrDnF54U3Z1lr4pR5sb9PrLKo=;
 b=UZZpvSb4HeeCGugClpiXUn0wdsWW+TuXI4dyAXbKgqI691dXcSWVmUs9ufQDp0iddi
 xmQYed+iCc+i609dG0nv18sljoe5q45gArshR27Oz7+pHwgLdmmZeo5dO0wNjOqSskg7
 DBKxsaNMDGtbEfQppznD76T1wMinxwpRDvKyQ5aL8e6mIr/Q2ZLUGCfiLsnFCFv6yMT4
 SniebIt8AZQd1UgTWAs3tKI0Abpfv8ThUjYAte7cRX0B8PSLoVwnAvhcvLc9ddcodJgN
 0ACIqkZZ7zQIpYZLE1dUVPAs1j3eSAlMBuEwMgxRdhwiILUQEHuwVWg+Y183I4KYJd4U
 ld+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9bXHeVoIwT+PFteQaUrDnF54U3Z1lr4pR5sb9PrLKo=;
 b=hs3N/AtTrFf0Feyh+MtXPqX1FzAJy+WVJm+tSDOWq9nOi/HsL2Fh+rfA6NYz7TiY0A
 avpvbGxdkpYEAvLeEGZgP9wbMWT/M/Y/7XZqXsz7dt+D97Ea8kL/bCHkh9Dzl2LZ5KpM
 WTwd96w97kchqj0sW+2Lrug3IdwixPhfx+lNA4CNfq7NFIqfAyPBUdPszzJNylWQrRfQ
 HBNTuf+JtVbP13lbJKxbiQfVMzwP/mAu4rToGW846WIbdzlFIPLe0HimV9h4nYV1G01W
 kdoeAfA15XXSzvtzgwc3KJTOWwra9HvjStPae6HSVAoCEirZYU6Tv7kOulq3p3T9NnnK
 1Ulw==
X-Gm-Message-State: AFqh2koK2Rn4/2wt2b2W65OIN9Tn9BY1XGvViVgmMwmfkE/E56Pt+a4k
 Ef/5X3gbOzz/jsvvuRyT6+ZLzg==
X-Google-Smtp-Source: AMrXdXtI9XL85z8VUY4QYxeYDFuacm97AViyYtNU0fx9peSC7l2A/xkDBE0lg8/rPN3GjRUdogGNBw==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id
 ip16-20020a05600ca69000b003d564bfccb8mr10260651wmb.12.1674136070678; 
 Thu, 19 Jan 2023 05:47:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003d9de0c39fasm6447017wmq.36.2023.01.19.05.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:47:50 -0800 (PST)
Message-ID: <b99714ad-8191-f830-26f0-4ed3f12a0d8f@linaro.org>
Date: Thu, 19 Jan 2023 14:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] configs/targets/nios2-softmmu: Add TARGET_NEED_FDT=y to
 the nios2 config
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20230119125745.2028814-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119125745.2028814-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 13:57, Thomas Huth wrote:
> qemu-system-nios2 uses the functions from libfdt in hw/nios2/boot.c,
> so this target has to be marked with TARGET_NEED_FDT=y in its config
> file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configs/targets/nios2-softmmu.mak | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



