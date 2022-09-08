Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A45B1DB6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:54:54 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWH3V-0002rI-Lv
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGfB-0007tn-9g
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:29:45 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGf7-0008Mr-MR
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:29:44 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v4so16564615pgi.10
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3YpcoToWbDfneIpdQGWXPPEXICX5Tif2TvOqA7ze8A4=;
 b=KakzMV39zv6xtY2ORoSukUbNTG1HUw7zUNoKEdgbmUY8o26qH15W5X9+XiX5UEWWhE
 kUYSM9c9nzb6mqf0Br6meudrThuxifVIhonivQN2whQxn4lTsirWqxkiZKXaSwsF7FRr
 FFOaID1D3cGuNCKHEq0+aalerJBb/rLkLBKJhBng4CltQop2YGmDljdhr9mlVHhsDJYt
 2QBV5Fwo9enqMP4Ho8nglD5MKCA61t3NlnyJ16dG98xQ4kAHSKOfXaaU+gOi4P4qbuBc
 ZrdmYJAlexpF16AO129REpIvHVkOqk1vXQpV/vceqkCmQS/YOR0moA0hYJFQQmSxwCup
 VGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3YpcoToWbDfneIpdQGWXPPEXICX5Tif2TvOqA7ze8A4=;
 b=LJImuYR9xTh+WGzebheWsyVHwTX6FT4bYhEOr3T0xuG5FBw8K+9ZIvkkWM7dnCZKeF
 6BSQDp5IpYWg6LKxnHaSHSv4dsskfPC8H+wXS9eBqSeKY++N1lEZR531QD4I8/VsTm8M
 ZqZ03/eabGrVHG2iUyd+oo/rtOEp/69N26Lk+uqFLe5oHSpstp3JeJeBfAwsPMs3pHZg
 8ij+Vmh4eB6EXae759CkjtkMzpy1MYWGKSpMmTeEuQD2e/TmdVCeaCOqAl2N1mhvUxoO
 zIwjC6hTsDxiRni94vuwEugnvqtN+a6zkFUM3rbXKMpsN9jK4me+Vof5sVW7a/kYjjgK
 mucw==
X-Gm-Message-State: ACgBeo2otwbYuojC5kRUQFmQ/znFzd8dwpIojSsEV5cxPOXDip/Y+Pcq
 9N+scxI102c8xlRA05lrEIy2gBuiC1KMz5m4Bnk=
X-Google-Smtp-Source: AA6agR447GV6pO9tyOsyGm8sBt4Y00l/q57mZQcFCPSp1kSrJh8xEm1XHPGIBNeFzYm/PF+/0366nRAOQZyJ1EXDN+E=
X-Received: by 2002:a05:6a00:1a93:b0:536:5dca:a685 with SMTP id
 e19-20020a056a001a9300b005365dcaa685mr9217024pfv.13.1662640177104; Thu, 08
 Sep 2022 05:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661934573.git.aburgess@redhat.com>
 <6069395f90e6fc24dac92197be815fedf42f5974.1661934573.git.aburgess@redhat.com>
In-Reply-To: <6069395f90e6fc24dac92197be815fedf42f5974.1661934573.git.aburgess@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 14:29:10 +0200
Message-ID: <CAKmqyKNNdH3AWkB9f5AAfTLhH2qV0TGVGVv7zYbFWNdnG4rc-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: remove fixed numbering from GDB xml
 feature files
