Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F395A2603
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:42:30 +0200 (CEST)
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWnF-0007HC-5H
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWk4-0002aZ-JV
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:39:12 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWk2-0005Np-R6
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:39:12 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id s1so727507qvn.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3js/aWBCS0p6/EazyZZeWuVnF44ZxEqrv/7BUbssMSI=;
 b=hH6HnsHK40ulBXu56ati8V3gGn/Y2gU/ZwBjLTegG/4rJDjVt2LW7R97gsZ2V6DEvL
 cO1q1tndbgfDS3kwkRJhyO7x9/FnBt5/4NL5DwsvbwBriM8OkdS6NsuJOfODSwoF1Dnz
 OEBxeRI6SHuvpRE3DLqpu8i4rDXhueNaLqUHv4GzNZ//RL38tkGP3QanK7zUgnsN7HyM
 mCv5PNERqceDPROgbXA8i43XPPoc9SCpg0eQyl4ErnFtiA7uUn0GlS+z3hb5+L8OnUx7
 8m+BAGH0DlopoAv6BJ5xEGD+eaJX4ZkdKzkXX3rTJbTkNa7zohBybDW9fMWnlmPuEBXw
 gCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3js/aWBCS0p6/EazyZZeWuVnF44ZxEqrv/7BUbssMSI=;
 b=DSPxY4qsPrNoCri3Gcdxsyt+YYp2cgX9kRwQdW+WSA8SMmMKBWjFPIYdT5mt5nN+LM
 s8hasFw5HvbEOSPMxqXRVwJrASM83A2Po6OOcsUzjzMphqIAEYxLKwHbKvqSQGq1oB1M
 ULzvQmX/FtPe7/p3gubbyL1tw6SxjqIIqy932eSWQ025I5iho3TZkbAJdJQ0dUNmzxY+
 HGVIBIul087+kHRYKKiJuK06ZEy2YGSTfn1uhk8jZ6yxa8fok1NUiW89adJO0/zPwKH5
 1KinjL2OxSmWNr2fbgPuMPqz/YIrTnmutXZLHq3o2umlWzCr2keKGDDpuBIhD0vXqjXT
 DYuA==
X-Gm-Message-State: ACgBeo3vhmRR1BNqqQQxDB7SW5cZt6CLwf1RU7HEdVHmOUucjbVIpxVq
 7WR7OzaczDyNhSt2VBBGaMGvew3v41zHW0jlVCk=
X-Google-Smtp-Source: AA6agR4Xm9+wi+4RISd4WbF9PQpdyehiWjjxhMXDqwEohcjnh/Iqv8SP6GkrNyreUWMdPzhWyboWQUMcxy+17T0EPDM=
X-Received: by 2002:a05:6214:629:b0:497:2c65:32c3 with SMTP id
 a9-20020a056214062900b004972c6532c3mr5035054qvx.122.1661510349708; Fri, 26
 Aug 2022 03:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-35-bmeng.cn@gmail.com>
 <alpine.DEB.2.22.394.2208241745400.562041@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2208241745400.562041@anisinha-lenovo>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 18:38:58 +0800
Message-ID: <CAEUhbmWdqgE_K01N_arGo2aeqhK-cY3xRSfhJvsh2E6rmJCagg@mail.gmail.com>
Subject: Re: [PATCH 34/51] tests/qtest: bios-tables-test: Adapt the case for
 win32
To: Ani Sinha <ani@anisinha.ca>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 24, 2022 at 8:42 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Wed, 24 Aug 2022, Bin Meng wrote:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Single quotes in the arguments (oem_id='CRASH ') are not removed in
> > the Windows environment before it is passed to the QEMU executable.
> > The space in the argument causes the "-acpitable" option parser to
> > think that all of its parameters are done, hence it complains:
> >
> >   '-acpitable' requires one of 'data' or 'file'
> >
> > Change to use double quotes which works fine on all platforms.
> >
> > Also /dev/null does not work on win32, and nul should be used.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  tests/qtest/bios-tables-test.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 36783966b0..0148ce388c 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
> >      free_test_data(&data);
> >  }
> >
> > +#ifndef _WIN32
> > +# define DEV_NULL "/dev/null"
> > +#else
> > +# define DEV_NULL "nul"
> > +#endif
> > +
> >  static void test_acpi_q35_slic(void)
> >  {
> >      test_data data = {
> > @@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
> >          .variant = ".slic",
> >      };
> >
> > -    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
> > -                  "oem_rev=00002210,asl_compiler_id='qemu',"
> > -                  "asl_compiler_rev=00000000,data=/dev/null",
> > +    test_acpi_one("-acpitable sig=SLIC,oem_id=\"CRASH \",oem_table_id=ME,"
> > +                  "oem_rev=00002210,asl_compiler_id=qemu,"
>
> ME and qemu should be surrounded by quotes. They are string arguments.
> https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html?highlight=oem_table_id
>

The doc also says sig is a string, but the original code does not
surround it by quotes.

The parameter is of string type by default, so there is no need to
surround it by quotes unless it contains some special characters.

Regards,
Bin

