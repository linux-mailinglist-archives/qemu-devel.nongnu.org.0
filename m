Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631F4C05E6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:26:07 +0100 (CET)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfTq-0006ZD-O2
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfRa-0004wB-15
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:23:46 -0500
Received: from [2607:f8b0:4864:20::62f] (port=35816
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfRY-00035L-6l
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:23:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i1so3332818plr.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ims7EfNLqZ5S3YoZJguq4oCSoj4w9KC1Oh5AFhth+io=;
 b=qvH+6+3c9tMCtFw/JTCQ3M9wmgoB5swknTmHIUK3NGw+fJjIYS3iyUkwzaf2d90HCw
 l7KvnS/dkgJFy+Slx8xnG9H3bjCwoxUxIgD4ZPzCx05vmY34ZkDpwAGexkPfVFoh7oM5
 yOoYE7ycFItGCh61XqOkXDvMlIfNcB1mrdGTysxzAXvUP1xXD7WQQo1GxWKXzdjHBOq2
 8KuCj2dERqNhc1CXMu24tV36jwBRcSrnpnnQh+ET1OZwKBrnO4hxCb3t4AG3L5k0MLRn
 majFzVBsg8kAa9c5hB4w3iWOZBAC+e0jYyqCnTn3lJ4lsy5g9p61ZNShZfWWMSI8mRSv
 xuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ims7EfNLqZ5S3YoZJguq4oCSoj4w9KC1Oh5AFhth+io=;
 b=EXAYPy2BRszksWKSXPOpvrwBO+mRcuLTJAAxe5RTLLwvlUyjKZeHLK6TacyrzKFtAn
 35Zf8PYHc+RyCLk7Csz/Mz2krlqLdrLDrMBTGWUu39bk3cvi/IE09Nr7QAPWFJyjov7f
 FvdGtQEBaCK3Dwdt2zk7MU+srSBO4eAZjgED4bf4ht6FkWwl14Mf72RDkG0Jn0HJ8eND
 RyPC0vkvxzaOdIlMhVPuQ5YEqJcXkk13vhXDV50c6gHbObPthJTgOxdHL2lBbn8xanCR
 3D8R6EDJf+AiHBb+KZKOd6eEzqtuYCH6yk8lzq3tHtWyCkGN2v3n/wbX4AjuYcbblQyZ
 BLpA==
X-Gm-Message-State: AOAM530CwRq1Gx+0+PKzFIznw+4V9E11jVTA7w8y9Vg+WGTmSk3Rkryf
 49hMYD8NXGFuY5H8nHlOh4dNhw==
X-Google-Smtp-Source: ABdhPJzideYTUn9DvcrQorapo+bxdux/qDZh9S++JUi40R4kWAhUv1lgITxO8A3oiWvsIdhA1vc45g==
X-Received: by 2002:a17:902:a38f:b0:14f:c36f:afd with SMTP id
 x15-20020a170902a38f00b0014fc36f0afdmr9893651pla.63.1645575822854; 
 Tue, 22 Feb 2022 16:23:42 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id ob12sm791375pjb.5.2022.02.22.16.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:23:42 -0800 (PST)
Message-ID: <ad8efb09-3c5c-53ed-5ac9-b9bb43c9799b@linaro.org>
Date: Tue, 22 Feb 2022 14:23:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 41/47] target/ppc: Move xs{max, min}[cj]dp to use
 do_helper_XX3
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-42-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-42-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Also, fixes these instructions not being capitalized.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  8 ++++----
>   target/ppc/helper.h                 |  8 ++++----
>   target/ppc/translate/vsx-impl.c.inc | 30 ++++-------------------------
>   3 files changed, 12 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

