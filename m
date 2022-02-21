Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B768A4BD9CB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:11:54 +0100 (CET)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Tp-0008H9-RG
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7hc-0005SM-EP
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:22:04 -0500
Received: from [2607:f8b0:4864:20::535] (port=44968
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7ha-0004s2-Uq
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:22:04 -0500
Received: by mail-pg1-x535.google.com with SMTP id l73so14120440pge.11
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 04:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lpDYyoUakX0DdkBE4N81FQvn36iOAZegLiQlNxVewgw=;
 b=aWWYqXn7gqBANlKGjNseO22TvQDJzyWd5WcGNVy9WqwKhuh1CXmHPuS46B8ccDqMCQ
 Dhy/lqj5dWUrjl2FgJf4QyFDXH5J/2yNmnhlLgAZdGv56KvT5OpJkpnKdbBod5mtil/g
 EV8W7czZWc9GAIL933LqXnMWkoS6bBBjVLpubuZeQlpSkm5vSCG/XtYadC9Iim4xmT/a
 Y7EW2g6DyhOxidkOfhYl1YOKDQdF3IvnJSbTyfj+4Zu6fSYq3nXDD27ehM64VpSureI3
 ZdOzSFJpvxQAXYnmTHsRUORscsunX1w71Hr6A7jnaRYKV80PeQ6OprvvQ4dsbj3++02C
 RaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lpDYyoUakX0DdkBE4N81FQvn36iOAZegLiQlNxVewgw=;
 b=YWfX8RJONxjgkZsPMRwslSrLsbuTBiZjvkTjWI82MFeQV9DNAQTMJrf88YyhpqJGsK
 j+nEkK2+u4LxXjdljlHTqJzrRk7CpTphvinRWGWbcikkHsyduSQXR8iab7Jk9maSOVSc
 ndoNnMW02Q5FnA3ZWuyA7QTPezrbF3pxXvMEVN76/UBmgRM3Dv9994DVKVvYgd4lKmVd
 UIe6MEiS375xCTk5icSnotAmZKL4kjLUgvEOcSyRG3qW23VR7WFBSJ8GADU6adjDvlpY
 NEbmc3WSBXiVlxnjrH23FDiXDWmfwMjWTjw6EqX97edSxew/SsVshswBCWYJlt8J70Fv
 ZAxQ==
X-Gm-Message-State: AOAM533A2wVDuhDSbuZ8lt0WLIT2qG0u9o/bEFYWpYN59CjCQgSZJ4wu
 8cDTHGjDrh8i0cZJa3Y+oi4=
X-Google-Smtp-Source: ABdhPJwhSmUin/YNHSKZLqSuCW54RgJwfTmHIfZzS1h/q5ANYi4fO5ynnX/JPMlui/CRl3l6HNshaA==
X-Received: by 2002:a05:6a00:21ca:b0:4c9:ff9:47e3 with SMTP id
 t10-20020a056a0021ca00b004c90ff947e3mr20285358pfj.10.1645446121698; 
 Mon, 21 Feb 2022 04:22:01 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id m126sm16680197pga.94.2022.02.21.04.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:22:01 -0800 (PST)
Message-ID: <aaf8e14a-10cb-3423-cbae-a180f4da179b@gmail.com>
Date: Mon, 21 Feb 2022 13:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PULL 00/25] qtest patches and misc header clean-ups
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 12:59, Thomas Huth wrote:

> ----------------------------------------------------------------
> * Improve virtio-net failover test
> * Some small fixes for the qtests
> * Misc header cleanups by Philippe
> 
> ----------------------------------------------------------------

> Philippe Mathieu-Daudé (12):
>        hw/tpm: Clean includes
>        hw/remote: Add missing include
>        hw/acpi/memory_hotplug: Remove unused 'hw/acpi/pc-hotplug.h' header
>        qtest: Add missing 'hw/qdev-core.h' include
>        exec/ramblock: Add missing includes
>        core/ptimers: Remove unnecessary 'sysemu/cpus.h' include
>        target: Add missing "qemu/timer.h" include
>        linux-user: Add missing "qemu/timer.h" include
>        softmmu/runstate: Clean headers
>        exec/exec-all: Move 'qemu/log.h' include in units requiring it
>        hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
>        hw/tricore: Remove unused and incorrect header

Thanks for picking these!

