Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A864AAD19
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:52:15 +0100 (CET)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUqk-0003ZK-Uf
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUpb-00029t-Ei
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:51:03 -0500
Received: from [2607:f8b0:4864:20::1030] (port=35823
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUpZ-0005xC-NQ
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:51:03 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so16710307pjq.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qSOsUIlUbLZPCZbPLqMNtQAmFKyzSSX3uDeUWF/kWAo=;
 b=ohslIZ9rcVDIdbj2G5C0FRCq8azs14PqiOKqC+YRw1oLk2hmU+8akEWmh3GwXJVlWc
 K7GGJE5yDnRax1OJwvMK6fcSPErr35sBoY32/BT59r13h6mE7X54bsev+GujT2rVUD2a
 YyGBf2gkd/r12EzLwIec1nRnNICsgi6KuckNUD7pPkH6Bd8H9amnzeure3LcTotBMjk0
 D0DMCN6Gkk0vzMRPCOKN+yuKf6GoMGqGrlHyiLxyxbaxZyzdb4nu/+SSyNq+XtGtsJpp
 lYcfv7aJKrVspNpSeZpVQ/90oykhxukzqeI77QzKnHa5Y0e6edaWMDNRkF/1NUSyX8jr
 dciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qSOsUIlUbLZPCZbPLqMNtQAmFKyzSSX3uDeUWF/kWAo=;
 b=Tys1sMFp/bHIzI1rx9WVgcY5/wNqcMHqisRTSvi7L43p5ZCkyBgRKk0W5SkaPSi79u
 GkzfoI++5dU6M1fWgIb1rPioRiVkNl2tLR2HnQ8+OsZHiMDISPTvJpzPVnOAHaFSbOFR
 L5yJmkFFZAkFzQwtD6Uf+AJqASaVVWBn9Hvs7Dwb9i6307sxkZDIP39TWg7Ulk12yzgz
 zK4lQeIFm6yeg73bGEIdlUBAPlwQfN9Nw9gWLVwfs13osafxxk0jiiyLJCuhTgNCKNEg
 B0BbMSjQRbfDU4/ZvUnESaNEuzCRh0BTf1vA+RgdSOySwZGrHNOiEEaZGOa5iJKu1Hy7
 TVlg==
X-Gm-Message-State: AOAM532zb6oFvF/Iou4z+BL5WCgHgvF7/U3NsF9qG+L4LJcH89gYJf40
 sIyTe6Ts4jnL/MfnLuDlGqQ1aZZ7aL4/hQqo
X-Google-Smtp-Source: ABdhPJzxERfCqRyvtVDfB3iLmzJNHv37IKhTCE9G7+68UKHq7KmatTVrY1JmVPMggDX7IVXCQ/MLHQ==
X-Received: by 2002:a17:902:e885:: with SMTP id
 w5mr10159557plg.155.1644105060416; 
 Sat, 05 Feb 2022 15:51:00 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id lj14sm279253pjb.48.2022.02.05.15.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:51:00 -0800 (PST)
Message-ID: <50625dc1-6a62-70b4-d158-29fa9ccb5c35@linaro.org>
Date: Sun, 6 Feb 2022 10:50:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] exec/ramblock: Add missing includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:37, Philippe Mathieu-Daudé wrote:
> Add missing includes to avoid when refactoring include/
> 
>    include/exec/ramblock.h:26:21: error: field has incomplete type 'struct rcu_head'
>      struct rcu_head rcu;
>                      ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/ramblock.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

