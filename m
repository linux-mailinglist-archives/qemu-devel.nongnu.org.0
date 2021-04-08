Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548D358D6D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:20:58 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaD3-0008G5-DP
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaBV-0007ME-VC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:19:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaBU-0002Yo-F7
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:19:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id nh5so1670789pjb.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G7owpRl4/c9XrittvGfE47hXJTPSR6NSirQ7sH31xf0=;
 b=qtBEbm/WEMEK/CHxdga0ChiJlJPQk3Vuo5ySuw/9pZqOJhfIrhRGXcdY/Usnbkrb1i
 3ABXBzJ0NlOIa/BT1jpdXrhC7/0q0gOQHf19DQAo2MFQnfElOkOosMQbGnPgnlBYIek+
 HlNx9K1XIRPNPC/ceG+8meiVz97TBEfwGVp1H7v6wbBFBDg/lByoPkBBFLQWNM6TWlW1
 zPhVJVC9hPiLGCv9jKSueAo5BhsT8znY6NvM7TfOrjKFTIz1TEgr3J1KoSLMhEG29Dmb
 jh5/hQdm8oojzvk3ABWkUkI5YHLthaVd/FCzLT/IrX9Y/y7vTTEzk1Oz0mH9LuAEzgF5
 JcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G7owpRl4/c9XrittvGfE47hXJTPSR6NSirQ7sH31xf0=;
 b=fcztcW1ueM7+lSBoIE4HwnVj/zmlahDnEXU/cdM2CAHmA7soZSE9Kpj/pOj1ZV/sGL
 ZHKD9NiZ+Wb5sq1QhijoIHHEHx5H3tx3MEn28lFWmyVmWQZEvVzqQ5AwK4OFdu879sWP
 UASK2uoJDMEHyDC+KUT0tmRDb7Mac5R9n/mergvc/8nGj2GbtNVHRvhutRxRn/NkIgJU
 YL8M8JuVs8YqeI/JZDhOHqtZ0cHokG6AbH1G+kiTALQjScrziXFdV2yUnw70ap10Rmqe
 Fq8vofTA0s4uvVIVHyNvbcGVkeLD3U+Ew4QfoQhE+b6vALfPi5b65BEfQGSmj/GjBUCM
 vRUw==
X-Gm-Message-State: AOAM5332HfuQjdEBIQBXHGAoEaBwddROlzZQtvVRZpS14ApYsyKnccjC
 emM4uAoI8P1Iz2GtZPo0ftanzQ==
X-Google-Smtp-Source: ABdhPJyfvWfIeCJjd2vk3525wbRNVqozdSUOFvyU+UW8p7ljD97YOoWbtdjEl1eHF0IN7kXE3P85FA==
X-Received: by 2002:a17:90a:bb8b:: with SMTP id
 v11mr10202420pjr.4.1617909559138; 
 Thu, 08 Apr 2021 12:19:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a6sm228976pfc.61.2021.04.08.12.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:19:18 -0700 (PDT)
Subject: Re: [PATCH v3 15/26] Hexagon (target/hexagon) move QEMU_GENERATE to
 only be on during macros.h
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-16-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83ae9df2-272e-729d-765e-69f738042acf@linaro.org>
Date: Thu, 8 Apr 2021 12:19:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

