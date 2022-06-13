Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6D549E34
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:57:36 +0200 (CEST)
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qBq-0004Zc-Uk
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q3n-0004bf-TZ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:49:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q3m-0004sN-BF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:49:15 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f9so5996999plg.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a5pnAzk+32oy6yLP8BTMbZuD4ccpdjc7x5AICqSFz6w=;
 b=SLFM07NZOZ/zdF8Gby82fmPCrJ6+tVc06DVQVGnYN54DmKmjgtWw1FTrV6e7MM/8VT
 9lXO81GIxwolWvVprAB1+ZWSVLTNNBUFmS1JkSH90dmDM3YU8Ka5VHzVFlH/D1w1iWGi
 TbWZcETVvFdQ3Sj2I6pjaM8cbnBRTgl8z5vQkutdued6jI3TslXzm/z/Zr2KqJAT938N
 C2gyv52gr+TBS+kHes53NUACQYSt9ejaksYP02/OuTNlheu0mtCQC2Suvo6BL7RttPTr
 sMiN1ug77DCWenWw9Dj2+vHcZ2H36cPD28EFW3JT7fCwpi/M9AIvSyc7+1A6XJUgE6zJ
 6B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5pnAzk+32oy6yLP8BTMbZuD4ccpdjc7x5AICqSFz6w=;
 b=8Ommwj8kZZrON+iN+OKtvP/gR/oDYodO60iET2CDsYZ42DPi9aGcr2Ip7/OowJNIWb
 pH/Wir4pZkBgWFPq+a0Ns+V0nJiqkMlKVWZoDJhEc2UoWdVQ0bZwGEqllb/yxqx4vvpV
 eclmtoGInkMlvSSX9vl1FLSnOLnNktStVdVldFC2FvU8r6A5RqXFWw6CTDT1kwt37KTI
 xbFSpUv/kLFDWT8RZpNRllMHFeX9uXqIpHJOn3dBG6WbV9QU39cye3ncwWVfI7rlzYRX
 qW0R6DQXaqaREQpLUxl+D487Mf3qYS3zN+hlbciTDQFBBc1NXShGVL1PeF2PEJ7HTOlV
 qE6g==
X-Gm-Message-State: AJIora/3RIhSyQznZpYiowbU9hmKm7oD4YuChKdH0eqGv6sVOluL6iol
 A3dHgG/V/XgMXYNFJP+mEY4Qtw==
X-Google-Smtp-Source: AGRyM1udWBn2VUp0G0xAnj/FbvKxzOspAvBsP1ESYQIO3P/RYg/9QAbr+GzRJK92ki4XSZMsED1pKg==
X-Received: by 2002:a17:903:186:b0:167:6d8c:68c4 with SMTP id
 z6-20020a170903018600b001676d8c68c4mr541270plg.91.1655149752422; 
 Mon, 13 Jun 2022 12:49:12 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a17090aba1300b001ea808094fcsm5614234pjr.49.2022.06.13.12.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:49:11 -0700 (PDT)
Message-ID: <e0f68345-8a66-f332-ae45-99ebb79699ed@linaro.org>
Date: Mon, 13 Jun 2022 12:49:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 05/11] bsd-user: Implement rename and renameat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> Plus the helper LOCK_PATH2 and UNLOCK_PATH2 macros.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Jung-uk Kim<jkim@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 45 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  8 +++++++
>   2 files changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

