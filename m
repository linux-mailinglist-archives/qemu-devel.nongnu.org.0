Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD04E5745
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:27 +0100 (CET)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4cs-0001HC-3M
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:18:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4az-0007TL-JN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:16:30 -0400
Received: from [2607:f8b0:4864:20::632] (port=44820
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4ax-0004Fs-9X
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:16:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id q11so2130603pln.11
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hTgX0iktLeYeNHl0mMfkwxTN5iNNOl9CaQ94K+RDDN0=;
 b=T58/3iioiX1yyvmzlo9RfjluRVdXh24KePZodygNglGjn1xZ4LSyXHc2QAWPdP3sZf
 nq4m+Cx492z0iQqDeSYGmW3OHv8WwR+IWyAFPE1HUglDy85YIIcRngMURPngwKZKREJw
 xaRJNFQVdkIKtek6m9tSd94JAXJZEL1mPT5euo2Npv4i36pAccFHi4bgF4hEKe8/tWLn
 FRt2ykL4uKrdCgt3/au4m16kbriy5/Q46FWd56hIsN4X63z8olOjznLLFSOND1FAz/OJ
 aXEUgUN5nVVnzuuJK+G99zbL7MD5qv+TTx+xFV+prUFGhml/j1C5409TsNgaBhd1AlAB
 0eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hTgX0iktLeYeNHl0mMfkwxTN5iNNOl9CaQ94K+RDDN0=;
 b=D//GiknOM6CStqCBkvvQuCeATiSzuM+tddAsSQQqOeKfnooaB0FMURLakccKZPqnF/
 xOst00FErDN2OAbJNu4zE5bcyGQ49nS04CDuQNWBmMQnFE9VQLLDR92ot+8wNDLkg4Jl
 +LdEgM0bRHGR5PV+MjG258iQitNoKkXXX5OItNhvO2/UGY+dCCM4mw8ooxP+lvJBpInZ
 6cL1JSNWgx+AaDSFLjzbbTjt7Nf29WJDACno8nvos4ZVW+xbzyM8xwWzdnCYso8I1ceq
 azx7eTG5S/d7uPamC8jp9W4WmlUvLQwYY8qxmqtX03AQRZX9K2YbjPBQ7xRyqVKyJA61
 mCIA==
X-Gm-Message-State: AOAM531/Bcbzgwjqm5erLyUWJYdn5E3UDUzFW7YdfIgBdHueo/vxTXaB
 OaXnh5kOAE03zHtAL53I25E7IA==
X-Google-Smtp-Source: ABdhPJwjp4LNh6DFaejhLSPHDCiG7yGxSlwFeh/TcHVt7QCw/lRh3omt1KetjAodcYwvF21zz82vTQ==
X-Received: by 2002:a17:903:41c8:b0:154:78a8:21 with SMTP id
 u8-20020a17090341c800b0015478a80021mr913040ple.67.1648055785448; 
 Wed, 23 Mar 2022 10:16:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm336828pgo.88.2022.03.23.10.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:16:24 -0700 (PDT)
Message-ID: <d1b99e72-a50d-ec0f-32c1-2a6c572a6d27@linaro.org>
Date: Wed, 23 Mar 2022 10:16:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/32] Replace config-time define HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-7-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> [ For the s390x parts I'm involved in ]
> Acked-by: Halil Pasic<pasic@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

I see now the poison is two patches later.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

