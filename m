Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B53C6433
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:51:57 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31y7-0005dF-Vt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m31sk-00046Z-Fy
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:46:22 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m31si-0004D1-Vk
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:46:22 -0400
Received: by mail-il1-x132.google.com with SMTP id b14so7649014ilf.7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q39vu7tXl6d4+/wEYb2Rw+frPHsrRBbEWgCSw2ZuRh8=;
 b=l4bPDGD7f4dh9feFhCugQtCpB7dvqh4y2L5IQ9xRLRRFZ+g8m4Gq/s4wXjZrC6XNz7
 Pqqpl2WL8Q0pmzPNz4mpdN1TuXjv9fQSCeep0O1WD0ux3JnqeKupe0dpfrpyl3MqBPGj
 PeEQnpoXbOBWFps07CB5lT10FxRJiPRuXSWoFcIkh3uK9rC1wKlzdW2syyDxySmLy2x1
 /C92ZbXoiylneyQUKd5cvFSBUr/uHZr485HRIvHmooP1RWzqmmFdYZBdx2BcZprwh9Eu
 EyN3tzTMtXoNWKpX3rGVtpJXXf41u2Fl2/S6rr1AVrwg9vWihWI+pT80FRdirxRmx7gu
 2rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q39vu7tXl6d4+/wEYb2Rw+frPHsrRBbEWgCSw2ZuRh8=;
 b=Gv75p0KVN1Ik3zTJYm1yfyn3trh6/kPo0X3kkTnzVmxS7DfOqV0tmqfTlKC+WAyBe6
 GTPpEaat3audKN3SvrJYHFLeIfr+sjBWnLdwo3rVIEJcxWZ6lf2nYUGEKramvskcA/N6
 q+nGH61un64E8APLT1xMGRziq3OdWgpInKHIOjiMQqwB1o4Qlf3TczrTWn4jIKB9UNZq
 NcZjqv8jc4ypzOW4LgcO7qseTmI9VmCb81fTHb2cKPd76hqsfW90GmTro3gS4EyJFAIu
 ekdkYARa17hEAx8g1eDGX9sNaMp5/Z4A3BdXUAKLbmJmcG1E/Uq2HObvDB/eEGcKlTne
 k+7g==
X-Gm-Message-State: AOAM532Aui/z4MlZkr6xhRSRJQJCs+Fihlp+ZE27C8Mi7UpJZtCxcZ75
 RGRUVc926wOsPNzJNeo/jRuEQoxH2gFbhnRCS4Q=
X-Google-Smtp-Source: ABdhPJxFKQvq6VfqEX4SwfUmVoLFQAR+0iOZtpbqyVjFS5ECt6d7O+icgrLQCnNMRnJwBm0mafsS9WngDhHGiGINt6w=
X-Received: by 2002:a05:6e02:1947:: with SMTP id
 x7mr352636ilu.85.1626119179601; 
 Mon, 12 Jul 2021 12:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-7-wangyanan55@huawei.com>
In-Reply-To: <20210702100739.13672-7-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 12 Jul 2021 21:46:08 +0200
Message-ID: <CAM9Jb+ivAix6yZ=rJ1_8++Z5Nc2=8aoeSVFuq+eFZvbEZ-QKNg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] machine: Tweak the order of topology members in
 struct CpuTopology
To: Yanan Wang <wangyanan55@huawei.com>
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Now that all the possible topology parameters are integrated in struct
> CpuTopology, tweak the order of topology members to be "cpus/sockets/
> dies/cores/threads/maxcpus" for readability and consistency. We also
> tweak the comment by adding explanation of dies parameter.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 4 ++--
>  include/hw/boards.h | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 55785feee2..8c538d2ba5 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -968,10 +968,10 @@ static void machine_initfn(Object *obj)
>      /* default to mc->default_cpus */
>      ms->smp.cpus = mc->default_cpus;
>      ms->smp.max_cpus = mc->default_cpus;
> -    ms->smp.cores = 1;
> +    ms->smp.sockets = 1;
>      ms->smp.dies = 1;
> +    ms->smp.cores = 1;
>      ms->smp.threads = 1;
> -    ms->smp.sockets = 1;
>  }
>
>  static void machine_finalize(Object *obj)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 1eae4427e8..3b64757981 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -275,17 +275,18 @@ typedef struct DeviceMemoryState {
>  /**
>   * CpuTopology:
>   * @cpus: the number of present logical processors on the machine
> - * @cores: the number of cores in one package
> - * @threads: the number of threads in one core
>   * @sockets: the number of sockets on the machine
> + * @dies: the number of dies in one socket
> + * @cores: the number of cores in one die
> + * @threads: the number of threads in one core
>   * @max_cpus: the maximum number of logical processors on the machine
>   */
>  typedef struct CpuTopology {
>      unsigned int cpus;
> +    unsigned int sockets;
>      unsigned int dies;
>      unsigned int cores;
>      unsigned int threads;
> -    unsigned int sockets;
>      unsigned int max_cpus;
>  } CpuTopology;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

