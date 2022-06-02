Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBBD53C051
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:20:57 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsFU-0000oH-42
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwsDc-0008NB-2c; Thu, 02 Jun 2022 17:19:00 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwsDa-0007sW-Hd; Thu, 02 Jun 2022 17:18:59 -0400
Received: by mail-qv1-xf32.google.com with SMTP id s10so1262144qvt.8;
 Thu, 02 Jun 2022 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RKKe6AAnr2ATC1lZJtwgwmSj3bN1sj9R7+Jzb3O8XMo=;
 b=DOpkfJtjP860MiaAr9mIKkro6ZTKfaFdEyP3H5nmGYfPe8Ov98CLzJL59POD6euP8s
 M4eLYKaV1ENZpR6QaVcEgEjAHDM3gNVmMSeuEne8Mz2Oem78xUES0g0dUxv89XuoOT/q
 L4LAjnKJgFpF0A66F13m9cYQGrzfmornlYcfUrNJfUO2X+QC5+oVfiT/UyYM8Sc5wEXE
 AGd1eJtNgkwJtui0oSr8+UukGiAPBOOztDgwOwVfdvHSkBT7bb8ucSsBdaqOMOOADkn7
 uvAiVMM1H8dC5EWzT7kIUD3Gm9Fu+Li1MSpR3T/IK3D/Re0Ksk+lkEqpthFIsRvM22Bi
 D6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RKKe6AAnr2ATC1lZJtwgwmSj3bN1sj9R7+Jzb3O8XMo=;
 b=zkRTX1Hz7nsU7UAGdX6IMdqgONiYNJQACPJ6PN1D8sRePvPiSE3ky8ej7yHRjq8pWi
 HD/bKQPDwnNfGzGKQO+VPidHlzxb0hodrvD2uMXmZDV0U+kiESEr4B7tbtLN5zhNlTZ1
 SPAYy9NnlHJzeywOXyTeDbhXlWih31/mQrDbMOyK6OHOeDXoTx6YFjZyZv6hv4Tv/u79
 Fc9ouREjDA0hTCo2QypfutrJ57KOxcLvef6BzZw++eDLrxLRvVzWsRKP+GnUIsCb8lVP
 4jbT4nTGq+UkgBrH5pHM1NJ/8JE5GnZ5ZIJK62hzsBCary0xZawSrRy13bLQVtVjhoHj
 MJDA==
X-Gm-Message-State: AOAM533ZlX5adixlTuoiNSdxYwcygET3XqVya9bFP7FZ4EAesP50fpxg
 Y/XCAs867IitybG46jJO8yBVpwrFZSSQIZjTXoxRyWdPCX4=
X-Google-Smtp-Source: ABdhPJx+LXX/5C4wWKruH2g/4zEVn8B15wLdOM+sLmkk/FXEJzddBVSulI6yUEMVTUc/qFQVt0JrIBXXlsLrq2sPl+A=
X-Received: by 2002:a0c:b34d:0:b0:467:d752:af33 with SMTP id
 a13-20020a0cb34d000000b00467d752af33mr1858571qvf.109.1654204737092; Thu, 02
 Jun 2022 14:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:7f14:0:0:0:0:0 with HTTP;
 Thu, 2 Jun 2022 14:18:56 -0700 (PDT)
In-Reply-To: <20220529184006.10712-1-shentey@gmail.com>
References: <20220529184006.10712-1-shentey@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 2 Jun 2022 23:18:56 +0200
Message-ID: <CAG4p6K77BxKXxdS53df67zLh=dZfEFubeMtfPBaU1gxWtY_ZAw@mail.gmail.com>
Subject: [PATCH v3 0/3] QOM improvements for rtc/mc146818rtc
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bd820c05e07d8db0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf32.google.com
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

--000000000000bd820c05e07d8db0
Content-Type: text/plain; charset="UTF-8"

Ping

Am 29. Mai 2022 18:40:03 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>v3:
>* "iobase" is now u16 (Philippe)
>
>v2:
>* Explicitly fail with &error_abort rather than NULL (Mark)
>* Explicitly fail with &error_abort rather than NULL in existing code (me)
>* Unexport rather than remove RTC_ISA_BASE (Mark)
>* Use object_property_get_*u*int() also for "iobase" (me)
>
>v1:
>This little series enhances QOM support for mc146818rtc:
>* makes microvm-dt respect mc146818rtc's IRQ number set by QOM property and
>* adds an io_base QOM property similar to other ISA devices
>
>Bernhard Beschow (3):
>  hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
>    fails
>  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
>    property
>  rtc/mc146818rtc: QOM'ify io_base offset
>
> hw/i386/microvm-dt.c         | 9 +++++----
> hw/rtc/mc146818rtc.c         | 9 ++++++---
> include/hw/rtc/mc146818rtc.h | 2 +-
> 3 files changed, 12 insertions(+), 8 deletions(-)
>

Ping

--000000000000bd820c05e07d8db0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping<br><br>Am 29. Mai 2022 18:40:03 UTC schrieb Bernhard Beschow &lt;<a hr=
ef=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt;:<br>&gt;v3:<br>&g=
t;* &quot;iobase&quot; is now u16 (Philippe)<br>&gt;<br>&gt;v2:<br>&gt;* Ex=
plicitly fail with &amp;error_abort rather than NULL (Mark)<br>&gt;* Explic=
itly fail with &amp;error_abort rather than NULL in existing code (me)<br>&=
gt;* Unexport rather than remove RTC_ISA_BASE (Mark)<br>&gt;* Use object_pr=
operty_get_*u*int() also for &quot;iobase&quot; (me)<br>&gt;<br>&gt;v1:<br>=
&gt;This little series enhances QOM support for mc146818rtc:<br>&gt;* makes=
 microvm-dt respect mc146818rtc&#39;s IRQ number set by QOM property and<br=
>&gt;* adds an io_base QOM property similar to other ISA devices<br>&gt;<br=
>&gt;Bernhard Beschow (3):<br>&gt;=C2=A0 hw/i386/microvm-dt: Force explicit=
 failure if retrieving QOM property<br>&gt;=C2=A0 =C2=A0 fails<br>&gt;=C2=
=A0 hw/i386/microvm-dt: Determine mc146818rtc&#39;s IRQ number from QOM<br>=
&gt;=C2=A0 =C2=A0 property<br>&gt;=C2=A0 rtc/mc146818rtc: QOM&#39;ify io_ba=
se offset<br>&gt;<br>&gt; hw/i386/microvm-dt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 9 +++++----<br>&gt; hw/rtc/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 9 ++++++---<br>&gt; include/hw/rtc/mc146818rtc.h | 2 +-<br>&gt; 3 =
files changed, 12 insertions(+), 8 deletions(-)<br>&gt;<br><br>Ping

--000000000000bd820c05e07d8db0--

