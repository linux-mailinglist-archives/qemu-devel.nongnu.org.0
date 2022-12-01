Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88BA63F21D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 14:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0k2O-0003Lm-0y; Thu, 01 Dec 2022 08:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1p0k2H-0003LA-EN; Thu, 01 Dec 2022 08:55:34 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1p0k2F-0002qK-Ik; Thu, 01 Dec 2022 08:55:33 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id 7so2088088ybp.13;
 Thu, 01 Dec 2022 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gDLoHkTwlo9gY+PAnsWyxqL0KQn7khtTPrADNd+gyD8=;
 b=MhQGJ6TnMQJvHQ9gqdTEf68H+UZj5Gsl36isRKnVWIQcIYTwqYFpGOiPjGghlNb1+R
 pVhRToRWWVgnwRl3DJM2RpJgAPoXwa3a6bi2T8Z96Jwp1oGj9+NEbdZHO0ZIln3Rh4cD
 N88A+oFOqVRhjOYrIfV17Eg7DzzGThB5YqLHWsPUNBarKacFhcU9bXa+4AHsoqKu69ef
 9KMGl8nuQvZBbEhcGfdQrrjI6MvlBekL4jucEtDNM3eXvArJXG5Y4Oj0263rt1NffJ7E
 H2SGqPuo45RoeIJk5oNjsjsu88Q23etfw1SM6bhCV+lGUc2fkiOXmG0oY5FCfT08fkR8
 fZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gDLoHkTwlo9gY+PAnsWyxqL0KQn7khtTPrADNd+gyD8=;
 b=yOl7q4J4Rk5PAgYqGbwLBG+hvNUHyo7y59RzvIaTj/QQMzGpf42zzRZ8nsVjGNk0sr
 yGx8+3FVCgHrZL2z/rgiV4jXnho288ckEhGDn0MltQ/xxo6pCGdAlG/mvXICNx+gjf3+
 sokUl/4MVnBMc6RoP5rdyGvMe1Q7yayoCwtyLkiRIIrs6f2X84xBirAUWJfvn9x4GZGK
 sE/d/QAwzjspjfvN9kkLiqWeNu2s1wyU5aFnZ3cZmhlGQglF6v3eOVVrxsLy28S02d0I
 1W+JzafBWFEAKX/9OtJCr2ADP8xVGZi2QYQEsf6HVqlnnA7dPvDM1yoDPtV626ZaE2y8
 kUKw==
X-Gm-Message-State: ANoB5pmi5PNzXJtzs83pXf6eEwHOo26Tv4NSFUme3rWKiPHVGj1E8nfF
 OJZSO8rC8qOR7i/wtEynupWPyOUjhR9U/f67IW8tOklo
X-Google-Smtp-Source: AA0mqf7y81NYXIgNsxyR7ibX1IVjsogGJNt9O/a07gSe2qAVBoxFR7UBjgSFjMCfIMEv8n+SMj+J2r4O/HX8nEUjjro=
X-Received: by 2002:a25:40d4:0:b0:6f0:118d:f77c with SMTP id
 n203-20020a2540d4000000b006f0118df77cmr39485108yba.205.1669902930057; Thu, 01
 Dec 2022 05:55:30 -0800 (PST)
MIME-Version: 1.0
References: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
 <CAFEAcA9P2-v94p8H8+ktnf-Yf-rucbGySXE6AGPdwvDxXfP=ZA@mail.gmail.com>
In-Reply-To: <CAFEAcA9P2-v94p8H8+ktnf-Yf-rucbGySXE6AGPdwvDxXfP=ZA@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Thu, 1 Dec 2022 16:55:19 +0300
Message-ID: <CACKEeRO59OBtXrkimR01KU6e4DXhYxg=z1AmK=XsXgK-RAEm_A@mail.gmail.com>
Subject: Re: cortex-a55/a75/a76 MPIDR_EL1 specifica
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f49fe305eec49281"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f49fe305eec49281
Content-Type: text/plain; charset="UTF-8"

More like the opposite - proprietary software which does not yet have
proper support for MT CPUs worked fine on QEMU but failed on hardware - so
discrepancy was found.
This does not block anything right now, the question is more how closely
qemu should follow hardware which it emulates...

BR
Timofey

