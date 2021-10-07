Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF4425881
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:56:35 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWh8-0003al-DL
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYWei-0001ma-K1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYWeg-0007l4-GY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633625641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3LIWQsYwame5cMntu1T4M91IxPxy9iCnjxKhMXzzu0=;
 b=VZ9FFs6vmNmPHKsVfyYFfJoHTk0PERK6cu9O/PIHMPCt7h/RaD5oi3/8kjxG3oUTqAUcnS
 MBsete+QFvPlFyvGEnAhBgZ71juE2FycXMfIJ3iokmq/wiYDYE6qOosZg8BNfvdHpxdoNk
 PbRhSP/dE650aTfEhn15E3DoIZ2xQE8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-SO6qPribOVGEC4BOwiQ5NQ-1; Thu, 07 Oct 2021 12:53:57 -0400
X-MC-Unique: SO6qPribOVGEC4BOwiQ5NQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so1524973wrm.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3LIWQsYwame5cMntu1T4M91IxPxy9iCnjxKhMXzzu0=;
 b=ZCYrZT4ascmYfPJMRGgBtl2HL/4pPbD+1k+dDt4zMhos3B14QmHmf1Y1uyf1dN/ihT
 /eKZUnIKSIqkcZdqnodJC2gEjlHth7PVCNKUhyf+k1mxmpG7rASg3H3gxgVkjKxoERLG
 zxdxFu7CE66gtKuI2V8u+CpdCtrn+DR9S3a0HCbe/1ijPXxYhgnQ/DYhmv8HBY/YWvAB
 slhYjYF8j9ZTZwvG+SImoW/hBPObekrYoJGr51iniTXAeH1Rh91ksN5rXPmKm2rLEeoe
 WHdf4g2b7Y+ouFWnhFBzBLLLPP2BYdi7Bq6xRJaEa9SdmrGSk5Aa6mD84KZ3oXhslroP
 T3QQ==
X-Gm-Message-State: AOAM530tRbtl6k0/Fix+5hce9/YvNvsYXG0c4uTQfghlExugRIppy+mP
 YvymRuYCGymxYQs3BKw3R82ZfIX38g2FmeFX1uBQCaw1tN10ZWJNGVm5+8qLRNq6AOdiTrIlJ2d
 mS+/KYd7nPtPe/b9fL64DtCvM/3+fLl+DC727ejELWdR3gRime2fSkrtWLiSdSYM=
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr2927563wrt.362.1633625636004; 
 Thu, 07 Oct 2021 09:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY8U1aHjgejGEMOYcsaGOxaD/tSiNIRxmKzK0iVcKeoOeoF6r3fIRjmVSHE+DZdz82DWOYlg==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr2927538wrt.362.1633625635725; 
 Thu, 07 Oct 2021 09:53:55 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id k9sm170060wrz.22.2021.10.07.09.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 09:53:55 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-18-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 23/24] configure: prepare for auto-generated option parsing
Message-ID: <a1bdcb8f-8f37-a375-465b-a1bd0cc47d30@redhat.com>
Date: Thu, 7 Oct 2021 18:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007130829.632254-18-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/2021 15.08, Paolo Bonzini wrote:
> Prepare the configure script and Makefile for automatically generated
> help and parsing.
> 
> Because we need to run the script to generate the full help, we
> cannot rely on the user supplying the path to a Python interpreter
> with --python; therefore, the introspection output is parsed into
> shell functions and stored in scripts/.  The converter is written
> in Python as standard for QEMU, and this commit contains a stub.

Looks like a good approach to me! I've just got two questions below...

> diff --git a/configure b/configure
> index d2f754d5d1..d979476e03 100755
> --- a/configure
> +++ b/configure
> @@ -789,6 +789,18 @@ fi
>   
>   werror=""
>   
> +. $source_path/scripts/meson-buildoptions.sh
> +
> +meson_options=
> +meson_option_parse() {
> +  meson_options="$meson_options $(_meson_option_parse "$@")"
> +  if test $? -eq 1; then
> +    echo "ERROR: unknown option $1"
> +    echo "Try '$0 --help' for more information"
> +    exit 1
> +  fi
> +}

