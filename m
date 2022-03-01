Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC84C8158
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 03:57:29 +0100 (CET)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOshc-0001QD-3t
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 21:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOsgM-0000hv-6E
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 21:56:10 -0500
Received: from [2607:f8b0:4864:20::429] (port=41838
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOsgH-0004mV-5e
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 21:56:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id p8so12883954pfh.8
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 18:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kkU4SwSFx1eDX6rMqrtPkwgahtU/1gNXaVQ/LziMhAE=;
 b=e0zRkku+7docVhGkb5bTh/QJCTLCGd2khSFCVYP3I1zmmI6GhAcnHRmogukwyEEKaj
 bvZ1g8RbgyTtA8EceBBSXFZE0HlSyHc3oGt6Z9PzoQhvxI+N51rKy2/+Z+SBYEuVvZak
 z5UAISWq2Nm2bd+/WU1UEXSB/p3yhoNoVw2B/x9MZ3WSBnZGAdLLMYwl46ojR47AdCFP
 UhhDeqgW4HCiUYoaP8WS4Udh7F0opCgmvvGQ2SExq4FAkyLUeq2lqU2XPFgMkx/O+kBz
 /J2Zts1gnvw9X2J3/VKcsWSC9pdNShOFWsDsZNwlWZCzImP68L7+N+6cmpbaZR2t7ql/
 /7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kkU4SwSFx1eDX6rMqrtPkwgahtU/1gNXaVQ/LziMhAE=;
 b=6L4ZBzEhNxe7IqG4M2Nl/ePPcyvQfB2UdQ/jXpavsJbzdP4KfKCyym7GdpxS/lvI1b
 VLRVgiEzhUpuYEW1UUPR5eTWAzSbmQ8bqsWwfcH+ID3BGbbJzwA/NM00tPp26tT9O+el
 slbNSWPGXRa5dO8otWqvWxKQIXBrNbGfWclwTnBGn+wsTVFrVFSP3zhYDd3mkddN4LFk
 5P44YGP/aGmhHoWFje4M4ifz7PTo02bBG+7GKITPisXjF+nCJegmHsYHr2SlJA8q/gXT
 UlnaEIMKm827XvKwcj/gWFuTWtJsQPtNCr3iubKwXir5B2dFU2gICFFssoeU8vXu0WZp
 2c+A==
X-Gm-Message-State: AOAM530auYp11UY7d2KiU+E1L/NOI6Jmj93uktE/zC6BNzT9OYbuqJTT
 cXcubVqiHzfnk3UHQpIU9DwSCg==
X-Google-Smtp-Source: ABdhPJxSt7BaxvJS29uqeJ8GK39Atq2EA0UVniBwfRb7/blhgvCvRNkefwdodvFGEFEvOk1zmJpzlQ==
X-Received: by 2002:a63:d23:0:b0:364:f37b:947d with SMTP id
 c35-20020a630d23000000b00364f37b947dmr19942318pgl.263.1646103363579; 
 Mon, 28 Feb 2022 18:56:03 -0800 (PST)
Received: from anisinha-lenovo ([203.212.247.124])
 by smtp.googlemail.com with ESMTPSA id
 k22-20020aa788d6000000b004f1335c8889sm15121479pff.7.2022.02.28.18.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 18:56:03 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 1 Mar 2022 08:25:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 1/3] tests/acpi: i386: allow FACP acpi table changes
In-Reply-To: <20220228201733.714580-2-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203010825180.1505325@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-2-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x429.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 28 Feb 2022, Liav Albani wrote:

> The FACP table is going to be changed for x86/q35 machines. To be sure
> the following changes are not breaking any QEMU test this change follows
> step 2 from the bios-tables-test.c guide on changes that affect ACPI
> tables.

Please retain the tags in subsequent versions of the patch.

>
> Signed-off-by: Liav Albani <liavalb@gmail.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..7570e39369 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/FACP",
> +"tests/data/acpi/q35/FACP.nosmm",
> +"tests/data/acpi/q35/FACP.slic",
> +"tests/data/acpi/q35/FACP.xapic",
> --
> 2.35.1
>
>

