Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7748759D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:35:50 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mb7-0000xu-AA
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mWZ-0007x8-7n
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:31:07 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37417
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mWV-0003An-9X
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:31:06 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so11561203pjj.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsHTKTAPUAAEY/+CTtQT1r0c250XQYNJKBf69c1YOEk=;
 b=Nrh3OW06hdguIf1xOyj53pIBFYyBJFQsU1jPnQ0plcdZrECBJwCKQ8b4EMFpnUnUhK
 IP7pahHAGkBExQlupcv2rxmODFsbnXIujxAJjzoZ3zaHL7EFtBPvXQaQSMYvMbq2jFL7
 v9NxnBV5pXVoAtcZ82L1flruJ9YCddWYzAcktFXV2cq6WUWi2b0nuQjtNzZ3Ts8XgFCX
 fbvBbU7t8G+pUuU4FrO2BHG7a8VKDe2YbgZ7baR0AAsEqlOWMrar6S4vDVUIPK2J/nEz
 UeZuLop4bSOXiLA2FC1W5JvCozZetDaVB7AGFso2oO1zFc/qWj1TgkXPVXtSB6UA/Ks8
 J3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsHTKTAPUAAEY/+CTtQT1r0c250XQYNJKBf69c1YOEk=;
 b=m0/RzxrA8gtPmtoMy7jslMRYpecjbE1s74JfZJIHuf0RCCfxlxwEJdyZRx+f0B0clM
 bHDg4vEc+09f3GV2TtWSx21lfAkloMgn/JnJP/KtodJgjNCWxAzNVMfE6e0CP1pu2rJl
 38OCvMtMxEkec8RMS6JKEnXcmb5XbR/BhjmL0zSdmneZ71P9WoS8ncIUIeDln1bepK74
 p8wREjIy1sK3kt2bYGGP4musNbTKcJoaMhmNgtRWBlGRtvqewklweCt5LuA8sDn1yY72
 aPoslxYuHxrMMkNbLf3aqzgSTHOMp/iKU5TxLRbJFqAvMOQPTBNHNBEAnzRectDXtqTe
 k6SA==
X-Gm-Message-State: AOAM531M4MMCBI5M/HryNRYV4THoe6QiTBdRy1ZjrFGnnEQE+xTtVmcl
 OWSBu3xaxB56Rl9XzBllD9qcRyEjzIibT3TgrTk=
X-Google-Smtp-Source: ABdhPJy0pV3eLGSB4K1enPcxjOXUdSjVkbB0/q3ytNr0u3TL+/rmd9lZWAWMz4CjR4f2FyCVInbjk/G4MsyGGv5fTiI=
X-Received: by 2002:a17:902:da8c:b0:148:a2e8:2c11 with SMTP id
 j12-20020a170902da8c00b00148a2e82c11mr61632470plx.96.1641551451862; Fri, 07
 Jan 2022 02:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
 <89b1a68f-7eae-30a6-dba0-ed86e6638ce9@redhat.com>
 <cf5dc700-e0ae-6de9-f4c3-53ce5528accf@redhat.com>
In-Reply-To: <cf5dc700-e0ae-6de9-f4c3-53ce5528accf@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 7 Jan 2022 13:30:41 +0300
Message-ID: <CADO9X9Tr02jN0+bOaJRymjP349bWH1ediNN=fynsPSpmcJBn4Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add vmnet.framework based network backend
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002b393a05d4fb7bb2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: phillip.ennen@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b393a05d4fb7bb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 7 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 08:03, Jason Wang <=
jasowang@redhat.com>:

