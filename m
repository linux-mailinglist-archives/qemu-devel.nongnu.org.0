Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9F41FC7A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:21:19 +0200 (CEST)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWft8-0003qi-Lv
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfqY-00008a-Vv
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:18:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfqX-0005S4-JQ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:18:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id e12so130800wra.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rFMB4vQepRRyDpCy0wGYflnZkLJO5xKZ1ZyzF40S3UM=;
 b=ACqIP717AuAbs1m9zYWo38flRF3vO4sp88zmoynqNMc47MnJxQNToJw9F6oFO1CRSy
 L+WiLrF/wgHnhG4C56AiIXuPv0fts61Fgnhy/47QnIL8h9bgkcYHM5hYmzQqdSUE4Uik
 Z4Muzg9zpDuxgJW0eGC3wMCnIUzR6r068SEMxCiFVYXmOc4vItgj9Z7eGMs3iUY2JUgl
 jt26q2AhrbzecIY7v8QtJm0AMLnbn2y4DV+MnGsNKgMFZ16sLTbHRHJVTyPAV1nocKCw
 ApSKenYyKjTMnrmYgT1w42sAN+vAR1iVgDt75mOTjAqcSAAOXkPL2L7bwVF1NPFGMs91
 3J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rFMB4vQepRRyDpCy0wGYflnZkLJO5xKZ1ZyzF40S3UM=;
 b=8JVOxKDpeC9YhSPBjjSG44+uwOQrzNV4xbsUt4NVJn5Xj/OMh1XsFEZcr7U5zIFVEg
 R276CglfRUUQlbx7wS7GDT75UzEWMZv4T3QFXEeLypdh2uAzZp8RTRklj7L1fT6HS7e1
 S3VHmPZ+FkIAJin7n3UEMUXcqINV/eG3fqE2SHtK1uDbUNxCkAU7vhyF4uMGm+0o3iWd
 Y60EVafXDCcIAg/GaQN9dgyu23NZUNplq4uIeHd/1c97L8rOjiFwdyXns2KYkKSNaLhg
 6lkjMnOZIFuU4mkPqVq4bwmcFouuay7DciBQZkt7U4J0XS2WaTfWel30cmu3idetIMil
 V7JA==
X-Gm-Message-State: AOAM530RV7YCUU05ftfAoE6lv4zilHjbMgeFyDoNWPmDc786/61qv3N5
 G0UsH9RV1PdXunl2fJGaA9QuS/upYTs=
X-Google-Smtp-Source: ABdhPJzQ0T9n8oO1uOz65qjrdBgebc7NUKt87pbMq+K7b3HwuHMI37ts1Cm0LRCpzjNKQOMGWdEy9Q==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr3671105wrs.11.1633184316169;
 Sat, 02 Oct 2021 07:18:36 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o26sm10829384wmc.17.2021.10.02.07.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:18:35 -0700 (PDT)
Message-ID: <8b582ac7-6521-d4a7-ea1b-873e367a50af@amsat.org>
Date: Sat, 2 Oct 2021 16:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 21/41] target/alpha: Make alpha_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for alpha-linux-user.

Renamed to TCGCPUOps.record_sigsegv in patch #19 of this series.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Remove the code from cpu_loop that handled EXCP_MMFAULT.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/cpu.h          |  7 ++++---
>  linux-user/alpha/cpu_loop.c |  8 --------
>  target/alpha/cpu.c          |  2 +-
>  target/alpha/helper.c       | 13 +------------
>  4 files changed, 6 insertions(+), 24 deletions(-)

