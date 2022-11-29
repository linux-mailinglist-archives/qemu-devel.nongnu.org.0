Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4CB63B7FA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 03:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozqQX-0007fd-7j; Mon, 28 Nov 2022 21:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ozqQB-0007dC-4l
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 21:32:31 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ozqQ8-0003Vv-NT
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 21:32:30 -0500
Received: by mail-io1-xd29.google.com with SMTP id b2so9092145iof.12
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GHtl8wwDWGAs6itQXdqyUts/DaJi5tGHPe70JHGChw0=;
 b=C5K8HHH0eEgLkNORw33cA6Ea3rF6DRLWs5x9e42ULIhkxEPwgWGCTCjqxeayN1sHXq
 gXfQKJB8tIIJuuFZRTqK23rX4/il6HkwEJp9mLlBewIdmBhmRNwmHzLHgMQ059FYGeKD
 mi+fbY4HyBunTgGk2UpHYqiJVmBnhqnLZSt+rGkJywFrHMpRIFkc1w73ZIZ5+jNoLRpp
 Kx7QIQRQYk4FM1dzsIva89uvw7JbTggl9rn5qiXFfxF0Vfjg1ZRyKXXv5lIVaxS1Dhov
 UPUWb+N1j3FPjF5ITgM+ZadRj9ZWkI53zVMCrVPXu6T8+fs+uYT94E19vU21BFsicjnP
 eWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHtl8wwDWGAs6itQXdqyUts/DaJi5tGHPe70JHGChw0=;
 b=arBqTsarILnEj5uTWZyCWsqbqx6OKrelcEr2Cz321JT5ibk52kGlaUBTX2IcduzYtn
 BXZ63c4gm0Xakowy1+wjk7KtPTahfKLzMI9kkEYqwymhGIus9dOV4YFzy7zDHofpbGlJ
 9s4ilgQphW/1p2/3D/OijS5qMTkfaMcfWIuBQ2mEqm3PjPmN+3x6uGvmLT/20YSRPePu
 MdO4TSkl6NhO2z0FLG6ZPLbPwvN12fgKSasmRLpBxQ56meKXaW9viAN0HwP7n/H6ZY00
 JaGMxKA9C+Gwf5PgeL7yvtdRrvA3M2wpRH9+6LbllKAhCcU7axuSf8uNs52/nJwMJDb8
 abyA==
X-Gm-Message-State: ANoB5pkYw0oRaBHbmw3BDsxIHqY1mkkJxHe4CzNG/Ui5lPhnYp15Iky9
 fLcVrtGAeVUYXjQuyW0tu/DF9lhdk/fCE9qgx3Sh8w==
X-Google-Smtp-Source: AA0mqf7VZoX6Nnl+OivsQQReIKAB4JroVf10LsHmK1uv/r5QMlzLNREDg/R3IPCXwNgWTJgAXXobDTYr7Z6ykBZNCjQ=
X-Received: by 2002:a02:ad12:0:b0:389:787a:ead5 with SMTP id
 s18-20020a02ad12000000b00389787aead5mr10549270jan.83.1669689146496; Mon, 28
 Nov 2022 18:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20221125044138.962137-1-ani@anisinha.ca>
In-Reply-To: <20221125044138.962137-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 29 Nov 2022 08:02:15 +0530
Message-ID: <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
To: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Michael Tsirkin <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000076732c05ee92cc0b"
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000076732c05ee92cc0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:

> Added the SPDX license identifiers for biosbits tests.
> Also added a comment on each of the test scripts to indicate that they ru=
n
> from within the biosbits environment and hence are not subjected to the
> regular
> maintenance activities for QEMU and is excluded from the dependency
> management
> challenges in the host testing environment.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>


Is anyone going to queue this for 7.2 given it's quite trivial?


> ---
>  tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
>  tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
>  tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
>  3 files changed, 12 insertions(+)
>
> changelog:
> changes from v1: fixed typo as suggested by Phil.
>
> diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2
> b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> index 9667d0542c..fc623de072 100644
> --- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2015, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are
> met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>
> +# This script runs only from the biosbits VM.
> +
>  """SMBIOS/DMI module."""
>
>  import bits
> diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> index dbc150076e..f818a9cce6 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2015, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are
> met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>
> +# This script runs only from the biosbits VM.
> +
>  """Tests for ACPI"""
>
>  import acpi
> diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> index ac55d912e1..7adefbe355 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2012, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are
> met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>
> +# This script runs only from the biosbits VM.
> +
>  """Tests and helpers for CPUID."""
>
>  import bits
> --
> 2.34.1
>
>

