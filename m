Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9816FE40
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 12:52:06 +0100 (CET)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6vET-0003qI-Jd
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 06:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1j6vBk-0000ko-0k
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 06:49:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1j6vBg-0007im-MG
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 06:49:14 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1j6vBf-0007hV-5K
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 06:49:12 -0500
Received: by mail-oi1-x241.google.com with SMTP id q81so2764487oig.0
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 03:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Q8ccGq2qe+FnJi7qjSHYyMnZWwVvcnEgtsBRMT2Rp7w=;
 b=YGopWnmSPS4w9eH0KA85oGuSgzwixfnp0gCWZnlC7zAVJIwSZrX1DSkIBvng94wXPc
 kk+hy0eSSvUqTxTUxYhT5aWVE0zbFZJDwMX3BQrG6nvSUgBFwndrKNCYzxCJKMPoIfny
 PQ+pi5kOE85cf/W3oKNQ2puLtrJaDa2wJVQZIcWYY3flg7Cw97lTNYCE4Gm2eB4yXpmI
 9lphNeGbJY4JnhWO9iZnDdL24DorR0T68rZiCn/ChEZRAAP0k7CzFOPLyQfKVTEMYGyW
 /OzqqMJqpR72NHTUj0eKuOnBrC+jUJxHKVRRvcojtniE0D6fjSMmWQxLtZeNQKNkj9Et
 ecgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Q8ccGq2qe+FnJi7qjSHYyMnZWwVvcnEgtsBRMT2Rp7w=;
 b=HdgGKwJDoPj0K3UCl/K+tnnIEJMi7wUnPG1ptkguf2/H9BoHP5GgT6vgdOHYnWAOGY
 AXMNSaRLu7M0DyM3DPI9pCEf2HBEbestUlyQPaloAI2MtHwL9Tk/mht7+WM6tTDuGYK9
 UZWEwjQhlXrPnH3VMeGganmvg4bFLK5p0zAiwZqtZr+LIw6oi2vAn/2zMpxLtoHr3xrN
 k2/mrLCbCNdHAY9I2LExyWS6tXANMwTkCB8/SldXbnguP3JsT4bogGwDhKP8b+R08Ll+
 NvxrHuTxoV4zEtjxp+FLRW0d7aVeH3AWdduGgiF6jlcdV54vgzIJEZ8OoubeKmcqjdG1
 I9pA==
X-Gm-Message-State: APjAAAUF1YGYlAJwK/BWOgYweTyY4JKTZ9a5lVOrJf9HyGB9kX9EICzZ
 gFmIHcBdFQlYSx9esPJkmAgTy3GMqZYUYub03Xs=
X-Google-Smtp-Source: APXvYqw6lDJKghCRcq5TZq/NJUwBSEMynqODXMAah7/h2qR/PoBoy5FU3Ov0KauNLZniTDrLMUDNU4w9g8hzjZq+E7g=
X-Received: by 2002:aca:c514:: with SMTP id v20mr2758293oif.62.1582717750374; 
 Wed, 26 Feb 2020 03:49:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Wed, 26 Feb 2020 03:49:09 -0800 (PST)
In-Reply-To: <20200225154121.21116-4-peter.maydell@linaro.org>
References: <20200225154121.21116-1-peter.maydell@linaro.org>
 <20200225154121.21116-4-peter.maydell@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 26 Feb 2020 12:49:09 +0100
Message-ID: <CAL1e-=hsLKTEpEw+xFog+9VDVFgkYyGRpAAVwzsK3LkfN=2h7Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] docs: Convert 'managed start up options' docs to rST
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004a78e6059f7931a7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004a78e6059f7931a7
Content-Type: text/plain; charset="UTF-8"

On Tuesday, February 25, 2020, Peter Maydell <peter.maydell@linaro.org>
wrote:

> The only remaining content in qemu-tech.texi is a few paragraphs
> about managed start up options; move them to a new rST document
> in the system manual.
>
> In the process we fix one typo and format more option and
> command names as literal text, but make no significant
> changes to the content.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---


FWIW:

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


