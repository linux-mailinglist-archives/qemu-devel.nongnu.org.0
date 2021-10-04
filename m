Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B29420A27
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 13:37:21 +0200 (CEST)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMHW-0002Cs-Td
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 07:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXMEg-0008Kh-M0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:34:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXMEf-0000t8-3o
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:34:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id p11so10418690edy.10
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6y14qz4eKQbd3GW9nG9syVa0hT8qoI2u7WXU+GdOoGc=;
 b=5JLlsgIJqjZnidQ6gHqRVsnIxWy+HxusoZUsczfjwQ67QvN85mAh88qXtAXda/OLYH
 RbREnLIsCJFTZhLCQky7HMjYmMnjyOVqWpPids5vTrweEMymTiLBFX0lBnQC+ECPMlP5
 uQ0Jm7pL9eQXu2SJmKg6/7N0JLHHIcjB9zIesLsKHkKWAUiGu4Np+B6Jaa69TkuDvput
 GzgigM5fJiQM8DIO+uKG1KaJP+5lk3tIZPTqdmqTgYvz2fuXa78H5ntbohF7A5YPs7Av
 vXLrFYdBN2OSzrkg4PKZc5pt25YxiQIzJ+AaYHbks6fOA0taGFsYUwqt/Vb0Do/XkGZU
 0dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6y14qz4eKQbd3GW9nG9syVa0hT8qoI2u7WXU+GdOoGc=;
 b=o2ZUmCVx9KvQcFV0Aba0rFXKccN4kosFob8AL8q3oxQXOa4lLhcjOFr4pIejex33ju
 nhn6EDto1c1sxDNjTpH6tadQ6GUEmauhDE9AyOvtmck1DSFPx0gicSC9vi/h1mJ3dKhA
 Or5VIsKPvu9UsQpN7LqNuiYufQ2Gve3AOptH5VTbrQiLD7a6UfLngEuI4LlFgqYewLX/
 S66lrad6WGjSrpPCldLs/zZoyQaRuerAubS10ZlTjzr/usrMhEkKOm/baK5dsyFD/u0h
 WW/S4O/O2LO7rt3NqJsjOWSpPX933oIg11kwq+JdK7MRJ1lSogGEHecnrUrYC3FWqBGR
 7sOg==
X-Gm-Message-State: AOAM533BFAZHZgaXwJmSudhWvdDnJp3e+g9cjNERujSLTDoH9KNnsOD/
 PYA5YrRrAhZzz4z0Sd6L0725s0bkS2W1L2XwH/iJFqwx7p8=
X-Google-Smtp-Source: ABdhPJz+XSYEK1zlAM+9xIlHTAO8Dw7BylCoElZfu4LHwa7YRPeHJQqFrQmjPJGiUu96/vPBiWMd8gdS+ZT449569xY=
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr17689774edk.11.1633347258124; 
 Mon, 04 Oct 2021 04:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210920070047.3937292-1-ani@anisinha.ca>
 <20210920070047.3937292-2-ani@anisinha.ca>
In-Reply-To: <20210920070047.3937292-2-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 4 Oct 2021 17:04:07 +0530
Message-ID: <CAARzgwxVY5KFS9LPea3H_9aFNb4Gff8kA-M41O7kzs2HLD_Wqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] tests/acpi/bios-tables-test: add and allow changes
 to a new q35 DSDT table blob
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52e.google.com
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
Cc: imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ...

On Mon, Sep 20, 2021 at 12:31 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> We are adding a new unit test to cover the acpi hotplug support in q35 for
> multi-function bridges. This test uses a new table DSDT.multi-bridge.
> We need to allow changes in DSDT acpi table for addition of this new
> unit test.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/data/acpi/q35/DSDT.multi-bridge       | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>
> diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..dabc024f53 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.multi-bridge",
> --
> 2.25.1
>

