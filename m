Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9417444281
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:36:01 +0100 (CET)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGQr-0007gM-2j
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGLn-0000BM-UV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:30:50 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGLk-0007I5-QA
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:30:47 -0400
Received: by mail-qv1-xf30.google.com with SMTP id i13so2957197qvm.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NAbr4+8YzSyQxb37426Pk54sCkETG1TLqDyXbzfMe+E=;
 b=YRtq0NpLDGWI3YafYxTYkdL/LW4YzOiq5NgRHPCBwu9X3oXsiP/h2C/vgh3SD+Dm3W
 2V1ZzD0E5n+ZYc3nYtsEdhIHmLqWE1tPjbnMylNKS+RHfDso6ODVBfKA6+7nHJ8fPeWY
 ANfwt0iR9+9OkN8i9e8DVpKZolE/a0plSuVDFFacrFGC439SSgF47HudC3Lo/2WKFLLT
 WolX332Qc9qIgeenmxXPPyoY5YAaYRxqyCdd4eZ3QUN4ex1rOfZRMY5+dbo6yBDBLW+Z
 OcB6+zZ8I4X2Z4/HzPZb5qwWT3TrLnDhoOxpvk3d10IlWcuWZKCaCUx1z5fZ1kQ5ckal
 ZqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NAbr4+8YzSyQxb37426Pk54sCkETG1TLqDyXbzfMe+E=;
 b=ATOg/LJS6MNVxo/KovIBZowK9CJd0wLT8+XqAUFgTYM6gqA8Cuvn+9kdR+8kBT7mxD
 GCMHNgvXKha4Ruf2n4xsbol5rhEjnR0Esb1ryV6DVSpbuQizytvTDRCCDSYspZeq1fRi
 HVlyS0OgRY5ijaT+1LHSRs3AnFWwqVMElfT5QJcftRH50eHKnXu5Qno+FhafWJlymLFz
 CH8m6BDERRjGQhrV5Imhi274gdUv/uVhOh4DCeJNI77hrFEX4Io8jMqYogm7q99jSIH/
 GipceibNaNL3OVbirDCHK6hTwg2mC3ZjQEd5OYLQqW1qYEtsklprPvUCHbk9QJ5zP20m
 BI5g==
X-Gm-Message-State: AOAM533ZLGUpBoDSGLa3LTTkFz7pr6Ive1aPA6oSURWPMik/vn0Z8QCE
 xMTJRWxAf1G91JC8ZSxRPJ3Rlw==
X-Google-Smtp-Source: ABdhPJxDpDTz9pbt8dvUJPYDMbxC01q1GLafFOukmiyK+/ZuFdVxblkEKbtSdh/pMrn3jvm/v1jytw==
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr43647557qvc.61.1635946243676; 
 Wed, 03 Nov 2021 06:30:43 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id l3sm1504402qkj.18.2021.11.03.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 06:30:42 -0700 (PDT)
