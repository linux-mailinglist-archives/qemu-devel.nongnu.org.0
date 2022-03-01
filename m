Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4444C892A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:22:59 +0100 (CET)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzek-0003gq-Ge
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOzBD-0002OF-BE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:52:27 -0500
Received: from [2607:f8b0:4864:20::1032] (port=35616
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOzBB-0000Mu-Qq
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:52:27 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so1638228pjt.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Rwhii/S/L36Potljjq3DGclFv43p2b3+ac2o4cWKOcE=;
 b=Dbt/6+W4hZY55WjGydFBpBLaEjkt2eyx/qagNRoyqMFYvMDpXClPUWSDtRjzn7qQOI
 SP+PQ5tcdEOr3i9F6Un2r4o2nvsdI8Y+dTu8bLQqCDa9BscL9ldpR4rNUT/3p2EPxEf2
 utYR/8wlb/n8Bxfqt/R8u0MCpDy9RcklsRm8sZvBjMRhN2D0KLAEpDALuTxBD4OIysI+
 LzqZQgtcmFLLJtNSAwbI7s30rbtv9ZoU2tMOM1/YBUKfrg3H8hcY4qoDYRb8dKFK0lJM
 mZ5Nno+CFlvpGwSi4gHMBEMQQkChJrJGImIg9XzY/f5yNZwmuGSa+5taPn0rkyiUFYfG
 jlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Rwhii/S/L36Potljjq3DGclFv43p2b3+ac2o4cWKOcE=;
 b=N61N8GXHJFOLfwJncSV/2C69cRprJ9+SEP9B2Po0F28FE7sz9LvKEQXn32nEcDoWUd
 b+R9eOC9xzkcu08E18dcHzbVeBSRt8vHJ0YG3DbJcWpskUsa8w6vNgQ5LPYAsVEJS4IG
 vBdxxFkuZnHFp5vT6iVh/et2W+wUjn5ebNRwmjOlfFRcRQSWUpPHaE3iKVjRv/NsNrsd
 OERgSGhVUFqqhgOLLwv2PZkklTOtvILXieiyQckoDnMEuIszFRkT2alj1FnsrHiva2BT
 i+xJSWJmzK2XYXGn1CLe/bfx7+HxtiLYYmed1ke54zZs9+b5gNcGH3b2XL0aMh8F8cXm
 YkWw==
X-Gm-Message-State: AOAM531rWFcHPc+e92n/ZzcoUThbln4Byb0Upoe8+7L8heGTIEz/h744
 Imp5PJJNULKVnlyBhr8XNoMh4g==
X-Google-Smtp-Source: ABdhPJyska7xYI7m0BhF7D/AlloZY3H/xB9MAkJ8eTJ8X0utYYbYFEoqpNPmAUzUTFJiAJRqLK0tfg==
X-Received: by 2002:a17:902:f552:b0:150:11a5:5e01 with SMTP id
 h18-20020a170902f55200b0015011a55e01mr24290769plf.114.1646128343927; 
 Tue, 01 Mar 2022 01:52:23 -0800 (PST)
Received: from anisinha-lenovo ([203.212.247.124])
 by smtp.googlemail.com with ESMTPSA id
 u19-20020a056a00159300b004e1590f88c1sm17170910pfk.220.2022.03.01.01.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:52:23 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 1 Mar 2022 15:22:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220301094354.1d37f470@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
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
Cc: ani@anisinha.ca, mst@redhat.com, shentey@gmail.com,
 Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 1 Mar 2022, Igor Mammedov wrote:

> On Mon, 28 Feb 2022 22:17:32 +0200
> Liav Albani <liavalb@gmail.com> wrote:
>
> > This can allow the guest OS to determine more easily if i8042 controller
> > is present in the system or not, so it doesn't need to do probing of the
> > controller, but just initialize it immediately, before enumerating the
> > ACPI AML namespace.
> >
> > This change only applies to the x86/q35 machine type, as it uses FACP
> > ACPI table with revision higher than 1, which should implement at least
> > ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > flags register according to the ACPI 2.0 specification.
> >
> > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > ---
> >  hw/acpi/aml-build.c         | 11 ++++++++++-
> >  hw/i386/acpi-build.c        |  9 +++++++++
> >  hw/i386/acpi-microvm.c      |  9 +++++++++
> commit message says it's q35 specific, so wy it touched microvm anc piix4?

Igor is correct. Although I see that currently there are no 8042 devices
for microvms, maybe we should be conservative and add the code to detect
the device anyway. In that case, the change could affect microvms too when
such devices get added in the future.


echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
-monitor stdio 2>/dev/null | grep 8042

<empty>


