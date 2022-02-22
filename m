Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2064C03EC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 22:33:24 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMcmg-0003aG-Tl
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 16:33:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMckH-0001Zf-Od; Tue, 22 Feb 2022 16:30:56 -0500
Received: from [2a00:1450:4864:20::332] (port=39559
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMckF-0008IG-Sj; Tue, 22 Feb 2022 16:30:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso149196wms.4; 
 Tue, 22 Feb 2022 13:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H/lGyZHCThlIaxbQCZDRjeZ+Uas4srk8vvVhn+BB0mI=;
 b=O6Gd76w0SFlVEkH+2t/WDQ89SDqyfTO3dcETj5p3LN7L7scyn9+AM9rF0P7/OBElVI
 IaCqOLDtBdqcTChZ0zHFbaXuLNq31y9Bk812+OjmJZgtdoywZ24ZfDQnpgBs6HD4110V
 T9aXaxGJxRK7A618Gr0nJq2wWk/lH2KoRRdySAOOm4qPIV0a2n3Ky2xFwgY3uCN5Fqr8
 IdANbqrvmSIs1bfIieHk3LcDGMoXG4uX61KdHIMMf95aEdFfMX5KdaqQqFCR0vMJhVdL
 SogH+6moYJOItMq9q1yGUGgJvvLGMMdDRe3++yGcbCC36klJmNtGw9xc+GJGfXup0pXw
 vCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H/lGyZHCThlIaxbQCZDRjeZ+Uas4srk8vvVhn+BB0mI=;
 b=PHI0yqMepBnWrhpjWe+AEmV8PGlx9nrOXjT7+Xagj+tC2IhRtPuAkJwAGTXY+IBTG+
 ZlE3Jue644QFJn2e0Nel635+RMofeg5299152N034ddxKAGtOV2/MWGTbTXCqic//z0X
 Bp23KMTLqU8gFUDwov7C2fKQFWE7DMI6jX1kEC4srMw6x9h6R/XFInTl6EMByWil6j4a
 PKRF4uybptOAVAaLNK8JzCXNoRJRbleVpPKpKicIAqkWACPjOzHymbowApwePE6KCvvg
 y3hbklkWG9Sv2L+739ABIf3aAtbxWLC9vNmuNd4sLci/3KDO/D238dLbyaUPgy6Js+hU
 Tt5w==
X-Gm-Message-State: AOAM531IGZw5e79gvYW3K7oVvh7IVq5GPVowXkw4pA5yhAf2JtTqjcbk
 0JT+72+1saLDuJ7Guiz8GyQ=
X-Google-Smtp-Source: ABdhPJyC9bhugV1MOWnPbPQ76eOiEMlwlSKUlSpDTQE45Vf4GpYg2n3yM23h35D461WWY2Y00zQuNA==
X-Received: by 2002:a05:600c:3ba6:b0:37c:dea9:581e with SMTP id
 n38-20020a05600c3ba600b0037cdea9581emr4804490wms.128.1645565449905; 
 Tue, 22 Feb 2022 13:30:49 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c26cb00b0037ff53511f2sm3183071wmv.31.2022.02.22.13.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:30:49 -0800 (PST)
Message-ID: <a72bf878-09a4-e3df-18e2-4c4e47016632@gmail.com>
Date: Tue, 22 Feb 2022 22:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] block/curl.c: Set error message string if
 curl_init_state() fails
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220222152341.850419-1-peter.maydell@linaro.org>
 <20220222152341.850419-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222152341.850419-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 16:23, Peter Maydell wrote:
> In curl_open(), the 'out' label assumes that the state->errmsg string
> has been set (either by curl_easy_perform() or by manually copying a
> string into it); however if curl_init_state() fails we will jump to
> that label without setting the string.  Add the missing error string
> setup.
> 
> (We can't be specific about the cause of failure: the documentation
> of curl_easy_init() just says "If this function returns NULL,
> something went wrong".)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   block/curl.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

