Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FCB461D53
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:05:46 +0100 (CET)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrl29-0005hh-9N
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:05:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrkuV-0006oo-Ct
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:57:54 -0500
Received: from [2a00:1450:4864:20::335] (port=47064
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrkuT-0007Iw-A5
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:57:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso12980486wmr.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xCM1hfUZVDBECzrJCw8u/Pp4s+DclpZ43xopIBYXi+c=;
 b=z2ZAdnYOBG4x6Fe6JBOn+iQghk4G6WHWLMbzUIUb+LLUDUuxs7emgeCIbpMxd26Y+g
 aIGgn9DNNQQ1QXHkUXB0isu37mSVTWdam/LrN8QBWiPycgr5bg72J8ovLdOVpBFr5O9i
 PkeMOgYPaMYBCjaW39sXtcvmfk0FRQwIYmIcvYQcEw5h5XigGhSMGSTkUm26qD5fOISR
 /AVWYiYXxT6WH54pKuUE7ePGXHup4uykxalj2CHRlrjfenQ/M5MWwYNjkgr/RJmpI9Fp
 NT7a0ZB9jrpXmzZIuXTTysx7yuFJRELxi3KEmf0uof0hilxDDb5GrlC245WEJ+5Wp6gb
 Q5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xCM1hfUZVDBECzrJCw8u/Pp4s+DclpZ43xopIBYXi+c=;
 b=QZUvy26Ks/X5dRgANtDRfL+qONzaqwf3eKd9hC7QoR53GIN+XDXF/okvTWPZmo2mi9
 3UKDthzc6Uc5yEdvPwpDaTDiLLVnvPFSA5sbgrDe3WqhyNUd3GBlLkdSHndCTOk0Zk51
 9O5HUDsnwIB6az3ktAlQRR1KbX4Rp2dh8kcw/gDR5kjO9oLQB3V5q+sQeqSjjiKhqy9f
 Cb7bbUFe7cEsMVSknTSxALj9JgvEr98+YrU5PHu3JNDhWlsl3JgXtGvtS3G7bT8wpnsX
 hdObjP+CCF+UzalV68a4yzu1qmfIgSlvGuOydNZLPsd5S2Mmg2C6CYoX+go3fGi+B/Ij
 bjMw==
X-Gm-Message-State: AOAM5316hwfpZE9DqfqJOlP8xcZl0y+A6nUV6FmlSM9AdrAvyc6DeMwl
 KQ501QkBYvZnc2vhkZb91DloALUVzzQpADYFY1k=
X-Google-Smtp-Source: ABdhPJzpliNr4vC+vIH6Y97iC1o6mxf39QrH6v2OW1UPUDt3aLBJ/+ZJBbSKLkY1J34pHEIp8v+OTA==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr39323855wmk.50.1638208667987; 
 Mon, 29 Nov 2021 09:57:47 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id x13sm14456226wrr.47.2021.11.29.09.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 09:57:47 -0800 (PST)
Subject: Re: [PULL 0/1] Linux user for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211129140456.604255-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d20614c-2167-ba3f-7bbc-425995a0a270@linaro.org>
Date: Mon, 29 Nov 2021 18:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129140456.604255-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/29/21 3:04 PM, Laurent Vivier wrote:
> The following changes since commit e750c10167fa8ad3fcc98236a474c46e52e7c18c:
> 
>    Merge tag 'pull-target-arm-20211129' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-29 11:56:07 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request
> 
> for you to fetch changes up to 0a761ce30338526213f74dfe9900b9213d4bbb0b:
> 
>    linux-user: implement more loop ioctls (2021-11-29 14:54:17 +0100)
> 
> ----------------------------------------------------------------
> linux-user pull request 20211129
> 
> Fix losetup
> 
> ----------------------------------------------------------------
> 
> Andreas Schwab (1):
>    linux-user: implement more loop ioctls
> 
>   linux-user/ioctls.h        | 4 ++++
>   linux-user/linux_loop.h    | 2 ++
>   linux-user/syscall_defs.h  | 4 ++++
>   linux-user/syscall_types.h | 6 ++++++
>   4 files changed, 16 insertions(+)

Applied, thanks.

r~


