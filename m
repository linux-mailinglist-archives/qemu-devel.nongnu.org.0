Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECD4E4472
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:43:30 +0100 (CET)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhbV-00014a-Ns
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:43:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWhaD-0007de-HQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:42:11 -0400
Received: from [2607:f8b0:4864:20::42f] (port=33388
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWha7-0000xV-OB
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:42:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s42so18705766pfg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R0RJLUNvhjKf5saFnJA6OIn/4bHEiB3DbuUyW5TASBc=;
 b=GGzKrtJQ3cyyKIyc7JRj8Ax8ShK6hW+WId+5O1PXLzQJnCHRI0jtBQRN8EbsSYYlwR
 qslsv4Cs2uMLqVHxO+U3mufI/9yuvBjoAUAUPbsPywXwD/8i1l4JggbkYtOkKQMMaaYA
 8kZG6tOsGOGs73YElcy0Oy2gCNZF3Z4kwjAI1GqbBwSfJsKqeihG6N9DXUjpW+IUL8T+
 yqu7fpgKLS2F+QZcZX2Tcbj7dd7Mo5Qjp1phz9wxX5iiioiaBqasrQCC0B7dKE/bnGlE
 5mO+OxfiO79YDzZRtxZ/WdTGBOOiH67DZTvxQlhCdwi1IJ+zQHcgAC0CTRt7pbyAoiAM
 n9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R0RJLUNvhjKf5saFnJA6OIn/4bHEiB3DbuUyW5TASBc=;
 b=sKvzdQhBB5nbF59q7xuViEcxR4O8pE4tCNtf+8/589aVOWnT7L/iTy6GORdWHj/G+/
 NA/t6/eOVEFBV2UyRKhzMcDEImshzjKV1rHQHedjrhAB4PP8i9iSGPNW1TIGakZEDOTg
 Nw+xfRXhhg9JA0C5sKOvtIcW2o6BmXD1EXEpsPLPNAXQjoGZJO4QYZXBEQuNz0P6F8pm
 D5NQaIWSMot5uLoTzihuJlMz16Zwxa81Pvr7t3SsjsPjnOQQivZaFyZrHlCyKkzcXSdr
 zuIq/1IiQbEkmNaQSP6bpn0lFpxVSXhkbb0jCwaR5U4DD7xzAXKRrb7knylrDqwXwZqK
 UVyA==
X-Gm-Message-State: AOAM531b/vqE8PI+xinSdDdCY50s9AzYckdLxPgA27HvvE5sI6dEE18F
 hGUFGsd1GtMdN/MdyEBwPZcxVg==
X-Google-Smtp-Source: ABdhPJydRz5ImBFLMgCNPNrt2RWSfjJcpSF+DLrevRYBH4QYUw4/YDmuPXu+nccqE0kuk75cIcO3wg==
X-Received: by 2002:a63:6446:0:b0:382:6aff:7bff with SMTP id
 y67-20020a636446000000b003826aff7bffmr10826534pgb.318.1647967322236; 
 Tue, 22 Mar 2022 09:42:02 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a63ac1a000000b003831aa89c45sm2903962pge.42.2022.03.22.09.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:42:01 -0700 (PDT)
Message-ID: <a5224bb2-4f01-778e-bc83-81ed6ab301fd@linaro.org>
Date: Tue, 22 Mar 2022 09:41:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] fix cmpxchg and lock cmpxchg instruction
Content-Language: en-US
To: Wei Li <lw945lw945@yahoo.com>, pbonzini@redhat.com, eduardo@habkost.net
References: <20220322162314.408170-1-lw945lw945@yahoo.com>
 <20220322162314.408170-2-lw945lw945@yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322162314.408170-2-lw945lw945@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 09:23, Wei Li wrote:
> Give a better code struture to reduce more code duplication according
> to the discuss in patch v2.

This needs to be a consolidated description of the problem fixed, and not reference 
previous email conversations.

> 
> Signed-off-by: Wei Li<lw945lw945@yahoo.com>
> ---
>   target/i386/tcg/translate.c | 41 +++++++++++++++++--------------------
>   1 file changed, 19 insertions(+), 22 deletions(-)

Patch:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

