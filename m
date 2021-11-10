Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC244C496
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:44:09 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkplg-00014m-Vd
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkpks-0000QO-W8
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:43:19 -0500
Received: from [2a00:1450:4864:20::336] (port=43761
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkpkr-0006pG-Ex
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:43:18 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2296612wmz.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K33v15VkEhnEkXT1oN59ghQgW93IG6p6tQ6WpsAxD5c=;
 b=lsCYqQeLp+Ep9bU+/hzOxnLceRrlQ0rRQdJvW+UF322sZMD4d5kT+gnIjETj4liFd/
 6HWa0F/5JV8IAcvRRiIwl3jU8V5luil7tCJcJyW2OMG+9clBd4EKboHAkPGiBfYYMNKJ
 PY1+L75TVhDzUPqjyI/9EgbVlNIV9LML7TVEXfo32I7M3RsdaWYEkgS8k40LBxBvVWL8
 05mW1heoUEBBflB9J1SSM+9eF0ivyPMS/FlQzXN0mGMeMlcNn8Xd9YCJ0+Uv3bnKp/H0
 8ac6Yv5zcv0N5Oqzjb2ej+0n8eGiofAwIMGj5QfY8eaAmdIG+J/XLfcJx7FBaGqsbNGV
 BFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K33v15VkEhnEkXT1oN59ghQgW93IG6p6tQ6WpsAxD5c=;
 b=HPDmAt7NDvC5yHCaZPubTEHDMMwO3EINIYSGFtrqt8Vl9iwEYjARecqZWnkQ7Fo1iJ
 7cBkVQiGaV3ZJ8idqWC8A6y+m8G4A8j0wmXn1XuhBst0gSYHgb4mLDyIC86bDcdKGQ0a
 ha/aPsyy/OPNl/a+TYz3jvfWdjUmGKS3OcYr88gv5ddRYmgZdXOpkdtqZriox9rdXfdQ
 5xf0sDQ+xroYvO2UOZZjlJZYqeXZnvRPzlIeCgxHv1L4U/YOXUvXP8k7obiAMrLoM3pm
 Lr5ZPTAf3Zee743P3fFSzgZXvkbUy67d9nVKz3xA1yY81IDLDmX+dPemPjh1wFxu1r6T
 CqHw==
X-Gm-Message-State: AOAM532k3rANb1TxDtP7BrKCja6+uWWpC/8h/XnLDAJyXJgUKWBUp9Iv
 PySZoJbs/+M0Lf4M+BrV8so=
X-Google-Smtp-Source: ABdhPJzOUkQmJInluO5N/lO9n3xMxUGcDYMvX1TZGtK0lRDqYE3Ee+C2JxMvOqQC/ahv5Nkk4+Slwg==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr16996577wmi.107.1636558995703; 
 Wed, 10 Nov 2021 07:43:15 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l18sm211651wrt.81.2021.11.10.07.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:43:15 -0800 (PST)
Message-ID: <9c9b2ded-9b5b-e15d-9d4e-019e6277773c@amsat.org>
Date: Wed, 10 Nov 2021 16:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 1/4] linux-user: Add host_signal_set_pc to set pc in mcontext
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-2-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211108023738.42125-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.678,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 03:37, Warner Losh wrote:
> Add a new function host_signal_set_pc to set the next pc in an
> mcontext. The caller should ensure this is a valid PC for execution.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  linux-user/host/aarch64/host-signal.h | 5 +++++
>  linux-user/host/alpha/host-signal.h   | 5 +++++
>  linux-user/host/arm/host-signal.h     | 5 +++++
>  linux-user/host/i386/host-signal.h    | 5 +++++
>  linux-user/host/mips/host-signal.h    | 5 +++++
>  linux-user/host/ppc/host-signal.h     | 5 +++++
>  linux-user/host/riscv/host-signal.h   | 5 +++++
>  linux-user/host/s390/host-signal.h    | 5 +++++
>  linux-user/host/sparc/host-signal.h   | 9 +++++++++
>  linux-user/host/x86_64/host-signal.h  | 5 +++++
>  10 files changed, 54 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