Why the detour via this wrapper and $(_meson_option_parse) ? Couldn't you 
simply add the stuff directly to $meson_options in _meson_option_parse() ?

>   for opt do
>     optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
>     case "$opt" in
> @@ -1548,6 +1560,8 @@ for opt do
>     ;;
>     --disable-slirp-smbd) slirp_smbd=no
>     ;;
> +  --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
> +  ;;
>     *)
>         echo "ERROR: unknown option $opt"
>         echo "Try '$0 --help' for more information"
> @@ -1802,11 +1816,9 @@ Advanced options (experts only):
>                              enable plugins via shared library loading
>     --disable-containers     don't use containers for cross-building
>     --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
> -
> -Optional features, enabled with --enable-FEATURE and
> -disabled with --disable-FEATURE, default is enabled if available
> -(unless built with --without-default-features):
> -
> +EOF
> +  meson_options_help
> +cat << EOF
>     system          all system emulation targets
>     user            supported user emulation targets
>     linux-user      all linux usermode emulation targets
> @@ -4487,7 +4499,8 @@ if test "$skip_meson" = no; then
>     mv $cross config-meson.cross
>   
>     rm -rf meson-private meson-info meson-logs
> -  NINJA=$ninja $meson setup \
> +  run_meson() {
> +    NINJA=$ninja $meson setup \
>           --prefix "$prefix" \
>           --libdir "$libdir" \
>           --libexecdir "$libexecdir" \
> @@ -4532,9 +4545,9 @@ if test "$skip_meson" = no; then
>           -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
>           -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
>           -Dnetmap=$netmap -Dvde=$vde \
> -        $cross_arg \
> -        "$PWD" "$source_path"
> -
> +        "$@" $cross_arg "$PWD" "$source_path"
> +  }
> +  eval run_meson $meson_options
>     if test "$?" -ne 0 ; then
>         error_exit "meson setup failed"
>     fi
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
> new file mode 100755
> index 0000000000..8948c296b7
> --- /dev/null
> +++ b/scripts/meson-buildoptions.py
> @@ -0,0 +1,63 @@
> +#! /usr/bin/env python3
> +
> +# Generate configure command line options handling code, based on Meson's
> +# user build options introspection data
> +#
> +# Copyright (C) 2021 Red Hat, Inc.
> +#
> +# Author: Paolo Bonzini <pbonzini@redhat.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2, or (at your option)
> +# any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <https://www.gnu.org/licenses/>.
> +
> +import json
> +import textwrap
> +import shlex
> +import sys
> +
> +def sh_print(line=""):
> +    print('  printf "%s\\n"', shlex.quote(line))
> +
> +
> +def load_options(json):
> +    json = [
> +        x
> +        for x in json
> +        if x["section"] == "user"
> +        and ":" not in x["name"]
> +        and x["name"] not in SKIP_OPTIONS
> +    ]
> +    return sorted(json, key=lambda x: x["name"])
> +
> +
> +def print_help(options):
> +    print("meson_options_help() {")
> +    sh_print()
> +    sh_print("Optional features, enabled with --enable-FEATURE and")
> +    sh_print("disabled with --disable-FEATURE, default is enabled if available")
> +    sh_print("(unless built with --without-default-features):")
> +    sh_print()
> +    print("}")
> +
> +
> +def print_parse(options):
> +    print("_meson_option_parse() {")
> +    print("  case $1 in")
> +    print("    *) return 1 ;;")
> +    print("  esac")
> +    print("}")
> +
> +
> +options = load_options(json.load(sys.stdin))

Could you maybe print a header line first, à la:

# This file is generated by meson-buildoptions.py, do not edit!

?

> +print_help(options)
> +print_parse(options)
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> new file mode 100644
> index 0000000000..3be3058a6c
> --- /dev/null
> +++ b/scripts/meson-buildoptions.sh
> @@ -0,0 +1,12 @@
> +meson_options_help() {
> +  printf "%s\n" ''
> +  printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
> +  printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if available'
> +  printf "%s\n" '(unless built with --without-default-features):'
> +  printf "%s\n" ''
> +}
> +_meson_option_parse() {
> +  case $1 in
> +    *) return 1 ;;
> +  esac
> +}
> 

Tested-by: Thomas Huth <thuth@redhat.com>