>  Makefile                        |  2 +-
>  docs/system/index.rst           |  1 +
>  docs/system/managed-startup.rst | 35 +++++++++++++++++++++++++++
>  qemu-doc.texi                   |  3 ---
>  qemu-tech.texi                  | 42 ---------------------------------
>  5 files changed, 37 insertions(+), 46 deletions(-)
>  create mode 100644 docs/system/managed-startup.rst
>  delete mode 100644 qemu-tech.texi
>
> diff --git a/Makefile b/Makefile
> index 5f0f803b471..28749d20401 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1114,7 +1114,7 @@ txt: qemu-doc.txt docs/interop/qemu-qmp-ref.txt
> docs/interop/qemu-ga-ref.txt
>
>  qemu-doc.html qemu-doc.info qemu-doc.pdf qemu-doc.txt: \
>         qemu-options.texi \
> -       qemu-tech.texi qemu-option-trace.texi \
> +       qemu-option-trace.texi \
>         qemu-deprecated.texi qemu-monitor.texi \
>         qemu-monitor-info.texi \
>         docs/qemu-cpu-models.texi
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 794e5d8de03..887bef92f40 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -14,5 +14,6 @@ Contents:
>  .. toctree::
>     :maxdepth: 2
>
> +   managed-startup
>     qemu-block-drivers
>     security
> diff --git a/docs/system/managed-startup.rst
> b/docs/system/managed-startup.rst
> new file mode 100644
> index 00000000000..9bcf98ea790
> --- /dev/null
> +++ b/docs/system/managed-startup.rst
> @@ -0,0 +1,35 @@
> +Managed start up options
> +========================
> +
> +In system mode emulation, it's possible to create a VM in a paused
> +state using the ``-S`` command line option. In this state the machine
> +is completely initialized according to command line options and ready
> +to execute VM code but VCPU threads are not executing any code. The VM
> +state in this paused state depends on the way QEMU was started. It
> +could be in:
> +
> +- initial state (after reset/power on state)
> +- with direct kernel loading, the initial state could be amended to
> execute
> +  code loaded by QEMU in the VM's RAM and with incoming migration
> +- with incoming migration, initial state will be amended with the migrated
> +  machine state after migration completes
> +
> +This paused state is typically used by users to query machine state and/or
> +additionally configure the machine (by hotplugging devices) in runtime
> before
> +allowing VM code to run.
> +
> +However, at the ``-S`` pause point, it's impossible to configure options
> +that affect initial VM creation (like: ``-smp``/``-m``/``-numa`` ...) or
> +cold plug devices. The experimental ``--preconfig`` command line option
> +allows pausing QEMU before the initial VM creation, in a "preconfig"
> state,
> +where additional queries and configuration can be performed via QMP
> +before moving on to the resulting configuration startup. In the
> +preconfig state, QEMU only allows a limited set of commands over the
> +QMP monitor, where the commands do not depend on an initialized
> +machine, including but not limited to:
> +
> +- ``qmp_capabilities``
> +- ``query-qmp-schema``
> +- ``query-commands``
> +- ``query-status``
> +- ``x-exit-preconfig``
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index c11b1a5d5ad..7798e072a1c 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -40,7 +40,6 @@
>  * QEMU System emulator for non PC targets::
>  * QEMU User space emulator::
>  * System requirements::
> -* Implementation notes::
>  * Deprecated features::
>  * Recently removed features::
>  * Supported build platforms::
> @@ -2835,8 +2834,6 @@ added with Linux 4.5 which is supported by the major
> distros. And even
>  if RHEL7 has kernel 3.10, KVM there has the required functionality there
>  to make it close to a 4.5 or newer kernel.
>
> -@include qemu-tech.texi
> -
>  @include qemu-deprecated.texi
>
>  @node Supported build platforms
> diff --git a/qemu-tech.texi b/qemu-tech.texi
> deleted file mode 100644
> index 35da6a40af1..00000000000
> --- a/qemu-tech.texi
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -@node Implementation notes
> -@appendix Implementation notes
> -
> -@menu
> -* Managed start up options::
> -@end menu
> -
> -@node Managed start up options
> -@section Managed start up options
> -
> -In system mode emulation, it's possible to create a VM in a paused state
> using
> -the -S command line option. In this state the machine is completely
> initialized
> -according to command line options and ready to execute VM code but VCPU
> threads
> -are not executing any code. The VM state in this paused state depends on
> the way
> -QEMU was started. It could be in:
> -@table @asis
> -@item initial state (after reset/power on state)
> -@item with direct kernel loading, the initial state could be amended to
> execute
> -code loaded by QEMU in the VM's RAM and with incoming migration
> -@item with incoming migration, initial state will by amended with the
> migrated
> -machine state after migration completes.
> -@end table
> -
> -This paused state is typically used by users to query machine state and/or
> -additionally configure the machine (by hotplugging devices) in runtime
> before
> -allowing VM code to run.
> -
> -However, at the -S pause point, it's impossible to configure options that
> affect
> -initial VM creation (like: -smp/-m/-numa ...) or cold plug devices. The
> -experimental --preconfig command line option  allows pausing QEMU
> -before the initial VM creation, in a ``preconfig'' state, where additional
> -queries and configuration can be performed via QMP before moving on to
> -the resulting configuration startup. In the preconfig state, QEMU only
> allows
> -a limited set of commands over the QMP monitor, where the commands do not
> -depend on an initialized machine, including but not limited to:
> -@table @asis
> -@item qmp_capabilities
> -@item query-qmp-schema
> -@item query-commands
> -@item query-status
> -@item x-exit-preconfig
> -@end table
> --
> 2.20.1
>
>
>