--00000000000076732c05ee92cc0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha &lt;<a href=3D"m=
ailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Added the SPDX license identifiers for biosbits tests.<b=
r>
Also added a comment on each of the test scripts to indicate that they run<=
br>
from within the biosbits environment and hence are not subjected to the reg=
ular<br>
maintenance activities for QEMU and is excluded from the dependency managem=
ent<br>
challenges in the host testing environment.<br>
<br>
Cc: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" targ=
et=3D"_blank">berrange@redhat.com</a>&gt;<br>
Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_bla=
nk">pbonzini@redhat.com</a>&gt;<br>
Cc: Maydell Peter &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D=
"_blank">peter.maydell@linaro.org</a>&gt;<br>
Cc: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsn=
ow@redhat.com</a>&gt;<br>
Cc: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
Cc: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_bla=
nk">imammedo@redhat.com</a>&gt;<br>
Cc: Michael Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank"=
>mst@redhat.com</a>&gt;<br>
Cc: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-trivi=
al@nongnu.org</a><br>
Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_=
blank">ani@anisinha.ca</a>&gt;</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Is anyone going to queue this for 7.2 given it&#39;s quite tr=
ivial?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
---<br>
=C2=A0tests/avocado/acpi-bits/bits-tests/smbios.py2=C2=A0 =C2=A0 | 4 ++++<b=
r>
=C2=A0tests/avocado/acpi-bits/bits-tests/testacpi.py2=C2=A0 | 4 ++++<br>
=C2=A0tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++<br>
=C2=A03 files changed, 12 insertions(+)<br>
<br>
changelog:<br>
changes from v1: fixed typo as suggested by Phil.<br>
<br>
diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avocado/=
acpi-bits/bits-tests/smbios.py2<br>
index 9667d0542c..fc623de072 100644<br>
--- a/tests/avocado/acpi-bits/bits-tests/smbios.py2<br>
+++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2<br>
@@ -1,6 +1,8 @@<br>
=C2=A0# Copyright (c) 2015, Intel Corporation<br>
=C2=A0# All rights reserved.<br>
=C2=A0#<br>
+# SPDX-License-Identifier: BSD-3-Clause<br>
+#<br>
=C2=A0# Redistribution and use in source and binary forms, with or without<=
br>
=C2=A0# modification, are permitted provided that the following conditions =
are met:<br>
=C2=A0#<br>
@@ -24,6 +26,8 @@<br>
=C2=A0# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS<br>
=C2=A0# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.<br>
<br>
+# This script runs only from the biosbits VM.<br>
+<br>
=C2=A0&quot;&quot;&quot;SMBIOS/DMI module.&quot;&quot;&quot;<br>
<br>
=C2=A0import bits<br>
diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocad=
o/acpi-bits/bits-tests/testacpi.py2<br>
index dbc150076e..f818a9cce6 100644<br>
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2<br>
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2<br>
@@ -1,6 +1,8 @@<br>
=C2=A0# Copyright (c) 2015, Intel Corporation<br>
=C2=A0# All rights reserved.<br>
=C2=A0#<br>
+# SPDX-License-Identifier: BSD-3-Clause<br>
+#<br>
=C2=A0# Redistribution and use in source and binary forms, with or without<=
br>
=C2=A0# modification, are permitted provided that the following conditions =
are met:<br>
=C2=A0#<br>
@@ -24,6 +26,8 @@<br>
=C2=A0# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS<br>
=C2=A0# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.<br>
<br>
+# This script runs only from the biosbits VM.<br>
+<br>
=C2=A0&quot;&quot;&quot;Tests for ACPI&quot;&quot;&quot;<br>
<br>
=C2=A0import acpi<br>
diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/avoca=
do/acpi-bits/bits-tests/testcpuid.py2<br>
index ac55d912e1..7adefbe355 100644<br>
--- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2<br>
+++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2<br>
@@ -1,6 +1,8 @@<br>
=C2=A0# Copyright (c) 2012, Intel Corporation<br>
=C2=A0# All rights reserved.<br>
=C2=A0#<br>
+# SPDX-License-Identifier: BSD-3-Clause<br>
+#<br>
=C2=A0# Redistribution and use in source and binary forms, with or without<=
br>
=C2=A0# modification, are permitted provided that the following conditions =
are met:<br>
=C2=A0#<br>
@@ -24,6 +26,8 @@<br>
=C2=A0# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS<br>
=C2=A0# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.<br>
<br>
+# This script runs only from the biosbits VM.<br>
+<br>
=C2=A0&quot;&quot;&quot;Tests and helpers for CPUID.&quot;&quot;&quot;<br>
<br>
=C2=A0import bits<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000076732c05ee92cc0b--

