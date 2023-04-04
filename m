Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB226D64DB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhO6-0003K4-26; Tue, 04 Apr 2023 10:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjhO0-0003EM-8m
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjhNy-0001aT-Ft
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680617505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FEdPry9eYiISaWwLf8AG+PW56ohb43cLgTcCiFeKSEI=;
 b=LlohujpuxcWdBoCoMCl+5JPohQy2amTDA0FWrxaDD1ST3YVgH3OhqzCVT5de2uF3c8WwI1
 5pglQdWe8NJjnWjbxhr+R8CiCpxNrWX+C+XT6iGjpPWkBgqOCy8ImwMHlfJCldOCanjFEW
 ytdjS3tPeLS5n0m2/jegTl86n/zIisg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-rbq_DV0_MFCt7K-EXbHpSQ-1; Tue, 04 Apr 2023 10:11:43 -0400
X-MC-Unique: rbq_DV0_MFCt7K-EXbHpSQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so46490312edf.16
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FEdPry9eYiISaWwLf8AG+PW56ohb43cLgTcCiFeKSEI=;
 b=C8HjDRRA7yRM0PAUGfXRBgWxwZ919F+y0RrCmTzGxlerm4o46qQXfgu6lCDjGZD+Cf
 hL3VocOnTK3NHd6S5kpzvcHEhhh4xbih6rbLedvAsH60EbR3vKVH44BDgWjDZ0JL6hiO
 x+2Y+pVxpodRaKUBwFMcnYO5f5LE95YI30g3O/oxwl6C5VJUHSaR+NW9wCS4BySIwvu6
 NICeGI+/c4PWZY/a7hh0nFGjMzLtDH8LWF3QVsc3VpOYMqgHAhJM2ijeFSE6OzFRJqGJ
 3xs/qwTrg604b6hO46GK0tgdsT7u+pM5Kb82Ykpi2XImD9ZWtEZQsAjVPTk5jRoTKCJ9
 HXmw==
X-Gm-Message-State: AAQBX9dYuqcGyrB3mB8S7om6GpfvP+kaWD2ZM/5/W4mQq2tGZh+DOR81
 756/f4TW6thG5YESwc5Jy8PxiUFS88GlbO5YjQZdKo1OwoeLJCBoZnbYAqJW8vJrBHd0Y4OPwGK
 AxdutT0pauNyXqfht1LGT6Tfp9WM3oF8=
X-Received: by 2002:a17:906:9615:b0:935:3085:303b with SMTP id
 s21-20020a170906961500b009353085303bmr1292798ejx.15.1680617502671; 
 Tue, 04 Apr 2023 07:11:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZmNY0nONEMu3p3/qVfIKizSlcvHIHMMO+ts6y5N5MWuSA4iPes0hRMLSf3v3mH9BP1qTZjCtMvnAO5FQzhPPA=
X-Received: by 2002:a17:906:9615:b0:935:3085:303b with SMTP id
 s21-20020a170906961500b009353085303bmr1292784ejx.15.1680617502462; Tue, 04
 Apr 2023 07:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230403161618.1344414-1-imammedo@redhat.com>
In-Reply-To: <20230403161618.1344414-1-imammedo@redhat.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Tue, 4 Apr 2023 19:41:31 +0530
Message-ID: <CAK3XEhNMPDUQ2hkxpOXRVsMyLHom1UNf1BzZ8yqewqFHDCuf2g@mail.gmail.com>
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jusual@redhat.com, 
 kraxel@redhat.com
Content-Type: multipart/alternative; boundary="0000000000003cebb105f88341ad"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000003cebb105f88341ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 9:46=E2=80=AFPM Igor Mammedov <imammedo@redhat.com> =
wrote:

> with Q35 using ACPI PCI hotplug by default, user's request to unplug
> device is ignored when it's issued before guest OS has been booted.
> And any additional attempt to request device hot-unplug afterwards
> results in following error:
>
>   "Device XYZ is already in the process of unplug"
>
> arguably it can be considered as a regression introduced by [2],
> before which it was possible to issue unplug request multiple
> times.
>
> Allowing pending delete expire brings ACPI PCI hotplug on par
> with native PCIe unplug behavior [1] which in its turn refers
> back to ACPI PCI hotplug ability to repeat unplug requests.
>
> PS:
> From ACPI point of view, unplug request sets PCI hotplug status
> bit in GPE0 block. However depending on OSPM, status bits may
> be retained (Windows) or cleared (Linux) during guest's ACPI
> subsystem initialization, and as result Linux guest looses
> plug/unplug event (no SCI generated) if plug/unplug has
> happend before guest OS initialized GPE registers handling.
> I couldn't find any restrictions wrt OPM

                                                         ^^^^