To: Andrew Burgess <aburgess@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Aug 31, 2022 at 10:45 AM Andrew Burgess <aburgess@redhat.com> wrote:
>
> The fixed register numbering in the various GDB feature files for
> RISC-V only exists because these files were originally copied from the
> GDB source tree.
>
> However, the fixed numbering only exists in the GDB source tree so
> that GDB, when it connects to a target that doesn't provide a target
> description, will use a specific numbering scheme.
>
> That numbering scheme is designed to be compatible with the first
> versions of QEMU (for RISC-V), that didn't send a target description,
> and relied on a fixed numbering scheme.
>
> Because of the way that QEMU manages its target descriptions,
> recording the number of registers in each feature, and just relying on
> GDB's numbering starting from 0, then I propose that we remove all the
> fixed numbering from the RISC-V feature xml files, and just rely on
> the standard numbering scheme.  Plenty of other targets manage their
> xml files this way, e.g. ARM, AArch64, Loongarch, m68k, rx, and s390.
>
> Signed-off-by: Andrew Burgess <aburgess@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdb-xml/riscv-32bit-cpu.xml | 6 +-----
>  gdb-xml/riscv-32bit-fpu.xml | 6 +-----
>  gdb-xml/riscv-64bit-cpu.xml | 6 +-----
>  gdb-xml/riscv-64bit-fpu.xml | 6 +-----
>  4 files changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
> index 0d07aaec85..466f2c0648 100644
> --- a/gdb-xml/riscv-32bit-cpu.xml
> +++ b/gdb-xml/riscv-32bit-cpu.xml
> @@ -5,13 +5,9 @@
>       are permitted in any medium without royalty provided the copyright
>       notice and this notice are preserved.  -->
>
> -<!-- Register numbers are hard-coded in order to maintain backward
> -     compatibility with older versions of tools that didn't use xml
> -     register descriptions.  -->
> -
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name="org.gnu.gdb.riscv.cpu">
> -  <reg name="zero" bitsize="32" type="int" regnum="0"/>
> +  <reg name="zero" bitsize="32" type="int"/>
>    <reg name="ra" bitsize="32" type="code_ptr"/>
>    <reg name="sp" bitsize="32" type="data_ptr"/>
>    <reg name="gp" bitsize="32" type="data_ptr"/>
> diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
> index 84a44ba8df..24aa087031 100644
> --- a/gdb-xml/riscv-32bit-fpu.xml
> +++ b/gdb-xml/riscv-32bit-fpu.xml
> @@ -5,13 +5,9 @@
>       are permitted in any medium without royalty provided the copyright
>       notice and this notice are preserved.  -->
>
> -<!-- Register numbers are hard-coded in order to maintain backward
> -     compatibility with older versions of tools that didn't use xml
> -     register descriptions.  -->
> -
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name="org.gnu.gdb.riscv.fpu">
> -  <reg name="ft0" bitsize="32" type="ieee_single" regnum="33"/>
> +  <reg name="ft0" bitsize="32" type="ieee_single"/>
>    <reg name="ft1" bitsize="32" type="ieee_single"/>
>    <reg name="ft2" bitsize="32" type="ieee_single"/>
>    <reg name="ft3" bitsize="32" type="ieee_single"/>
> diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
> index b8aa424ae4..c4d83de09b 100644
> --- a/gdb-xml/riscv-64bit-cpu.xml
> +++ b/gdb-xml/riscv-64bit-cpu.xml
> @@ -5,13 +5,9 @@
>       are permitted in any medium without royalty provided the copyright
>       notice and this notice are preserved.  -->
>
> -<!-- Register numbers are hard-coded in order to maintain backward
> -     compatibility with older versions of tools that didn't use xml
> -     register descriptions.  -->
> -
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name="org.gnu.gdb.riscv.cpu">
> -  <reg name="zero" bitsize="64" type="int" regnum="0"/>
> +  <reg name="zero" bitsize="64" type="int"/>
>    <reg name="ra" bitsize="64" type="code_ptr"/>
>    <reg name="sp" bitsize="64" type="data_ptr"/>
>    <reg name="gp" bitsize="64" type="data_ptr"/>
> diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
> index 9856a9d1d3..d0f17f9984 100644
> --- a/gdb-xml/riscv-64bit-fpu.xml
> +++ b/gdb-xml/riscv-64bit-fpu.xml
> @@ -5,10 +5,6 @@
>       are permitted in any medium without royalty provided the copyright
>       notice and this notice are preserved.  -->
>
> -<!-- Register numbers are hard-coded in order to maintain backward
> -     compatibility with older versions of tools that didn't use xml
> -     register descriptions.  -->
> -
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name="org.gnu.gdb.riscv.fpu">
>
> @@ -17,7 +13,7 @@
>      <field name="double" type="ieee_double"/>
>    </union>
>
> -  <reg name="ft0" bitsize="64" type="riscv_double" regnum="33"/>
> +  <reg name="ft0" bitsize="64" type="riscv_double"/>
>    <reg name="ft1" bitsize="64" type="riscv_double"/>
>    <reg name="ft2" bitsize="64" type="riscv_double"/>
>    <reg name="ft3" bitsize="64" type="riscv_double"/>
> --
> 2.25.4
>
>

