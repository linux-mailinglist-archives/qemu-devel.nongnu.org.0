Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20722595683
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:34:43 +0200 (CEST)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsy9-00071M-Vu
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNsuX-0004oT-VC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:30:57 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNsuW-0004eM-8E
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:30:57 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-333a4a5d495so25971607b3.10
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=k9yhOzbAv3N+c0AtEF+yTLdEsUyzC8mSG2SFKCHHnl0=;
 b=xHTTa09EaDd6uea0vKPGrhC3oegBv1bRKOnOfiTmq0fdw2uw4MHYLVah3mzB1sTAc4
 EvEAITmC2TbdQ6Q3bKGkFkOPTjPbaG22eAf5Lm+6wYM+hhWqOwvyVFsLKPo1kbkieso1
 4fQ0GVJYINS75cjRsFXPpJ0COC92GUrY+YnhXSc0ZUyfVNyfOKpzqHY7U5c7qAMcbejF
 ESijpDpG1xXYcD+1rCgtO50FtxtqvIKkQ+vSa4EOCna+S1QereEqfGBXeeVPSSa2E16S
 q77Od5bppfvKy6Am2/qF/xhic7y4QlMyss85I9G0M6M4Qxnj52mgP9eIvOZTyhaqRzKi
 mx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=k9yhOzbAv3N+c0AtEF+yTLdEsUyzC8mSG2SFKCHHnl0=;
 b=lbWcb30BseXeZ5eakGBG4A8ZjSQK6eBNCuNAHgHUgvjRoF2yD3wKsldz4NDbG3wBoa
 sNeMVFRBSY2kR2mRjNqsXt6MRFjxR/v933MnSlyKBfN7b/NxMFNARlW4E0CFVD0uya58
 b39gOKw+J5Orkk/eMznscgZCdy3ho6qffVrRHiOwpKLqjKO5/sahsfJQMocUOrrGT8+k
 +qbM3uj4wiRlvpdfKC3b0oiiULA9yaYBY8aQVJFUzJNGu0sAvdvy3V8YN0GHVnaVEs86
 YRgCKguSh4HRRxHqdhf2Xka6GE3wFIQIr+VFvcvIdz1DoGqDJ7tLOK58rUCvMZD91So7
 BPzg==
X-Gm-Message-State: ACgBeo1FmkJvfd+H1yiXzKCWMq2wsB9AvKN/RWeSuVj6PaWrDJwj7oer
 NGqFaDfA2tTExR26TGWPXpW+aHlEWNc73aeW7XG7tQ==
X-Google-Smtp-Source: AA6agR6/qPSxlR5+QVuCYzULSD3nx7At6HNT1S0KIcrjiQAsy3BMgjhM60G8K5PteLGrq5DQLiJbp5hf9E8e30BqOiU=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr16803900ywt.64.1660642255338; Tue, 16
 Aug 2022 02:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220816092624.15168-1-zhukeqian1@huawei.com>
In-Reply-To: <20220816092624.15168-1-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 10:30:12 +0100
Message-ID: <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
Subject: Re: [PATCH] acpi_ged: Add ospm_status hook implementation
To: Keqian Zhu <zhukeqian1@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 16 Aug 2022 at 10:26, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> This fixes a bug that causes segmentation fault with following dumpstack:
>  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
>  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
>  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
>  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
>  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
>  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
>  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
>  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
>  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
>  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
>  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
>  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
>  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
>  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47

What are the conditions required to trigger the segfault?


> Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/acpi/generic_event_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index e28457a7d1..a3d31631fe 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>
> +static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
> +{
> +    AcpiGedState *s = ACPI_GED(adev);
> +
> +    acpi_memory_ospm_status(&s->memhp_state, list);
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
>      AcpiGedState *s = ACPI_GED(adev);
> @@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
>
> +    adevc->ospm_status = acpi_ged_ospm_status;
>      adevc->send_event = acpi_ged_send_event;
>  }
>
> --

thanks
-- PMM

