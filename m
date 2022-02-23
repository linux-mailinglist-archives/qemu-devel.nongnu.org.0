Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40B4C05E2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:23:17 +0100 (CET)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfR6-000305-Ih
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfPb-0001b4-OG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:21:44 -0500
Received: from [2607:f8b0:4864:20::529] (port=38407
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfPZ-0002uN-9Q
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:21:43 -0500
Received: by mail-pg1-x529.google.com with SMTP id 132so18408324pga.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8VxxydkdihbrmoAD1WhY/wsxz0Txdi/8y6XlwQr15/s=;
 b=KUT99LTMqtXYjABPHzGxkNv2oObSc8O4SViS/gWs90ezQl1V9KPlX6oF8K/lts4Wux
 +ZR2HN+HDrZQy2u3tIwXqUjiXw+hd/NHzX4aT4sOXrKu8gwzYobYjwKZbOwqmd8uRYE1
 y4NrfyvhiRaDAuwMoEFiLk/AYqQRaieQ7Xe9NG3SgPY+FLsLtIEMuZwZ1Xgz+iZduSc6
 0LdiRPmTCP2uysS3XMr3rISyahcUa9e4qw4pLDk3wjxSfVvKQHnP8M6ZUuUfJsaIjScw
 i+HuKWp4KZo3a+AjPsT2Dv+435g+/cR4apn1pKGKmh2yA1bJH+r2pF8JsjWkfGEUwaxa
 hHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8VxxydkdihbrmoAD1WhY/wsxz0Txdi/8y6XlwQr15/s=;
 b=lXXHX1ryIfHOGZL9wJmecY5QcEzkMuCeRQxIKiTixHkmv2abyH/702QHXAc7NtRXDU
 ADPaJMwnvXtME5ogC9Rj3D8jFJhNfuGxhVJRP7SwAYfjr6WjsPdeqa9t71FZoYwXAQRn
 UiRDWVW+yhbpg4MqX2jMEAcKxu4zeHKURF9P9Twzd1y/erVgaT5AB5rXqKZjaZyHZe3X
 7KkbxGM2Tn3WqgBBWU3bUsJbBTbKP/4gDybJ3XecT1owV+J3ZK+3N4fYUiQYQ92EeIxA
 2KsNdlIe6G0N+B1+8yOgBxZQaw0J5WhBMPeyHV/0p6g6SAHA/Lt2CFGKd/GobY7LSlW1
 H7hA==
X-Gm-Message-State: AOAM532Z3HhFkeJbdnP6WuN2gonw84XoQ3iS9RoLebAImRYLEq4hkptZ
 +o11irpnJBTi0crzZA0QJ0zWLA==
X-Google-Smtp-Source: ABdhPJwFk/4fHBp76VHJDnOsDGiTL1XZCy7VU1ww5bVnrAtN8DL0ypKes1ylUieN6l4nFKD6oMp+Uw==
X-Received: by 2002:a63:6d0d:0:b0:370:14d8:5962 with SMTP id
 i13-20020a636d0d000000b0037014d85962mr21413023pgc.463.1645575699482; 
 Tue, 22 Feb 2022 16:21:39 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id l14sm743574pjz.32.2022.02.22.16.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:21:39 -0800 (PST)
Message-ID: <a02c31bf-a864-ca5a-63eb-83113d86ac4e@linaro.org>
Date: Tue, 22 Feb 2022 14:21:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 39/47] target/ppc: Implement xscmp{eq,ge,gt}qp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-40-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-40-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  4 ++++
>   target/ppc/helper.h                 |  3 +++
>   target/ppc/insn32.decode            |  3 +++
>   target/ppc/translate/vsx-impl.c.inc | 31 +++++++++++++++++++++++++++++
>   4 files changed, 41 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

