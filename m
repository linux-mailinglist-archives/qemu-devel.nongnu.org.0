Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0743D870
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:11:06 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftwf-0003L4-Gn
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftuq-0002Zd-7z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:09:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftuo-0002MU-Cl
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:09:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so3382886pjb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P6vPPxwJggaNE9YcTJQRovGRBMTZJp7bi2Gm3s0t5Bs=;
 b=WzOR/OuElglI+wln4udVcwXlX7EWtKhZ7mkNXVyjzoZJfGcetBPQhsOJBu/IFeUmz5
 LECISKY2rvzI3E/9IzcTdcS1LwjuqRL3PigwlApmIM78yvkIDdJ1CeCKrjM46QCoF7HC
 2hCYHDt9ZS9TyuMucz/uyTiE/8r3gChKEsUGDoiy2JbsCw6dXV2fG3FRV57F6LvF/awB
 WFbIy4Ez9wtg1/fdEqKle4a2c2Lzpc0RuazzmDCIB/mypZKjqmw7zv0ToPsxvf/IrTbD
 4gNsjfhVS55iHWtaFsSUIAZavTR84izPjO+GNkTf5lW9wPS9FVrrKSZaPX8cwQnZVsAk
 wCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P6vPPxwJggaNE9YcTJQRovGRBMTZJp7bi2Gm3s0t5Bs=;
 b=BRrlD2SdNuTp452972vi5d4hxD/aUKcebAFVVlYoi0l7PiaOIob7T0bR6Df9e1rLqg
 AjqySj+3Xv8k9c++LiA1ONdEL84F17CXif3BFAG97zlohKiyxuDRWvfDNCT7Y/59jqSX
 vcURvrWBEEVhS8X3PWgFBYw+DqMCOE9b95Djd3C5QcLHR+fKsoJbJd/H9I9uhkZoP5RH
 lYNjNMYzoKdVKhifg/1tAqpH1ff0HdGafTmIsQfAZmPTcYDa80eUAeLXbasW8Ydd7cTc
 fxzdEY6xHvCHsFDhvPxRjIzj2FsOyZfAUmLqhKiOUGJdgkw9hb3+osShouedOHAqo2lL
 6Hmw==
X-Gm-Message-State: AOAM532aYa9Kw5WvA4s6Z/IMg5rcRH1AGGP3NNF+yMgMrR5NPrk9dwFS
 Uoe0JkDxNJqrq7HCnjPT7KohYQ==
X-Google-Smtp-Source: ABdhPJzumR537rpTfysr49zkPqx0/72kHW6chmX4+PLxD6zapHlq8R9mSh/mt6hD8Q6RdKeUxfBkBg==
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr1182580pjb.25.1635383348868; 
 Wed, 27 Oct 2021 18:09:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id r14sm874410pgf.49.2021.10.27.18.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:09:08 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] MAINTAINERS: Split MIPS TCG frontend vs MIPS
 machines/hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027041416.1237433-1-f4bug@amsat.org>
 <20211027041416.1237433-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <929e41f1-b987-a078-c3b1-605481b79bdb@linaro.org>
Date: Wed, 27 Oct 2021 18:09:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027041416.1237433-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: libvir-list@redhat.com, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:14 PM, Philippe Mathieu-Daudé wrote:
> Hardware emulated models don't belong to the TCG MAINTAINERS
> section. Move them to a new 'Overall MIPS Machines' section
> in the 'MIPS Machines' group.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20211004092515.3819836-4-f4bug@amsat.org>
> ---
>   MAINTAINERS | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

