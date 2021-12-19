Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D1479E84
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 01:19:03 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myjuo-00050v-RB
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 19:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myjsx-0003Pp-Qs
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 19:17:07 -0500
Received: from [2a00:1450:4864:20::433] (port=36860
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myjsw-0004y1-94
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 19:17:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id r17so11516929wrc.3
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 16:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V06Q+nvOahqzX+DTmVw0U+K0J/MjvUtUTuQ6nCE4PTo=;
 b=Bc8fWTDyDtrqSDGUwWefQoZeLCYcA8huiGLBq43IAj5MpdsfhFFLIOV+P3cIY9aMd5
 lHLFZSTu5hIfVX9QE/zLRukEQ3A+ryCGlfT+jW63fRNVuYE0ZcXKDpBZKS9BIsI9AeJ0
 vWz9poTW41tPkmV8s9pS8ep7ZqA2xWTMD4/lLLZCEhIWAlqzGeIBAlka8IJgsJ7HxSTP
 T4RX2nu5e1eoAH1dDOS8C7p1caEOiEnVm6aG17IDwXrEf7FuvM82xbTrAt8/dvZsk8gp
 DMNvwg4KFLmZSA3yzlPd1o8JmgIEqjmeDdkul2Ie/Fimgmnyu4TTL5D+zlsa4sWfU9wM
 ihqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V06Q+nvOahqzX+DTmVw0U+K0J/MjvUtUTuQ6nCE4PTo=;
 b=vFpvkmk7yuj1W9DoqIlEKz4VF+f0V94C/yXj1SLWr9RVjQkaNKBhIjbTH52obqZacJ
 om6h7K4c+3HfRuRR3XHdw4vAII5X58J3Wb4gUgpa0GViPG0p2dyOD7YFbBiAqWohBThq
 0y0k8tHCu2wlbBUT7o3cxfOxb3xID3uHb/pzs23lR4xKAOjny2UTGETcxqNW++lCF6zM
 LTuJd7X5bHZES5z3D1VlZZKTatpEGPJEsschekVqUTef8DHxubbTFpNM5lwKh67O8/j9
 +htq6qlDyLThcmaI0csY0k7lzp1JKqN0b0dVJpA171O5PdTn6JdqUQ1Zvn+23XVcfEgt
 nwIg==
X-Gm-Message-State: AOAM531OINtzb8tUghjeumsdqUnw5Z0ZpzlzbzeubXiyqD6p0YAenGiY
 0a0WoSXVQpuz2NVU3+3nfxg=
X-Google-Smtp-Source: ABdhPJwd5FiqP89IqqltcKk+OLXljUUmJHD15F0jLQvLnUeICu6DEAM6QSu8BBr1a2t8RsVgbntEcA==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr6971902wrw.84.1639873024990;
 Sat, 18 Dec 2021 16:17:04 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q206sm7625739wme.8.2021.12.18.16.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 16:17:04 -0800 (PST)
Message-ID: <a3f18df9-0774-f393-802c-96b784cdfaef@amsat.org>
Date: Sun, 19 Dec 2021 01:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 04/20] tcg/s390x: Implement vector NAND, NOR, EQV
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211218194250.247633-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/18/21 20:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h     |  6 +++---
>  tcg/s390x/tcg-target.c.inc | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

