Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EB39FDE8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:40:00 +0200 (CEST)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfhn-0002IT-3k
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqfft-0001PO-Kv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:38:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqffs-0007aF-0t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:38:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 69so11042182plc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SvSRsjcIoHcigozP/cDRvCcrXAwXAt9OubnbFa4/xI8=;
 b=BKOzVywi4fNyg3tTfC3c56fzJ7OG8bwPwprlDZP1KTUwuVFrMkIBt3nfOH7wiUDMfi
 g1w/Io93uXtfpiaAqMOcszJDuV9DjrZe5BUoMrXYFJ/J3NgRl+fPgLGQ8ofm1KIzgD5q
 AbV2ADE8jLHZJZgyM2ZJOUpB2rfMzqet+d9Kqsww3B1tg/Q9wOP/HsKG2tzWBXOjQJwu
 j6e808r16SnOr/HRCx7hBRAuLbXI9FDmhQ4lQPEulUiJ9rEoprVo6Mdhmie7a/a9uye3
 XO8/+H0IRuObidrH/gVki5705uVprcVBWJdf394uWMglsYGb5wIJeMJRQLRd9uMukHxj
 gfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SvSRsjcIoHcigozP/cDRvCcrXAwXAt9OubnbFa4/xI8=;
 b=Y8wibnAeGpfZdOFvk9dhrEjAqlmXAcHnBZXy1KgSnY7f2BWQAzYEQlWrUxReE7qcsk
 QKhtPpNXCkyhq7ca6JT7hT5w2oqjM+je3oCPoPoWZiAyrx5877Qdb3jnWExeUN6qI1wY
 Dzfu82N0ouBwCYrCfn9Y9v8+RchzwWoJEv6HktbHn3MqL6hwax4I7zsvKaqlgNuecFs8
 EG1MJ6Vfp3Zx+mDymwcEdIo+xWW4mMY8EcICf81CWbVbHVj3WuuSxiXcC9cff6pJF+P7
 8Nh5g/ufYjYjhBeeijlCOZlNZgmyYY/4/Oxoi9YX7YkAIH0XF+ANFPF591H38e7trWKT
 rX2Q==
X-Gm-Message-State: AOAM531tEuY/h5JoXeuZhGfqpP2gLSws34DJybR9LC0p51/KWcW9DZ+K
 eGgHxRFMKxDFrCKfzJnKNI5ayv11RE9agQ==
X-Google-Smtp-Source: ABdhPJxW2Rez/AbW3d3deKTSc34aCTeYqIGDsJgh8w6pId8LMSkvoAX2Zds4WNCnGNFNb35zUIPOPw==
X-Received: by 2002:a17:902:e784:b029:f5:6961:f355 with SMTP id
 cp4-20020a170902e784b02900f56961f355mr1119598plb.9.1623173878454; 
 Tue, 08 Jun 2021 10:37:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u190sm11311812pfb.151.2021.06.08.10.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 10:37:58 -0700 (PDT)
Subject: Re: [PATCH 01/26] meson: drop unused CONFIG_GCRYPT_HMAC
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5608c01-5f9c-01de-7ac3-03ec1bcac050@linaro.org>
Date: Tue, 8 Jun 2021 10:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> CONFIG_GCRYPT_HMAC has been removed now that all supported distros have it.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

