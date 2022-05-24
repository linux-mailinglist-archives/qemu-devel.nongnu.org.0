Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6757533213
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:59:37 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntagq-0007st-A2
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntadm-0004LW-94
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:56:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntadj-00007n-40
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:56:24 -0400
Received: by mail-ed1-x52d.google.com with SMTP id er5so24369988edb.12
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uG8OJddYZ6mOjHHu70JhRKPjdYq7mnPVPG+wbth3wY0=;
 b=RYZBqLjApEkTSxGLM+lTITm91ZqBF/ghmuo6Jb5oGf/4nhE2rwxn4M1bbX8dbAR0kM
 93WaOMIic/OzgqYyPXIkFyfOycpgvMVNzZPsZhkQF61BzCWUcKHMLxWhQgYpOdVemkH4
 52dBj7At76MqnSJhxG+OlQbP6ydxKWMLd7smI5uzJ5WKtW/XgAIq4aLkd/gkxemGrpMT
 gnfM9u0WyUQlyWZU8KhXXONxAEGOjgyfn+S/80rP5c5dSG8di8LFVSjzskKEAem2ZDmD
 cUuw44gFnz8ck6tzkxkpa0iWYT0oMIRNFA7G2VZac4Kw4lW6tQN529anW7uLGbgyyBE4
 mZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uG8OJddYZ6mOjHHu70JhRKPjdYq7mnPVPG+wbth3wY0=;
 b=vGxd3X9uPXz/xRe2J9syTz2kn92bqm/GtZ05oonkii82eMvbf86FCKJhOiF60ivPYL
 uvpN6EwoG27gXuCbuYg4IVd88KapdHtW/Oxaxa8Ebh4bL00xXKfBMOdz3HuxbXqemue8
 k7k36d0XeSH/Qx2uosnqwPzyhwnydZVltQdFtmZl5rzdqbGgdFM9hxP8LDPH7jwrvkJS
 vUgGNqlh+YIkpc62jBFD6WnoH8ZrtEbTLWde3XuvnguySRWcQl7Mvo4GvwIgZf9YfGxT
 pHoFwzlklbLgJ3CuBTsT+c00+lwsusHUEx6iV0ZEOnz4ZuZZpTKG0tM5W6xf1L8eySBW
 VWkg==
X-Gm-Message-State: AOAM532KvWUZUGoiB01IAcT+lj15/Kk6it0Pfs1DTvvg7yMcWPLDORoV
 S7aVsAD50OVOuFCz3oIUtUf5ObOvmKW37QAUPUhTbQ==
X-Google-Smtp-Source: ABdhPJx3x4AKiySlPcLAIY20HasU/q8yaGIw+TKOJjqhG/TwTwki5SU1oAA2WeOBaTiEgUR9nbVb28eMVil0rUtxB60=
X-Received: by 2002:a05:6402:3906:b0:42a:ad43:6477 with SMTP id
 fe6-20020a056402390600b0042aad436477mr30791342edb.20.1653422181658; Tue, 24
 May 2022 12:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
 <20220519153402.41540-2-damien.hedde@greensocs.com>
In-Reply-To: <20220519153402.41540-2-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:56:09 +0800
Message-ID: <CALw707oa8Bigsr9nTKfvUFiAzpUJjrQfRKh3vcWc=zFKUfe9yA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] machine: add phase_get() and document
 phase_check()/advance()
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="000000000000cd4ec605dfc759d1"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000cd4ec605dfc759d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, May 19, 2022 at 11:41 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> phase_get() returns the current phase, we'll use it in next
> commit.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/qdev-core.h | 19 +++++++++++++++++++
>  hw/core/qdev.c         |  5 +++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..e29c705b74 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -887,7 +887,26 @@ typedef enum MachineInitPhase {
>      PHASE_MACHINE_READY,
>  } MachineInitPhase;
>
> +/*
> + * phase_get:
> + * Returns the current phase
> + */
> +MachineInitPhase phase_get(void);
> +
> +/**
> + * phase_check:
> + * Test if current phase is at least @phase.
> + *
> + * Returns true if this is the case.
> + */
>  extern bool phase_check(MachineInitPhase phase);
> +
> +/**
> + * @phase_advance:
> + * Update the current phase to @phase.
> + *
> + * Must only be used to make a single phase step.
> + */
>  extern void phase_advance(MachineInitPhase phase);
>
>  #endif
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..632dc0a4be 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -910,6 +910,11 @@ Object *qdev_get_machine(void)
>
>  static MachineInitPhase machine_phase;
>
> +MachineInitPhase phase_get(void)
> +{
> +    return machine_phase;
> +}
> +
>  bool phase_check(MachineInitPhase phase)
>  {
>      return machine_phase >=3D phase;
> --
> 2.36.1
>
>
>

--000000000000cd4ec605dfc759d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at =
11:41 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" tar=
get=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">phase_get() returns the current ph=
ase, we&#39;ll use it in next<br>
commit.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0include/hw/qdev-core.h | 19 +++++++++++++++++++<br>
=C2=A0hw/core/qdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A02 files changed, 24 insertions(+)<br>
<br>
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
index 92c3d65208..e29c705b74 100644<br>
--- a/include/hw/qdev-core.h<br>
+++ b/include/hw/qdev-core.h<br>
@@ -887,7 +887,26 @@ typedef enum MachineInitPhase {<br>
=C2=A0 =C2=A0 =C2=A0PHASE_MACHINE_READY,<br>
=C2=A0} MachineInitPhase;<br>
<br>
+/*<br>
+ * phase_get:<br>
+ * Returns the current phase<br>
+ */<br>
+MachineInitPhase phase_get(void);<br>
+<br>
+/**<br>
+ * phase_check:<br>
+ * Test if current phase is at least @phase.<br>
+ *<br>
+ * Returns true if this is the case.<br>
+ */<br>
=C2=A0extern bool phase_check(MachineInitPhase phase);<br>
+<br>
+/**<br>
+ * @phase_advance:<br>
+ * Update the current phase to @phase.<br>
+ *<br>
+ * Must only be used to make a single phase step.<br>
+ */<br>
=C2=A0extern void phase_advance(MachineInitPhase phase);<br>
<br>
=C2=A0#endif<br>
diff --git a/hw/core/qdev.c b/hw/core/qdev.c<br>
index 84f3019440..632dc0a4be 100644<br>
--- a/hw/core/qdev.c<br>
+++ b/hw/core/qdev.c<br>
@@ -910,6 +910,11 @@ Object *qdev_get_machine(void)<br>
<br>
=C2=A0static MachineInitPhase machine_phase;<br>
<br>
+MachineInitPhase phase_get(void)<br>
+{<br>
+=C2=A0 =C2=A0 return machine_phase;<br>
+}<br>
+<br>
=C2=A0bool phase_check(MachineInitPhase phase)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return machine_phase &gt;=3D phase;<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div>

--000000000000cd4ec605dfc759d1--

