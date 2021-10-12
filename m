Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1D142AFA5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:27:26 +0200 (CEST)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQF4-0005pn-0C
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQDq-0004Tb-2k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:26:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQDn-0005Dn-3f
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:26:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i12so1748877wrb.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UETwBuCiVxOUOzQf+b6fB3GhRtfjQc8pbXB9Tq1AB28=;
 b=KLzpQYf/WIO5Hab4fW3i+mm8blD7qWTt7io/9U4iYIp8kTI05aAELqBOaDHNEpwFxk
 wODiLoYRxxpXRo5XJ8j/ccNp7gjCrJgiVDBGXmYkvvMyBB+8/83SHIYDXTeix58rzMvn
 zREqGPU1zMLivPdmPcmo07eYpYDEq6qQufNjtOdgaj/5MnezrLKMXgso0jHmfgJvC9c9
 CvAyASPXb8tiVrDyppqGi2CVEJ4kNMHzHNWSYdg+LVGUE5WKAoudBGqUi4oxFh5xNg6b
 EsUCskd9o13kOFsJI0rXgXOw+1TO+P7qgcfbapNP2WGup7yXz8E+Vxal3bVD+XFcHAq9
 QZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UETwBuCiVxOUOzQf+b6fB3GhRtfjQc8pbXB9Tq1AB28=;
 b=ppVv3ZBdgKuO2hTKTodkCKU5E0jRtBhpPNePDH75flmaGyPoAKWbZ5FDDD0GWPVai0
 dW4TTDXIwjuVJRoORjkyYCY2xrODutQ0GV6vX0eoKexJDJsfXsRVH0bZsohyx3Cz+XTt
 0gX3HAo9sLtcEOYWN9YYD6RXDv1iNZOzq0lh5C/z1TZDgn9UA77MSdxf8Zm1Tqk+DYFA
 qZMllqBR51sN5QjLN27vRNVmoq5r6nd1P6BjVX6Yka8Suy/i69CoL9oESFckr1t4faUG
 TxOGuvJrne+3wzz0GLFZjZguK9SFPt+V29L6s8bkEM8lTuLR14GGpsHcq9w7bPdRH1hV
 4yyA==
X-Gm-Message-State: AOAM531yFTTwTFF5TyqS/q5CFHn/2Qgwb0z29kWlBun/rcVthjFg1l+D
 mGYD1jlc4sL/rKiTHJOXZkVSuNZxJB0=
X-Google-Smtp-Source: ABdhPJyFsZey0F5mgkIMQuVl2oBLdP9Ts/fGh1j9f8xT3yQpGvBbs4qt4t+VXcaPs8bZeKQQoii1sQ==
X-Received: by 2002:adf:a18f:: with SMTP id u15mr34212231wru.183.1634077565354; 
 Tue, 12 Oct 2021 15:26:05 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id h1sm3540151wmb.7.2021.10.12.15.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:26:04 -0700 (PDT)
Message-ID: <adb77e5b-e8bf-4d84-f0e0-8f9d49cbffb6@amsat.org>
Date: Wed, 13 Oct 2021 00:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 13/23] target/mips: Fix single stepping
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 18:21, Richard Henderson wrote:
> As per an ancient comment in mips_tr_translate_insn about the
> expectations of gdb, when restarting the insn in a delay slot
> we also re-execute the branch.  Which means that we are
> expected to execute two insns in this case.
> 
> This has been broken since 8b86d6d2580, where we forced max_insns
> to 1 while single-stepping.  This resulted in an exit from the
> translator loop after the branch but before the delay slot is
> translated.
> 
> Increase the max_insns to 2 for this case.  In addition, bypass
> the end-of-page check, for when the branch itself ends the page.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