>
> =E5=9C=A8 2022/1/6 =E4=B8=8B=E5=8D=8812:18, Jason Wang =E5=86=99=E9=81=93=
:
> >
> > =E5=9C=A8 2021/12/11 =E4=B8=8B=E5=8D=886:44, Vladislav Yaroshchuk =E5=
=86=99=E9=81=93:
> >> macOS provides networking API for VMs called 'vmnet.framework':
> >> https://developer.apple.com/documentation/vmnet
> >>
> >> We can provide its support as the new QEMU network backends which
> >> represent three different vmnet.framework interface usage modes:
> >>
> >>    * `vmnet-shared`:
> >>      allows the guest to communicate with other guests in shared mode
> >> and
> >>      also with external network (Internet) via NAT. Has (macOS-provide=
d)
> >>      DHCP server; subnet mask and IP range can be configured;
> >>
> >>    * `vmnet-host`:
> >>      allows the guest to communicate with other guests in host mode.
> >>      By default has enabled DHCP as `vmnet-shared`, but providing
> >>      network unique id (uuid) can make `vmnet-host` interfaces isolate=
d
> >>      from each other and also disables DHCP.
> >>
> >>    * `vmnet-bridged`:
> >>      bridges the guest with a physical network interface.
> >>
> >> This backends cannot work on macOS Catalina 10.15 cause we use
> >> vmnet.framework API provided only with macOS 11 and newer. Seems
> >> that it is not a problem, because QEMU guarantees to work on two most
> >> recent versions of macOS which now are Big Sur (11) and Monterey (12).
> >>
> >> Also, we have one inconvenient restriction: vmnet.framework interfaces
> >> can create only privileged user:
> >> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> >>
> >> Attempt of `vmnet-*` netdev creation being unprivileged user fails wit=
h
> >> vmnet's 'general failure'.
> >>
> >> This happens because vmnet.framework requires `com.apple.vm.networking=
`
> >> entitlement which is: "restricted to developers of virtualization
> >> software.
> >> To request this entitlement, contact your Apple representative." as
> >> Apple
> >> documentation says:
> >>
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
> >>
> >>
> >> One more note: we still have quite useful but not supported
> >> 'vmnet.framework' features as creating port forwarding rules, IPv6
> >> NAT prefix specifying and so on.
> >>
> >> Nevertheless, new backends work fine and tested within
> >> `qemu-system-x86-64`
> >> on macOS Bir Sur 11.5.2 host with such nic models:
> >>    * e1000-82545em
> >>    * virtio-net-pci
> >>    * vmxnet3
> >>
> >> The guests were:
> >>    * macOS 10.15.7
> >>    * Ubuntu Bionic (server cloudimg)
> >>
> >>
> >> This series partially reuses patches by Phillip Tennen:
> >> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com=
/
> >> So I included them signed-off line into one of the commit messages and
> >> also here.
> >
> >
> > Applied.
> >
> > Thanks
>
>
> Reverted actually, though it can be built on macos but not Linux. I see
> thing like:
>
> In file included from qapi/qapi-types-net.c:15:
> qapi/qapi-types-net.h:411:9: error: unknown type name
> =E2=80=98NetdevVmnetHostOptions=E2=80=99
>    411 |         NetdevVmnetHostOptions vmnet_host;
>        |         ^~~~~~~~~~~~~~~~~~~~~~
> qapi/qapi-types-net.h:412:9: error: unknown type name
> =E2=80=98NetdevVmnetSharedOptions=E2=80=99
>    412 |         NetdevVmnetSharedOptions vmnet_shared;
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> qapi/qapi-types-net.h:413:9: error: unknown type name
> =E2=80=98NetdevVmnetBridgedOptions=E2=80=99
>    413 |         NetdevVmnetBridgedOptions vmnet_bridged;
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>
Fixed in v9. There was one more place where
'if': 'CONFIG_VMNET' statement should be added
in the qapi json. Without this malformed qapi sources
were generated.

Not only Linux builds were affected, other non-macOS
platforms also. Sorry for this!

....
>
> Thanks
>
>


--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000002b393a05d4fb7bb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 7 =D1=8F=D0=BD=D0=B2. 2022 =
=D0=B3. =D0=B2 08:03, Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com"=
>jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
=E5=9C=A8 2022/1/6 =E4=B8=8B=E5=8D=8812:18, Jason Wang =E5=86=99=E9=81=93:<=
br>
&gt;<br>
&gt; =E5=9C=A8 2021/12/11 =E4=B8=8B=E5=8D=886:44, Vladislav Yaroshchuk =E5=
=86=99=E9=81=93:<br>
&gt;&gt; macOS provides networking API for VMs called &#39;vmnet.framework&=
#39;:<br>
&gt;&gt; <a href=3D"https://developer.apple.com/documentation/vmnet" rel=3D=
"noreferrer" target=3D"_blank">https://developer.apple.com/documentation/vm=
net</a><br>
&gt;&gt;<br>
&gt;&gt; We can provide its support as the new QEMU network backends which<=
br>
&gt;&gt; represent three different vmnet.framework interface usage modes:<b=
r>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 * `vmnet-shared`:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 allows the guest to communicate with othe=
r guests in shared mode <br>
&gt;&gt; and<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 also with external network (Internet) via=
 NAT. Has (macOS-provided)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 DHCP server; subnet mask and IP range can=
 be configured;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 * `vmnet-host`:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 allows the guest to communicate with othe=
r guests in host mode.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 By default has enabled DHCP as `vmnet-sha=
red`, but providing<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 network unique id (uuid) can make `vmnet-=
host` interfaces isolated<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 from each other and also disables DHCP.<b=
r>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 * `vmnet-bridged`:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 bridges the guest with a physical network=
 interface.<br>
