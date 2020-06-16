Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D71FBDE2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 20:22:45 +0200 (CEST)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlGEO-0003XO-R7
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 14:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGBm-0002J1-QJ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 14:20:03 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGBj-0003Wt-3G
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 14:20:02 -0400
Received: by mail-pg1-x544.google.com with SMTP id v11so1587965pgb.6
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7EH541OwJ+vrz3gLWn+IAXHtNpDt4gK6bJ8iw4e7F0=;
 b=I6GXsRQrfK/+moh0oI6VM26S11JJlnTrRUgeyhoqZsLMqn6GiQu4U0Zb3mcpAj77EN
 5adRHuwrG+rDJtJ2KVT/182NMSUGXph0x66juyJXzgWXdSFq0kjTfxQrEdepQ23EXlXm
 IUTD/L/jv8q2Dev/tsTUtQB5szxMEe0H065PNnMv6AqDglvjzAz1Xc33y9q3wr3rIWED
 oAcz79QFIsqjd5h9qBsqXdDXl7oU6mIH6Qva9/gwSI+JFh+PPUFrRBJh0bprNiRc8mHj
 hB9H8LsYCatuw8p/M7Kdh9twN2hHBpIS4fvH1XG3pOmZfYOxZAmrbaFTD1WVYG/DW3Em
 12KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7EH541OwJ+vrz3gLWn+IAXHtNpDt4gK6bJ8iw4e7F0=;
 b=a7xSBaFlRxXUKXah0aGBJmet/KnVTO+wg/zX71uQ2dg572VfNIeSaTbGGciQhvRFqf
 VnRgk+/9c9FcigwvL82PuAMhrzVm+PDXx1QEz6vZle3NPZj92lWeeHfRU41ibUOoPzH9
 MwP3b8WDswPI01a5x6ZekQ5LE2cfjcIHO+zw/m5hZcYUKjPGdDxNeyMP8frGoLdZ+NLu
 5cYoGyjh66fcRnLdL6mf51oC1Y5fGsDzIz7g3j/yxoR/D+K8Nr9xG8B37ho8m5T13R3V
 Du0LdJ7tD1ermSFEAKvY4wTHDRBR0bTbAPDD7K+wHPTWdqO9blqOgs3nnEN15+o68X6r
 IF1Q==
X-Gm-Message-State: AOAM531Juxk2s9ztoZjPrTIsPoaQbqtPnefNyezf7dd4GdsWUnSBLf54
 O/SZ+Vap+X/e3rEu7TR5ZJSTmA==
X-Google-Smtp-Source: ABdhPJxhgOklGEq81LYwGtUvbsjmEs9bC9DuUG+YSFI9L4LRuIG98bd64zz4vLdhcyTthcmXKE9RDQ==
X-Received: by 2002:a62:1c8a:: with SMTP id c132mr3295154pfc.69.1592331597550; 
 Tue, 16 Jun 2020 11:19:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm14534684pgv.5.2020.06.16.11.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:19:56 -0700 (PDT)
Subject: Re: [PATCH RFC v3 0/3] target/arm: Implement SVE2 Crypto Extensions
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200427214046.31401-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbc874a5-2e5b-05a3-d52d-d96ed1fa9237@linaro.org>
Date: Tue, 16 Jun 2020 11:19:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200427214046.31401-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/20 2:40 PM, Stephen Long wrote:
> Modified some of the crypto functions in crypto_helper.c to take in a
> desc parameter.
> 
> Didn't add a desc parameter to SM4E and SM4EKEY since it is used in
> translate-a64.c and the functions in there need crypto_sm4e and
> crypto_sm4ekey to stay the same type (i.e. take 2 or 3 parameters)
> 
> Stephen Long (3):
>   target/arm: Implement SVE2 AESMC, AESIMC
>   target/arm: Implement SVE2 AESE, AESD, SM4E
>   target/arm: Implement SVE2 SM4EKEY, RAX1

In the end I took care of these insns myself, after rearranging the AdvSIMD
helpers.


r~

