Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9263DEA07
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:51:22 +0200 (CEST)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAr4z-0003o7-9v
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAr3k-00036L-25
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:50:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAr3i-0003XZ-Ew
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:50:03 -0400
Received: by mail-ed1-x533.google.com with SMTP id p21so28204068edi.9
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQX4/RDByQqby4E4Y+wp9lSKKm3SEtpZov2mZUU4X2M=;
 b=BNQfAzlzqvcHAa9mZ6XmeR9XDGlt4RfU14hkIE4pihXTCSlNrvjNffnDPE81mJq/N0
 mkCyvSfznlHxnJ0G8n5bV2CtCMXz2hixtCQXno1q0/4NA0UHxxUhRfXC1aZ4wRn/MsgY
 fK0YYNI/veio3VR159V4C5ESQ4ufHab2UY0JuQ56yzN3YChIu1+RLHER/fvCYqRQul6h
 D5dkWf63beoeE5WiozNSc0eMKZYO76bv5WZARfG6iwrRgz534h8pnMgrj7ETIEDyXqwC
 uVj+0bXZwQfSW/8M7sdIr4/h9OYFtypWmSkMbfwx6j4LHsZ2Y9SwnNukhk4dllQKMBPh
 OR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQX4/RDByQqby4E4Y+wp9lSKKm3SEtpZov2mZUU4X2M=;
 b=SgJ0LdQgvhtQoCElszU2zKY7w3z3zoB76ycIzll/W9i/s4ukHPPcPQxBzcNOWrT1Qh
 ti4ScJaL+g/dzF3tu/Pls8/KhHmTEj3tKoV94RtZ9RY+ZzUoFj6osd36mlHxRiU/hpQT
 eS9dyTPbABirZp5LwJMl6BWuo1kAcT8fkM5bT6CXKph3N2oocTXr+xcHtxHNAdR9Ca+u
 Nz8RIfs/PZ9H/GWxiM3HPdYz9ndCL1K8gq833/tnkXta/njsUxmVsgYukyLWNumkcOWE
 hK3a7AaHL8lhaRF5yyL6H6c0wK39YCgIZR3guvbJS5sXOASH9bCP4NBtca/phgXf+9V2
 VRXQ==
X-Gm-Message-State: AOAM533SYQQZeX2wHc9Y4xr2tbvDKlhHYe/okptEk8370vwd4+zM1oKz
 JDzqFE5R7YTwvsJkKhNCXykyPhX1fA3u67yXlycrCg==
X-Google-Smtp-Source: ABdhPJzI2tg7YqvAsIvLjwkejY2CpMWpmIkgf6DjwaB4Emglw1NaUmhNZxp8enNFRaCzQ/EoefLG/FMbUYUIMWbDBS8=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr13136940ede.44.1627984200923; 
 Tue, 03 Aug 2021 02:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
 <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
 <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
In-Reply-To: <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:49:17 +0100
Message-ID: <CAFEAcA9nqTfo6+BrfDqm8w6ELhg21BpDwbvimeLH=eC2dt7aBw@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 10:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> Are you testing by starting with a before-the-libslirp-merge
> change QEMU, doing a build, then updating to the libslirp
> changes, and then doing a 'make' without reconfigure or
> 'make clean' ? I suspect this is perhaps to do with it being
> an incremental build.

More specifically:

$ git checkout master
$ mkdir build/slirptest
$ (cd build/slirptest && ../../configure --target-list=arm-softmmu
--enable-debug --disable-docs --disable-tools)
$ make -C build/slirptest -j8
$ git checkout remotes/elmarco/libslirp
$ make -C build/slirptest
$ mkdir build/slirp2
$ (cd build/slirptest && ../../configure --target-list=arm-softmmu
--enable-debug --disable-docs --disable-tools)
$ make -C build/slirp2

The build/slirptest directory has built a .so, and the
build/slirp2 directory has built a static .a.

(Both builds succeed because they're not hitting the clang
static analyzer thing, but they shouldn't be building different
types of library.)

Running '../../meson/meson.py configure' in slirp2 gives
(ignoring the non libslirp parts of the output):

Subproject libslirp:

  Core options                  Current Value
Possible Values
Description
  ------------                  -------------
---------------
-----------
  libslirp:default_library      static
[shared, static, both]                                        Default
library type
  libslirp:werror               true                           [true,
false]                                                 Treat warnings
as errors

  Project options               Current Value
Possible Values
Description
  ---------------               -------------
---------------
-----------
  libslirp:version_suffix
                                                      Suffix to append
to SLIRP_VERSION_STRING

In slirptest I get only:

Subproject libslirp:

  Project options               Current Value
Possible Values
Description
  ---------------               -------------
---------------
-----------
  libslirp:version_suffix
                                                      Suffix to append
to SLIRP_VERSION_STRING


So somehow meson has failed to apply the default_library and werror options in
the incremental build case.

-- PMM

