Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53367A76D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 01:19:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKTVM-0005Ht-9C; Tue, 24 Jan 2023 19:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTVK-0005Hi-JO
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:19:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTVJ-00048Z-0g
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:19:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id h12so11495651wrv.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 16:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oiylR93yO73qVw5sRddIXuIpjlpWf+0sJ73TPyxwvH0=;
 b=dzfmslOX7rzwjjioB1ipZvrvvFhADQEOgKXxpt5nlrYdS9wygG1jkVY4EhCGAMygJW
 3Hr1K0IlHYDCsNax+rQ/boVMBloovhuQ464Uzk2BBRpkzCCUqVERN1wY+9hzlf6w2fR7
 sT9dX/rl5HnrEvmSN4fObXklH+OawwvLo2ELtsYKO8eF/DWNXnKKJDbUSuoRmK8JeYTq
 0LykPOPQWRBHDftXnOcBri+JOuo2IjoYoRajbRfvsJFb9BqkTIQnu/EFN9grs0bghnsM
 FndC6y77Sc1tCT/XlrAXwYZFwp/eKE1T92aD+kD6Qo9XdQXLcf/FLGQW7ZxwAXAivVf6
 enVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oiylR93yO73qVw5sRddIXuIpjlpWf+0sJ73TPyxwvH0=;
 b=3Vse6hedLs5qS3QQh60U/dKdNq1emkHpQ7RttLvEAIAiA1ek+cwv/IwPUEiFtAPlrP
 aY8fllPRF9VX5YFkMFLKeIZyN25uU9ITpD96se59E2Tu3jlwgdb1krMTeDdbUcZs58Je
 E9rUXRQVkv5R/axW0JUCnKIvza5Xwtw7GYT6eX7EmXmCJCkco7f6BP6Xfem+6+UaD/FR
 2iEcJGo2t2s1uOI3CxYwWOQ8INzaSMIBbfQJTWPySBHCzSe4j6QwoZiXvoBJ1GhZomDE
 52WMyuuCOEhsOKD/Jz4L7UP0PDQnc2FT+nqKMd/m0devJGa5dxO2W1FVw3Cf6R6xwFtM
 h1+w==
X-Gm-Message-State: AO0yUKUfPLEVC+3QKHiZuvDpPK0Uovd3w8G9JEfwXfNG69XPlk14HjXS
 SCaoupkBAC3KgRDGpMhcNEtsuQ==
X-Google-Smtp-Source: AK7set/nfCac+HjIfIKadwSYNgCYaCaaBVvZqorvfm5kv1VR79rsKxdbgpb+xQYAeTGh0Cr5TIdWqQ==
X-Received: by 2002:adf:f3d1:0:b0:2bf:ad2a:dd9f with SMTP id
 g17-20020adff3d1000000b002bfad2add9fmr4829007wrp.24.1674605943111; 
 Tue, 24 Jan 2023 16:19:03 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adff10e000000b002be5becdb89sm3005781wro.3.2023.01.24.16.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 16:19:02 -0800 (PST)
Message-ID: <2d68e79e-c71e-bf19-893b-bde79188779d@linaro.org>
Date: Wed, 25 Jan 2023 01:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 02/21] util: Include osdep.h first in util/mmap-alloc.c
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-3-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230117220914.2062125-3-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 17/1/23 23:08, Peter Xu wrote:
> Without it, we never have CONFIG_LINUX defined even if on linux, so
> linux/mman.h is never really included.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   util/mmap-alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


