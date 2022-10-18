Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD2602934
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjge-00064M-2i
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjXD-0004fL-5n
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:09:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjXA-0001oD-Bh
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:09:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a10so22603044wrm.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBkzqpk5s8WDUWf/D6YYnNVs/CWMjoP89BQJk9WUBmI=;
 b=FQTaNHpZmQI4fPWHmWAzEoIyGhMgQnd1HSwSG+e9CCNW/dnchRfoXp0ODsWD95TfBR
 1jFYdb5RGCOdDB0u1eqzg9hIYvkmhLJPBgTBl/wikKYGTdvHgBLUlttBCa3SO1PhulLU
 N1gHS43M5Z9sriFnWEVIXDaPdiwNvM1pazttmodIxDNUf5G8UiFG87kpeFTpXz/rHq0X
 RxuSGgiz2eQFeoDdrYtiG+L815Qq0pFr7tQ6wCKTz6dfCTVNdMw5TfCYSMoor7PhyMNb
 hiRTY5LsUC7zGj8vAGTF1F1r6ikRxZGeDkGB2XVELPUxqvPRYAkDu7rl8NubSa/FxZBF
 cKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBkzqpk5s8WDUWf/D6YYnNVs/CWMjoP89BQJk9WUBmI=;
 b=YdiONHDRB9+BlCtEU0jjfkXoB56xQNQjMYsKJj+7sJTJqpWtVvviP6gjbVath9jkiN
 jfTNwgGIpbCumZbBQWdbNVmRnvUiiGcHzolpJ7Qt5VFHRfUV8GL6Z3KOVIPL8VP1OcyD
 J9aP/QgI8BJdbSKfL2x6JgOvcEQlUclqQ10d/XUiF/o/KwI7ZhbXHc91GG6C0Q0yMBxS
 0LRUb6TPvl2i4HrXMFRS21iwALUl/h6ZZTxia2zCX/3pcPDX6GicbNbLnzZWZobIIeV6
 5iDH4DWG+p2Kf7J7OfZeRI0IB+9piQLfjtJR4gwjumvZ7bnCYeYkQ+8eGYg2OSZDkRrO
 neqA==
X-Gm-Message-State: ACrzQf0JqmEsPpOxRggzRdwnCQMHew3ecJkvdyEED3gefJuKIGfp7XDF
 o2sgLu6GTjfIJ2MC/PKwjI0Cew==
X-Google-Smtp-Source: AMsMyM7M92vtZWQlM3u0rnR8XFCk79tbB7fjoIAWau7LajtS69lhONCYd8npswQpzziPcci7XeaF2w==
X-Received: by 2002:a5d:4950:0:b0:230:cc5a:f6b0 with SMTP id
 r16-20020a5d4950000000b00230cc5af6b0mr1358210wrs.656.1666087752777; 
 Tue, 18 Oct 2022 03:09:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adff0d1000000b00231ed902a4esm10753683wro.5.2022.10.18.03.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 03:09:12 -0700 (PDT)
Message-ID: <2abbdbb7-710c-149c-7c3e-75060b28ee5c@linaro.org>
Date: Tue, 18 Oct 2022 12:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/7] tests/docker: update test-mingw to run single build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
 <20221013154705.1846261-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221013154705.1846261-3-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/22 17:47, Alex Bennée wrote:
> While the test-build test happily run for mingw the test-mingw case
> runs more of the packaging inline with what our CI does. It however
> fails if we don't find both compilers and expects to be run on a
> docker image with both.
> 
> Remove that distinction and make it work more like the other build
> test scripts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/test-mingw | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

