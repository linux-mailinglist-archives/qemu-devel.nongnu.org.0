Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F563B98E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 06:48:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oztSd-0005K3-KR; Tue, 29 Nov 2022 00:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oztSV-0005JW-KQ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:47:11 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oztSS-0008Km-1v
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:47:06 -0500
Received: by mail-io1-xd32.google.com with SMTP id d123so9315108iof.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 21:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRVT62Vmd7XJl6F1USDXu0t8+oIxs0vFbC2imliauyk=;
 b=Y+9PdI28yh5FYJPoxrh4jTLXir0979hAhl3kvyxO/bemFRGd/PZE8EhllM3MU/q3bJ
 Fbo9E7OoyosLb7PCfcTAySDCTyu/bvQT+Q2GQl+gE+W/jsYvt8QmVmmK5wRoFzbu5o7a
 4FvgErWgTQrQuoe/iw1bxB8mcmtkl8Pf30x7QD9V96ixPTbuGlWZzAMdvqum6ww7b6yS
 /c70+m112nqlfnZtQDBfDiNbtyvsWdpjQZni2aiWhkB3A5c7bgRiq4pS0nNKDbdtWTqH
 uE6quPxizsLfyyOHPuXzkoy8CGYxJ1NPCL2FjZib9vx6mJqkdvxM+Z1nsTI0S5w41vOp
 bqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sRVT62Vmd7XJl6F1USDXu0t8+oIxs0vFbC2imliauyk=;
 b=EcHWQFI+JepDo4SYb8kwJWnPrBxw/oLd6w3BJqRxvHiBuWYYZHJWRr3sat3xuB6eQd
 UaOnEUEc6wmOKRFMakMTA+KWNghqFV/F1IE8KyBI8IjyjKY0YZjIS8VXYTjA0osl8FyM
 74VE979ZVLogd9G1OWGTUqoxUqUU0Lv+MR4np6BdqGgOHXlp61Pw15nd+eNU3TDlX6pu
 kEfnM25KCqtPKW9bTGDJA/Jo8cYChWI8sdBbK8kgGp5RBTXf6VCuaGilZBQExVqTptoc
 tDoqvgmR3i0K18qyq6VmtH6CSojK/COElRrYmQe4Yq/r/PY/3LHw14XdNJ8W0oC7fNE2
 +Fxg==
X-Gm-Message-State: ANoB5pnlFT0SN/Y8hfL9OqwLoWy+J2VzP//KJFW1t/LhRAwIYlaxpw9p
 KQGpoiNrsmKlf1dbu7RAW1XfTM3e55V1EkzRJo/iUg==
X-Google-Smtp-Source: AA0mqf5xz3vEHF4NrZtkrPhTmCIk8rbK6TMPH/xKNpn5rVTJ8dDKy3s4Q55AFrYWm+MDFRyB4oGz69aQrFxbFJhKgic=
X-Received: by 2002:a6b:580a:0:b0:6c0:3ade:1c3e with SMTP id
 m10-20020a6b580a000000b006c03ade1c3emr16404112iob.63.1669700822446; Mon, 28
 Nov 2022 21:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
 <20221129000647-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221129000647-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 29 Nov 2022 11:16:51 +0530
Message-ID: <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd32.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 10:37 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> >     Added the SPDX license identifiers for biosbits tests.
> >     Also added a comment on each of the test scripts to indicate that t=
hey run
> >     from within the biosbits environment and hence are not subjected to=
 the
> >     regular
> >     maintenance activities for QEMU and is excluded from the dependency
> >     management
> >     challenges in the host testing environment.
> >
> >     Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >     Cc: Paolo Bonzini <pbonzini@redhat.com>
> >     Cc: Maydell Peter <peter.maydell@linaro.org>
> >     Cc: John Snow <jsnow@redhat.com>
> >     Cc: Thomas Huth <thuth@redhat.com>
> >     Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >     Cc: Igor Mammedov <imammedo@redhat.com>
> >     Cc: Michael Tsirkin <mst@redhat.com>
> >     Cc: Thomas Huth <thuth@redhat.com>
> >     Cc: qemu-trivial@nongnu.org
> >     Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >
> >
> > Is anyone going to queue this for 7.2 given it's quite trivial?
>
> Don't see why we should bother.

Completeness?
>
> >
> >
> >     ---
> >      tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
> >      tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
> >      tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
> >      3 files changed, 12 insertions(+)
> >
> >     changelog:
> >     changes from v1: fixed typo as suggested by Phil.
> >
> >     diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/=
avocado/
> >     acpi-bits/bits-tests/smbios.py2
> >     index 9667d0542c..fc623de072 100644
> >     --- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
> >     +++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> >     @@ -1,6 +1,8 @@
> >      # Copyright (c) 2015, Intel Corporation
> >      # All rights reserved.
> >      #
> >     +# SPDX-License-Identifier: BSD-3-Clause
> >     +#
> >      # Redistribution and use in source and binary forms, with or witho=
ut
> >      # modification, are permitted provided that the following conditio=
ns are
> >     met:
> >      #
> >     @@ -24,6 +26,8 @@
> >      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF TH=
E USE OF
> >     THIS
> >      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> >     +# This script runs only from the biosbits VM.
> >     +
> >      """SMBIOS/DMI module."""
> >
> >      import bits
> >     diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/test=
s/
> >     avocado/acpi-bits/bits-tests/testacpi.py2
> >     index dbc150076e..f818a9cce6 100644
> >     --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> >     +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> >     @@ -1,6 +1,8 @@
> >      # Copyright (c) 2015, Intel Corporation
> >      # All rights reserved.
> >      #
> >     +# SPDX-License-Identifier: BSD-3-Clause
> >     +#
> >      # Redistribution and use in source and binary forms, with or witho=
ut
> >      # modification, are permitted provided that the following conditio=
ns are
> >     met:
> >      #
> >     @@ -24,6 +26,8 @@
> >      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF TH=
E USE OF
> >     THIS
> >      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> >     +# This script runs only from the biosbits VM.
> >     +
> >      """Tests for ACPI"""
> >
> >      import acpi
> >     diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tes=
ts/
> >     avocado/acpi-bits/bits-tests/testcpuid.py2
> >     index ac55d912e1..7adefbe355 100644
> >     --- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> >     +++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> >     @@ -1,6 +1,8 @@
> >      # Copyright (c) 2012, Intel Corporation
> >      # All rights reserved.
> >      #
> >     +# SPDX-License-Identifier: BSD-3-Clause
> >     +#
> >      # Redistribution and use in source and binary forms, with or witho=
ut
> >      # modification, are permitted provided that the following conditio=
ns are
> >     met:
> >      #
> >     @@ -24,6 +26,8 @@
> >      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF TH=
E USE OF
> >     THIS
> >      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> >     +# This script runs only from the biosbits VM.
> >     +
> >      """Tests and helpers for CPUID."""
> >
> >      import bits
> >     --
> >     2.34.1
> >
> >
>

