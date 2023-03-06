Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976746AB744
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5cL-0005Aq-RR; Mon, 06 Mar 2023 02:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5cJ-00053g-7x
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:50:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5cH-0003vs-Bq
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:50:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id h14so7804737wru.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678089039;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SQ12Ou/rd7Koioh0p3SxqdxhNnqRQWslilaQfFTsKWE=;
 b=kvhMLPGKYmqCnlPKHD8eVd7KXb06GSexMxGt8GQEUHDfIVkrjJzXdBkF1d/EVuA7ZQ
 W8JwCVbfcvJK2zQYXiMDwf/+icqRIlXYEHCUCtfK5LMaDyuVqiu8Klbh+kcIzZhS7FaA
 fM0hxH9nUOdcItkMSM18bKDMdfezbTfCldxfrgDD88Iy5dDMqGN25mDEoT9oaINy3/SM
 lrqcqdMwfggGoX/X2GspjkmlS4s+ZQYKetoMPaCKoLR4RBXvngi39cu0QhDVWsDIMTZB
 YxVZGRihubMvbEEYGu8KaP4kTjL3PVcxenEVe4tkBYXpDPzATQvJXm5I1f6GmmashPQS
 j0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678089039;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQ12Ou/rd7Koioh0p3SxqdxhNnqRQWslilaQfFTsKWE=;
 b=hpY5gVmGznchQ+WCg+WbSdMXM9IfwEv/iUjBjQOwGYPyJK8VdPGYSUSNA+PiOKdbv1
 4hHkyyBHGzwFeQrFQz03wG5xx7EOoSPpGHNGMr9pHv6ojCosyEBvjFdoC/a6vrX/y7FV
 PzqbkZMMGIlGgA9Nde78X1foFQXWY5zI+Ke92jEo43FSopGvoPgkSt65yNC0tWjiHaHN
 zvqb2AjFY+B3WWFbr38zK6CnJdrEFFgSq7XVlxS+CsI6xjMhGI31asvzZLjgHdgPJANF
 9882Ag4zviezNRg2+fXQShp5fWosb72vrxim+6bfw8+ZQtrm89UpErAyQj9WcG9MA0ts
 jy6w==
X-Gm-Message-State: AO0yUKWAVTL65Utn3RanNt+f3c9pllHc1SPuvQDWFx3j+m1G55SWWip3
 94U0DrM+52plOnWoVaFFBI1TgA==
X-Google-Smtp-Source: AK7set/Jo0fH0O8EGf09WVCTom7GUkXwhbfE4hX/teO4pc/4XfpNhW6gNjpQzJlDmhhb15tJcNm7Wg==
X-Received: by 2002:a5d:52c2:0:b0:2c7:fc61:1676 with SMTP id
 r2-20020a5d52c2000000b002c7fc611676mr6627882wrv.7.1678089039700; 
 Sun, 05 Mar 2023 23:50:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z4-20020adfd0c4000000b002c5493a17efsm8995509wrh.25.2023.03.05.23.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:50:39 -0800 (PST)
Message-ID: <36cbefc5-4443-d2aa-2fd8-b7dedeefc53f@linaro.org>
Date: Mon, 6 Mar 2023 08:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/9] accel/tcg: Pass last not end to page_reset_target_data
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-6-richard.henderson@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 03:13, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h |  2 +-
>   accel/tcg/user-exec.c  | 11 +++++------
>   linux-user/mmap.c      |  2 +-
>   3 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


