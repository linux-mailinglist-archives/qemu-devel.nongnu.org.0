Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B369B3451FF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:48:03 +0100 (CET)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSP4-0007nZ-1m
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSMK-0006nu-9I
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:45:13 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSMI-0001Y3-0L
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:45:11 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i9so12275606qka.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WCUNcsc6Kglt1QBzKXb9G+rVopHRlh1lNA0iZNdg2kI=;
 b=TNpNZNKepYxzxFpBmWaHPC3EaSh3SleQgHuNkFjRUMTqxj+QXCDBzlYQ6XyFKKB6Rs
 neaSejO/SdPilnqjqtsdl5x25XeoZSqIUwZQk3OT972+Bib6g+6Dr0tJA8VzqMY2M7Z/
 ShI9CxoihJY/N0DasoMQn9PoKwg+0FlTMjNAurD/XFr/rOeyomob0yxA9yfX/zrvpdAJ
 JUFgF19SWrQ7hVs3vbap4EJNMeCt1SgwgHkZwry4+BPPuYAwjJjRSuCTYflY8Gv9oDuA
 /gzXKVR71rwKibrbvKTqLni7+18uMsvRRNt+em17Ah9dUvI3ELjSJQ/MZunREL3BmsXN
 pPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WCUNcsc6Kglt1QBzKXb9G+rVopHRlh1lNA0iZNdg2kI=;
 b=QwRqvqp4LjCPoC760qPweDpuJOHz5rBn/RHsRySrggWo6SphvbhKXtw0alyOo7ey0a
 tyTFUEMWjinIhdAEYDfUrKbToWaP2UXPZ8PhfXbTFG+7AvLaoPdujKwD+SNKgNx0bzYW
 w3WnYo6lz6/Byo8fRFHpZ8DXa3wPApbmXM+NmTKV+VPTxutPO8LMZTm/FGQn4oIzG+V0
 FGKTCCKlwYcIizPXHljhOWL3LYxfJWC2Dvz/MHSoAs9E5ORXHTC+LPasg7YGA2DknPd/
 MgqbzGnxkMQoKC13QFFp2ZqvHXOYWqOBqFAxYtujZe0GGrCSiSXlN31DoiJXf1QzkQxF
 8HOw==
X-Gm-Message-State: AOAM53164BXhhxHKEORO2paIyutg2zUPDqyc5lPyXqp9KtEKQ3oPSHzV
 PkTPgxub4gOO1Q6xs9Ga6Wi6QA==
X-Google-Smtp-Source: ABdhPJwUjOwcFhe+ADrop86x5yCPLKDmjfXI4D+42areabT5HnmlVrXGBn2e8uwfaXmrQZlS+pkoQw==
X-Received: by 2002:a37:aac9:: with SMTP id t192mr2261155qke.408.1616449508206; 
 Mon, 22 Mar 2021 14:45:08 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a187sm5777699qkd.69.2021.03.22.14.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:45:07 -0700 (PDT)
Subject: Re: [PATCH] exec: Build page-varry-common.c with -fno-lto
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210321211534.2101231-1-richard.henderson@linaro.org>
 <646b88fe-99b8-cc93-2f9f-497f241ce118@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65a3b4aa-73e1-741c-e90a-2c6417230320@linaro.org>
Date: Mon, 22 Mar 2021 15:45:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <646b88fe-99b8-cc93-2f9f-497f241ce118@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 5:14 AM, Philippe Mathieu-Daudé wrote:
>>   configure                |  19 -------
>>   meson.build              |  18 ++++++-
>>   include/exec/cpu-all.h   |  15 ++----
>>   include/exec/page-vary.h |  34 ++++++++++++
>>   exec-vary.c              | 108 ---------------------------------------
>>   page-vary-common.c       |  54 ++++++++++++++++++++
>>   page-vary.c              |  41 +++++++++++++++
>>   7 files changed, 150 insertions(+), 139 deletions(-)
>>   create mode 100644 include/exec/page-vary.h
>>   delete mode 100644 exec-vary.c
>>   create mode 100644 page-vary-common.c
>>   create mode 100644 page-vary.c
> 
> In which MAINTAINERS section this files belong to?

Hmm, yes.  I see exec-vary.c wasn't listed either.

It looks like exec-vary.c should have gone into softmmu/ when that was created. 
  And should be part of "Overall TCG CPUs".

r~

