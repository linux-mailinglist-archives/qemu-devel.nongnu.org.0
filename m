Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB05B2985
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 00:43:06 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWQEi-0007X3-TG
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 18:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oWQCe-00060D-J1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 18:40:56 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oWQCc-0005Rg-AR
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 18:40:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id h188so18050763pgc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date;
 bh=iajBj4S/4XJ66hudM8lrSx1TSNAl+VCQ/LvQWquh/0M=;
 b=HH+NKh6avxSkekcCkvd6gz1avHRiveE3HQ6PGZpj7QGd7Qu8g4Cp7QBtmluiiLuVLB
 /ejDwXLNPylaGUORVGeKlPp+SK2Nr1NX1bjlZhRKX/BSG5CHwEyVnP4c2aBHkygJxWgd
 X8N3uYpQSZc+JjFZd+SoOUzMNzdMqDhm2hir0LDsaLq9jRGZC7lUM1iQiHVMFDxneaXg
 3TAR/mkBrzd1tFOJ/DNMw8I5d8Sms8/z0mR7CgEYLl5fkutLGC36uusXUxwbNg6d3Lyr
 CMCVMlMqnOH9cGTclGfJ7TXRetki2Z/ZXvBliSSN5UhXvkrpBAY1mqDzO6DuMrj2EW18
 aZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
 bh=iajBj4S/4XJ66hudM8lrSx1TSNAl+VCQ/LvQWquh/0M=;
 b=FvZY3hsRxZH4zL4bynCIsPiZUe8bMaPjFsR9fY4HKeD1CB552/e6F9PtrcyGA9Y2FX
 XQVa6aFnr6AAEEdfaY+iBqEtjId/CdydxxrgJPey1jQ59tazR9CCBL7QE5W70RS7tYoH
 bQqvBe3ufP+tuNIFlrV25PHLt8bAx9bSyXR9kkWhT5D8zez2uImhRy6BVEe3F1PJloNY
 5uTGdblhBlAK7kwqPa0QR0x/EXh3QXrr8hI24debs3GPSODDccTNTCWiqunGWgYQeUfQ
 MLoVwCv4LYT6+TxyFBgLsQ/OddQ7vgcxOnGUgps18sVUGJXqsG+KmpJUYIpZLhVtyKcb
 IZDw==
X-Gm-Message-State: ACgBeo0KRAXQIW0EMTSBO3+vquCFYPA7S6b1ox9IIrP0ORrOP8Bc3qUe
 I0tK9SVZ8V6Z1NlNuJNRLa82Dn3CnVdwJda9VYg=
X-Google-Smtp-Source: AA6agR4RDAmuZPOSrgveL2zYYQpZtF1shXQvnbW66oJRjpkw+K4iRVcEZeppwwPoPhap/CwITcnJtw==
X-Received: by 2002:a05:6a00:22cd:b0:52f:706a:5268 with SMTP id
 f13-20020a056a0022cd00b0052f706a5268mr11213989pfj.80.1662676851941; 
 Thu, 08 Sep 2022 15:40:51 -0700 (PDT)
Received: from localhost (154.30-253-62.static.virginmediabusiness.co.uk.
 [62.253.30.154]) by smtp.gmail.com with ESMTPSA id
 w66-20020a627b45000000b005361f6a0573sm135375pfc.44.2022.09.08.15.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 15:40:50 -0700 (PDT)
Date: Thu, 08 Sep 2022 15:40:50 -0700 (PDT)
X-Google-Original-Date: Thu, 08 Sep 2022 15:21:58 PDT (-0700)
Subject: Re: [PATCH 2/2] target/riscv: remove fixed numbering from GDB xml
 feature files
In-Reply-To: <6069395f90e6fc24dac92197be815fedf42f5974.1661934573.git.aburgess@redhat.com>
CC: qemu-devel@nongnu.org, aburgess@redhat.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: aburgess@redhat.com
Message-ID: <mhng-64388555-b0ae-4a9e-8d52-b04022357349@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 31 Aug 2022 01:41:23 PDT (-0700), aburgess@redhat.com wrote:
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

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks.

