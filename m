Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0A549E24
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:54:25 +0200 (CEST)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0q8m-0007Vv-RE
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q4c-0004vZ-PI
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:50:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q4b-000563-EI
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:50:06 -0400
Received: by mail-pg1-x534.google.com with SMTP id f65so6473620pgc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p8LgFPfWSVBCft3PaS8agsYldU8zkEYa0PRWa7AWBvk=;
 b=CNI8Fz32Iy1nGk2WaQx8eXDLOiGG81DX2D87xvo6WO693lxdLmKZGMQcTrDpM/MZcA
 6Q3ieviuJ6l8ogz/Us7bH5VElXcIQEP2OTaagMgN/1SOootuLXEgK/AF2GQiXAUfzWKL
 CP1JI7ReK6+yAp1GjDc5JoievrzBTbtcumFPFaQv/axsWL58mzdN2IXaUvneYGASSMwM
 h+UYLX9QRyClEv08hpLIqCK2HjK6aJVfiOKHdmWkixUZEDeuw96gIQnrUzOnCPtHps9h
 cotBFFy6gvJrSDDgjqMYsigvwZxyDYmEfZN0eJzAJmdoqEkTI/eAJzOgt/7+VDQVQFzr
 D0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p8LgFPfWSVBCft3PaS8agsYldU8zkEYa0PRWa7AWBvk=;
 b=ryxMKoMfVLQZftoWXf2k84IIh0xQ9Et+yRB59/EwNVFyq75rF/MGix/OU35d9W5eYB
 XgGnYSn3Ugfwt1WPyLGJV4j/EhWGl7K3cBibLp/CLY57lmU5Q2fTTIN418CYqghzqSNw
 LFqbKLq49xXOGP5wSOL7JpAH7VqmV1Awjo+RQqAAhOOWvnuTAxwyyGdNRnpY+3mreVxv
 PVBGg2JTcD41lxesyXv11zQYREmvkcgq5Wfq48jrcZ5RNbPKlAKODY0vK1ERf9D9Mlwn
 27ArMh8f1YXs2CG9d8LBkVopyJvgwf4h5CCrxTudd0o780N+NhITQYUm6ogprUVT1aAB
 +W2A==
X-Gm-Message-State: AOAM532BBRiD35cfgL3oNWc6s4r6YCOwN9qNF3gJlzoRTgUuRFn0McNq
 zCWMTkOPF+HNYl5GrU2HmFXUDQlMRMnhPA==
X-Google-Smtp-Source: ABdhPJztrsoucEK6uUWrMDHXSdff77DadYoMlX6fNUauDU8D8GN9CYk8rJL9wkmhmYcxl2rj24KCIg==
X-Received: by 2002:a63:7d4:0:b0:3fc:7507:cb09 with SMTP id
 203-20020a6307d4000000b003fc7507cb09mr1090180pgh.582.1655149804187; 
 Mon, 13 Jun 2022 12:50:04 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 s138-20020a632c90000000b003fdcf361df6sm5881772pgs.87.2022.06.13.12.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:50:03 -0700 (PDT)
Message-ID: <8b88947a-7f8a-6f14-0cf6-a6a8a31bad3d@linaro.org>
Date: Mon, 13 Jun 2022 12:50:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/11] bsd-user: Implement mkdir and mkdirat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  8 ++++++++
>   2 files changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

