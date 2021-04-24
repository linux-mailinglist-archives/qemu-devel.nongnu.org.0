Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A002536A282
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:15:08 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMo7-0001nk-Mm
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMm6-0001Ox-Qi
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:13:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMm1-0000vO-TE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:13:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id e2so22482648plh.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nfjntvy6F53j7i8ROdkMraljIDUSgu9TwteKxSp/GDo=;
 b=QD4c/Uk+o4jeIZRaIY10xc8pAupDhXXh1RrA1hR4GsYM/8TGHcEEq3xzgyYPCmMYaM
 RUcSlR1ONllD3CzE7y5jY+M4ROuuAAnw70ES1Jfzq1TI1fL55fIoVUV6AZ12exPoBZrM
 R5wWV9Xu5fI+1LCO9rP/WufreG/JBH9Ex5Xj88qQLwoWp5oYaTyByCX0GVita6BARzRX
 3qm9Urkxok2Y18CV1nA0Ex0/JQitx6ZEtWmw9mr3ySTBEGmG4M2ToEqKUXX4taB+oBlb
 iEnjlJSdgFOf6vT+BDPF5VgAwgsEWXQoDp39jF9/ezs+m1MXYUFAmdOgdXAzKEMq1ozi
 JA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nfjntvy6F53j7i8ROdkMraljIDUSgu9TwteKxSp/GDo=;
 b=RZDenAD6b1FTfRNrKRjpcYepKbVN+ptIMkz9c4XjM63jD+U04WK6lh7+q7JaYI7cjU
 p0OEUgl8LBT0IZPG3lzZ/JKX31OF3jStEnPqFUGUfqWrYlhmiN8EeF8brE2uCLRkHFhf
 zoIoM7BbBEuzrk6Aj8ymMVoy3MNxxCW4rVOwyPkQO366KV3UpJjnI2jQ335GUdoZN/Ui
 1o7my6EnZr8REyb8+gZjxRyYxgnWDlQy6yjBG1UId7EV5FfOgnmGaX3E+8Vu5fXOJMNt
 KsPOz3Kt6y7VaIpORcbqrbX0svad1LOjUWUzLcWUbV2dI2g/mvu0YgF0c9GqgNSgBikV
 xpMg==
X-Gm-Message-State: AOAM532bIoxsWb/snGtO1D2+Fa+zDcBxMnN+whKpDoQ+i8BYh6HPaRs/
 /qL/z/iQ6joublHplnvsY1EkTwfc+9KpcA==
X-Google-Smtp-Source: ABdhPJwZsT/hHSnEkx/VF9su4RwS54QnS4nUHdXIUWRq4sWG7Gl/9B/ATXaYv4RRtkLIGrIdeQxAWg==
X-Received: by 2002:a17:902:e051:b029:eb:4411:db58 with SMTP id
 x17-20020a170902e051b02900eb4411db58mr9710236plx.11.1619287976239; 
 Sat, 24 Apr 2021 11:12:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id z23sm7530331pgj.56.2021.04.24.11.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:12:55 -0700 (PDT)
Subject: Re: [PATCH v2 35/48] bsd-user: style tweak: use {} for all if
 statements, format else correctly
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-36-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c42d09d1-af50-a489-f82d-964eeeca9564@linaro.org>
Date: Sat, 24 Apr 2021 11:12:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-36-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


