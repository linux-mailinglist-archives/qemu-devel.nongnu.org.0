Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67A6BB757
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:16:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSq2-00034M-N4; Wed, 15 Mar 2023 11:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcSq0-00033s-T6
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:14:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcSpz-0007QG-90
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:14:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r18so17654857wrx.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678893285;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZcijW8m4TYG0JACCbdSpYNwcAFU5QOSbXONtKbIw6RE=;
 b=xV/z4ggt4f0uaEF+5EenK4dFPr6zf4K9OyhmrAo1btDE4/j67rPgPHOBUin4/hgZAb
 +Ogj+W24AoFfHMCfDaRde4ljGc8dRN7iPlz2VVqRFkXtSrDpzEJMP9xtL3BrLqHR9vU1
 +dmJfwWv6ZYjOmBmSDVCyoamX3ZYJGTnmWTYLB6mXq5EglldLEP0xBuyzeh1nEwgHBKL
 7y57V4FkWUfKXZeKYniR2eVhV0ziTSdpsOoPBNmTkVy50GSFGAvU7DJBM5ueFZRXMnBU
 dK+HgVHxPxMytJoeXwyH2cG0HH7cItEmjQYd1pKv4QSCAuJXlicomGrl///gbUdqRE2E
 sR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893285;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcijW8m4TYG0JACCbdSpYNwcAFU5QOSbXONtKbIw6RE=;
 b=rzoYhETdA8ZDOAwoHG0/szFbW/h08PPJpkxMHI3jXiI7G+IbJKpQfyNheho9znyIFE
 bGHv72wkowNmH2TJvLVQ2z0OniFFLPYF229pa6qOG4FTbeJjgdVyDaR38tKH2wbE8T1D
 /52RClJQsrsGyJoyLN9C7ZIrq4JA8G5D6uvF/tPZTYUMYQaBjLlOWOoDoZw8P1mdReE4
 4khysAZadkqgCFm3CffMpxHjIa4UGoNoBClFbalpODkOHoIvSkUJra77B32q55Itj9wu
 PKpBvsii4JEa+kKMWS0r3n0wM5KE7D0dWNdT4u5fZT8ZzK68QQOvvB0ZGlL2ELy1O8J7
 du6g==
X-Gm-Message-State: AO0yUKV6UeEw2tTsX6fmjWEzZzFJHJYffH3sTCVt9g5AbLIvqACnsbWR
 zXQgBYEFJ5V0Tr5BkOZ1NGsgi8IDSZIZgBXjz5xTlQ==
X-Google-Smtp-Source: AK7set8YbnkWR8m4If5KRsPkZwjLY2iKtzg+filBEVpCeYKfn0FIGgZmyMsyd6Co37z6sJr3lCxCxg==
X-Received: by 2002:adf:f0d0:0:b0:2cf:ea5d:f60a with SMTP id
 x16-20020adff0d0000000b002cfea5df60amr2582236wro.3.1678893285453; 
 Wed, 15 Mar 2023 08:14:45 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b002c7107ce17fsm4962914wrt.3.2023.03.15.08.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:14:44 -0700 (PDT)
Message-ID: <214a3dd9-3800-1f8f-6b33-37dc88610eff@linaro.org>
Date: Wed, 15 Mar 2023 16:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] scripts/git.orderfile: Display QAPI script changes
 before schema ones
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230315112811.22355-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 15/3/23 12:28, Philippe Mathieu-Daudé wrote:
> When modifying QAPI scripts and modifying C files along,
> it makes sense to display QAPI changes first.

Patch 3 of this series illustrates this (and has been
produced using this orderfile).

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 8edac0380b..70adc1a74a 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -22,6 +22,8 @@ Makefile*
>   *.mak
>   meson.build
>   
> +# qapi scripts
> +scripts/qapi*
>   # qapi schema
>   qapi/*.json
>   qga/*.json


