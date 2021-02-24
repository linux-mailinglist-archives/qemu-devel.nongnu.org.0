Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4E3241AD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:14:39 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwoA-0005Dg-NA
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEwn4-0004ma-9p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:13:30 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:35893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEwn2-0001TC-C8
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:13:29 -0500
Received: by mail-il1-x129.google.com with SMTP id g9so2193520ilc.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUsgLvSOdt3YhBodBaidHn0jlCJdLeuFsyD+PeHoDXM=;
 b=H7IQF9HqjR8rKKr4IsLY12lybLVvpefhpdsmWJ4DLqNs3t0MDSnf8H5/WmLFNlzvh0
 tAVah2JAaZxzmeOSseQtfYp+ETzZxbTOhfQpKNHiDRNFyqYZxL5Sa050t1UgNUdjei0U
 NEuFDTMCRZ9gdzobQBfQ/2/FsECFpebokX1qmUZ0lGB3+2yql9tac0egPAiELppMOaGA
 rQDLyqzz2oQjTUOeQTqQEEzuAM0URXywaOHS6ee6i1v2OhHKuoHMsyZwQ4f8VWnHgu82
 gF0Rpw8R6tPXTJe9SryuZ6pQZ7uehT4mjweDCb/kgDHvCKqE9RUahNEF4El1chvDeJvU
 wf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUsgLvSOdt3YhBodBaidHn0jlCJdLeuFsyD+PeHoDXM=;
 b=LasF0lMeexrR8a0Mu60espjwPTk8BMzt27dYJd1+UY7TA9hAEkW2MQw2KGa90Pu8Vh
 aqNyrCZas2fqMX2UGeeDKyompqB2M7ca/2Jc3Wb7Kv/l2Og2T4v6PPXfDjebXLroGxRu
 tbjQ+kVSalgX4iiDOEypsG9pEI7XyOYIc6kO2a/uUUlgS/fZIgtGNhSkfDh1fAQKS02n
 9C9d33hi7EYHmtmwsQLWHp/YimDxJxAEnVdkDD11nJq1T2K7TQbN5AxgDHCVMjZgASvp
 d51gucxV7a+k79jXIbmhSUeYQ8ZISMbq6Iki5cQZj6MmjnjbEZvIayJV2O+mUCVFHh5I
 pvvw==
X-Gm-Message-State: AOAM5316KIPlDow3ujPZI3VCaKAYtWUoQnIsJSD10D/LJAeGKhc8GqG4
 15Dtm8UmiNrYagbB8oZBG32WJra2XwvJqB90KDs=
X-Google-Smtp-Source: ABdhPJxVLHetNYt26ImC+wQ1grq76ScYu54SaeZQcQLKY+z4hks2JzLNgNVMPJV8yN4e/pZh66LvEBP1QkXig+EjbyM=
X-Received: by 2002:a92:6b11:: with SMTP id g17mr24482880ilc.163.1614183207197; 
 Wed, 24 Feb 2021 08:13:27 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
In-Reply-To: <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 24 Feb 2021 17:13:15 +0100
Message-ID: <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> It is normally added as v2 for compatibility. Like this.

o.k. Thanks!
I will test this tomorrow.

>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 24db7ed892..f721d0db78 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .xlevel = 0x8000001E,
>          .model_id = "AMD EPYC-Rome Processor",
>          .cache_info = &epyc_rome_cache_info,
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            {
> +                .version = 2,
> +                .props = (PropValue[]) {
> +                    { "ibrs", "on" },
> +                    { "amd-ssbd", "on" },
> +                    { "model-id",
> +                      "AMD EPYC-Rome Processor" },
> +                    { /* end of list */ }
> +                }
> +            },
> +            { /* end of list */ }
> +        }
>      },
>      {
>          .name = "EPYC-Milan",

