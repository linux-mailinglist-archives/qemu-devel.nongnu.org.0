Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B882E54680C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:08:34 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfJR-0005Yx-9C
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfFq-0003iC-LX; Fri, 10 Jun 2022 10:04:50 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfFo-0005QB-Go; Fri, 10 Jun 2022 10:04:49 -0400
Received: by mail-pf1-x434.google.com with SMTP id u2so23960798pfc.2;
 Fri, 10 Jun 2022 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WOizbph/aF9dwpn2F1nG76VwZp3cVNo8nrHhnPqQFDA=;
 b=ht3kq4++rJBOuyzId+VRYMQSWswzzJ4WDWk9/kVtvIxKKPBoLjZH5tV3Z24/pzn8ZL
 2lH6m02TA98Knc3gFnnaNlSvSsP+ICp9yEIC2ScwI+NjeFC8T8sHoEWGvR4qx+APszmx
 kH77VqwVuv3Lc8wMDp9RPP9IWlct1JIm8xqJfzG7Um3uOCrhY5zfhB+tnkQ5MPn3oIee
 ej4IAd1GroJupJ8CkGoGHGUAozkjTQGbc9Pc3NFM/WrmJsG+sb08g3qZhpwjPBWdEcqk
 CR7kP6cMsEIYPgQKrYdg34fz1hn2FJ3mxKBYtcTECkSyJuLRtjrvZbYcOHIof1uMOWQI
 eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WOizbph/aF9dwpn2F1nG76VwZp3cVNo8nrHhnPqQFDA=;
 b=wflApUSpWKudpETgiPmCd1Sf7RxXEG9Byg/GT4hG8fzCq7l/1PE8iSgbeGL57QCHWm
 4/EBWEqcX+ilHBePYbfGIqdjM7yOIfr9YEIyecEHh7HldLVW77oQe6FQkwTgUfVTiMe3
 Mhe4rOhsram0XGMDHD2YmwCtcYBfJktxCNy+EChWLVg/cQBSq7u4PxLqCm8R4fEyoKJ+
 FW+u4SQ6Rara45tHDx15FZO+yvDOsjPiHCdkEHnzIVCxd4NFjwKaU5Y1aMDoYK+m2WhF
 y/ntk6jo6qY/pqeG4zZjaWV48sZ7sS3JEpXMcTTNxg3SCWuw2AuKw7VFR4aMUad3Wgyb
 Gp6w==
X-Gm-Message-State: AOAM533MC6IV9oASEwuphtMlNkGKlFDp3eUHTAUleblY9Oms/hKLovNk
 c+o8VnTZNrqJtoHRV8edrI0=
X-Google-Smtp-Source: ABdhPJy1l8HVh+Xu5V/R12BdpoS+U+3M7jJXL6I/4PVltVe0BOFOJ6O5wv9sS5MQ8PcqWufrsFi95w==
X-Received: by 2002:a05:6a00:14c1:b0:51b:eed4:c571 with SMTP id
 w1-20020a056a0014c100b0051beed4c571mr35866197pfu.72.1654869883719; 
 Fri, 10 Jun 2022 07:04:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a17090a780b00b001e2f3607625sm1743096pjk.23.2022.06.10.07.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 07:04:43 -0700 (PDT)
Message-ID: <124a4722-01f9-225f-05d3-35bd51713bfe@amsat.org>
Date: Fri, 10 Jun 2022 16:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/mips/boston: Initialize g_autofree pointers
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paul Burton <paulburton@kernel.org>
References: <20220605151908.30566-1-shentey@gmail.com>
In-Reply-To: <20220605151908.30566-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/6/22 17:19, Bernhard Beschow wrote:
> Fixes compilation due to false positives with -Werror:
> 
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from qemu/src/include/glib-compat.h:32,
>                     from qemu/src/include/qemu/osdep.h:144,
>                     from ../src/hw/mips/boston.c:20:
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>        inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:52:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_load_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:52: note: ‘dtb_load_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                                    ^~~~~~~~~~~~~
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>      inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:36:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_file_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:36: note: ‘dtb_file_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                    ^~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/boston.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Queued via mips-next.

