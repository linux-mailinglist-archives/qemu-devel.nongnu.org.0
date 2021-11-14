Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7F44FBBA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 22:12:19 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmMnS-0008BL-1E
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 16:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMlb-0006U1-Me
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:10:23 -0500
Received: from [2a00:1450:4864:20::42c] (port=36749
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMla-0005GP-8m
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:10:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s13so26637079wrb.3
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 13:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/e7FbYAL6o1ztYtkaSwhNC3OjTk4ZMecty5PJq7uRgw=;
 b=ngJm94X0S5PkNbp38ATs3NwiWQ2tpXWAi+fyS750+TVIithwRgFnrfpzVafiTgn2QZ
 vv0OayKXFa15nfJfLQwuDqRsyouwJdAQLny9kxqPojN6hmq/Q23qDMWQNP15szGTNK4M
 UFj8VAJztpPy7uH2ckpUVAQT8Lcsx93u6n8pp0LT/q1p3/a+HG6aHo6xs0w2tAtuiBom
 CaRQt1BPuI0K9c58UKF37Aoi5FG9d5LMSoDZ7y8MkrmASojZ/wFocEbrRGlFnx7WnuxB
 Q/PjSIiRt/40tC8lvFQfVHqMoGk+fEWYfzuhPkBV4JPucgRN9nJR3T3Xa+G0EzO3WqX4
 IT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/e7FbYAL6o1ztYtkaSwhNC3OjTk4ZMecty5PJq7uRgw=;
 b=78jlJ4lMSSRWUh1rVTdC/ievcQlhsieeDonjvAx9MPK+bXVZ/PZ8whT6FG3YMK2aco
 gV+jPp+yVKel0xAiLj2EqunOFufgC3k8Ujk0OqaOAD7dxVjZhY9HnnKSKlnyLCkiI3hF
 NMQIErlDsTT9jAj3bkitSIM4gFQH0OtyNDizKQluhHxjPLcy68yGPWHMf6ve14AEqwoP
 /aFou4KTw5OlTtMP7aE2ioseEl/a0JYe+0NNWR5OWsFQApxlqkeUljDPpx4j3OFkDL0h
 NVZ3rFHxXcPcd4vmpcJHhcFI1mvG0MhU8KuSX94VakvHjpt+Rx6ovD36O+bZMwYGL8Rs
 xqgw==
X-Gm-Message-State: AOAM530U3TJ8LO4Atw8Lv1d5FkSDj9bpH3aVCPaf/zfT37TUDwHgwUZu
 C9Zum5/9H3ahyMu/oRprN2E=
X-Google-Smtp-Source: ABdhPJzuY7WW9DQJF8b1YHbRKR+knhJ2vfzw4bkAZEpJQ3Mvd2E+kS9FaxR9Kzizvq16N4BWtiLFPw==
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr41034486wrm.60.1636924220971; 
 Sun, 14 Nov 2021 13:10:20 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm3438420wrc.1.2021.11.14.13.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 13:10:20 -0800 (PST)
Message-ID: <eb7c0cef-d8e4-09c4-997e-35470fda3428@amsat.org>
Date: Sun, 14 Nov 2021 22:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] linux-user: Always use flexible arrays for dirent
 d_name
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211114103539.298686-1-richard.henderson@linaro.org>
 <20211114103539.298686-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211114103539.298686-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/21 11:35, Richard Henderson wrote:
> We currently use a flexible array member for target_dirent,
> but use incorrectly fixed length arrays for target_dirent64,
> linux_dirent and linux_dirent64.
> 
> This requires that we adjust the definition of the VFAT READDIR
> ioctls which hard-code the 256 namelen size into the ioctl constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 6 +++---
>  linux-user/syscall.c      | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

Same as v1:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

