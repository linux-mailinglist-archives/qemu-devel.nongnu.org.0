Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8343756A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:28:03 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrmG-0007gR-8P
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdrjt-0006Pl-LC
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:25:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdrjr-00049v-Mi
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:25:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso5334212pjm.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hfb7NaENHjyBnpfwTEKIvy2uNVURFtnSohw9OxYg0do=;
 b=AsZq1ejEbE7vnv2Gml8jVEc5HKaJi57b+tvKZVRC2p60siuBgNLTiayVFG4k3AO7BU
 sJejIJxvu8UZ0+4CBuPeGsBw4EwzuGTWGS33ixII19AG6y4emfiYJi23laxdVCVSXSgG
 0BwN2da2qv+53ASM6MIrQeOQ381IIkhtTQkEiTw4mIm6PI3u1f9nMPBeBspqMdIdku6Y
 GP32HqOa/G9bFjxAFyUh0/9o+F/0uRC6CB60m94GoI3MyZWrWQ09dhoD5wqgZNrTH/9B
 jHNNAgMdvclExJ0467WM3cAUyKm9TxLeGISbbdINlN38+9WG2Jk26FF9Sf3iOP1YfZ+Z
 F6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hfb7NaENHjyBnpfwTEKIvy2uNVURFtnSohw9OxYg0do=;
 b=NZ9hc4O74/3Xa0dX4qVZ6UVQGjmCZzhCKaOlHNgHyHObM1A/FtfAncsnWpiw3I12Pr
 URvvZwWU8oDKHGnZskAOmNWdMDVJayrezdb6uANhjJhATfhyYT7ISV2wqfRQZtX+O9hm
 oWGa9IqJdm85a/9AM19rzkC/jvV8+tyfE+tyMCmcodTp4tws4LnxNocb4gbN2D0IasuU
 BxqfhmMsL4osj6n2mqq3uhwuS61bL0XSkN5PhnQhBFsJQTBR3W9iQd58Xjoz9I1speQk
 CLBwX+0ILdsm2JbU38RSiDqBBkDic4C3WgAQRsGp+F5hLR9mm1X91eUaNEFioVuEeHV+
 8Y9Q==
X-Gm-Message-State: AOAM533W3R5xyEMKKhDRreluGCrq0Qex8w9JFlDaTApJjkIE6d6IUWKR
 2wCzN76GqGu2rQ0BYmpxU/w1NA==
X-Google-Smtp-Source: ABdhPJzvIeAB/4MO2laMY3seM1o0t1ptY0prnW7/cwyEJvnbiMIXdCJ6q2uFgDnryHvn7sNSafUqjA==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr13558558pjb.76.1634898325661; 
 Fri, 22 Oct 2021 03:25:25 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.159])
 by smtp.googlemail.com with ESMTPSA id mu7sm10117371pjb.12.2021.10.22.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 03:25:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 22 Oct 2021 15:55:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v8 04/10] ACPI ERST: header file for ERST
In-Reply-To: <1634324580-27120-5-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110221554020.268000@anisinha-lenovo>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-5-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 15 Oct 2021, Eric DeVolder wrote:

> This change introduces the public defintions for ACPI ERST.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  include/hw/acpi/erst.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/hw/acpi/erst.h
>
> diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> new file mode 100644
> index 0000000..9d63717
> --- /dev/null
> +++ b/include/hw/acpi/erst.h
> @@ -0,0 +1,19 @@
> +/*
> + * ACPI Error Record Serialization Table, ERST, Implementation
> + *
> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
> + * ACPI Platform Error Interfaces : Error Serialization
> + *
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_ACPI_ERST_H
> +#define HW_ACPI_ERST_H
> +
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +                const char *oem_id, const char *oem_table_id);
> +
> +#define TYPE_ACPI_ERST "acpi-erst"
> +
> +#endif
> --
> 1.8.3.1
>
>