On Thu, Dec 1, 2022 at 4:38 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 1 Dec 2022 at 10:55, Timofey Kutergin <tkutergin@gmail.com> wrote:
> > After submitting a patch for cortex-a55 support and trying
> > to run SMP on odroid-c4 I have found concern about mpidr_el1 register.
> >
> > cortex-a55 (and also a75/76/78) seem to be considered SMT CPUs
> > with single SMT thread. As a result, they publish core numbers
> > in AFF1 rather than in AFF0 and AFF0 is always zero. In the
> > cortex-a55 TRM:
> >
> > Aff1, [11:8] Part of Affinity level 1. Third highest level affinity
> field.
> >   CPUID. Identification number for each CPU in the Cortex-A55 cluster:
> >   0x0 MP1: CPUID: 0. to
> >   0x7 MP8: CPUID: 7.
> > Aff0, [7:0]
> >   Affinity level 0. The level identifies individual threads within a
> multi-threaded core. The
> >   Cortex-A55 core is single-threaded, so this field has the value 0x00.
> >
> > Plus MT (bit 24) is set to 1.
> >
> > But it seems that qemu does not take it into account. Is this
> > intentional? Does it make sense to change this behaviour to
> > something closer to real CPU ?
>
> I don't think it's intentional, it's just that when we wrote
> the code to handle the MPIDR all the CPUs we emulated were
> MT==0 and put their CPU number in the Aff0 field, so that's all
> that the mpidr_read_val() function handles.
>
> Of the CPUs we currently emulate, these ones set MT==1:
>  * Cortex-A55
>  * Cortex-A76
>  * Neoverse-N1
> (I don't know about the a64fx but would guess it is MT==0.)
>
> Since we already have a couple of CPU models which we don't
> get this right for, I don't think this needs to block the A55
> support, but it would I think be nice to implement it correctly.
> I guess I would do this via a bool ARMCPU::cpuid_in_aff1 similar to
> the existing ARMCPU::mp_is_up, and making mpidr_read_val()
> act appropriately. The awkward part is that this would mean
> that across migration from an older QEMU version the guest
> would see the MPIDR value change, which is probably bad.
> So I guess we need a CPU property to suppress that and to
> set that in the hw_compat_7_2 array (which will appear when
> the 8.0 board types get added after 7.2 releases).
>
> Did you see any guest-visible behaviour issues because of this
> value being wrong ?
>
> thanks
> -- PMM
>

--000000000000f49fe305eec49281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">More like the opposite - proprietary software which does n=
ot yet have proper support for MT CPUs worked fine on QEMU but failed on ha=
rdware - so discrepancy was found.<div>This does not block anything right n=
ow, the question is more how closely qemu should follow hardware which it e=
mulates...</div><div><br></div><div>BR</div><div>Timofey</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 1=
, 2022 at 4:38 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 1 Dec 2022 at 10:55, Timofey Kutergin =
&lt;<a href=3D"mailto:tkutergin@gmail.com" target=3D"_blank">tkutergin@gmai=
l.com</a>&gt; wrote:<br>
&gt; After submitting a patch for cortex-a55 support and trying<br>
&gt; to run SMP on odroid-c4 I have found concern about mpidr_el1 register.=
<br>
&gt;<br>
&gt; cortex-a55 (and also a75/76/78) seem to be considered SMT CPUs<br>
&gt; with single SMT thread. As a result, they publish core numbers<br>
&gt; in AFF1 rather than in AFF0 and AFF0 is always zero. In the<br>
&gt; cortex-a55 TRM:<br>
&gt;<br>
&gt; Aff1, [11:8] Part of Affinity level 1. Third highest level affinity fi=
eld.<br>
&gt;=C2=A0 =C2=A0CPUID. Identification number for each CPU in the Cortex-A5=
5 cluster:<br>
&gt;=C2=A0 =C2=A00x0 MP1: CPUID: 0. to<br>
&gt;=C2=A0 =C2=A00x7 MP8: CPUID: 7.<br>
&gt; Aff0, [7:0]<br>
&gt;=C2=A0 =C2=A0Affinity level 0. The level identifies individual threads =
within a multi-threaded core. The<br>
&gt;=C2=A0 =C2=A0Cortex-A55 core is single-threaded, so this field has the =
value 0x00.<br>
&gt;<br>
&gt; Plus MT (bit 24) is set to 1.<br>
&gt;<br>
&gt; But it seems that qemu does not take it into account. Is this<br>
&gt; intentional? Does it make sense to change this behaviour to<br>
&gt; something closer to real CPU ?<br>
<br>
I don&#39;t think it&#39;s intentional, it&#39;s just that when we wrote<br=
>
the code to handle the MPIDR all the CPUs we emulated were<br>
MT=3D=3D0 and put their CPU number in the Aff0 field, so that&#39;s all<br>
that the mpidr_read_val() function handles.<br>
<br>
Of the CPUs we currently emulate, these ones set MT=3D=3D1:<br>
=C2=A0* Cortex-A55<br>
=C2=A0* Cortex-A76<br>
=C2=A0* Neoverse-N1<br>
(I don&#39;t know about the a64fx but would guess it is MT=3D=3D0.)<br>
<br>
Since we already have a couple of CPU models which we don&#39;t<br>
get this right for, I don&#39;t think this needs to block the A55<br>
support, but it would I think be nice to implement it correctly.<br>
I guess I would do this via a bool ARMCPU::cpuid_in_aff1 similar to<br>
the existing ARMCPU::mp_is_up, and making mpidr_read_val()<br>
act appropriately. The awkward part is that this would mean<br>
that across migration from an older QEMU version the guest<br>
would see the MPIDR value change, which is probably bad.<br>
So I guess we need a CPU property to suppress that and to<br>
set that in the hw_compat_7_2 array (which will appear when<br>
the 8.0 board types get added after 7.2 releases).<br>
<br>
Did you see any guest-visible behaviour issues because of this<br>
value being wrong ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000f49fe305eec49281--

