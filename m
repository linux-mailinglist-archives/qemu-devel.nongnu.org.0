Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767F6BA9A0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 08:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcLnR-00043Q-6U; Wed, 15 Mar 2023 03:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLnO-00042s-Gn
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:43:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLnM-0003We-Op
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:43:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id l12so8139305wrm.10
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rvYPDtS0otTf2TwG4exGzO/xRb4ahGsH65/dnAGE3EI=;
 b=JxowwaMgOntNFN4/Ifevs8/lyv4zi9DwCNEZyb7Pxj4DSpxuOuBbqgotY3vKAryYOv
 rqfHsHUG2VEVktDfnJN2VLReavC2eawkI8URVDWeVyvmhyNHJoVj3YGPL5uTmV/D0IH7
 KH87hWmYuHY5s+Lo+Tfeh7fpAcHkzK1x30Q0isEIuYXsdxk8YGfEc7ZLPXUbMn8Z5aE3
 BwgTjq6ZnN1TggJzLdc1V+AX5iMR7p8g81J40PR3eGHR8vIwuyN4dL89kVdW9pgapHh3
 yUAU7pPcy64kuCVr+dRbw7A2dTggRUMJna6AitpUq9vtcB7mt+strzYcTdPCRKQkgQYC
 QORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rvYPDtS0otTf2TwG4exGzO/xRb4ahGsH65/dnAGE3EI=;
 b=skZvXins9ApEydILglz7O/uckoz0SbzOriU8gk4mmeuFWlR/hMxZO/iYjqZu7Nuuoi
 TAwicUxdC/zpRpIj1NDK2fT9sRnnJc8lGIMqL3CHP++ZR4yHlg5r4g9BXXOkzrZ6tIn8
 0olgkVSzvfOuK1Y7FKB5Tcgn/T/I1qaMrImU4W63EVJw4mbGp6zEWC1eP75x7IvG/U9+
 zcYKCLTryn+GAWuGxNdrwPJHPbIeOaRG/CavJYamex31ROVqG0Lzm2xv1KN2lePt7xYl
 PoSsaveOcsQIKgDnoZJE58FNgvtRfaCpTOaMv3PRx7ruyTN0CQznmTskwnS+5k8iCZV4
 kqBg==
X-Gm-Message-State: AO0yUKWkmOBlEfJRy3f0R08sv7mPDsOEzfgrHj1ph4KhdUpS1A0W1RJw
 dHcFjYBOkY06eK8Kw3QMtpFEiQ==
X-Google-Smtp-Source: AK7set8D6LPDjIG3QQLXuE7zltyAe/KiFdl6tK+77F/vklfp9X8Vn5T0Ea2ksmhBS0dfg3XdtS1rWA==
X-Received: by 2002:adf:de90:0:b0:2ce:ae57:71dd with SMTP id
 w16-20020adfde90000000b002ceae5771ddmr1122921wrl.51.1678866215162; 
 Wed, 15 Mar 2023 00:43:35 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6501000000b002c54241b4fesm4041008wru.80.2023.03.15.00.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:43:34 -0700 (PDT)
Message-ID: <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
Date: Wed, 15 Mar 2023 08:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] Use f-strings in python scripts
To: Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Marco,

(+Python experts)

On 13/3/23 18:25, Marco Liebel wrote:
> Replace python 2 format string with f-strings
> 
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>   target/hexagon/gen_helper_funcs.py      |  54 ++--
>   target/hexagon/gen_helper_protos.py     |  10 +-
>   target/hexagon/gen_idef_parser_funcs.py |   8 +-
>   target/hexagon/gen_op_attribs.py        |   4 +-
>   target/hexagon/gen_op_regs.py           |  10 +-
>   target/hexagon/gen_opcodes_def.py       |   2 +-
>   target/hexagon/gen_printinsn.py         |  14 +-
>   target/hexagon/gen_shortcode.py         |   2 +-
>   target/hexagon/gen_tcg_func_table.py    |   2 +-
>   target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>   target/hexagon/hex_common.py            |   4 +-
>   11 files changed, 198 insertions(+), 229 deletions(-)

These files use a mix of ', " and '''... Since you are modifying
them, it would be nice to unify. I'm not sure there is a recommended
style; matter of taste, I find the single quote (') less aggressive,
then escaping it using ", and keeping ''' for multi-lines strings.

