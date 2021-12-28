Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6D480B1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 17:13:24 +0100 (CET)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2F6J-0002rp-TX
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 11:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n2F55-00029Y-T0
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 11:12:07 -0500
Received: from [2a00:1450:4864:20::32e] (port=46824
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n2F52-0008Ru-Jo
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 11:12:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so10326488wmd.5
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BArjLCt/pQCC9Kiz03VvPwP33biXRx6io0lmqlwlRjE=;
 b=iUFwwFjzMPyQ4t5ivTKz+kF9u3lCNG0J4hH9vG35/04msrgsmvh2kr8/jxHVPEJJvO
 MDY1OAJfXVTelqkSrohzsslqv7SC1uiBcYpAoXmbPhIi6/fPJZjdjx0MgK9mck/rhkMd
 TskE5QcpxeCD+6V7izUbSiolNXjYNqZ2LqK0apGpChPdU9KrBEubHmn0ogou3vuDNjdT
 /MOt/CEiBWbnDdOz2r/16880d4qY3oXn19KUTrgE7Uc3CN+Cat4u+K2gGRHvNR+a+m9L
 PS9BoG7WnefQi166nEAfPqsAjWCBAePdg7Qsz1kxpceBKuG+ILZShA5sY/XMF4fFxV56
 giiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BArjLCt/pQCC9Kiz03VvPwP33biXRx6io0lmqlwlRjE=;
 b=Njo+FAmQmJxT0UOyixS75SZBko1EwP4sPHiIZHfoZqsD54/5RQB1bln6ptbJKXHzDe
 5DZ3ayydzKzWNag6x9UDCaANphXRDpG6QcxuoclXpW9GHWLM1N0VNFUEFeP+gaIk0RKR
 xFz1iiAw0dEnMoj8alA67RL1d/tBAKkEs6LGZ0EuE39pke8OdRgkV1+6e0Las46lv+9x
 86RPDGvm6BRQeHBcDLggZY1gYBXCqnVEwEkQMmYcNj2Fc+EEztuMPdGFUBzUO701YSX2
 5XhKoZLE3QDtx3o+afhNPeqSBPyqqbzPN8lsOBI1GkG4sCeweK7YpoxPI5rHqR2EpyTG
 VFeg==
X-Gm-Message-State: AOAM533iIQ06LrN1c0Q2SHBFnkFjDksvyqPJDf4X0n6/F858+AxJ+crj
 cjNK5xhQhWdgXiXzBWsc9mhegk2E1a4=
X-Google-Smtp-Source: ABdhPJwu4Bjuhe9iHaaG/GRv1/SWGJhJJqAcRuabmnXK8I5vTXg/cbLxv8O53WBnrbQ8uuZA2C9O9A==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr17659686wmq.64.1640707904501; 
 Tue, 28 Dec 2021 08:11:44 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id h14sm18465788wrz.31.2021.12.28.08.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 08:11:43 -0800 (PST)
Message-ID: <ebb42251-a2b2-21df-9f69-8d854be5d2d9@amsat.org>
Date: Tue, 28 Dec 2021 17:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/tcg/hppa: Add float reference files
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211228160234.4158872-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211228160234.4158872-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 17:02, Philippe Mathieu-Daudé wrote:
> Generated on PA8900 (PA-RISC 2.0).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/tcg/hppa/float_convs.ref | 748 ++++++++++++++++++++++++++++++++
>  tests/tcg/hppa/float_madds.ref | 768 +++++++++++++++++++++++++++++++++
>  2 files changed, 1516 insertions(+)
>  create mode 100644 tests/tcg/hppa/float_convs.ref
>  create mode 100644 tests/tcg/hppa/float_madds.ref

Also fails as:

--- float_convs.out     2021-12-28 17:10:18.155581343 +0100
+++ tests/tcg/hppa/float_convs.ref       2021-12-28 17:00:38.008580465 +0100
@@ -1,748 +1,748 @@
 ### Rounding to nearest
-from single: f32(-nan:0xffffffff)
-  to double: f64(-nan:0x00fff7ffffe0000000) (INVALID)
-   to int32: 2147483647 (INVALID)
-   to int64: 9223372036854775807 (INVALID)
-  to uint32: -1 (INVALID)
-  to uint64: 9223372036854775807 (INVALID)
make[2]: *** [tests/tcg/multiarch/Makefile.target:30: run-float_convs]
Error 1
make[2]: *** Waiting for unfinished jobs....
--- float_madds.out     2021-12-28 17:10:18.156581344 +0100
+++ tests/tcg/hppa/float_madds.ref       2021-12-28 17:00:38.008580465 +0100
@@ -1,768 +1,768 @@
 ### Rounding to nearest
-op : f32(-nan:0xffffffff) * f32(-nan:0xffbfffff) + f32(-inf:0xff800000)
-res: f32(-nan:0xffbfffff) flags=INVALID (0/0)
-op : f32(-nan:0xffbfffff) * f32(-inf:0xff800000) + f32(-nan:0xffffffff)
-res: f32(-nan:0xffbfffff) flags=INVALID (0/1)
-op : f32(-inf:0xff800000) * f32(-nan:0xffffffff) + f32(-nan:0xffbfffff)
-res: f32(-nan:0xffbfffff) flags=INVALID (0/2)
make[2]: *** [tests/tcg/multiarch/Makefile.target:30: run-float_madds]
Error 1

