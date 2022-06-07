Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCA54054F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:24:32 +0200 (CEST)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycwR-0004fc-0d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nycvF-0003vc-Fy
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:23:17 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nycvC-0000Wk-QC
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:23:17 -0400
Received: by mail-lf1-x12b.google.com with SMTP id w20so7720548lfa.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=QoXxGToh3f23btP1rXQSJJFvi4djid/nJnXF7+hOEFM=;
 b=PWCrEOFlGg1Dd43FGPfALr5YDdcvBLrDnViP9a3GkgkyBCpQpFdjOgWoEJ6M7Am5pV
 hn6e5qamb7Hbs7xxPloU2tYzB7TyxZ9gQrHOonoQkZUFNXQjENTIfAoutYy0RU669k2v
 IVlO3VonduHozVvCNEgabUCKpfUaLsDDlAlY0CCDVhHIIXCHn4AkGg4zyGZs1xv95BY4
 JGQ03eVDOMecNF9T+r5VTR/QSDTq2eATwa4aQPh8bGXIDXmGp4GDANPDFVltTjeWh4Qg
 iDL92ea04wsbpAfrfm5RIKY4gBnScM/0y2LDvMnEhGfTK/ZSXxOm/4fyd0d3yG7l2EdC
 Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=QoXxGToh3f23btP1rXQSJJFvi4djid/nJnXF7+hOEFM=;
 b=EOryx45dao4WSL710ZwLKmHF4AAj7kPSxVwGv7aPm3QfQkFV+aq5L6CIMwK8FTy939
 Fcr1Csym8wQr09h8FCeLuhxJFrU8mTD3PskorTAE8PKK/+0VGsuyotqQ9+N86hPCPpM7
 k36CyqEAHntPxVKU4hNgx+4Yy3TVndd7xsQyUVk9jUdC4KgD2/XV/g+Nr2Fc7vPel6PD
 68Wal8DGw4chXpCJBaLQviWyDKAwdCyewq21Si/65cNB1hp3//7qOsLGtyZ0bdVa4Cbm
 zOm0wTrM5txGM4yBQJWQKy50D/pIrmgWVVa3Le7OYLKbCfXN1FlfgkbBILQqWc4QjkAS
 8wMw==
X-Gm-Message-State: AOAM530+eEYS4xzorBKdKYVHA5Bl7Q0lQDvUIpj2B9Yr8YgwhJSJMPis
 cEDjq92p9CJyAsiUstt1YI30tMYY7O9LSSiYYZLV2g==
X-Google-Smtp-Source: ABdhPJxdm5iE5F3de4daM0iv9WPmoZs3s4G/H4D3T52yHgLonOzU4jxe3V9Au13QNJSGJZ3EkjujrxLr+A4tVioG90c=
X-Received: by 2002:a05:6512:29b:b0:479:2ac:84ae with SMTP id
 j27-20020a056512029b00b0047902ac84aemr19077079lfp.624.1654622591211; Tue, 07
 Jun 2022 10:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy7G6HR5=-uVv4GAxryBvdAmtQRo9GDXBO=gj18J+9FwwQ@mail.gmail.com>
 <616364ca-7ad7-4a3b-6737-3d3d06414b3c@vivier.eu>
 <CAHEcVy4XKUzBR-quVx4w+ttCgFG6ykC-LAVq+UCBmeyy48dgfQ@mail.gmail.com>
 <B5E70BCB-ABA7-4366-8B11-0B218A933040@oracle.com>
In-Reply-To: <B5E70BCB-ABA7-4366-8B11-0B218A933040@oracle.com>
From: Yu Zhang <yu.zhang@ionos.com>
Date: Tue, 7 Jun 2022 19:23:00 +0200
Message-ID: <CAHEcVy4S+H+TjWabQjkbJRcO_Hgk0AbTHUxQf89ej9KP5c6i8w@mail.gmail.com>
Subject: Re: about the current status of Multi-process QEMU / out-of-process
 emulation
