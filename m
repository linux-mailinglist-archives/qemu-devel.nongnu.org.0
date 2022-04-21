Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D82350AB0D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:57:23 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheni-0008CA-Me
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhell-0006dc-Vb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:55:21 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhelk-0000yu-Dv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:55:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id c12so6669311plr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9GV3CpyII/hU26vhl3rbGRDK6jIj7Q2bGNcufblzEhg=;
 b=blW/+TYcoKo40rD2NvKNrpvvsmRHLy8wUVtT1jQt4f/JwxmBGa+2jPgQUc51EXn2eS
 dafO7ywzG4Rua969JotBu/cuzUJc0Na5fZuyz+10DzJxoF0ZGqwUs6sbCUx6upEJywoy
 fsNDgRndVorXfa65OPvMbSgNRrG8ewMGxmu2NN1N9ZPBmfkhhLG8tB2HgraNdMeKI7Pm
 HEynRWvqXhRmhgJBt7U2fQXwz5YUSwlPpEbWLbyld/97OUMwD3gIzGI5Ef7lqdyYU9MG
 yexveEy2U1ok4ojjZAb8X2jeqcRKMzLSf21nxAQr2zTLSWJMSgudzZW9zr2l+er8zjeE
 jCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9GV3CpyII/hU26vhl3rbGRDK6jIj7Q2bGNcufblzEhg=;
 b=Sg08V4LaDmdnxEnbmOMf/6D+YVuWj8JZWvNjJyJTZ+IPSmFW822xLGzLcFvbDcJfjL
 WkjTgEhpKUdvuibinGxp2iCxI4/6KAVDTmUNe4EnuNLtjnb0DUNw5wpVVG+Is42s3Uq2
 stsaeg3NststausNxmVhxoSehqHi2RroEsNudb3diRvCYlocOujSmprUbQE/p/leYY1k
 gGxKiMFfvXctqnj7/u9if1eaVoGUhsfnStvvKdrd6dWiEvhesvQllNILdFpKZ4VzXvko
 1t5ehFlskiC8TTYQ4BxFIJyrGimedp7R7eHIIAF0zrAa3LkrCK3QrZh15DEJzPQXk37+
 Uvgg==
X-Gm-Message-State: AOAM533Kz0Lsq2GF4jVQyDYt403Zv5QJUox4elqCWo8PaBaZKK9Tb2fd
 nljfh70B4ABflGdgkSqW0kQJ0IcpwKFFZA==
X-Google-Smtp-Source: ABdhPJw7PbGE9Zh95ZVVa7ghE0xLWx+IlqBGZnkqGViNoiSah1iQBhyMR9Xx1SLbt5nR72oexfTuVw==
X-Received: by 2002:a17:90a:f3d6:b0:1cb:a0aa:5e60 with SMTP id
 ha22-20020a17090af3d600b001cba0aa5e60mr1757827pjb.161.1650578119101; 
 Thu, 21 Apr 2022 14:55:19 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a6541c2000000b0039d1280084asm110244pgq.26.2022.04.21.14.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:55:18 -0700 (PDT)
Message-ID: <bc9588d2-5849-fd32-0552-4009429f8caf@linaro.org>
Date: Thu, 21 Apr 2022 14:55:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/6] target/xtensa: use tcg_constant_* for TLB opcodes
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-4-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-4-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/21/22 14:39, Max Filippov wrote:
> dtlb is a boolean flag, use tcg_constant_* for it.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

