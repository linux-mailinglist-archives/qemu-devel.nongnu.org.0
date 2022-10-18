Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B176025C4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:32:36 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh5S-0005qh-Ek
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okg8P-0008Kq-JY
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:31:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okg8N-0001re-Fw
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:31:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so21809383wrp.10
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hh8zsqHJtwQF473GCq9gdY3bX2hu2pNt2YAuA7QJWFE=;
 b=y3LqrjSxrBNh/KXL+fFvNSRZD/lkyyVoV/aS8nM2UuJEly704218mJEsV3Knt1KEj4
 dBJyfBR0+3HtWF4zxK6sRn0Q3j/EReirFM2XEkg5SDUxp5Zm8zGIqyAxtWgfDB9w2WAt
 zjLzzPJYlcQJ2dohB8BGLjgp+Q8h2G0gAQSKySpDEhAuJoWWd/T8ljeoCZoDSWO6+PYI
 wOz+z/ZAy7gRUx7OoSkZ6t/TiU5j2HsyVqS8KjEgKiLhC/P2snttjfkunmDfgld7EPAI
 dfmQQIR6K/au3A4LcZcWlDkiYmAbvj7uBLV7Nq8wVoRsSRG3+0hAnIRGIs3GrWZ8NwVk
 k/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hh8zsqHJtwQF473GCq9gdY3bX2hu2pNt2YAuA7QJWFE=;
 b=JqHwVdWBFEFNq1I0IauB+ZiK6z6vayXBGXa98czJ5GHuGSgY57YhsjBeS5fCuj+dJQ
 ev0DXpKb/7uJe1LQPBTlX3DVRVQKjNVpb+vptsV+QgltUbo5FUS32WetPZJQC1ToPKGQ
 c2q/dPDWBLXyn2YiW/opX31TEWu2MFdsHRtlXIR68POhmEK3JRW4HvMhveFnhvgdXeL0
 YpmhKLRcns2ffjJd97mUoZM94pYA0tiMfnQiAS57LOKeLF2mU03bfJZuVBF9rTJpXpa2
 ct8LLwOOKah5Nm01c+tfPjo3QRap+QrePSvyB5z8mzSW3VIYO3eRnHhKvvjYe/6SqkyN
 GpPg==
X-Gm-Message-State: ACrzQf2zi6Wvlb4jpwK67r3r9BZBkgkiAsMwfYxSQCbud9NXG6kvdpuH
 rMbjgn3br9C0zvuFQg19L5oM9A==
X-Google-Smtp-Source: AMsMyM7uBzGgTinJlAJchm+mw1xT/FDi39lz0p00QuUTHoULBdBX1mye9jcUrbej+U9xHdaIvFUDTg==
X-Received: by 2002:adf:d1ed:0:b0:230:9355:8da3 with SMTP id
 g13-20020adfd1ed000000b0023093558da3mr811952wrd.258.1666074685547; 
 Mon, 17 Oct 2022 23:31:25 -0700 (PDT)
Received: from [192.168.130.175] (151.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.151]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b003c6f0ebf988sm8830966wmr.30.2022.10.17.23.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:31:25 -0700 (PDT)
Message-ID: <f9dc0616-e706-45a6-f417-a254a8718a91@linaro.org>
Date: Tue, 18 Oct 2022 08:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] qga: Fix memory leak in split_list
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20221018044645.863859-1-linmq006@gmail.com>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, "Denis V. Lunev" <den@openvz.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018044645.863859-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/10/22 06:46, Miaoqian Lin wrote:
> We should use g_strfreev to free the memory allocated by g_strsplit().
> Use g_free() will cause a memory leak.
> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   qga/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/main.c b/qga/main.c
> index 5a9d8252e075..04902076b25d 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -934,7 +934,7 @@ static GList *split_list(const gchar *str, const gchar *delim)
>       for (i = 0; strv[i]; i++) {
>           list = g_list_prepend(list, strv[i]);
>       }
> -    g_free(strv);
> +    g_strfreev(strv);
>   
>       return list;
>   }

Fixes: 4bca81ceed ("qga: make split_list() return allocated strings")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

