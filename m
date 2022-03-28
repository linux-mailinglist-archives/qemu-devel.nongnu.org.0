Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAED4EA2A2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:01:50 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxQr-0003rF-H6
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:01:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxO9-0002GL-WB
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:59:04 -0400
Received: from [2607:f8b0:4864:20::1029] (port=40887
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxO8-0001w0-08
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:59:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so462201pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NjrWVFmpvRPc8KTzto20IHd3KSR5quCuPvMhLulBLCo=;
 b=Cy4TcrpgVNivbK9UpJ464nJ9I8NzsSO5nBj56f+cnSBFyPvuuPkDukCNWZLHZrbQs4
 vLOc7fyoYfudTkUD4kgyuGnFiWvTqMLZAn3nP5W4ULaeBvss4rLkOkkTcVwWqRH3Hhbf
 TomtmOnQqYSuXMRijYPv5BTsePxlm4Mjmu9miVO5pOAsbLzupZU0clWaurjyS140mclG
 3u3UZJNBQeXxBEHxX/slHvLmK/FaJDWxzqfpmMHtMg1Z9lPX3reqlK/DR6d8fbMQ13Tb
 nJgcSSSYEDmT5K9onWmg6DmC3SiPWaQCxvk787Cpi9wp1UbuAKwCMtE0Ui1k96KOjg21
 gvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjrWVFmpvRPc8KTzto20IHd3KSR5quCuPvMhLulBLCo=;
 b=BlNR7coZLry8Znoj5FcSjYabmJHAlJaM6MtMXcjK/U5fA1L1punarj6WlHAyBHIqv5
 CAoHJfw8OBX0SpMuk4m7ULpaNmLU1HCnTTyKsVfugIp1qApH4SLpTn3nxBl0GZRv0GRr
 HTeYzDgnTVKgUD95f7LI+MbhFmmAu/eXHzle75jZ5rBk6TXHTwM0c7iCR4Ay9uQ9RadH
 LBpAhg4quHLoETiqgH3nwj6DUjzDIvNLU38gBx5vKmTIKWQr7XDlmVpP79nNRE5xyQqH
 GPUEQIMka+PrbiYcfcEMRdEUbjmEF4ZrE/8/VoUfN2ytMUVRSrBFDuZxcyg8vr5LM9PO
 zVNQ==
X-Gm-Message-State: AOAM530zFhnBFHuSTqCYVmwV+TdNc9mJxWa6MEr2OyxjsoVJCVCcfgdW
 P5CmaY26FXskBw9wBq1lLRA=
X-Google-Smtp-Source: ABdhPJyaCDVcUX4JFA9QXoZ+D/peAZUVb8/+vxpNACLzBaVtN5RzI8CkH2rzZ8hnn8fWSnc784Ld+g==
X-Received: by 2002:a17:902:d2c1:b0:156:2e07:28d7 with SMTP id
 n1-20020a170902d2c100b001562e0728d7mr340471plc.39.1648504737032; 
 Mon, 28 Mar 2022 14:58:57 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a17090a5e0d00b001c7d4099670sm393136pjf.28.2022.03.28.14.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 14:58:56 -0700 (PDT)
Message-ID: <472728e5-1ac8-5ff9-ebe2-f73082ddc82d@gmail.com>
Date: Mon, 28 Mar 2022 23:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/tcg/xtensa: allow testing big-endian cores
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220325182352.113975-1-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220325182352.113975-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/3/22 19:23, Max Filippov wrote:
> Don't disable all big-endian tests, instead check whether $(CORE) is
> supported by the configured $(QEMU) and enable tests if it is.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   MAINTAINERS                                | 1 +
>   tests/tcg/xtensa/Makefile.softmmu-target   | 4 ++--
>   tests/tcg/xtensaeb/Makefile.softmmu-target | 5 +++++
>   3 files changed, 8 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

