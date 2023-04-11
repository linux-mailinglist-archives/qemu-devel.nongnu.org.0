Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A76DDA7E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:13:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCrc-00076q-QX; Tue, 11 Apr 2023 08:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCrb-00076I-21
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:12:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCrZ-0005Dc-FS
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:12:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id i27so7297732wrc.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+cxhpb+UikGO1S22GDLyqOj32eLMPRhG05nHMYC1JjY=;
 b=MQ78yZAr665nGo65s/ydx/rAgdiPIEasC2euasINhTnkeN/gveLHdt1YKUy6iyj1Nn
 qZolMOF9o6aoxfSXWasjOnKVkZJmXXRww/PNQLzm1avEKiFGWU/H96uBBqGqykWuLLmD
 ooAZe2UkrPSTi8Dus9bG/FjE3hd4HHuoaSGeZQy4nnpbYSIcL9XmqWjIUFOXwcoaVP76
 Gk64fmfJiiGZba1ZXYNjw5MPuoIc577/8L6NB2vflsyqhpKEE4VdO4Jnd462Zz9OBAHP
 h/enno2UPOWg/y3OT0PVUQGyDpNBXTSDXauIWKwhP1VD+CUz54QtRp2iVly/8aWDWwvE
 CFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cxhpb+UikGO1S22GDLyqOj32eLMPRhG05nHMYC1JjY=;
 b=Fhq3Hz8oySx/JB22RrCUmPGRP6Pus0ryawiHRSC7lM9RyaM/UqySs8JWWyGX3XgrOt
 XWSuPpJsTln++FTAZzIARWIBRQU0jfpIRYhpxLinW5DNbBr0IqAWTVaoJtWEcwwlgvqT
 +oUp9ZYrDi6kalgZw2nBBPSmFoeaeLglkXxPgdcpnFGc9El/B8ZL8gfoZtqgK+Tadu/t
 asY+i4TLwmKma8TeyOY6+cVMXe/Y9+y6w8oNbA7Ro7lMtsu3auWZrM2oaXosTW34C5yn
 zUg0ct2DE/8KqvMRCk6wNi3PKJppEj6AJYkoBD+6FD2gWPjJzr/hxH6ZYYoZkRI6ei3E
 fczw==
X-Gm-Message-State: AAQBX9c4Ma2x++OqJS9a2azshADJiHx2zM5JUaxe4cHzrRjz9tH1ML2h
 yv9Yi31jrE4HQ6Vxpd1ueJHIuA==
X-Google-Smtp-Source: AKy350aQsXX9jfZvcoAkzs/PibkXOiLtamG4E8Ab4zeJS2352I9elD8HOltSOGsnu6cXCIeFUjKYgQ==
X-Received: by 2002:a5d:5967:0:b0:2d4:5301:fac0 with SMTP id
 e39-20020a5d5967000000b002d45301fac0mr9150593wri.15.1681215159831; 
 Tue, 11 Apr 2023 05:12:39 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adff885000000b002c70851fdd8sm14448619wrp.75.2023.04.11.05.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:12:39 -0700 (PDT)
Message-ID: <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
Date: Tue, 11 Apr 2023 14:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> There are several places where we already convert back from
> bool to type.  Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