&gt;&gt;<br>
&gt;&gt; This backends cannot work on macOS Catalina 10.15 cause we use<br>
&gt;&gt; vmnet.framework API provided only with macOS 11 and newer. Seems<b=
r>
&gt;&gt; that it is not a problem, because QEMU guarantees to work on two m=
ost<br>
&gt;&gt; recent versions of macOS which now are Big Sur (11) and Monterey (=
12).<br>
&gt;&gt;<br>
&gt;&gt; Also, we have one inconvenient restriction: vmnet.framework interf=
aces<br>
&gt;&gt; can create only privileged user:<br>
&gt;&gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt;&gt;<br>
&gt;&gt; Attempt of `vmnet-*` netdev creation being unprivileged user fails=
 with<br>
&gt;&gt; vmnet&#39;s &#39;general failure&#39;.<br>
&gt;&gt;<br>
&gt;&gt; This happens because vmnet.framework requires `com.apple.vm.networ=
king`<br>
&gt;&gt; entitlement which is: &quot;restricted to developers of virtualiza=
tion <br>
&gt;&gt; software.<br>
&gt;&gt; To request this entitlement, contact your Apple representative.&qu=
ot; as <br>
&gt;&gt; Apple<br>
&gt;&gt; documentation says:<br>
&gt;&gt; <a href=3D"https://developer.apple.com/documentation/bundleresourc=
es/entitlements/com_apple_vm_networking" rel=3D"noreferrer" target=3D"_blan=
k">https://developer.apple.com/documentation/bundleresources/entitlements/c=
om_apple_vm_networking</a> <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; One more note: we still have quite useful but not supported<br>
&gt;&gt; &#39;vmnet.framework&#39; features as creating port forwarding rul=
es, IPv6<br>
&gt;&gt; NAT prefix specifying and so on.<br>
&gt;&gt;<br>
&gt;&gt; Nevertheless, new backends work fine and tested within <br>
&gt;&gt; `qemu-system-x86-64`<br>
&gt;&gt; on macOS Bir Sur 11.5.2 host with such nic models:<br>
&gt;&gt; =C2=A0=C2=A0 * e1000-82545em<br>
&gt;&gt; =C2=A0=C2=A0 * virtio-net-pci<br>
&gt;&gt; =C2=A0=C2=A0 * vmxnet3<br>
&gt;&gt;<br>
&gt;&gt; The guests were:<br>
&gt;&gt; =C2=A0=C2=A0 * macOS 10.15.7<br>
&gt;&gt; =C2=A0=C2=A0 * Ubuntu Bionic (server cloudimg)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This series partially reuses patches by Phillip Tennen:<br>
&gt;&gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip.=
ennen@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/=
QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt;&gt; So I included them signed-off line into one of the commit messages=
 and<br>
&gt;&gt; also here.<br>
&gt;<br>
&gt;<br>
&gt; Applied.<br>
&gt;<br>
&gt; Thanks<br>
<br>
<br>
Reverted actually, though it can be built on macos but not Linux. I see <br=
>
thing like:<br>
<br>
In file included from qapi/qapi-types-net.c:15:<br>
qapi/qapi-types-net.h:411:9: error: unknown type name <br>
=E2=80=98NetdevVmnetHostOptions=E2=80=99<br>
=C2=A0=C2=A0 411 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NetdevVm=
netHostOptions vmnet_host;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~<br>
qapi/qapi-types-net.h:412:9: error: unknown type name <br>
=E2=80=98NetdevVmnetSharedOptions=E2=80=99<br>
=C2=A0=C2=A0 412 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NetdevVm=
netSharedOptions vmnet_shared;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~<br>
qapi/qapi-types-net.h:413:9: error: unknown type name <br>
=E2=80=98NetdevVmnetBridgedOptions=E2=80=99<br>
=C2=A0=C2=A0 413 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NetdevVm=
netBridgedOptions vmnet_bridged;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
<br></blockquote><div><br></div>Fixed in v9. There was one more place where=
</div><div class=3D"gmail_quote">&#39;if&#39;: &#39;CONFIG_VMNET&#39; state=
ment=C2=A0should be added</div><div class=3D"gmail_quote">in the qapi json.=
 Without this malformed qapi sources</div><div class=3D"gmail_quote">were g=
enerated.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Not only Linux builds were affected,=C2=A0other non-macOS=C2=A0</div><d=
iv class=3D"gmail_quote">platforms also. Sorry for this!</div><div class=3D=
"gmail_quote"><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
....<br>
<br>
Thanks<br>=C2=A0=C2=A0<br></blockquote></div><br clear=3D"all"><div><br></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshch=
uk</div></div></div></div></div>

--0000000000002b393a05d4fb7bb2--

