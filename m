Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8447467A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:32:26 +0100 (CET)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9mz-0006Tt-4r
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:32:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9lB-0005a9-3F
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:30:33 -0500
Received: from [2a00:1450:4864:20::42c] (port=39539
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9l0-0005EZ-Sz
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:30:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a18so33020272wrn.6
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Ajrn9W0X4a0JmMZIP7OH4srJ8Y54qBSLxcR23T0n7Y=;
 b=YsWViKOldE2Q6yiajyRKVbO0pyKvGSS8UUCdlysQJanTHzki6wqBdOScmshfGpSa96
 vpehQsUpmJqt1+zOkECo+cIu+ZrtpNN/EKmH/eG5vPKU2REAqF6ssl97ngAj3GLV/ugc
 rY2X/VuDjp4AfQBrY3R2igwz8WwI0Glh/W6gpMhqlePn1k9htsjrEtiSZGJ0XbTwqZ2g
 BsEWp2oIFH219WOc8JXJ8w84s9o96Csp5EIQMKtFqhupBv9pyE902l6Pz9pZXOqKwDbF
 NlC4s24c5SzUmNKudcDurjEk+Tp8dfZbTX7y6mKq3048PL+0ava5L52kc+cYlTW/9g/l
 x2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Ajrn9W0X4a0JmMZIP7OH4srJ8Y54qBSLxcR23T0n7Y=;
 b=OUrkvDG8Txx5mP3/g2CvEyMOiy+j9NhPYKwhW+grNFbuiZJ0kOI1RS+0ViInT5Pmvt
 qgmlI5Z567LDVJ5gjgxgXZVjn86yKqggas3EsI/o6A9c+IVSFNmHEvN1vZsD3E+09k3t
 Fd2u3Qk74fwlSKiNIED1Rg21KlQDcbV2vLX8LFr8vs9gwQA3Wgm8atWVvw6UubAMGkyb
 c1BVzYehtaKyQowyg2sT5vL0XXGcDumM0Wfu3EpN+Hj33csHvt3rtKNDLKnyb09XykM6
 ch8HdJBVZ8++cKvJDYSttFGrqqTZHG3ax7QBFjBGqKK2DoTYrGLvMEwACpPHfQlulV/9
 vMmQ==
X-Gm-Message-State: AOAM530B/OAsXNA33g1d6ZMut8roCQ+2BkdiH1ymTSU6zdf7JM0M3F/+
 3Ght3QX+EAlOPFUKHbDbHVA=
X-Google-Smtp-Source: ABdhPJwJBrVWamrMdBbHtK7dtd3uKEbYN5FiMjmtlItMKNqXwNUmzniFzBa1Njc/0lX46myu02S8NQ==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr6236259wrt.419.1639495821006; 
 Tue, 14 Dec 2021 07:30:21 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j40sm2644337wms.19.2021.12.14.07.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:30:20 -0800 (PST)
Message-ID: <affabe18-4ef4-90ee-a2d3-2ad970d076cc@amsat.org>
Date: Tue, 14 Dec 2021 16:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 04/15] linux-user/host/sparc64: Add safe-syscall.inc.S
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 12/14/21 01:25, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/sparc64/hostdep.h          |  3 +
>  linux-user/host/sparc64/safe-syscall.inc.S | 89 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 linux-user/host/sparc64/safe-syscall.inc.S

> diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/linux-user/host/sparc64/safe-syscall.inc.S
> new file mode 100644
> index 0000000000..bb35c64cfc
> --- /dev/null
> +++ b/linux-user/host/sparc64/safe-syscall.inc.S
> @@ -0,0 +1,89 @@
> +/*
> + * safe-syscall.inc.S : host-specific assembly fragment
> + * to handle signals occurring at the same time as system calls.
> + * This is intended to be included by linux-user/safe-syscall.S
> + *
> + * Written by Richard Henderson <richard.henderson@linaro.org>
> + * Copyright (C) 2021 Red Hat, Inc.

Are you sure this is the correct (c)?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

