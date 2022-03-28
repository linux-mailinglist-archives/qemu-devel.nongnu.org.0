Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B74EA39F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 01:33:46 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyro-0002wD-V1
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 19:33:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyq5-0002Gq-Qb
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:31:57 -0400
Received: from [2607:f8b0:4864:20::22c] (port=37470
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyq4-0006QQ-CB
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:31:57 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q129so17390893oif.4
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 16:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VmUJmL1JdJrA0nrvyjXMdmt9CPHh+pEourfdVxarHng=;
 b=fZZg3M4yo2XCgoe1M6F44DQnWz03NvHL3ML2Ed117BY6d+ucoWYpd5yiWfG+qLFkdy
 geVb4RTwj5veHro3yrymv4LFpwTKgl8mSlFOFdcF8a7lKDknTvg+ivm308pqa9tp1c2a
 MQ4cYG7c0hkjxjwEl98Ov6tEriCjn+0MJi8OdQQMShx3t8SCJpRkfT/asG6SwG+ij+Ap
 MOhv7sKCOfVdPG3dVZX3R6qiejfZKok/tW1rt5FkiruPgnDyq+flKWhb5Rn28eNpugzr
 y/NPGMQvW10jOZqZ2w3TBgNajqMNEoqX8qy/EwLKN5hKJTjhuSn6cUe0dw0XPtqsgTPv
 emAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmUJmL1JdJrA0nrvyjXMdmt9CPHh+pEourfdVxarHng=;
 b=FQMc4hjZmftcMDS+6mj+n9NMGGhUUkTVcEqk0FuKqBksYN7g7PEhtOruaM0txnrGPz
 UjnpLVA6SPxBbcAamrSzwKM2u+MbtZoTTuUuRfiJQHK7S96bLq22sHPr53oQTTPNgXoO
 P9UMbQmvmNB39Bgltj/M0pl/iopoHvsHwNviuFLdonh0aOI22tjOxF4Esa0Tm7x/XCRR
 PaVBSOh6V8K9ecOXutfNCUrlMjSouvQxAjkTSN7oNTsrANKImLPMfYzSvG/0Eopi+w8F
 nVoI6Mgn/ZPkTRZ4uc4GHQlmtWKAAFG8TWR0kP/NnNJLZ+G0p4pw90nJBlOb0c7TmSxd
 EC/w==
X-Gm-Message-State: AOAM533xsr5uOv6uyHMaaiHzySKkV3CVDxqLWjflNHrTPErFo9Nn7Fcn
 cbVToqbIho9gu1nem2N5MhIEBA==
X-Google-Smtp-Source: ABdhPJzkVOLNcvgSDL+syE45euFfUxVrf+40UYM3yHmC1ORzTkhZhKcCL5PqAl6/mJPR3QTDo7XlkA==
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr860138oin.128.1648510315191; 
 Mon, 28 Mar 2022 16:31:55 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 fl12-20020a056870494c00b000ddd5a37614sm7061162oab.8.2022.03.28.16.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 16:31:54 -0700 (PDT)
Message-ID: <89ed0d46-c836-00a6-29f8-1130eea4c8ad@linaro.org>
Date: Mon, 28 Mar 2022 17:18:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 21/29] Enable common virtio pci support for
 LoongArch
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-22-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-22-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   softmmu/qdev-monitor.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