When you churn out a v2, can you fix this typo?


> clearing GPE status
> bits ACPI spec.
> Hence a fallback approach is to let user repeat unplug request
> later at the time when guest OS has booted.
>
> 1) 18416c62e3 ("pcie: expire pending delete")
> 2)
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: mst@redhat.com
> CC: anisinha@redhat.com
> CC: jusual@redhat.com
> CC: kraxel@redhat.com
> ---
>  hw/acpi/pcihp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index dcfb779a7a..cd4f9fee0a 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -357,6 +357,8 @@ void
> acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       * acpi_pcihp_eject_slot() when the operation is completed.
>       */
>      pdev->qdev.pending_deleted_event =3D true;
> +    pdev->qdev.pending_deleted_expires_ms =3D
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
>      s->acpi_pcihp_pci_status[bsel].down |=3D (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.39.1
>
>

--0000000000003cebb105f88341ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 9:46=E2=80=AFP=
M Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">with Q35 using ACPI PCI hotplug by default, user&#39;s request to unplug=
<br>
device is ignored when it&#39;s issued before guest OS has been booted.<br>
And any additional attempt to request device hot-unplug afterwards<br>
results in following error:<br>
<br>
=C2=A0 &quot;Device XYZ is already in the process of unplug&quot;<br>
<br>
arguably it can be considered as a regression introduced by [2],<br>
before which it was possible to issue unplug request multiple<br>
times.<br>
<br>
Allowing pending delete expire brings ACPI PCI hotplug on par<br>
with native PCIe unplug behavior [1] which in its turn refers<br>
back to ACPI PCI hotplug ability to repeat unplug requests.<br>
<br>
PS:<br>
From ACPI point of view, unplug request sets PCI hotplug status<br>
bit in GPE0 block. However depending on OSPM, status bits may<br>
be retained (Windows) or cleared (Linux) during guest&#39;s ACPI<br>
subsystem initialization, and as result Linux guest looses<br>
plug/unplug event (no SCI generated) if plug/unplug has<br>
happend before guest OS initialized GPE registers handling.<br>
I couldn&#39;t find any restrictions wrt OPM </blockquote><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^</div><div>When you churn =
out a v2, can you fix this typo?</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">clearing GPE status<br>
bits ACPI spec.<br>
Hence a fallback approach is to let user repeat unplug request<br>
later at the time when guest OS has booted.<br>
<br>
1) 18416c62e3 (&quot;pcie: expire pending delete&quot;)<br>
2)<br>
Fixes: cce8944cc9ef (&quot;qdev-monitor: Forbid repeated device_del&quot;)<=
br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
CC: <a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a><=
br>
CC: <a href=3D"mailto:anisinha@redhat.com" target=3D"_blank">anisinha@redha=
t.com</a><br>
CC: <a href=3D"mailto:jusual@redhat.com" target=3D"_blank">jusual@redhat.co=
m</a><br>
CC: <a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.co=
m</a><br>
---<br>
=C2=A0hw/acpi/pcihp.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
index dcfb779a7a..cd4f9fee0a 100644<br>
--- a/hw/acpi/pcihp.c<br>
+++ b/hw/acpi/pcihp.c<br>
@@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler=
 *hotplug_dev,<br>
=C2=A0 =C2=A0 =C2=A0 * acpi_pcihp_eject_slot() when the operation is comple=
ted.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0pdev-&gt;qdev.pending_deleted_event =3D true;<br>
+=C2=A0 =C2=A0 pdev-&gt;qdev.pending_deleted_expires_ms =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; =
/* 5 secs */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;acpi_pcihp_pci_status[bsel].down |=3D (1U &lt;&lt=
; slot);<br>
=C2=A0 =C2=A0 =C2=A0acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_S=
TATUS);<br>
=C2=A0}<br>
-- <br>
2.39.1<br>
<br>
</blockquote></div></div>

--0000000000003cebb105f88341ad--


