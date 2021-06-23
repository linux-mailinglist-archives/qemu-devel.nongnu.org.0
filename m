Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0D3B1869
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:05:13 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0gy-0004Q7-Uy
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0fw-0003Uq-8d
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:04:08 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0fu-00078C-Hy
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:04:08 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso1487308oto.12
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6qPYrmPRHYwI8dSUxhkrWC550oMqO1zIh8Q7qL3VKhg=;
 b=sdDZ2ZqJRLADD5SuYjg8qZDYJyIXAEcalP0W586FkGFud998fzkPnzm428Rswel5uJ
 PGlzrjCxSQe5R1CzpKzjxgiPWXJiVfNiupmY9H/c0Nmywj3QsSnqGHR1N0mFfXNZed9K
 TE/bpYI+rm+3ClouSodhk3SbjxqIHMy5jyY6nQUMzoc+U/rmzIhSzzOuwJvqAFq8GGjj
 FQ6k7SIzRPe3q0D2hGyONsO+BKPPTOvU0xpkX6ZDc4sgMX+/s0yvT3D3bBXX9g5xkzXG
 hY+xiweMlQ+mn5T1gOEQXWrkTBeBTRncLNI8ZTOw5Rqb8Rzvo7/WkTOm+zYnFr56Vgyz
 Yx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6qPYrmPRHYwI8dSUxhkrWC550oMqO1zIh8Q7qL3VKhg=;
 b=Nexf5tigGUrLyrQCvY28r/1mFaFVDmB77tvVHZ92/ZHmyjdeLVNAw95ny1DPAQ+4H/
 XF04ZK0ft7jHVyeXpw1bj/yfM8+iWRh36EscTQGgUQD00RYzWQbcenABU3G1ZkeRXT8o
 YoKRH1TnlG7ZEQMehoEXRhxOKW9rdL7vNPSUKfmNCioS2QaPjQqo8Q+lohwezNsnuqOT
 p/NfCdKQgJuONcVi4aqkGgKSrVd3xqPMBkdhJjJKEDb78dVzULacbSFd+49so+YwbZgr
 kX6+bx2WVZcAFQBnLTIecV0oAUpthW6QKPRLYXeWODGl/NgfLKHN7yoW03ear3f2h+4K
 w+7g==
X-Gm-Message-State: AOAM5334ap5/XAAKdvIhSjh4Cg0By6vBbNYNAT3geHMDwPnNtAKI+gm2
 Wds7zxDoanRSHwfh0TdcPCz4F8wNMoKuUP0tB2c=
X-Google-Smtp-Source: ABdhPJzBgXa2GtX8W+YoJ+OMl2g4I4wh8uX9Onlav6jjH2B9ixy7VMAHMpf091+vzY78ldvVRUoEvyik7FpevFvB0vc=
X-Received: by 2002:a9d:2f61:: with SMTP id h88mr7170054otb.190.1624446245550; 
 Wed, 23 Jun 2021 04:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-6-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-6-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 14:03:54 +0300
Message-ID: <CAC_L=vU+YM=d-tkNZ5quqhCvvA5jitVKGO0xM6TEDXt=Ydeu+w@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] bios-tables-test: Allow changes in DSDT ACPI tables
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006c3efd05c56cdda7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006c3efd05c56cdda7
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova <jusual@redhat.com> wrote:

> All DSDT Q35 tables will be modified because ACPI hot-plug is enabled
> by default.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
> b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..c5167f48af 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,12 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.nohpet",
> --
> 2.30.2
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--0000000000006c3efd05c56cdda7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 2021 at 10:08 PM Juli=
a Suvorova &lt;<a href=3D"mailto:jusual@redhat.com">jusual@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">All DS=
DT Q35 tables will be modified because ACPI hot-plug is enabled<br>
by default.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios=
-tables-test-allowed-diff.h<br>
index dfb8523c8b..c5167f48af 100644<br>
--- a/tests/qtest/bios-tables-test-allowed-diff.h<br>
+++ b/tests/qtest/bios-tables-test-allowed-diff.h<br>
@@ -1 +1,12 @@<br>
=C2=A0/* List of comma-separated changed AML files to ignore */<br>
+&quot;tests/data/acpi/q35/DSDT&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.tis&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.bridge&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.mmio64&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.ipmibt&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.cphp&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.memhp&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.acpihmat&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.numamem&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.dimmpxm&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.nohpet&quot;,<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marcel Apfelbaum &lt=
;<a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.apf=
elbaum@gmail.com</a>&gt;<br></div><div><br></div><div>Thanks,</div><div>Mar=
cel</div></div><div class=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"><b=
r></div><div class=3D"gmail-adL"><br></div><div>=C2=A0</div></div></div>

--0000000000006c3efd05c56cdda7--

