Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0665D72D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 16:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5YN-0003kl-Tt; Wed, 04 Jan 2023 10:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Y4-0003hM-8B
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:19:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Y2-0007u9-3G
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:19:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so26705288wms.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kPTejbbi0VjrwZB3qm0I8/+jmgejs37VoikSC1jaUtQ=;
 b=AhDzPHiSag5hRqrsTQN2J0vuhBPs6nWR14Nx5/y7Eg0iKnIDoPZPGkD9b4OwiPoR9u
 wS9wgHnq7Ei4czHMLFTstFMhCH94/k12Ehtc4wRjzriD1k8WsGRQyUCzc9gTaImXQNhg
 qqwLwDiOkCUBdgQqahpfsNY3lfYZgilLFDbpu6SFuL6zxpz8oBVLVMJmVO5lg5HEE2Hi
 Ia9CuCDCBhGADcfj6+Qjr7uK7SoThYMhM1JnGu6XtSq0Bw/hj8L7MbItaxiQLEynibq4
 koSFvychnjqJrUvLRBcE+yuFr4jJChIxAVVfzEg7fULMcQxwxiYsWLpaMam1a5HJWq0h
 A+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPTejbbi0VjrwZB3qm0I8/+jmgejs37VoikSC1jaUtQ=;
 b=7h8Cup5tsLXhqRatsisTemqkiWAlh+yTsz4UV87nE6uNuueNn7D7pMoL6J9ci0FpIm
 yxhxAl6MfQT4ZyI4mNdzhCv5rqlidt75GLxA+tQL8HDDB0UQ7Q3rlUkdt5s+uAds+0Q7
 agHEVXORK7Pc+D6gQdFeSGbaz8SgYzIhfl+DL1VpaPONQCrvtuVYks9+SlKA0OPkDKUR
 RG+nn2/932dGq8TzHivNwjt+hN518YyBt9Z4yCRkJrqpS7D+tAA1FujxM5WtvFdorO+4
 OsUuzTwutYnVeu/UcrIT3mMnjKG0OXfcDfa75FoofuogLCeL8CuXUFv8JmD9yIgLM8q2
 ybCA==
X-Gm-Message-State: AFqh2krVU0hxdCTH9/HEIsrVablvJGhDIv7dmb4vUu/joTKhkHOvCkXX
 q6SjALYd/vJ/bwBnzFIMBzf80A==
X-Google-Smtp-Source: AMrXdXur2qtX7wLHbl0tKH2b2is4RZ/VKSr2T4aG8FJIBb61gSsVoK18AtRN6qbV2HSt2GDGU9Bh7A==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr34776131wmp.33.1672845561368; 
 Wed, 04 Jan 2023 07:19:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm69512254wmq.45.2023.01.04.07.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:19:21 -0800 (PST)
Message-ID: <265c7231-31a0-09a5-2b39-57e0d610661f@linaro.org>
Date: Wed, 4 Jan 2023 16:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] hw/isa/piix: Resolve redundant k->config_write
 assignments
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 15:44, Bernhard Beschow wrote:
> The previous patch unified handling of piix_write_config() accross all
> PIIX device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


