Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D05B2908
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 00:08:27 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWPhC-00084c-Bd
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 18:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oWPem-0004ov-5S
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 18:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oWPei-0007w2-7D
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 18:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662674751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+yRXEdNd2Ww/FWI+pd/QtmNoCy/niV5V33yVr1UrPA=;
 b=Unofm42GWrldt33kFXvcN1nwtRGHL7aUPVCkHZCqqEaS6i5UtRKHIPtPM6AVMgpraxxYUC
 JKNAik8PKeLTh88ZPXBDCeWTr7GYlx3yAwfjKXyV9cBA60CaQbEoMM4+fkJp3FMbJxknSO
 zOSEUflFt4PPVfU1ZHahyxOWrcy9BNo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-u4Klv-9EP3uyU1XaFR8vNQ-1; Thu, 08 Sep 2022 18:05:49 -0400
X-MC-Unique: u4Klv-9EP3uyU1XaFR8vNQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 x10-20020a2ea98a000000b00261b06603cfso5994728ljq.17
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 15:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=l+yRXEdNd2Ww/FWI+pd/QtmNoCy/niV5V33yVr1UrPA=;
 b=AMB5uFov/Als3e/DuWzK3hxr0ZMKoyFHEH8Qd0FDR4P3Gc/CNQ9lpgH1Yq7Kg+PW+k
 YGsfUN1GtXON0gatoEf46E4DxSVtMaIpZXN4eX0DEBxCS9f6yDKeXwb0wFnNZAvsaxUx
 HH7bYv+Io0xr6IpBIzDYn6AXwn7WSneEr+zflXev/hoxcMlQkak4TlmqXhAIlsSJX+b7
 9pnaRWWabmQ1kBwWR/9XljaWfPAmnwTBjopKxGnSiSHzwRCc8qB/yznPHBScdAEg/X9j
 v4aADEZ0+94ajCddYrwmW+AOUzs4dmcPUBXP7UrGd/3S00GlpYAQ31ZaCTo6+kGBQtQT
 Z/MQ==
X-Gm-Message-State: ACgBeo1REc5Q6rphh9xy23QR7HnQtZZmM488+3Kn7wPVeSOG4EVzR1h9
 yfvoeIAX6DucOAST5szp0MwqPuC4SX6MZUNKgm+/lbRZIlFqmjSdaNUHS3BBLENO8fYofObiVKc
 WiA9x9zAYDwDASGIzg7lHZpZdK/jUJo4=
X-Received: by 2002:a2e:740f:0:b0:26b:da32:1b9c with SMTP id
 p15-20020a2e740f000000b0026bda321b9cmr1370522ljc.262.1662674748052; 
 Thu, 08 Sep 2022 15:05:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7phqC30I64kUrrkaxDeynH2r0RsgBZR5TOuVC1G+cd89a1dMy5MZAYssTMh+igQ6RzZ6VXMexyg5w93/aky8g=
X-Received: by 2002:a2e:740f:0:b0:26b:da32:1b9c with SMTP id
 p15-20020a2e740f000000b0026bda321b9cmr1370511ljc.262.1662674747721; Thu, 08
 Sep 2022 15:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220908093936.19280-1-pbonzini@redhat.com>
 <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
In-Reply-To: <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 9 Sep 2022 00:05:36 +0200
Message-ID: <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
To: Claudio Fontana <cfontana@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, 
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000b7350805e831a1bd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b7350805e831a1bd
Content-Type: text/plain; charset="UTF-8"

No, there's nothing yet.

Paolo

Il gio 8 set 2022, 15:47 Claudio Fontana <cfontana@suse.de> ha scritto:

> On 9/8/22 11:39, Paolo Bonzini wrote:
> > Queued, thanks.
> >
> > Paolo
> >
> >
>
> Thanks. When it comes to programmatic checks about what QEMU supports in
> terms of audio,
>
> is there something that can be done with QMP?
>
> I checked the QMP manual at:
>
>
> https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948
>
> but in the "Audio" section there is a bunch of Objects and enums defined,
> but no command to query them...
>
> Thanks,
>
> Claudio
>
>

--000000000000b7350805e831a1bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, there&#39;s nothing yet.<div dir=3D"auto"><br></div><=
div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il gio 8 set 2022, 15:47 Claudio Fontana &lt;=
<a href=3D"mailto:cfontana@suse.de">cfontana@suse.de</a>&gt; ha scritto:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On 9/8/22 11:39, Paolo Bonzini wrote:=
<br>
&gt; Queued, thanks.<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; <br>
<br>
Thanks. When it comes to programmatic checks about what QEMU supports in te=
rms of audio,<br>
<br>
is there something that can be done with QMP?<br>
<br>
I checked the QMP manual at:<br>
<br>
<a href=3D"https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#=
qapidoc-2948" rel=3D"noreferrer noreferrer" target=3D"_blank">https://qemu.=
readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948</a><br>
<br>
but in the &quot;Audio&quot; section there is a bunch of Objects and enums =
defined, but no command to query them...<br>
<br>
Thanks,<br>
<br>
Claudio<br>
<br>
</blockquote></div>

--000000000000b7350805e831a1bd--


