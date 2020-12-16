Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7A2DC34A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:40:54 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYv8-00011A-29
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpYrH-0006B8-1V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:36:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpYrF-0002ab-FG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:36:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id y17so23585522wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RioLIL/51M892pi4PfULxVrU8BkqmQWJ2WrXOQTeM94=;
 b=F0M9NIuFH4ogZHP20MUIxL9nXAMVjpQb8J8ZSkJ6ctFIxTL50r9IiQnnbm8AAWyzsS
 YZl1c9/DwKGwwOEbSdBg2vTOX/5mYmO61ORA6VrSyhbn3ZO6cc+taFevGSG7DAT0G6Gm
 m5L1N1ncrY/qJz7ijy/f3ZjsCZsR6VJtiPqgFwn5B5k+LPM39HLozuUzqPb0mSKwqP/z
 hlBTYLih5nsAfHt2rOQeVTR69QDxcgD9iu+Xn7ybIzdCa2SJy3i3UbA2KT8vOrHJqMlP
 9aE97QwL5q2QomeNSuZ7BvhZjL++eZxbuxiRT5srflnyBmVowxd78PAw3gfoZq8/ox9x
 Qqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RioLIL/51M892pi4PfULxVrU8BkqmQWJ2WrXOQTeM94=;
 b=Ru6sYwX0mTampgBRwexM0StD5zXIC0HFQblw6AtSFbi86esLiOXlDmWJw+WnP+8xH9
 uz/CJctlvdqcbw17fmFD9rIaFz6vmJhs+lUb3uJj627vnT3qPrU+WV4pdRiSpWTBJ9Ne
 PaDFUkDSbJ571zYkIwdrb3weiMnjCQEgbK2q1j5/Mncdd7oVsdWls+jfnGnuRojfs9+p
 qMQOj6IEsM0lhHQ+r0UAziIP+/u1yZ2P8mUQVAkEMzlZM3vklL23xxhij9dMDQ4sxOt8
 skpsmthQK660IJLOUK/qzOmUqvAcSRTYpGd1lqW4mW6ln4huNKWQZWxk9ZAFzaY12rRR
 2r4Q==
X-Gm-Message-State: AOAM531FN1Suz73utemW0y5xtN0DBiBZ9/AgK6UOurOduzykOBHKtDpA
 VDSih1iE73wNhgvU+tkBuqQ=
X-Google-Smtp-Source: ABdhPJwfhS7BZM0YU9eBg8FkdtxTUY865Exkij+cknoYiVWvsHnlug5sNXQ99k30DPjfvfx1zn226w==
X-Received: by 2002:adf:e348:: with SMTP id n8mr2209977wrj.148.1608133012009; 
 Wed, 16 Dec 2020 07:36:52 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z13sm6768100wmz.3.2020.12.16.07.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:36:51 -0800 (PST)
Subject: Re: [PATCH 1/3] remove TCG includes from common code
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <78e081f9-5de9-2793-e2eb-3884a408f558@amsat.org>
Date: Wed, 16 Dec 2020 16:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216135529.265165-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 2:55 PM, Paolo Bonzini wrote:
> Enable removing tcg/$tcg_arch from the include path when TCG is disabled.
> Move translate-all.h to include/exec, since stubs exist for the functions
> defined therein.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/stubs/tcg-stub.c                      | 1 -
>  accel/tcg/cputlb.c                          | 2 +-
>  accel/tcg/translate-all.c                   | 2 +-
>  accel/tcg/user-exec.c                       | 2 +-
>  cpu.c                                       | 2 +-
>  hw/i386/kvmvapic.c                          | 1 -
>  {accel/tcg => include/exec}/translate-all.h | 0
>  monitor/misc.c                              | 1 -
>  softmmu/physmem.c                           | 3 +--
>  9 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

