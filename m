Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0632DD6F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:56:02 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwsz-0005Hd-Fp
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwTi-0007fC-Eu; Thu, 04 Mar 2021 17:29:54 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwTg-00057W-TF; Thu, 04 Mar 2021 17:29:54 -0500
Received: by mail-il1-x12d.google.com with SMTP id d5so173011iln.6;
 Thu, 04 Mar 2021 14:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hf00AHbHIMiNm64Y8lGK3pPtMES+J1oh7Yn7Ca/ioxA=;
 b=YrmWf0MS22tSe+BM7zdzsAa+mftFKYsTFEhv3to2Uinqh93TiBQZYHXKv1on3REajc
 xwEY4A5UghxgUfoYrXxvZCGIAycXNRbHJxDDgS2+QrDTjBfyEAt/1jr2YxyvzUbAc5xa
 FdSM9Mfo7WhXL6RT/bVWD2G4V5FocNZ65BWiKjYt9nmpwybZki0hhIX5OgUUVabKt+4j
 vh6CvAFgaPq5eTUpDjHqkZXhHJaiBzz+hECMb0jRU6lpFUHVUhoPJJsBbB+/4ZoNaptZ
 HAE9VqIFMWim+1hOokDtfBfEtpHrVPw+JOVpKyMP7A3DVB0FVrrB5t9mqvyzXzNvGYKO
 Fp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hf00AHbHIMiNm64Y8lGK3pPtMES+J1oh7Yn7Ca/ioxA=;
 b=SGZR5dMMff+OTXds9+bp+8Or74Q6oLwHfCSQ8KE4C3vzOqoyQLDXa3vBC2jWYD0uiu
 ZdXQTEeiZQsPqZvsnWVKh6YYHEEfu0tqcfBmZI/U0Ztym5hVCFp6S0NmLSKgjn67lOTb
 YnUdEvtywndC+NysrkWT3BQ4MoNecP/sclsyevDKBXScg03mnHzNC/n4pRMQ4lthqjHX
 FG1xo8bLIz8TnXqN9PjfE4y+0pt0aApI0uzcFUFLS6A+3KoTVar1NPi9QssMkfOuZWj+
 RLu1CnQUs/UwsEEeh+MuuwtfxZUxwVrHT6IN3T125Hw8V7j/178z2PrWo3z5buWpEmSY
 Y2uQ==
X-Gm-Message-State: AOAM530rsQXECMf5sQzTzfvRDyWFwxZYsqViNug7Us+FcbAB+yYSGOWU
 ANMXmdutJyTtoj41ck4t06GdT+qHQ9ZFV6Wnv3s=
X-Google-Smtp-Source: ABdhPJwUVO+yeK6V9fI/ic75sFUPWKsvu5iFup+wuuDL7/3dT0wSZSK4yHRcEgxXMQOmU3DuNMAA2eNbernztswPYe0=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr5854594ila.40.1614896990539; 
 Thu, 04 Mar 2021 14:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20210304140229.575481-1-armbru@redhat.com>
 <20210304140229.575481-3-armbru@redhat.com>
In-Reply-To: <20210304140229.575481-3-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Mar 2021 17:28:33 -0500
Message-ID: <CAKmqyKOTzdSB48KpOS9ovz3K+yvGa0jC5WEhZs9_MsrxGhgYPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] memory: Drop "qemu:" prefix from QOM memory region
 type names
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Edgar Iglesias <edgar.iglesias@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 4, 2021 at 9:03 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Almost all QOM type names consist only of letters, digits, '-', '_',
> and '.'.  Just two contain ':': "qemu:memory-region" and
> "qemu:iommu-memory-region".  Neither can be plugged with -object.
> Rename them to "memory-region" and "iommu-memory-region".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/memory.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c6fb714e49..3c95d7831a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -33,11 +33,11 @@
>  #define MAX_PHYS_ADDR_SPACE_BITS 62
>  #define MAX_PHYS_ADDR            (((hwaddr)1 << MAX_PHYS_ADDR_SPACE_BITS) - 1)
>
> -#define TYPE_MEMORY_REGION "qemu:memory-region"
> +#define TYPE_MEMORY_REGION "memory-region"
>  DECLARE_INSTANCE_CHECKER(MemoryRegion, MEMORY_REGION,
>                           TYPE_MEMORY_REGION)
>
> -#define TYPE_IOMMU_MEMORY_REGION "qemu:iommu-memory-region"
> +#define TYPE_IOMMU_MEMORY_REGION "iommu-memory-region"
>  typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
>  DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
>                       IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
> --
> 2.26.2
>
>

