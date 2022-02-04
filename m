Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F14AA02A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 20:34:07 +0100 (CET)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4LO-0002sF-3v
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 14:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nG2tJ-00013u-1x
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nG2sd-0005dn-D2
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643997581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xXdsvhLxntdFnIgPxCP01TwxUt530X9TzIa0M/TkcEc=;
 b=T8EW7cGsNqAA8q+n6cQF2zaCBusFiM1t9GSoeoJ1tj/CSe2Eg9QTViVadYsUyc1DeokUq7
 WCGLdNHzebCzKjsLVDWbMsalIM6U9MkEk/arg71s5alIatYieQOfMqQx14YoeWGu+yObYx
 QLzHoJP2OL6ztBM/DS8ijd9lsJA7hcY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-XZ9rcIBDNOa4oU8_3g64Rg-1; Fri, 04 Feb 2022 12:59:38 -0500
X-MC-Unique: XZ9rcIBDNOa4oU8_3g64Rg-1
Received: by mail-pl1-f200.google.com with SMTP id
 h11-20020a170902eecb00b0014cc91d4bc4so3454359plb.16
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXdsvhLxntdFnIgPxCP01TwxUt530X9TzIa0M/TkcEc=;
 b=XtkakMFP2rP+1JjBRjgY5YxO9yEIYTFO89ZyzP22B+kVZ9u+6DEVkfjfJsn2+HYBFy
 zXtErzlmtCaNSaojrb+eEvj9XLdQ5xs5LhAJGpQ3YUwfVkDOOtIceSxHAmtHmbN6Qtc2
 WZEPGcPZbqsaYf0ORKf2dZ7lo0fiKWnrRGjwiqewNraeLDWwBmi4JWd3tvWv1N/OE5Fa
 u6wozSagJSUgK3ZMct+TxZW696SLuhfHLCT20saBVByp5GUJOfNN/OvYybxl9frsghfw
 pm456PKYspQknfpL3AEKJ22ygvhe6XcNbaIY+3jYJmtZy1ArbsKgpb/RwU5kUTK7rQmM
 63Yg==
X-Gm-Message-State: AOAM530w2r+OeqqZQRnMR/pd/dSXK6hYIIZSVlGQjWOeHk/zDjDDc+3Z
 Gs1bbLHh1GQv7NxJHUW0qjFokJGW9ENhlLOT0XM7IeBEy50uPV7DO9Mtu3+tvb8e/jhfZkkQDx+
 i0Wp1yf4H9+fCdVP/xZPjHxwyxEcJdk0=
X-Received: by 2002:a17:90a:d203:: with SMTP id
 o3mr4438994pju.122.1643997577144; 
 Fri, 04 Feb 2022 09:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytkWL2WtPPplaNuKr/wV8+W43xw2Od9blyU1kpQosRZrYMV5lkr2uXweI0aNM7eAd7Gb4/jS52qARoXFht3xE=
X-Received: by 2002:a17:90a:d203:: with SMTP id
 o3mr4438961pju.122.1643997576881; 
 Fri, 04 Feb 2022 09:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
In-Reply-To: <20220131233507.334174-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 4 Feb 2022 18:59:23 +0100
Message-ID: <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000094fe7405d73503f7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094fe7405d73503f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is causing breakage in the acpi-tables-test, sorry.

Paolo

Il mar 1 feb 2022, 00:35 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> Previously CPUs were exposed in the QOM tree at a path
>
>   /machine/unattached/device[nn]
>
> where the 'nn' of the first CPU is usually zero, but can
> vary depending on what devices were already created.
>
> With this change the CPUs are now at
>
>   /machine/cpu[nn]
>
> where the 'nn' of the first CPU is always zero.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/x86.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb9..50bf249c700 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t
> apic_id, Error **errp)
>  {
>      Object *cpu =3D object_new(MACHINE(x86ms)->cpu_type);
>
> +    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
>      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>          goto out;
>      }
> --
> 2.34.1
>
>

--00000000000094fe7405d73503f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is causing breakage in the acpi-tables-test, sorry.<=
div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 1 feb 2022, =
00:35 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4=
bug@amsat.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">P=
reviously CPUs were exposed in the QOM tree at a path<br>
<br>
=C2=A0 /machine/unattached/device[nn]<br>
<br>
where the &#39;nn&#39; of the first CPU is usually zero, but can<br>
vary depending on what devices were already created.<br>
<br>
With this change the CPUs are now at<br>
<br>
=C2=A0 /machine/cpu[nn]<br>
<br>
where the &#39;nn&#39; of the first CPU is always zero.<br>
<br>
Suggested-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/i386/x86.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/i386/x86.c b/hw/i386/x86.c<br>
index b84840a1bb9..50bf249c700 100644<br>
--- a/hw/i386/x86.c<br>
+++ b/hw/i386/x86.c<br>
@@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_i=
d, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Object *cpu =3D object_new(MACHINE(x86ms)-&gt;cpu_type)=
;<br>
<br>
+=C2=A0 =C2=A0 object_property_add_child(OBJECT(x86ms), &quot;cpu[*]&quot;,=
 OBJECT(cpu));<br>
=C2=A0 =C2=A0 =C2=A0if (!object_property_set_uint(cpu, &quot;apic-id&quot;,=
 apic_id, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000094fe7405d73503f7--


