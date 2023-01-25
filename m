Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90767C095
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:05:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKoos-000384-JA; Wed, 25 Jan 2023 18:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKooq-00037n-JO
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:04:40 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKooo-0003FG-Vf
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:04:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id z5so109913wrt.6
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IAW6rRk2JiJBt/bOL54R1ZJ8YnMpgHLPuy4yBAySFww=;
 b=mnq/zYV87zxI5fBXDk7KoCjpZXbnvoGAskmLaTOQq+pwY5UQlsJOxAEYEsP7v6c4d8
 unFqag29QyvEkXqA/Vtlks4enwdYvq7Gi+NFko1msJ809Y+ZfdvXDZ05jFvVrQCHOaty
 gAmVF94x2Y6l4OSNUK55qYzEtKTtQaTeSMOKa7iEfvrbxor1bOmDTiQjh2itavws0E5r
 yYujNl8QvvW5GFNXvSbyLZfTOXtb/tnyXxuaSNtlTbupGxL2//OfEDzgkfcAe7dGj5K4
 Meq5BZeSQ1AujY0UXCgyEhM3JRZBdvAWRdBOhTZFYAN0vgWLGCtzjPc4VvEY98eui5SN
 Q2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IAW6rRk2JiJBt/bOL54R1ZJ8YnMpgHLPuy4yBAySFww=;
 b=V0xvoQ/okCSMJG2rNvZjc4iT7hGjWxJiNRYtz0FTxgU/mMcPLJohYO7zsMbYK5LIFt
 wPvvm8vjxcfQg0f0qVxFwOOF7mcxiVFGreHFFMk+6qF6meRTN5icRLivNa6dw9Y4g0uD
 YuNOh14xwORDxjpLNoXtRrvx75PI9Ny2ktaT6ZSYOTDP0K/89NZ/2EN5TCAPNs17Vu1p
 ufzVAhXwrhx0j67aaJfTzXZqxtL53iR1GItcdq7QMrfDWVOR+OqallVASdkvKvuoEb6v
 V+AH+nLgPu8owe0ATnG+g3pdsU3VK+ybkRXyDZ4YAd1TOlcm8qOJeBt/QNKpdQpIMZhK
 yrGw==
X-Gm-Message-State: AFqh2kpIe4ps2MkM+lmNtiEtkIGaHN653PngCgamsiGjMX5LVINaFe/7
 DuxD3u2JQKV8Lwt08zUGkOXFwA==
X-Google-Smtp-Source: AMrXdXsgW6t5d4ihhnzR80CYAajvU7h3wf002ls9tT4xfgL+mtHKwo6w7N8KZHip7YJOsZ0z3V6CCg==
X-Received: by 2002:a5d:50c9:0:b0:2b4:790e:32f3 with SMTP id
 f9-20020a5d50c9000000b002b4790e32f3mr27212175wrt.68.1674687877210; 
 Wed, 25 Jan 2023 15:04:37 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 m14-20020adffa0e000000b00287da7ee033sm5598086wrr.46.2023.01.25.15.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:04:36 -0800 (PST)
Message-ID: <28e8528a-3143-7e10-eca0-f16eb08043ad@linaro.org>
Date: Thu, 26 Jan 2023 00:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] util/userfaultfd: Add uffd_open()
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-3-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125224016.212529-3-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 25/1/23 23:40, Peter Xu wrote:
> Add a helper to create the uffd handle.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   include/qemu/userfaultfd.h   |  1 +
>   migration/postcopy-ram.c     | 11 +++++------
>   tests/qtest/migration-test.c |  3 ++-
>   util/userfaultfd.c           | 13 +++++++++++--
>   4 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792..a19a05d5f7 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -17,6 +17,7 @@
>   #include "exec/hwaddr.h"
>   #include <linux/userfaultfd.h>
>   
> +int uffd_open(int flags);

Preferably documenting what this function returns:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


