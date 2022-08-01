Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D45586D01
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:39:01 +0200 (CEST)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWZP-000339-Vk
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIWWo-0000lR-MT
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:36:18 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIWWn-0005EG-0M
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:36:18 -0400
Received: by mail-lj1-x235.google.com with SMTP id y23so2181255ljh.12
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 07:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCvOGnOlJx0vUty8Et4QrAIHVq5jPr+WMro3dhkvHmQ=;
 b=DoHHF+B27npBk+3vyJWNMXHFbtW5jCzhXEhjDsinsz7hUjDVxI1D0H6iOQCF+t1+u3
 j9yONP8frSCWhoQNZW06CwyReRaZ/UIDldC5iKgLoa7aaOiUdEmctsK6ooEQ8qK+bjsI
 jsnBdCU5pDVsStNBMzx2l3j4H/MNivYv6QUUbwzWMdNF2mXjh44a+jQN6frrvde1Qc4Z
 81wtxqscVOMiJQzk0gtAlRANudmltvtTPxzfAlqKOya3Z2qDrIL/CPbDq5ntsjJX27L6
 10AKl7Nm49SJRSeiGSxdavOhwC5AGBlAO0k6iHhIovb8PaHf4HZUrPHlt3iR8bNPcQXu
 xELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCvOGnOlJx0vUty8Et4QrAIHVq5jPr+WMro3dhkvHmQ=;
 b=yRCEteavgERyY3n2/7Xk2/XiwRvSSA692g6bR1pix7BAGdcu8IV4gpNXpc76k6OQoW
 s9wl/E+I1QidechtpKo+b2KjsJd/R2BYGKgaz+RakgCbQ4MppdHuCajFoO8F4B2tJjMa
 l+raEPs0wt7Ry2DupuLUM30bxgF1Ffx8i8gohSAo+UXi1pCKwZ7zN0sU0+D8CPrvmGlL
 nqdgTJEUgvMBPCcE3eSbs8rHdQ0UQQQBz5rp22ekG1ZAqa8Htne9nAOMhY5kJ4Nlykm+
 ZGOo4iBDsjUGVBBcQkmaM1PsUY+k/afNbbMP4/9WUFcwS6CX5oR8pky8yNquYgyyEA4Z
 6sWw==
X-Gm-Message-State: ACgBeo10UDfjIgzQ6Ule/YIopVoJXBk40D+GwE46VaUJUXGwjNChXvhA
 JAQ948S7SjUfxu6VfbmDEqPtk/5KPXmNsx3vWWg=
X-Google-Smtp-Source: AA6agR4ne3VEBRIk4B2s/4+4T0hZO0TF/qzRXFW7ZpuhzgkA7DtnpNemtdS0sO8VIpnITAGqNmXFe4Aak2t15j0qkTU=
X-Received: by 2002:a2e:9457:0:b0:25e:52c2:ba07 with SMTP id
 o23-20020a2e9457000000b0025e52c2ba07mr1071598ljh.14.1659364574539; Mon, 01
 Aug 2022 07:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220801142725.815399-1-ross.lagerwall@citrix.com>
In-Reply-To: <20220801142725.815399-1-ross.lagerwall@citrix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Aug 2022 18:36:02 +0400
Message-ID: <CAJ+F1CL=gvmHx-GTy8JHRfpxeOtu__i8Cta2hUobPg-wYb-FLA@mail.gmail.com>
Subject: Re: [PATCH] tpm_emulator: Avoid double initialization during migration
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000004b7b505e52eec16"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000004b7b505e52eec16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 1, 2022 at 6:28 PM Ross Lagerwall via <qemu-devel@nongnu.org>
wrote:

> When resuming after a migration, the backend sends CMD_INIT to the
> emulator from the startup callback, then it sends the migration state
> from the vmstate to the emulator, then it sends CMD_INIT again. Skip the
> first CMD_INIT during a migration to avoid initializing the TPM twice.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

There are no visible bugs/symptoms, I suppose?


> ---
>  backends/tpm/tpm_emulator.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 87d061e9bb..9b50c5b3e2 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -32,6 +32,7 @@
>  #include "qemu/sockets.h"
>  #include "qemu/lockable.h"
>  #include "io/channel-socket.h"
> +#include "sysemu/runstate.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
>  #include "tpm_int.h"
> @@ -383,6 +384,15 @@ err_exit:
>
>  static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize)
>  {
> +    /* TPM startup will be done from post_load hook */
> +    if (runstate_check(RUN_STATE_INMIGRATE)) {
> +        if (buffersize !=3D 0) {
> +            return tpm_emulator_set_buffer_size(tb, buffersize, NULL);
> +        }
> +
> +        return 0;
> +    }
> +
>      return tpm_emulator_startup_tpm_resume(tb, buffersize, false);
>  }
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000004b7b505e52eec16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 1, 2022 at 6:28 PM Ross=
 Lagerwall via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nong=
nu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">When resuming after a migration, the backend sends CMD_INIT to the<br=
>
emulator from the startup callback, then it sends the migration state<br>
from the vmstate to the emulator, then it sends CMD_INIT again. Skip the<br=
>
first CMD_INIT during a migration to avoid initializing the TPM twice.<br>
<br>
Signed-off-by: Ross Lagerwall &lt;<a href=3D"mailto:ross.lagerwall@citrix.c=
om" target=3D"_blank">ross.lagerwall@citrix.com</a>&gt;<br></blockquote><di=
v><br></div><div>lgtm</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>=
&gt;</div><div><br></div><div>There are no visible bugs/symptoms, I suppose=
?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0backends/tpm/tpm_emulator.c | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c<br>
index 87d061e9bb..9b50c5b3e2 100644<br>
--- a/backends/tpm/tpm_emulator.c<br>
+++ b/backends/tpm/tpm_emulator.c<br>
@@ -32,6 +32,7 @@<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qemu/lockable.h&quot;<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
=C2=A0#include &quot;sysemu/tpm_backend.h&quot;<br>
=C2=A0#include &quot;sysemu/tpm_util.h&quot;<br>
=C2=A0#include &quot;tpm_int.h&quot;<br>
@@ -383,6 +384,15 @@ err_exit:<br>
<br>
=C2=A0static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize=
)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 /* TPM startup will be done from post_load hook */<br>
+=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_INMIGRATE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buffersize !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tpm_emulator_set_buffer_s=
ize(tb, buffersize, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return tpm_emulator_startup_tpm_resume(tb, buffersize, =
false);<br>
=C2=A0}<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000004b7b505e52eec16--