--0000000000004a78e6059f7931a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, February 25, 2020, Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">The only remaining content in qemu-tech.texi is a =
few paragraphs<br>
about managed start up options; move them to a new rST document<br>
in the system manual.<br>
<br>
In the process we fix one typo and format more option and<br>
command names as literal text, but make no significant<br>
changes to the content.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
---</blockquote><div><br></div><div>FWIW:</div><div><br></div><div>Reviewed=
-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">amar=
kovic@wavecomp.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
=C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0docs/system/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
=C2=A0docs/system/managed-startup.<wbr>rst | 35 +++++++++++++++++++++++++++=
<br>
=C2=A0qemu-doc.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0qemu-tech.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 42 ------------------------------<wbr>---<br>
=C2=A05 files changed, 37 insertions(+), 46 deletions(-)<br>
=C2=A0create mode 100644 docs/system/managed-startup.<wbr>rst<br>
=C2=A0delete mode 100644 qemu-tech.texi<br>
<br>
diff --git a/Makefile b/Makefile<br>
index 5f0f803b471..28749d20401 100644<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -1114,7 +1114,7 @@ txt: qemu-doc.txt docs/interop/qemu-qmp-ref.txt docs/=
interop/qemu-ga-ref.txt<br>
<br>
=C2=A0qemu-doc.html <a href=3D"http://qemu-doc.info" target=3D"_blank">qemu=
-doc.info</a> qemu-doc.pdf qemu-doc.txt: \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu-options.texi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-tech.texi qemu-option-trace.texi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-option-trace.texi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu-deprecated.texi qemu-monitor.texi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu-monitor-info.texi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 docs/qemu-cpu-models.texi<br>
diff --git a/docs/system/index.rst b/docs/system/index.rst<br>
index 794e5d8de03..887bef92f40 100644<br>
--- a/docs/system/index.rst<br>
+++ b/docs/system/index.rst<br>
@@ -14,5 +14,6 @@ Contents:<br>
=C2=A0.. toctree::<br>
=C2=A0 =C2=A0 :maxdepth: 2<br>
<br>
+=C2=A0 =C2=A0managed-startup<br>
=C2=A0 =C2=A0 qemu-block-drivers<br>
=C2=A0 =C2=A0 security<br>
diff --git a/docs/system/managed-startup.<wbr>rst b/docs/system/managed-sta=
rtup.<wbr>rst<br>
new file mode 100644<br>
index 00000000000..9bcf98ea790<br>
--- /dev/null<br>
+++ b/docs/system/managed-startup.<wbr>rst<br>
@@ -0,0 +1,35 @@<br>
+Managed start up options<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
+<br>
+In system mode emulation, it&#39;s possible to create a VM in a paused<br>
+state using the ``-S`` command line option. In this state the machine<br>
+is completely initialized according to command line options and ready<br>
+to execute VM code but VCPU threads are not executing any code. The VM<br>
+state in this paused state depends on the way QEMU was started. It<br>
+could be in:<br>
+<br>
+- initial state (after reset/power on state)<br>
+- with direct kernel loading, the initial state could be amended to execut=
e<br>
+=C2=A0 code loaded by QEMU in the VM&#39;s RAM and with incoming migration=
<br>
+- with incoming migration, initial state will be amended with the migrated=
<br>
+=C2=A0 machine state after migration completes<br>
+<br>
+This paused state is typically used by users to query machine state and/or=
<br>
+additionally configure the machine (by hotplugging devices) in runtime bef=
ore<br>
+allowing VM code to run.<br>
+<br>
+However, at the ``-S`` pause point, it&#39;s impossible to configure optio=
ns<br>
+that affect initial VM creation (like: ``-smp``/``-m``/``-numa`` ...) or<b=
r>
+cold plug devices. The experimental ``--preconfig`` command line option<br=
>
+allows pausing QEMU before the initial VM creation, in a &quot;preconfig&q=
uot; state,<br>
+where additional queries and configuration can be performed via QMP<br>
+before moving on to the resulting configuration startup. In the<br>
+preconfig state, QEMU only allows a limited set of commands over the<br>
+QMP monitor, where the commands do not depend on an initialized<br>
+machine, including but not limited to:<br>
+<br>
+- ``qmp_capabilities``<br>
+- ``query-qmp-schema``<br>
+- ``query-commands``<br>
+- ``query-status``<br>
+- ``x-exit-preconfig``<br>
diff --git a/qemu-doc.texi b/qemu-doc.texi<br>
index c11b1a5d5ad..7798e072a1c 100644<br>
--- a/qemu-doc.texi<br>
+++ b/qemu-doc.texi<br>
@@ -40,7 +40,6 @@<br>
=C2=A0* QEMU System emulator for non PC targets::<br>
=C2=A0* QEMU User space emulator::<br>
=C2=A0* System requirements::<br>
-* Implementation notes::<br>
=C2=A0* Deprecated features::<br>
=C2=A0* Recently removed features::<br>
=C2=A0* Supported build platforms::<br>
@@ -2835,8 +2834,6 @@ added with Linux 4.5 which is supported by the major =
distros. And even<br>
=C2=A0if RHEL7 has kernel 3.10, KVM there has the required functionality th=
ere<br>
=C2=A0to make it close to a 4.5 or newer kernel.<br>
<br>
-@include qemu-tech.texi<br>
-<br>
=C2=A0@include qemu-deprecated.texi<br>
<br>
=C2=A0@node Supported build platforms<br>
diff --git a/qemu-tech.texi b/qemu-tech.texi<br>
deleted file mode 100644<br>
index 35da6a40af1..00000000000<br>
--- a/qemu-tech.texi<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-@node Implementation notes<br>
-@appendix Implementation notes<br>
-<br>
-@menu<br>
-* Managed start up options::<br>
-@end menu<br>
-<br>
-@node Managed start up options<br>
-@section Managed start up options<br>
-<br>
-In system mode emulation, it&#39;s possible to create a VM in a paused sta=
te using<br>
-the -S command line option. In this state the machine is completely initia=
lized<br>
-according to command line options and ready to execute VM code but VCPU th=
reads<br>
-are not executing any code. The VM state in this paused state depends on t=
he way<br>
-QEMU was started. It could be in:<br>
-@table @asis<br>
-@item initial state (after reset/power on state)<br>
-@item with direct kernel loading, the initial state could be amended to ex=
ecute<br>
-code loaded by QEMU in the VM&#39;s RAM and with incoming migration<br>
-@item with incoming migration, initial state will by amended with the migr=
ated<br>
-machine state after migration completes.<br>
-@end table<br>
-<br>
-This paused state is typically used by users to query machine state and/or=
<br>
-additionally configure the machine (by hotplugging devices) in runtime bef=
ore<br>
-allowing VM code to run.<br>
-<br>
-However, at the -S pause point, it&#39;s impossible to configure options t=
hat affect<br>
-initial VM creation (like: -smp/-m/-numa ...) or cold plug devices. The<br=
>
-experimental --preconfig command line option=C2=A0 allows pausing QEMU<br>
-before the initial VM creation, in a ``preconfig&#39;&#39; state, where ad=
ditional<br>
-queries and configuration can be performed via QMP before moving on to<br>
-the resulting configuration startup. In the preconfig state, QEMU only all=
ows<br>
-a limited set of commands over the QMP monitor, where the commands do not<=
br>
-depend on an initialized machine, including but not limited to:<br>
-@table @asis<br>
-@item qmp_capabilities<br>
-@item query-qmp-schema<br>
-@item query-commands<br>
-@item query-status<br>
-@item x-exit-preconfig<br>
-@end table<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote>

--0000000000004a78e6059f7931a7--

