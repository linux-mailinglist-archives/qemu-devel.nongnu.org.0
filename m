Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0EF31B3D5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:07:29 +0100 (CET)
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSMK-0006St-9V
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSKp-0005uX-8T
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:05:55 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSKn-00024C-Ld
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:05:54 -0500
Received: by mail-pf1-x434.google.com with SMTP id z6so3233634pfq.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Tf8BjAXyCBLuZlcc5vIi+hdN8PLkoCzDEzsOZMKy8A=;
 b=j8ZK49jyZHBSHy52ZJluz6C3tg13Ybjaop6vAvb+9LWA2ka0IFRsS81k1YS7xgmz98
 4sL5VZQUH4Gcs9rlpGze2eOpEd6OWNupc/BW6cjfZ0+mW4CQ+5Y5r/3g+5zsEU2AP7gS
 d+bFWFQKHhY8+5D9TJNKQ6w3IhLCGsDwoKC24AHuFOGkbjFKV/6icXLvTEYR46/Zk8c5
 L1y1BdNnupg7oXak5YO/s34JExcIL/+5qFNfxPp4SMVz0tLS8Bxgl5ZAyRxYiVcRSXMr
 k/O0F2CFpl19JTnMNZG7c7p6I5PcgDi2sp0jMd0jyCsd8Y3+ztxDZtCxULIJ+B0fs+lb
 Vuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Tf8BjAXyCBLuZlcc5vIi+hdN8PLkoCzDEzsOZMKy8A=;
 b=FojlRqrgH3GPgw1UsTU0oKYkzLVjX+ZlEkfVPw++AdfKhZkd2C9zJwcvL/qRz58Smd
 2LTIgjxo3Cbx/Y9cfrgyNMwBGDCvWTPFsZCcd3eValC6N2EV3/kZpvmuMr78Z3FbT+2m
 xM/tAMEMmJs6JbgsxWSVJVa8d/igwC+vRKBFnbXALalgX+xmIzT7MuqIIadEeawtN9He
 7nZ8Ryjff3P/VBySHeu34JZVUCHeO1jF0vEch3X2rv/x1JCHv13TsWOo5dwhQgjwcuqd
 2voOWbPcEvdLoEwN+98Jxn2TYX9KWdxu5sU5KJA0YJwtCSrNh779CX1+Hh+DfrA2KHdt
 TSXg==
X-Gm-Message-State: AOAM531veEju2XyGOXz1ttDbGshGTmCdrxpuXxLlN0lw8TjG6r9Q/BPT
 aR8q/6YdcfquFuCG2fWjhHgXqg==
X-Google-Smtp-Source: ABdhPJxyuZQi8qMvW1qLnpIRj3kya6zPfD/yoo0Zby3H08DgeuYNdgDVrPC6NhWWmaSZSRKJ9eIyvw==
X-Received: by 2002:a05:6a00:8d0:b029:1b6:3581:4f41 with SMTP id
 s16-20020a056a0008d0b02901b635814f41mr12789926pfu.56.1613351152028; 
 Sun, 14 Feb 2021 17:05:52 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 fv11sm15664779pjb.18.2021.02.14.17.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:05:51 -0800 (PST)
Subject: Re: [PATCH v8 31/35] Hexagon (tests/tcg/hexagon) TCG tests - multiarch
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-32-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0fa5672-8858-142e-a748-26fddfcafc88@linaro.org>
Date: Sun, 14 Feb 2021 17:05:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-32-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Enable multiarch tests for Hexagon
> Modify tests/tcg/configure.sh
> Add reference files to tests/tcg/hexagon
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

