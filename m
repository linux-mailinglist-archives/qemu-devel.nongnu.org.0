Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473F36A297
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:27:44 +0200 (CEST)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laN0I-0002kk-Ng
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMsX-0005Is-Vx
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:19:43 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMsU-00046Y-8C
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:19:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id g16so9943845plq.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PXTj5HAri+WYhGhhlDaJ+JfE3zVzqXg6E2TYq9QwaEM=;
 b=VWCLSHT5bth5jSQvfT3M+i6rBAmhYnnbrHNCOTbMHj2i5vq1yD+mEwxpUE1+E38SLZ
 8Jhqh7FZz1xM1jva9BwvbqV7oZyhgkr3aC3t4l421XbpVldhao7VxWTLPtD8mmj2x65F
 jxotcsME4zrveEb0VtgwH+gmTnS/oHRerJMKBZpHhjDw3rSbismiLVTDMLfxgkhO6Uql
 sksA2DfP9CKpJ0TIslwyL3qTIpIeC0jMH7IJM+4Xz50Nh/QXg/HXsqpUVMYbiGo97J7t
 8eHGYHm0SChRNpPfBfaqJv3/NHicgwibkKRAwgBoLYxFXyG6r5kqM/a7497/bmj0Lp61
 DuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXTj5HAri+WYhGhhlDaJ+JfE3zVzqXg6E2TYq9QwaEM=;
 b=WFxBkvgXZ1x76CdYKyRtub7cy+IaY22UkvUXfd5LqZseeo5NQ74YFB1O1BM1RNla6d
 hEQ7jImDOk16lKbnN0E9PsbLiJBrtg4lO+jayS7tpcGyJLKzjQj/Heyo7qsVGo6tY/zs
 PqvhUxI16To9o+jDhSP7IwCyf61vIl7gcf7jvckdgQTGjUI4BnWir5y2siVe6pGgxudg
 G/7zt/u9gjgUaSDJtIOLHbKR+ra0lHmkbzz8hGrz/b/VPYF0az/1O+hANyg38E/AMPdB
 dUNLEd3n5G3EL4WxV3xHFad2IgGm/BmX4w7/rygoOJe45mL9hDzm/ySjvmc5UsfxdIyX
 s2SQ==
X-Gm-Message-State: AOAM532UlEIKdfmBHPu6wuHxuQtWOKdApXzsyTkIXZa7fq0Jg0nEXZUL
 81aBHxoOOwt6StIVYGfEGV2rSA==
X-Google-Smtp-Source: ABdhPJzwM/ExgS+lp6i1R4SuDPFD+KpRzjI1mVMZ3UNC2q59odtNA9On7xiEZj/cofufNX03kO2KkA==
X-Received: by 2002:a17:90b:812:: with SMTP id
 bk18mr11305952pjb.145.1619288376989; 
 Sat, 24 Apr 2021 11:19:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w2sm7719665pfb.174.2021.04.24.11.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:19:36 -0700 (PDT)
Subject: Re: [PATCH v2 44/48] bsd-user: style tweak: use preferred block
 comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-45-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ae7f831-36ff-add0-3a32-6c0050923041@linaro.org>
Date: Sat, 24 Apr 2021 11:19:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-45-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
>   bsd-user/syscall.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


