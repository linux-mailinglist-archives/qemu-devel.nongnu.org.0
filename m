Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28F37CD1E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:09:45 +0200 (CEST)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsMi-00069S-L5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsKj-0003ZA-FG
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:07:41 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsKg-0002Nc-T3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:07:41 -0400
Received: by mail-qk1-x732.google.com with SMTP id 76so22887554qkn.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r4U1CTrMVydyiYhRYnc+2A0E+VIGt1Tbo7Cdb/5d+Tk=;
 b=dQcm/dQvNY2uM8AUsXSm18aCkoCTaW9kW2WoKdPmjIuYK7DvTDCJvHmflJ46sE5nac
 +svgCiOCrfiEw8hVh4d8/lL5G1ktswknZ1D0CudK142AbZiJ1C6O6YhRJPPy9foJ1NJ1
 HetuV8tsDoIFtJfF3CQsgHnMB0C+KUMEgXHvsiYAgyEpGaWAHEamnCBXG7ti5szIpLug
 Nbw0u/GttcgQDQDFgidMXL4GnmZptZB0E5HhRh1SnTaMfREHwSep961Iin4i1eB84vFO
 7UQAu2KEH5P9aeHRg5er9GUEcYV+xuSb+7Pn9Lnz2ZtHlFjvSFsMmh8DinOSYgNQPdcM
 ddMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4U1CTrMVydyiYhRYnc+2A0E+VIGt1Tbo7Cdb/5d+Tk=;
 b=mckfQjzpwxNKkl7HSldqMqcAvBJfKHPmyROTMOvwN16UhGsxUlmgDB6TBr8dhmLxZ8
 VgXdqG6ZHtzOI+FfVTHHzSBQuZdWgshWuMKc9yBOFOPabhG1q4en5vpegrxMisJ0Mc0/
 QM+8zuP51LL3moL58fWFVSrMtEbUFRkJlhknu2gxEOSHXi4iGKNe6JvElVmDFaWyr3vj
 OXL/XT8W2SZ1NlFHHGqXXlByoirUhEIejYO8yQ82zpX3XcmUvhYyJelN9DCoPOFpE5R3
 P9z6KIKPK3Ez+5RLLgeNQYOK4SL70mK1Go+HO1BKtYpi0mGwWamBjelhcmRHB3cLx+cU
 QClw==
X-Gm-Message-State: AOAM530PJxDgHaBza7jrx6SYzPAg1cfTdTBRZWUrqUdrWgYk+nA8U9GF
 e6rMHYncJHtq2lXlVEnph865Sg==
X-Google-Smtp-Source: ABdhPJyqsW5ygq9noVIxuYuE+yjmQxodUVQwZiSqz4Pb+unZ+gzDoL9CJ1pwJM6LjTymW5mT8VYpxw==
X-Received: by 2002:a37:8703:: with SMTP id j3mr33504576qkd.308.1620839258060; 
 Wed, 12 May 2021 10:07:38 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id e12sm357002qtj.81.2021.05.12.10.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 10:07:37 -0700 (PDT)
Subject: Re: [PATCH 05/11] target/ppc: moved ppc_store_lpcr to cpu.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-6-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516655d5-e6de-8dc3-a891-1cc051e4a496@linaro.org>
Date: Wed, 12 May 2021 12:07:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-6-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> This function is used in !TCG cases, so it has been moved into a file
> that is compiled when --disable-tcg is selected.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu.c         | 11 +++++++++++
>   target/ppc/misc_helper.c | 10 ----------
>   2 files changed, 11 insertions(+), 10 deletions(-)

It's helpful to be more specific about where it's used -- not just !tcg, but 
the location.  In this case, hw/ppc/ during machine startup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