Subject: Re: [PULL 00/18] HMP-to-QMP info command patches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211102175700.1175996-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6d762e8-5b32-6ff5-730d-adf69b7dd920@linaro.org>
Date: Wed, 3 Nov 2021 09:30:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 1:56 PM, Daniel P. Berrangé wrote:
> The following changes since commit 91e8394415f9bc9cd81c02bfafe02012855d4f98:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211031-pull-request' into staging (2021-11-02 10:07:27 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/berrange/qemu tags/hmp-x-qmp-620-pull-request
> 
> for you to fetch changes up to b6a7f3e0d28248861cf46f59521129b179e8748d:
> 
>    qapi: introduce x-query-opcount QMP command (2021-11-02 15:57:20 +0000)
> 
> ----------------------------------------------------------------
> Initial conversion of HMP debugging commands to QMP
> 
> This introduces a new policy that all HMP commands will be converted to
> have QMP equivalents, marked unstable if no formal QAPI modelling is
> intended to be done.
> 
> New unstable commands are added as follows:
> 
>    - HMP "info roms" => QMP "x-query-roms"
>    - HMP "info profile" => QMP "x-query-profile"
>    - HMP "info numa" => QMP "x-query-numa"
>    - HMP "info usb" => QMP "x-query-usb"
>    - HMP "info rdma" => QMP "x-query-rdma"
>    - HMP "info ramblock" => QMP "x-query-ramblock"
>    - HMP "info irq" => QMP "x-query-irq"
>    - HMP "info jit" => QMP "x-query-jit"
>    - HMP "info opcount" => QMP "x-query-opcount"
> 
> ----------------------------------------------------------------
> 
> Daniel P. Berrangé (18):
>    monitor: remove 'info ioapic' HMP command
>    monitor: make hmp_handle_error return a boolean
>    docs/devel: rename file for writing monitor commands
>    docs/devel: tweak headings in monitor command docs
>    docs/devel: update error handling guidance for HMP commands
>    monitor: introduce HumanReadableText and HMP support
>    docs/devel: document expectations for QAPI data modelling for QMP
>    docs/devel: add example of command returning unstructured text
>    docs/devel: document expectations for HMP commands in the future
>    qapi: introduce x-query-roms QMP command
>    qapi: introduce x-query-profile QMP command
>    qapi: introduce x-query-numa QMP command
>    qapi: introduce x-query-usb QMP command
>    qapi: introduce x-query-rdma QMP command
>    qapi: introduce x-query-ramblock QMP command
>    qapi: introduce x-query-irq QMP command
>    qapi: introduce x-query-jit QMP command
>    qapi: introduce x-query-opcount QMP command
> 
>   accel/tcg/cpu-exec.c                          |  51 +++++-
>   accel/tcg/hmp.c                               |  22 +--
>   accel/tcg/translate-all.c                     |  84 +++++----
>   docs/devel/index.rst                          |   2 +-
>   ...mands.rst => writing-monitor-commands.rst} | 167 ++++++++++++++++--
>   hmp-commands-info.hx                          |  29 +--
>   hw/core/loader.c                              |  39 ++--
>   hw/core/machine-hmp-cmds.c                    |  38 +---
>   hw/core/machine-qmp-cmds.c                    |  40 +++++
>   hw/rdma/rdma_rm.c                             | 104 +++++------
>   hw/rdma/rdma_rm.h                             |   2 +-
>   hw/rdma/vmw/pvrdma_main.c                     |  31 ++--
>   hw/usb/bus.c                                  |  24 ++-
>   include/exec/cpu-all.h                        |   6 +-
>   include/exec/ramlist.h                        |   2 +-
>   include/hw/rdma/rdma.h                        |   2 +-
>   include/monitor/hmp-target.h                  |   1 -
>   include/monitor/hmp.h                         |   5 +-
>   include/monitor/monitor.h                     |   2 +
>   include/qapi/type-helpers.h                   |  14 ++
>   include/tcg/tcg.h                             |   4 +-
>   monitor/hmp-cmds.c                            |  99 ++---------
>   monitor/hmp.c                                 |  32 +++-
>   monitor/misc.c                                |  46 ++---
>   monitor/monitor-internal.h                    |   7 +
>   monitor/qmp-cmds.c                            | 116 ++++++++++++
>   qapi/common.json                              |  11 ++
>   qapi/machine.json                             | 110 ++++++++++++
>   qapi/meson.build                              |   3 +
>   qapi/qapi-type-helpers.c                      |  23 +++
>   softmmu/physmem.c                             |  19 +-
>   stubs/usb-dev-stub.c                          |   8 +
>   target/i386/monitor.c                         |   6 -
>   tcg/tcg.c                                     |  98 +++++-----
>   tests/qtest/qmp-cmd-test.c                    |   8 +
>   35 files changed, 829 insertions(+), 426 deletions(-)
>   rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (75%)
>   create mode 100644 include/qapi/type-helpers.h
>   create mode 100644 qapi/qapi-type-helpers.c

Applied, thanks.

r~


