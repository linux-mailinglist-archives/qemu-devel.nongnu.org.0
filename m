Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05085F7B72
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:29:45 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqEK-0002RP-6h
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogpAa-0000xB-5Q
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:21:48 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogpAX-0005jq-Vh
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:21:47 -0400
Received: by mail-io1-xd2c.google.com with SMTP id s16so3860742ioa.6
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bt7NkM+EMtiy3WCIZyEKf5tH+Uangx7p5pMQz++WuWI=;
 b=QsTL/XHBPfMcjsNywqce21l4p0C8vUT6gd3spMM3iiaBFmDEzJsMwyTAmsvBJBI9Q6
 +EIoz7BaFfkaHNiV5n11RnowvSbZ1vwih3BHWec7oU77oCJqgXH7kcysbCfqC2Vle8oA
 ktLIexmKcFyT0CHQIXtOYEKXK7a+t3aobskF4YiEe9IkCpC1JMeVwPf+IvDdluacumD5
 cSs14xK+YsFZ9mTpZ5+fWW9qDBkHXTssPO+g2OIUx6T+84X9zEQQ8PlYNIKAFVOqzuev
 lNrzvFqUuqBOEChetv1TcUdUNR0JB81nYXm2fOkD5alES0W+rv4OByZBGwIo3kcX8F02
 00Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bt7NkM+EMtiy3WCIZyEKf5tH+Uangx7p5pMQz++WuWI=;
 b=1iuCCrO+sjZY9A27nlydlo4bg3QgDaF/zgRXaaLhLTQeNaHfX6+Hn0k1Ij2JMDw5Wc
 kCiOmFW0cSJeqAQflQSgfWGRUERahE21JzdYmv4kVm6w8Wg/LhTvpWXZAcou+vPuE0EB
 6G4iaRSOPTrxJC+GX3fGoS1qxy6sEowfY1kLGDqagVewzvD/832EjV0ebgnEDT7JKxn4
 N3dynOcM82KQv0m60apXvcW3BR8mb+4wYI4xwef++WPZAAsOjAqnvnd3aZ9v/QFoIPp6
 s2BmBq8iPENGJvQbb3cRrsVFXLDJYXwKZzhI+Mi5z8Dw/rlisfhMI6YWlZ+lOpBOPRpq
 zR4Q==
X-Gm-Message-State: ACrzQf0soZg3e7aXBuiiHlbSt35e5N5gq3D6Km+Hu5+Z5/v1KJG0m4YH
 sRpvu4RGZ5NhwRXfZCZNiK1TPzTNFNBUFCirF+ZJtw==
X-Google-Smtp-Source: AMsMyM44quv6DFUUE+UzmID3qSrU5DWxIL+iKHtU/bvlra0QmXlYzpb00zJzDrQvVWhdyBbPZkHv+aaDQths81MWgLY=
X-Received: by 2002:a5d:9452:0:b0:6a3:4fab:d98e with SMTP id
 x18-20020a5d9452000000b006a34fabd98emr2484746ior.185.1665156103699; Fri, 07
 Oct 2022 08:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221007144553.79648-1-miguel.luis@oracle.com>
In-Reply-To: <20221007144553.79648-1-miguel.luis@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 7 Oct 2022 20:51:32 +0530
Message-ID: <CAARzgwxpjfioHSWq3iyzbOT2LgfX_93A5Sje0e1K1tiXtz0wLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix for two ACPI GTDT physical addresses
To: miguel.luis@oracle.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 7, 2022 at 8:16 PM Miguel Luis <miguel.luis@oracle.com> wrote:
>
> The ACPI GTDT table contains two invalid 64-bit physical addresses according to
> the ACPI spec. 6.5 [1]. Those are the Counter Control Base physical address and
> the Counter Read Base physical address. Those fields of the GTDT table should be
> set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.
>
> [1]: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gtdt-table-structure
>
> Changelog:
>
> v2:
>     Updated with collected tags from v1.

For future reference, there is no need to send out a new version with
just the tags added. The tooling make sure that the tags are collected
correctly from the last version.

>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02847.html
>
> Miguel Luis (3):
>   tests/acpi: virt: allow acpi GTDT changes
>   acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
>   tests/acpi: virt: update ACPI GTDT binaries
>
>  hw/arm/virt-acpi-build.c          |   5 ++---
>  tests/data/acpi/virt/GTDT         | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 96 bytes
>  4 files changed, 2 insertions(+), 3 deletions(-)
>
> --
> 2.37.3
>

