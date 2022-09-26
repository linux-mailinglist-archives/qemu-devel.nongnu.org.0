Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C962E5EA382
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:26:50 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmG9-0008Lf-Mf
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ocmC3-0004NT-LW
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ocmBz-0000hZ-EX
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664191350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hGCCClB10ORsufua/OplM2FwtcSG9xbe3WCO+dfovUo=;
 b=ciRvABE95MkFoKw+qJMBFwR7C4Oiy8fsS28n6cDlPN8GLadw+JphW7KD7Nyd7Y/v+vZ3gD
 JGtc44PQs2QefjWBEbuBzT+Kn76gCAqq+mY6182G2iVWKqL7CThK5ScTUvg57REyPSpuZA
 f67or+H2hlgkVYMOVQGP2P78JFraIYQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-GuQzM_TrPmeMaYyqlj-RKg-1; Mon, 26 Sep 2022 07:22:29 -0400
X-MC-Unique: GuQzM_TrPmeMaYyqlj-RKg-1
Received: by mail-ua1-f69.google.com with SMTP id
 95-20020a9f23e8000000b0038caa7cd5c1so1431384uao.8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 04:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hGCCClB10ORsufua/OplM2FwtcSG9xbe3WCO+dfovUo=;
 b=GgmMjreXwu93DyjiCqepIOmYeQbiUs28XuPtbdX/OaawxoHc3WrGrNAAl9xYbeWddm
 cJ8mvxxA+XEsbMLDXG7g5oDZ1Zo1KNSyf0zF7VsIYjdoaAWcpExEo6jG9Slb6yA+i8h1
 DuWLNGDHd4+Ia506Y9awm9UNHAU96QXlacx/uzJUW4g2BsempENx8gZx2EPITkFo6YDl
 QUkiGGRs/KvtS1mFH9DelWGKMJsIzNEJq1lgphgJVjUv1qgLIRKY6oKrewiiNRruZ5Im
 hRF1BXRfQJ/qqs6p6ersp+XZAYNcYQnXIk1B71C/H9hx0GDJ2oTgOzJ6yF9PsAzDTorX
 PP6A==
X-Gm-Message-State: ACrzQf2Ssan6RpJbyBlNS7uH0NilTUhXiDBp05B5NU0LSwFf5LuMcp2G
 FDkMw5AqvRmBpv8TZ6gCgOdyCSHIJOW6ovJHvZddWwPBG3BMpg44ImoOzvzu+9TOxujKmr3AmA3
 9KKGvGndU6QDhxtYD37aEj/hEvecEwfI=
X-Received: by 2002:a1f:1f85:0:b0:3a7:f248:ee56 with SMTP id
 f127-20020a1f1f85000000b003a7f248ee56mr592298vkf.3.1664191348413; 
 Mon, 26 Sep 2022 04:22:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Pwg+VyUU8ha6/iYckLyX7WUh48zdZqDPvuK1Vz3yeT+aPd0Z9sRHwA42w1XVSC5t3ezIleUTw/3A04uN/Zd0=
X-Received: by 2002:a1f:1f85:0:b0:3a7:f248:ee56 with SMTP id
 f127-20020a1f1f85000000b003a7f248ee56mr592287vkf.3.1664191348178; Mon, 26 Sep
 2022 04:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220825222745.38779-1-pbonzini@redhat.com>
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 Sep 2022 13:22:16 +0200
Message-ID: <CABgObfZ+ba8BzchoF_gehMtJJzwTv8xt5iemHg8PvFreQ=KGNw@mail.gmail.com>
Subject: Re: [PATCH 00/20] Cross compilation changes for 7.2
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ping (I can also include it in my next pull request if desirable).

Paolo

On Fri, Aug 26, 2022 at 12:27 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This is a bunch of related changes leading up to building ROMs
> with container-based cross compilers:
>
> - detect pc-bios/ CC options just once instead of using make's $(shell)
>   function
>
> - move CC option detection to tests/tcg Makefiles from QEMU's root
>   configure
>
> - put all configuration of tests/tcg in config files instead of using
>   $(MAKE) VAR=value
>
> - mostly unrelated, change pc-bios/ Make output to look like Meson's
>   "Compiling foo.o".
>
> Paolo Bonzini (20):
>   configure: do not invoke as/ld directly for pc-bios/optionrom
>   pc-bios/optionrom: detect CC options just once
>   pc-bios/s390-ccw: detect CC options just once
>   vof: add distclean target
>   build: add recursive distclean rules
>   configure: return status code from probe_target_compiler
>   configure: store container engine in config-host.mak
>   tests: simplify Makefile invocation for tests/tcg
>   tests/tcg: remove -f from Makefile invocation
>   tests/tcg: add distclean rule
>   tests/tcg: unify ppc64 and ppc64le Makefiles
>   tests/tcg: clean up calls to run-test
>   tests/tcg: move compiler tests to Makefiles
>   configure: move tests/tcg/Makefile.prereqs to root build directory
>   configure: unify creation of cross-compilation Makefiles
>   configure: cleanup creation of tests/tcg target config
>   configure: build ROMs with container-based cross compilers
>   pc-bios/optionrom: Adopt meson style Make output
>   pc-bios/s390-ccw: Adopt meson style Make output
>   pc-bios/vof: Adopt meson style Make output
>
>  Makefile                                      |  12 +-
>  configure                                     | 251 +++++++-----------
>  meson.build                                   |   2 +-
>  pc-bios/optionrom/Makefile                    |  51 ++--
>  pc-bios/s390-ccw/Makefile                     |  43 ++-
>  pc-bios/s390-ccw/netboot.mak                  |  27 +-
>  pc-bios/vof/Makefile                          |  19 +-
>  tests/Makefile.include                        |  24 +-
>  tests/docker/Makefile.include                 |   2 +-
>  tests/tcg/Makefile.target                     |  34 ++-
>  tests/tcg/aarch64/Makefile.softmmu-target     |  11 +-
>  tests/tcg/aarch64/Makefile.target             |  15 +-
>  tests/tcg/arm/Makefile.target                 |   9 +-
>  tests/tcg/cris/Makefile.target                |   2 +-
>  tests/tcg/i386/Makefile.softmmu-target        |   3 +-
>  tests/tcg/i386/Makefile.target                |  11 +-
>  tests/tcg/multiarch/Makefile.target           |  18 +-
>  .../multiarch/system/Makefile.softmmu-target  |   2 +-
>  tests/tcg/ppc64/Makefile.target               |   8 +-
>  tests/tcg/{ppc64le => ppc64}/bcdsub.c         |   0
>  tests/tcg/{ppc64le => ppc64}/byte_reverse.c   |   0
>  tests/tcg/{ppc64le => ppc64}/mffsce.c         |   0
>  tests/tcg/{ppc64le => ppc64}/mtfsf.c          |   0
>  .../{ppc64le => ppc64}/non_signalling_xscv.c  |   0
>  .../signal_save_restore_xer.c                 |   0
>  tests/tcg/{ppc64le => ppc64}/xxspltw.c        |   0
>  tests/tcg/ppc64le/Makefile.target             |  26 +-
>  tests/tcg/s390x/Makefile.target               |   2 +-
>  tests/tcg/x86_64/Makefile.softmmu-target      |   3 +-
>  29 files changed, 275 insertions(+), 300 deletions(-)
>  rename tests/tcg/{ppc64le => ppc64}/bcdsub.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/byte_reverse.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/mffsce.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/mtfsf.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/signal_save_restore_xer.c (100%)
>  rename tests/tcg/{ppc64le => ppc64}/xxspltw.c (100%)
>
> --
> 2.37.1
>


