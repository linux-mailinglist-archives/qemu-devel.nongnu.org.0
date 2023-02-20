Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D969C74E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU26F-000088-6a; Mon, 20 Feb 2023 04:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU26C-0008Tu-4K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:04:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU26A-0001oG-Cc
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:04:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso422757wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6D/eTatBmHSKID3xazI6LHHL0R4uBWQmUBJ8O6ekbCI=;
 b=K4/mM05MnxZZnFf99BVJHyBRTMX9Uo2EYVYcRHfxSaRrArxh+liF9rvUrTukIzvYAF
 XeLGL5Nd14SKGWnvEN7v8ztpoIOklbGhsAuaF/cgoFjRguInShsM1yWlt5wQKzJGMSvB
 zNQfhCVAdCFCgzP64WYaKU94ofvv3DCVn27HHJqSAA0XEMkpv1sG+KZMptmy/c3HVpub
 nZ4ffX/yenCsldokPuPCKLVr0wExzH/PiZxuZutfyP8nj72wjGmsMwnvK8/+69RXKUyW
 rNVQFoj1AZs6s93JTwSBrbQMgI5/lpq7f8iypsMo5iEDCJKsh7Se9npnvrcZ3XCHxJfC
 Vh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6D/eTatBmHSKID3xazI6LHHL0R4uBWQmUBJ8O6ekbCI=;
 b=W8M950uESUL9lMxHYY9wbhHmXzM9GYBt3wYIGjAYB8o+03uKaC475RrRO0OP1ZOLew
 rHcMRoUS1ABSTW6ejeSZojb8uxuiLdjbYpfB0VCcge3QIAUll3ex7T0SP83qs/QoYov6
 8m91ItK2dyB36v2S5vUaXG7Fo9oiQBR9SaNmLpTjMStBwCuKvxgC474+uqPBaPxclcwo
 nvHqmQzibGVeY1gcrcRfSZE1WpZr5ZNlJ1fDLGr5ENFt9NEnYFxXhReWHj7q9sZOtL3j
 5w6zMYUnHOTMHpybI8nJx2CyDj+um91GMyvJWfUxRJuy2Vbib9dOIJEUXEibi7dt2aHN
 vVLQ==
X-Gm-Message-State: AO0yUKWMvizNe876Ia4OmA4n8tRRdaOW0xF+bgKK7+K29LQ3n256MYHd
 8gbQGtnV+peZwCq/+Kvd/c03Bg==
X-Google-Smtp-Source: AK7set96H5JQCCnbfMRKy+fr+1KkBw10EQN5WL6enqOK7oMO3ftQ4x1/T2jBwj3C4YigaWhI4C244w==
X-Received: by 2002:a05:600c:2b46:b0:3df:fd8c:8f2f with SMTP id
 e6-20020a05600c2b4600b003dffd8c8f2fmr290536wmf.40.1676883876764; 
 Mon, 20 Feb 2023 01:04:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c00c800b003e2243cfe15sm10166811wmm.39.2023.02.20.01.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:04:36 -0800 (PST)
Message-ID: <aaec48f3-fb3c-56c8-7d61-5aa7fd12e28f@linaro.org>
Date: Mon, 20 Feb 2023 10:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] linux-user: add target to host netlink conversions
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-4-Mathis.Marion@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220085822.626798-4-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 09:58, Mathis Marion wrote:
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> Added conversions for:
> - IFLA_MTU
> - IFLA_TXQLEN
> - IFLA_AF_SPEC AF_INET6 IFLA_INET6_ADDR_GEN_MODE
> These relate to the libnl functions rtnl_link_set_mtu,
> rtnl_link_set_txqlen, and rtnl_link_inet6_set_addr_gen_mode.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/fd-trans.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


