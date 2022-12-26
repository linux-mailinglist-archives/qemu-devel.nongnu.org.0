Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD865627F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 13:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9mTV-0002Qy-DW; Mon, 26 Dec 2022 07:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p9mTU-0002Qk-0C
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 07:21:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p9mTS-00057H-6s
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 07:20:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l26so5885819wme.5
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 04:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4dLleprNWI+fwZHLSyqHspu8V+MwBSjiqaLVigot3ww=;
 b=dVPONCTWy+lkR9WNg4ZyFEKuC+6Y4jhkEjSLjOO+tlY372EdKom7ER7I428YoV6ude
 7FBS/R4JqppqiZzi4+07GOTp32DHDfafBHgGEmo+rqu/92usAz9j25O2yjmsdLcSUM1S
 osqjMop8LglzchlR23aHrOFlCIv2dJhB2a1vANHrD89Dd1qCRMStzLUQOF1F/ilApej4
 6Rn/nvVdyJqCiKFTZB2RT4SJ/+lzs8hl+Ze8owTX+ZKDz2z5lUPp8KbdSllZMfb9jq3r
 EuOOhBLNEgx6BavdFKyaNI/5Dd3rytZltMgfayHhwCFQ4nhB7cxbHtT0BJzOBqhiDAQq
 SczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dLleprNWI+fwZHLSyqHspu8V+MwBSjiqaLVigot3ww=;
 b=y9xfgAXjdmzC/vn5SGFZ8hxFBVimW2JnAV6gCGYZ9Tl3K/BbNPc0EBOyI9ffeXkl51
 kGlCRHpNp3nxUjGy90CHZHNe+ApZPb3HcIsEXh62Ed9sKEvvXQz8JFy4eJwNm0S1ooH7
 jM8U2T6D+qMA7uhwenifWmwErDrSI94rB4vNRxJ9TAo1ZC0jrdHlHOz4FWQmrtB3xnoS
 TraJiV87tFchZknMuZLAazTG4wIouU4DAHeBqWyeFO5E5WiuK+zeDDXMCHg9mtne3uVZ
 GMiQqFhnsL1gNkjDzNckNCZYHJg6LMPqWN0JUqiGcYdip55YSt9bssUj5u3It+E8S1zA
 7F4Q==
X-Gm-Message-State: AFqh2kreTIgXJoxLCaDcwKHjYRVmbcLVZXbLQL/R7Cqv34U/PWUa1aII
 3AG/dz+wKly2F7bCOl6MTdkkZQ==
X-Google-Smtp-Source: AMrXdXsw+pDH98oup6/OJxgjPZRWivzMZ9gXFAnxHFhTzgvdXi0yh10jxPafuGXjQf5O66wUqwT25g==
X-Received: by 2002:a05:600c:1c27:b0:3cf:a83c:184a with SMTP id
 j39-20020a05600c1c2700b003cfa83c184amr13020541wms.24.1672057256477; 
 Mon, 26 Dec 2022 04:20:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c310f00b003b47e75b401sm20155720wmo.37.2022.12.26.04.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 04:20:56 -0800 (PST)
Message-ID: <ea956ebb-0690-b81f-0777-1dff50eb7121@linaro.org>
Date: Mon, 26 Dec 2022 13:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 01/43] tcg: convert tcg/README to rst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Fabiano Rosas <farosas@suse.de>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
 <20221224235720.842093-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221224235720.842093-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/12/22 00:56, Richard Henderson wrote:
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Convert tcg/README to rst and move it to docs/devel as a new "TCG Intermediate
> Representation" page. There are a few minor changes to improve the aesthetic
> of the final output which are as follows:
> 
>    - Rename the title from "Tiny Code Generator - Fabrice Bellard" to "TCG
>      Intermediate Representation"
> 
>    - Remove the section numbering
> 
>    - Add the missing parameters to the ssadd_vec operations in the "Host
>      vector operations" section
> 
>    - Change the path to the Atomic Operations document to use a proper
>      reference
> 
>    - Replace tcg/README in tcg.rst with a proper reference to the new document
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Message-Id: <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   docs/devel/atomics.rst   |   2 +
>   docs/devel/index-tcg.rst |   1 +
>   docs/devel/tcg-ops.rst   | 941 +++++++++++++++++++++++++++++++++++++++
>   docs/devel/tcg.rst       |   2 +-
>   tcg/README               | 784 --------------------------------
>   5 files changed, 945 insertions(+), 785 deletions(-)
>   create mode 100644 docs/devel/tcg-ops.rst
>   delete mode 100644 tcg/README

> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> new file mode 100644
> index 0000000000..9adc0c9b6c
> --- /dev/null
> +++ b/docs/devel/tcg-ops.rst
> @@ -0,0 +1,941 @@
> +.. _tcg-ops-ref:
> +
> +*******************************
> +TCG Intermediate Representation
> +*******************************
> +
> +Introduction
> +============
> +
> +TCG (Tiny Code Generator) began as a generic backend for a C
> +compiler

written by Fabrice Bellard?

> It was simplified to be used in QEMU. It also has its roots
> +in the QOP code generator written by Paul Brook.