To: Jag Raman <jag.raman@oracle.com>, Dongli Zhang <dongli.zhang@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-devel <qemu-devel@nongnu.org>, 
 Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="000000000000c97c1b05e0ded750"
Received-SPF: permerror client-ip=2a00:1450:4864:20::12b;
 envelope-from=yu.zhang@ionos.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000c97c1b05e0ded750
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jag,

It's quite nice of you to give me so much details about this feature. I
tried with this repo by using the python script. The server and client qemu
processes are created successfully.

I'm interested in it due to the requirement for higher security level in
cloud environment. We're taking efforts to enhance the security of the VMs
and hosts.

I read on the page below

   https://www.qemu.org/docs/master/devel/multi-process.html

that "an attacker who compromised this service would not be able to use
this exploit to access files or devices beyond what the disk service was
given access to". This is the feature which can reduce the risk due to a
compromised device emulation code.

It doesn't matter which specific device can be emulated in a separated
process. It matters that the device emulation service can be separated from
the qemu main process.

Another aspect I'd like to know is, could the multi-processes be live
migrated just as the single qemu process?

Thank you so much for your time and patience.
Wish you all the best,

Yu Zhang
07.06.2022

On Fri, Jun 3, 2022 at 7:37 PM Jag Raman <jag.raman@oracle.com> wrote:

>
>
> On Jun 3, 2022, at 11:34 AM, Yu Zhang <yu.zhang@ionos.com> wrote:
>
> Hello Dongli, Elena, John, and Jagannathan,
>
> I'm interested in the "multi-process QEMU" feature and got the kind reply
> by Mr. Vivier that I may contact you for this.
> On one of the QEMU docs [1] I saw the command line:
>
> +      /usr/bin/qemu-system-x86_64                                       =
 \
> +      -machine x-remote                                                 =
 \
> +      -device lsi53c895a,id=3Dlsi0                                      =
   \
> +      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2      =
     \
> +      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi=
-id=3D0  \
> +      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,
>
> It seems that the man page of qemu contains no parameter and option yet
> for this feature. The qemu docs, such as [2][3][4] are either not
> up-to-date or "doesn't reflect the current status of the implementation".
> So may I know whether is it still in experimental stage or mature enough
> for use? And even a few further questions:
>
>
> Hello Yu,
>
> We are working on vfio-user for QEMU which would supersede multi-process
> QEMU.
> The vfio-user feature is currently under review for merging with QEMU. We
> would drop
> multi-process QEMU support after the vfio-user changes are merged.
>
> We use the following repo for testing vfio-user before sending the patche=
s
> for
> review. You may be interested in checking it out:
> https://github.com/oracle/qemu/tree/master
>
>
> - When creating the orchestrator, can we specify a machine type such as
> pc-i440fx-7.0 for -machine?
>
>
> For vfio-user, the machine type on the remote QEMU process (server) is
> always =E2=80=9Cx-remote=E2=80=9D. The client QEMU could be of any machin=
e type.
>
> - Can each device has a dedicated emulation process or shares one process
> for emulating multiple devices?
>
>
> Each device could be running in a dedicated process, or multiple
> devices could share one process.
>
> - Can we find more command line examples showing the combination of
> orchestrator, remote emulation process, memory-backend-memfd and
> x-pci-proxy-dev?
>
>
> For vfio-user, we could give you a heads up once they are merged into
> QEMU. We
> are using the following for testing our changes, which you could checkout
> in the meanwhile:
> scripts/vfiouser-launcher.py
>
> Could you please give us more details about what you=E2=80=99re trying to=
 do? Which
