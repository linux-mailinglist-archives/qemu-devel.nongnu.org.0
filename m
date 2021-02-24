Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD21323879
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:20:26 +0100 (CET)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpPF-0006VQ-4q
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEpNp-0005kZ-Af
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:18:57 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEpNn-0007Bj-O6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:18:57 -0500
Received: by mail-il1-x132.google.com with SMTP id e2so1029062ilu.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrdLi2A7jkyOvS9ppy85vUqonPDqZKhuZZKnaprRs+M=;
 b=Yx04Rroft6y6er9m+mPzJ0f15lkigsyWXgWDkOar9gfMThp4ez8dCo8wliokzPSx9H
 hOGqoZS0GxdQejsbGNQCRku7lT+50Uhm7mOPyyFjX1LVTGAoAmpxIMXw6lsZeIfTPV5z
 vR8FlW4/oxjeUOSuryc0YDYlTu8WrSpysKFlCDTyc4MWr7f5ytOot57qRirv3Yu+HS5c
 VM4tYtZJSB5yAiH3q6XHEZiTSGSH8u/OhDaYWqQIWk0b6w0Mq06y2a/5xClkdnHGrmTK
 z/JqXynd5AmlTzXU/PsshWcy6PdhdkgmgPKfRlY6JmaubpluIjjX954n8Tl5JGELtZ+o
 wx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrdLi2A7jkyOvS9ppy85vUqonPDqZKhuZZKnaprRs+M=;
 b=d3RJdm/7GvknYBiBnVjbf2P6rBx8R/shQWKQzVmettFofVcw5Zx+nSTbFZZzRvS6Xz
 Vgg1zGR+jNgLPxEoEdMzJn9K6yvZedak1XrPkkD8L3Ko9luyIPdBDxknaxgNLfAHs3qi
 z8A87tIf+81NTb0JQDbLfM82/Xk2kVa7BQGcCY4QUKAdx4KXfWgCxtxWqTloy+Y2i2Ex
 N2KtNLXZdbUU9nv7HVSswBtXHeMqy+UaVuUzwznsmQ4IrYL2RwqG9g2GNaTaWrxahmCi
 S/gQNJlq7rRGCNQeFxnMTuqWxTbS3ZZLHKHQeXk62htdv+eNX3q2Gypt1Y84n9f1g5ro
 eZqg==
X-Gm-Message-State: AOAM533B+v/GTDnbSC+W4xdfmop4XtOKS2sw+7wB/mVEVKet7VoyT58Z
 HKpXuZDU8ZtDPEagnhMUYRdDJC3LoYp7FCwm36s=
X-Google-Smtp-Source: ABdhPJyWqGIIl/QVLkcxhfuA21lQ7HD/TcPkOMU8seX8jeIqGeC1FsfXZjVbTYABt1Q7PcDhhQFWWgZ5iITltK5ozFw=
X-Received: by 2002:a05:6e02:b27:: with SMTP id
 e7mr23298680ilu.253.1614154734346; 
 Wed, 24 Feb 2021 00:18:54 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
In-Reply-To: <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 24 Feb 2021 09:18:43 +0100
Message-ID: <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x132.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Babu,

> >> +        .features[FEAT_8000_0008_EBX] =
> >> +            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
> >> +            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
> >> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
> >> +            CPUID_8000_0008_EBX_AMD_SSBD,
> >
> > Don't have SSBD flag exposed in default EPYC-Rome CPU configuration?
> > Is there any reason for this?
> > Or do we need to explicitly add it?
>
> I think we missed it when we added EPYC-Rome model. I was going to add it
> sometime soon. As you know users can still add it with "+ssbd" if required.

Thanks for clarifying. I also see CPUID_8000_0008_EBX_IBRS missing for Rome.
Will it be okay if we add them now for Rome?

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..b495116545 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4161,7 +4161,8 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_8000_0008_EBX] =
             CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
             CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
-            CPUID_8000_0008_EBX_STIBP,
+            CPUID_8000_0008_EBX_STIBP | CPUID_8000_0008_EBX_IBRS |
+            CPUID_8000_0008_EBX_AMD_SSBD,
         .features[FEAT_7_0_EBX] =
             CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
             CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |

