Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDC52D2EA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:48:28 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfZr-0007nf-OO
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfSG-00074E-83
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfSE-0005zK-4J
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652964033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXtMtkD+aDGLMwQD+cNwTBtEf9p+tx75X0/A4hW9ViY=;
 b=h6Niyc5LvL89+KG7Pwlu6Vv5owQ/13zL7KsBMltqYU6Kr10rRwsum9Iw5fvscJgp0w4Hw5
 rHlaNUifvGcESTZ+T2jXNesSClyumjTCVYUl42qEG/XzEBJdY6/eI1cQEg5I9Mi3LWj22D
 BSZdqG5C489xRtwQ0FrX+BErAleLagk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-b1gR7s-0NtuzZjW5zi7F_Q-1; Thu, 19 May 2022 08:40:32 -0400
X-MC-Unique: b1gR7s-0NtuzZjW5zi7F_Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 u17-20020a056000161100b0020cda98f292so1515451wrb.21
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BXtMtkD+aDGLMwQD+cNwTBtEf9p+tx75X0/A4hW9ViY=;
 b=J9xQgUBfQli1zgmmd2w4x8v9hOxUiBAJ72QMz1x8yNmjnXcLILShPDieJ9i2kwfc3F
 8DfUPqsspmltbxu+Gkb2sg5H7X/MOSXo/mECWjJTipVt9DqGY1yF/oUQoSliA8pK/lrF
 +YfZR6/WXp3RqxYui+FVcIOQx0aFw+VxPj7ncims1G46JzddpJn/mmZx3i3lElFQmaqF
 LiV3oUs/F/r4vzWPkcn0SXWYrc/Ir4AQNZdgnyxMnq0iHWzXEEOaTLLPfajEsuflAb7Y
 Bbxf2mF1w0pmJKSefSy8TEJsE0vDwEQUsvoiuDBlI4X0uYlX2t4sQ7GOmwHWYHbvRK1h
 nlmg==
X-Gm-Message-State: AOAM531I/VEUuIpePKJ6r1PtQOISuXlnIJKtaNhsbAfoX8gYCjYE0Ffl
 DpAPCFqA6U0QHe7u1ipWLVnX1V85mIOw+VFJwXnkPvHcOw5Oja9hHla6VnqjYffI9wCjtkJHB5A
 yaxcAVMorCT05gMo=
X-Received: by 2002:a05:6000:18a2:b0:20e:6698:924 with SMTP id
 b2-20020a05600018a200b0020e66980924mr3670326wri.385.1652964031021; 
 Thu, 19 May 2022 05:40:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy29j5cjEVRhAHlj+TOFOKg1FZpLMl4ot1eIKJRl4cMJyfFYklmhAF2pctPe95WDFytH3j7og==
X-Received: by 2002:a05:6000:18a2:b0:20e:6698:924 with SMTP id
 b2-20020a05600018a200b0020e66980924mr3670301wri.385.1652964030708; 
 Thu, 19 May 2022 05:40:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adf9d88000000b0020d06e7c16fsm4633496wre.84.2022.05.19.05.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:40:30 -0700 (PDT)
Date: Thu, 19 May 2022 14:40:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] acpi/erst: fix fallthrough code upon validation failure
Message-ID: <20220519144029.0ff26644@redhat.com>
In-Reply-To: <20220513141005.1929422-1-ani@anisinha.ca>
References: <20220513141005.1929422-1-ani@anisinha.ca>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 13 May 2022 19:40:05 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> At any step when any validation fail in check_erst_backend_storage(), there is
> no need to continue further through other validation checks. Further, by
> continuing even when record_size is 0, we run the risk of triggering a divide
> by zero error if we continued with other validation checks. Hence, we should
> simply return from this function upon validation failure.
> 
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/erst.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index de509c2b48..df856b2669 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>          (record_size >= 4096) /* PAGE_SIZE */
>          )) {
>          error_setg(errp, "ERST record_size %u is invalid", record_size);
> +        return;
>      }
>  
>      /* Validity check header */
> @@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>          (le16_to_cpu(header->reserved) == 0)
>          )) {
>          error_setg(errp, "ERST backend storage header is invalid");
> +        return;
>      }
>  
>      /* Check storage_size against record_size */
> @@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>           (record_size > s->storage_size)) {
>          error_setg(errp, "ACPI ERST requires storage size be multiple of "
>              "record size (%uKiB)", record_size);
> +        return;
>      }
>  
>      /* Compute offset of first and last record storage slot */


