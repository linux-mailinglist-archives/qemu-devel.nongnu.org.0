Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F394BDA76
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:09:44 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAJq-0004ny-UO
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAHW-0003cg-JA; Mon, 21 Feb 2022 10:07:18 -0500
Received: from [2a00:1450:4864:20::42d] (port=37518
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAHU-0001dr-1j; Mon, 21 Feb 2022 10:07:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m27so15823236wrb.4;
 Mon, 21 Feb 2022 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=11IXdA5/mhpR5ohDuUPv1RJpMT+fYa1B4Y0jgQdN3lg=;
 b=a5IZaPV+NrxYNyC2eLtpuBhmZeSLNdMhKx72BmJcJGl/pr0ytp577hxu+lXrLZWsf9
 sjwN7quHtDBfUcg0Q/igbDNbuVDSwt5utajV42rX8ziiFWwcDA7JGXYyeJrKFIUu7fFv
 M6dLyEJRh05QyjxJxDv3s/J2UgxhO6lCdSZBAycUc3RxeB5h+CyttTMbudAx8Zf2up41
 c6R1Y1HjIGyLsQ3et1bA0LO/yOV1HMhG9rLPHiWSZBAbYddlZnhdS9oGMDNZdKeUwuPV
 ivSobeGBbiYQycgt7H3vpEnINx8hRayVi3dgLvHfAEge1GP9FMPLLIV/CDo/dUC/EMRh
 rxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=11IXdA5/mhpR5ohDuUPv1RJpMT+fYa1B4Y0jgQdN3lg=;
 b=b9Z8SM/cMvLX3ayflcPLxmUFRnRWRYEHqWrpO3ooDfVwKIrJ7nbdXXhgQBSmwqZlua
 0oOqYK7/2r2TqjO4/miz5y0HRK/NIOLidBu4X5oAWbn3o2I3D46pbBWVhw2LvoTIHTeP
 0NZhfFi/l0DrPWEHlQfgRuqxFIF2Zry2x9S+DxlrqfLfVm39HVPG87Xh7YPShBM01Uqg
 Qf12w/Ez0MfegoewaAibax6qTBBresxRVxQ1/XsdeaUv21CK6G+J97EqAkmWl2xyXC8U
 a9DBs3IFnmI2CIOwyie6RQOSF7S7u0/PSgLmhsuSba8ORBx9TmTB1mi2hM8c+VZhPrgU
 ZykQ==
X-Gm-Message-State: AOAM5336Ws9XAoolqHZZLZPqaSUQbh4QOP/nlFM+mYgvuwfVe2zIHTJ5
 5Ie3SwXN9/xPG0tZE/YdXGc=
X-Google-Smtp-Source: ABdhPJw8rOknlS5VzLti1r60f/aZDXFTTu0Ak8vuXak3cjvsJsSTaHT0jQmTzhIndZVYBZhfH6h3tw==
X-Received: by 2002:a5d:46d2:0:b0:1e4:b261:7e49 with SMTP id
 g18-20020a5d46d2000000b001e4b2617e49mr16125867wrs.669.1645456034350; 
 Mon, 21 Feb 2022 07:07:14 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c338600b0037c322d1425sm7581385wmp.8.2022.02.21.07.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:07:13 -0800 (PST)
Message-ID: <a4e57118-4544-702b-efc7-56e7e638fecf@gmail.com>
Date: Mon, 21 Feb 2022 16:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221142907.346035-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 15:29, Stefan Hajnoczi wrote:
> qemu_mutex_iothread_locked() may be used from coroutines. Standard
> __thread variables cannot be used by coroutines. Use the coroutine TLS
> macros instead.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   softmmu/cpus.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

