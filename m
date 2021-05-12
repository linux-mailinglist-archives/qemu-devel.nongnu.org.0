Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297037B327
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:45:20 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgd03-0001Ai-77
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcve-0005Mt-HN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:40:46 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcvc-000241-Vk
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:40:46 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so12828367oth.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DDxkI1ovy5MjUFJCBcLTUiStdNRmVhVneBvEVuF0GCM=;
 b=ZqrksRLBtuMTRSdDe7yrzcUoF8ZEn1XQfbuobGPC7unrALThwVVqr2MqcJQmIh506m
 0oatCllSR/VEjOrNu0YNEroQr+snfLWcT4Fp/K0KhVCt3HRjU3l2bc/fxe8TRC1ZKsXZ
 oABH/A4jQ/Wh8nDsYPiTXEcUAIxXfGTuYjSUEOWoAOCWhou3dNoA7q+3CxV8gxcLe7x9
 ELRNiCc+d/IkD/pC42h4KXVins1zLG+eND4YlrOHGJNkDsRuZ6KSW+zoGXyEHfn0phS1
 tKbZNLdfi839z78NSseIUItmvmlPUIJgb4zI5lPjlUJhOXV0selkolmED1w7nvp9Bjaz
 MMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDxkI1ovy5MjUFJCBcLTUiStdNRmVhVneBvEVuF0GCM=;
 b=f0lwf6sbn5TSKBloO1O7R/RIE4/uljhZmGPzTPU8h0TpFxBBH2fmErvWLtVZMuVHXl
 YYKxPDYBvmw1k/uL7XdgKa6qaM1ls0nginB7wOReg9xUvMnKB6xY0Dinpp56DmvRFMYq
 7Ns8Xp5x5WIV/jN4vE6GwdkwCkuh12oqudtoYtSNOxJWmL9jDNJt3n8KZoC/pGArCEGe
 Y47kyhrfDTK2xFFb0DbRep57G4j5iGfqSA8D3ZeOsad0lscrbMuKevVqV7k8QpXQ/7Ob
 +S7uI3ChBIxVhBbfWbxWkIm04hdKOpoI7JzO1wKO2LbXVFz1mGclMxoZH1G25v2iFusR
 V+aQ==
X-Gm-Message-State: AOAM533lTKCkdvwiOyoga9VjAyYnYpgTDvO8Rq1XDF4Zlw4t4awujOv9
 VkTOHuzvEu5oRVYL+vUuIqvM7g==
X-Google-Smtp-Source: ABdhPJxi5OEOMYyn5oqvIc2ILM7opIJkEiKB7+BjdNhCe45dLEkHcYcOQCRGdeaZFE9DtS5WAUjYsg==
X-Received: by 2002:a05:6830:1ac7:: with SMTP id
 r7mr22672578otc.167.1620780043757; 
 Tue, 11 May 2021 17:40:43 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id e39sm4158637ote.62.2021.05.11.17.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:40:43 -0700 (PDT)
Subject: Re: [PATCH 04/12] crypto: drop back compatibility typedefs for nettle
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-5-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e364ce8-2232-ae79-5936-3a57d2ecf775@linaro.org>
Date: Tue, 11 May 2021 19:40:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-5-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> Now that we only support modern nettle, we don't need to have local
> typedefs to mask the real nettle types.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   crypto/cipher-nettle.c.inc | 60 ++++++++++++++++----------------------
>   crypto/hash-nettle.c       |  6 ++--
>   crypto/hmac-nettle.c       |  8 ++---
>   3 files changed, 30 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

