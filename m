Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C156A9C36
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:51:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8c7-0008Bx-L4; Fri, 03 Mar 2023 11:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY8c5-0008Al-Nm
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:50:33 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY8c3-0002vK-JW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:50:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id p6so3360301plf.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677862230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3v80g7P8umsQjcH1h4fCP2pr3VRdvfCu8v4L/Rsu1Q=;
 b=PXfQG7BZ5Is77mA828vdj1PHmDwO4lZ73yhNrcTrJjoFQIE5aYHVoC3KQlRL1ujYTF
 pG2odsFCsZwWRmbYjMSSOt5IjUOZsxcaKAfIRSikD1yr383mQnMbYbyrE21chEN3J0N3
 z+nWZoXlAEoGMO3USdw+75MSJ4WhSglLI+3nFuTjsIbLtKokDAhmDu+jgWDRbBIIhERt
 2n7OojKPmsloHloyMHQSI3WHBJB7Yv5fXLwK5u7GCle/y6ME3YLstBlRuw1K+lhwFQ8N
 qeDSU0E0sxzrz9fYbYeHPQXDXx2E/3v/8f+Qm526cd65Su18wozvh2tBLlnA8WwCIkAQ
 iJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D3v80g7P8umsQjcH1h4fCP2pr3VRdvfCu8v4L/Rsu1Q=;
 b=kvrGaDB0Zelmx3AuCwAFbi/ziSaJ2blo21U/3g5cWO/P3rAIZ/PcDgo8jcMmjrXY2i
 +fequX0FehCtTXwloQcT+1e3KD37hee4kVsicpmpTGng0szt2c7WMbdN7EOmiVDiZ+OD
 Qy5WwTM2Jx0ODHGmEHqjJ8ni+OWGfG9RC2UjTUdpWgRbgjtI7UGLjJCgXvvaCWYebkLM
 aNLxBqVlVo/nwl62DJHzQ16lgBHebE+73/rT2wV8pdOrD8/Y3/J9IZ2C+CS2CI5mbqlA
 0fCTTGcwsxBJmEQXWtEC0CkAFh4z0aYDGPgT3NkpJ5kbzpNWT1Ed3EYlVCGxs+8OFM/q
 D65Q==
X-Gm-Message-State: AO0yUKU7cxdrXjhgZD0XaPNoZc+JYxVy5iVd4UNrKPUU7r+0e5z9gjZW
 rXBvEaBapnqKBcjajiDJ7NQYyx5icUvhAmMApCPpWw==
X-Google-Smtp-Source: AK7set9Yzge+JMvCob5CkK2CU4dPpG8A2xIbIVcH89Sqdl1PnZBMpgkz7EOzm0TjnZgxfvBvd/enk90cKwMFFJ/zl20=
X-Received: by 2002:a17:903:25c5:b0:19a:ebaa:68d7 with SMTP id
 jc5-20020a17090325c500b0019aebaa68d7mr959787plb.2.1677862229832; Fri, 03 Mar
 2023 08:50:29 -0800 (PST)
MIME-Version: 1.0
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
 <ZAHNEtV0N+9JyZTk@redhat.com>
In-Reply-To: <ZAHNEtV0N+9JyZTk@redhat.com>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 08:50:18 -0800
Message-ID: <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=hshan@google.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Mar 3, 2023 at 2:34=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Thu, Mar 02, 2023 at 06:25:59PM -0800, Haitao Shan wrote:
> > The Android Emulator hypervisor driver is a hypervisor for Windows (7
> > or later), made by porting the KVM from the linux kernel 4.9-rc7. Its
> > initial purpose was to support the Android Emulator on the AMD
> > platforms as the old name "Android Emulator Hypervisor Driver for AMD
> > Processors" suggested. Despite the name, Intel processors have been
> > supported ever since its first release. Since Intel dropped HAXM suppor=
t,
> > the android emulator is switching from HAXM to AEHD.
>
> When HAXM was proposed for deprecation & removal from QEMU, the suggestio=
n
> was that users should switch to Windows' native replacement WHPX, which
> QEMU already has support for.
Sorry I was not aware of Intel's suggestion when HAXM was deprecated.
Is this a decision already, which shuts the door for any other 3rd party
hypervisors?

>
> What is the rationale for wanting to introduce a 3rd party hypervisor
> solution like AEHD, for the Android emulator, rather than just sticking
> with the standard WHPX hypervisor available for Windows ? IIUC, the
> Android emulator can already support WHPX according to these pages:
>
>   https://developer.android.com/studio/run/emulator-acceleration
>   https://learn.microsoft.com/en-us/dotnet/maui/android/emulator/hardware=
-acceleration?view=3Dnet-maui-7.0
You are right. WHPX is supported by the android emulator. The reason for
supporting AEHD:

1. HyperV is a type-1 hypervisor, which does not coexist with other hypervi=
sors.
According to our data, there are both users who have to live with HyperV on=
 or
with HyperV off. Those users depend on certain Windows features (or 3rd par=
ty
programs) that have to turn on or turn off HyperV. Offering AEHD allows us =
to
serve both types of users. This is the major benefit. I think this
argument is true
for upstream QEMU users as well.

2. Actually, AEHD started development before WHPX was added to the android
emulator. But porting/writing a new hypervisor just took lots of time.
In the middle,
Microsoft offered us WHPX. It could be the case that AEHD was never started=
 if
WHPX had been offered one or two years earlier. However, we decided to cont=
inue.
First, see reason 1. Second, at least at that time, WHPX was noticeably slo=
wer
than both HAXM and AEHD. Third, Microsoft clearly stated there would not be
any backporting of WHPX to older versions of Windows. And those using old
versions of Windows need a solution in addition to HAXM.

3. Compared with HAXM, which looks like the default solution when HyperV
must be off, AEHD supports both Intel and AMD. And according to user feedba=
ck
and our own tests, AEHD can support Windows 10. This was the reason
why I maintained a patched QEMU ever since 4.2.0 specifically for them.

4. Although it is called Android Emulator hypervisor driver, it has nothing=
 that
is android specific. And I've seen the upstream QEMU successfully refactore=
d the
accelerator logic. This made adding a new hypervisor support less intrusive=
 to
the main code base. I have a good will and intention to maintain what I
submitted if it could be approved by the community. I hope this does
not place (or
at least place very minimum) burden on the maintainers, should it be accept=
ed.

Hope this can answer your questions. Thanks!

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20
Haitao @Google