> devices are you trying to emulate in the remote process?
>
> Thank you!
> --
> Jag
>
>
> Thank you very much and all the best
>
> Yu Zhang
> 03.06.2022
>
> [1] https://www.qemu.org/docs/master/system/multi-process.html
> [2] https://wiki.qemu.org/Features/MultiProcessQEMU
> [3]
> https://lxr.missinglinkelectronics.com/qemu+v7.0.0/docs/devel/multi-proce=
ss.rst
> [4] https://qemu.readthedocs.io/en/latest/devel/multi-process.html
>
> ---------- Forwarded message ---------
> From: Laurent Vivier <laurent@vivier.eu>
> Date: Fri, Jun 3, 2022 at 4:14 PM
> Subject: Re: about the current status of Multi-process QEMU /
> out-of-process emulation
> To: Yu Zhang <yu.zhang@ionos.com>
>
>
> Hi Yu,
>
> I'm not the author of this documentation, only the person that has merged
> the last change in the repo.
>
> According to the logs you should contact Dongli Zhang <
> dongli.zhang@oracle.com>, Elena Ufimtseva
> <elena.ufimtseva@oracle.com>, John G Johnson <john.g.johnson@oracle.com>
> or Jagannathan Raman
> <jag.raman@oracle.com> .
>
> Thanks,
> Laurent
>
> Le 03/06/2022 =C3=A0 12:17, Yu Zhang a =C3=A9crit :
> > Dear Mr. Vivier,
> >
> > I saw that you authored the QEMU page for "Multi-process QEMU".
> > (https://www.qemu.org/docs/master/system/multi-process.html
> > <https://www.qemu.org/docs/master/system/multi-process.html>)
> >
> > I'm interested in this feature, but feel a little confused with the
> command line:
> >
> > +      /usr/bin/qemu-system-x86_64
>  \
> > +      -machine x-remote
>  \
> > +      -device lsi53c895a,id=3Dlsi0
>   \
> > +      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2
>   \
> > +      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,sc=
si-id=3D0
>  \
> > +      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,
> >
> > It seems that the man page of qemu command contains no parameter and
> option yet for this feature.
> > May I know whether is it still in experimental stage? And even a few
> more questions:
> >
> > - Is "x-remote" a standalone machine type for creating the orchestrator=
?
> > - Can each device has a dedicated emulation process or shares one
> process for emulating multiple
> > devices?
> > - Can I find more command line examples illustrating the combination of
> orchestrator, remote
> > emulation process, memory-backend-memfd and x-pci-proxy-dev?
> >
> > Thank you very much
> > Kind regard
> >
> > Yu Zhang
> > 03.06.2022
>
>
>

--000000000000c97c1b05e0ded750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jag,<br><br>It&#39;s quite nice of you to give me so=
 much details about this feature. I tried with this repo by using the pytho=
n script. The server and client qemu processes are created successfully.<br=
><br>I&#39;m interested in it due to the requirement for higher security le=
vel in cloud environment. We&#39;re taking efforts to enhance the security =
of the VMs and hosts. <br><br>I read on the page below <br><br>=C2=A0 =C2=
=A0<a href=3D"https://www.qemu.org/docs/master/devel/multi-process.html">ht=
tps://www.qemu.org/docs/master/devel/multi-process.html</a><br>=C2=A0 =C2=
=A0<br>that &quot;an attacker who compromised this service would not be abl=
e to use this exploit to access files or devices beyond what the disk servi=
ce was given access to&quot;. This is the feature which can reduce the risk=
 due to a compromised device emulation code.<br><br>It doesn&#39;t matter w=
hich specific device can be emulated in a separated process. It matters tha=
t the device emulation service can be separated from the qemu main process.=
<br><br>Another aspect I&#39;d like to know is, could the multi-processes b=
e live migrated just as the single qemu process?<br><br>Thank you so much f=
or your time and patience.<br>Wish you all the best,<br><br>Yu Zhang<br>07.=
06.2022<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 3, 2022 at 7:37 PM Jag Raman &lt;<a href=3D"mailto:j=
ag.raman@oracle.com">jag.raman@oracle.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">



<div style=3D"overflow-wrap: break-word;">
<br>
<div><br>
<blockquote type=3D"cite">
<div>On Jun 3, 2022, at 11:34 AM, Yu Zhang &lt;<a href=3D"mailto:yu.zhang@i=
onos.com" target=3D"_blank">yu.zhang@ionos.com</a>&gt; wrote:</div>
<br>
<div>
<div dir=3D"ltr">Hello Dongli, Elena, John, and Jagannathan,<br>
<br>
I&#39;m interested in the &quot;multi-process QEMU&quot; feature and got th=
e kind reply by Mr. Vivier that I may contact you for this.<br>
On one of the QEMU docs [1] I saw the command line:<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-system-x86_64 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0-machine x-remote =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0-device lsi53c895a,id=3Dlsi0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0-drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-=
1.qcow2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0-device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=
=3Dlsi0.0,scsi-id=3D0 =C2=A0\<br>
+ =C2=A0 =C2=A0 =C2=A0-object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D=
4,<br>
<br>
It seems that the man page of qemu contains no parameter and option yet for=
 this feature. The qemu docs, such as [2][3][4] are either not up-to-date o=
r &quot;doesn&#39;t reflect the current status of the implementation&quot;.=
=C2=A0
<div>
<div>So may I know whether is it still in experimental stage or mature enou=
gh for use?=C2=A0And even a few further questions:<br>
</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Hello Yu,</div>
<div><br>
</div>
<div>We are working on vfio-user for QEMU which would supersede multi-proce=
ss QEMU.</div>
<div>The vfio-user feature is currently under review for merging with QEMU.=
 We would drop</div>
<div>multi-process QEMU support after the vfio-user changes are merged.</di=
v>
<div><br>
</div>
<div>We use the following repo for testing vfio-user before sending the pat=
ches for</div>
<div>review. You may be interested in checking it out:</div>
<div><a href=3D"https://github.com/oracle/qemu/tree/master" target=3D"_blan=
k">https://github.com/oracle/qemu/tree/master</a></div>
<br>
<blockquote type=3D"cite">
<div>
<div dir=3D"ltr">
<div>
<div><br>
- When creating the orchestrator, can we specify a machine type such as pc-=
i440fx-7.0 for -machine?<br>
</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>For vfio-user, the machine type on the remote QEMU process (server) is=
</div>
<div>always =E2=80=9Cx-remote=E2=80=9D. The client QEMU could be of any mac=
hine type.</div>
<br>
<blockquote type=3D"cite">
<div>
<div dir=3D"ltr">
<div>
<div>- Can each device has a dedicated emulation process or shares one proc=
ess for emulating multiple devices?<br>
</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Each device could be running in a dedicated process, or multiple</div>
<div>devices could share one process.</div>
<br>
<blockquote type=3D"cite">
<div>
<div dir=3D"ltr">
<div>
<div>- Can we find more command line examples showing the combination of or=
chestrator, remote emulation process, memory-backend-memfd and x-pci-proxy-=
dev?</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>For vfio-user, we could give you a heads up once they are merged into =
QEMU. We</div>
<div>are using the following for testing our changes, which you could check=
out</div>
<div>in the meanwhile:</div>
<div>scripts/vfiouser-launcher.py=C2=A0</div>
<div><br>
</div>
<div>Could you please give us more details about what you=E2=80=99re trying=
 to do? Which</div>
<div>devices are you trying to emulate in the remote process?</div>
<div><br>
</div>
<div>Thank you!</div>
<div>--</div>
<div>Jag</div>
<br>
<blockquote type=3D"cite">
<div>
<div dir=3D"ltr">
<div>
<div><br>
</div>
<div>Thank you very much and all the best<br>
<br>
Yu Zhang<br>
03.06.2022</div>
<div><br>
</div>
<div>[1] <a href=3D"https://www.qemu.org/docs/master/system/multi-process.h=
tml" target=3D"_blank">
https://www.qemu.org/docs/master/system/multi-process.html</a></div>
<div>[2]=C2=A0<a href=3D"https://wiki.qemu.org/Features/MultiProcessQEMU" t=
arget=3D"_blank">https://wiki.qemu.org/Features/MultiProcessQEMU</a><br>
<div>[3] <a href=3D"https://lxr.missinglinkelectronics.com/qemu+v7.0.0/docs=
/devel/multi-process.rst" target=3D"_blank">
https://lxr.missinglinkelectronics.com/qemu+v7.0.0/docs/devel/multi-process=
.rst</a><br>
</div>
<div>[4] <a href=3D"https://qemu.readthedocs.io/en/latest/devel/multi-proce=
ss.html" target=3D"_blank">
https://qemu.readthedocs.io/en/latest/devel/multi-process.html</a>=C2=A0</d=
iv>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message --------=
-<br>
From: <strong class=3D"gmail_sendername" dir=3D"auto">Laurent Vivier</stron=
g> <span dir=3D"auto">
&lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.e=
u</a>&gt;</span><br>
Date: Fri, Jun 3, 2022 at 4:14 PM<br>
Subject: Re: about the current status of Multi-process QEMU / out-of-proces=
s emulation<br>
To: Yu Zhang &lt;<a href=3D"mailto:yu.zhang@ionos.com" target=3D"_blank">yu=
.zhang@ionos.com</a>&gt;<br>
</div>
<br>
<br>
Hi Yu,<br>
<br>
I&#39;m not the author of this documentation, only the person that has merg=
ed the last change in the repo.<br>
<br>
According to the logs you should contact Dongli Zhang &lt;<a href=3D"mailto=
:dongli.zhang@oracle.com" target=3D"_blank">dongli.zhang@oracle.com</a>&gt;=
, Elena Ufimtseva
<br>
&lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" target=3D"_blank">elena.u=
fimtseva@oracle.com</a>&gt;, John G Johnson &lt;<a href=3D"mailto:john.g.jo=
hnson@oracle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt; or Ja=
gannathan Raman
<br>
&lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D"_blank">jag.raman@ora=
cle.com</a>&gt; .<br>
<br>
Thanks,<br>
Laurent<br>
<br>
Le 03/06/2022 =C3=A0 12:17, Yu Zhang a =C3=A9crit=C2=A0:<br>
&gt; Dear Mr. Vivier,<br>
&gt; <br>
&gt; I saw that you authored the QEMU page for &quot;Multi-process QEMU&quo=
t;.<br>
&gt; (<a href=3D"https://www.qemu.org/docs/master/system/multi-process.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/sys=
tem/multi-process.html</a>
<br>
&gt; &lt;<a href=3D"https://www.qemu.org/docs/master/system/multi-process.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/=
system/multi-process.html</a>&gt;)<br>
&gt; <br>
&gt; I&#39;m interested in this feature, but feel a little confused with th=
e command line:<br>
&gt; <br>
&gt; + =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-system-x86_64 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-machine x-remote =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0-device lsi53c895a,id=3Dlsi0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-drive id=3Ddrive_image2,file=3D/build/ol7-nvme-=
test-1.qcow2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2=
,bus=3Dlsi0.0,scsi-id=3D0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-object x-remote-object,id=3Drobj1,devid=3Dlsi1,=
fd=3D4,<br>
&gt; <br>
&gt; It seems that the man page of qemu command contains no parameter and o=
ption yet for this feature.
<br>
&gt; May I know whether is it still in experimental stage?=C2=A0And even a =
few more questions:<br>
&gt; <br>
&gt; - Is &quot;x-remote&quot; a standalone machine type for creating the o=
rchestrator?<br>
&gt; - Can each device has a dedicated emulation process or shares one proc=
ess for emulating multiple
<br>
&gt; devices?<br>
&gt; - Can I find more command line examples illustrating the combination o=
f orchestrator, remote
<br>
&gt; emulation process, memory-backend-memfd and x-pci-proxy-dev?<br>
&gt; <br>
&gt; Thank you very much<br>
&gt; Kind regard<br>
&gt; <br>
&gt; Yu Zhang<br>
&gt; 03.06.2022<br>
<br>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<br>
</div>

</blockquote></div>

--000000000000c97c1b05e0ded750--

