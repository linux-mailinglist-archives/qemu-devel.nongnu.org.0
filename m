Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2230E522
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:49:37 +0100 (CET)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Q1n-0003bx-PS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daggs@gmx.com>)
 id 1l7LSS-0005Wd-Gi; Wed, 03 Feb 2021 11:56:48 -0500
Received: from mout.gmx.net ([212.227.17.22]:36913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daggs@gmx.com>)
 id 1l7LSQ-00083o-Et; Wed, 03 Feb 2021 11:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612371400;
 bh=wY9epdhClG3pfBMjCONI3dHGDnVcfkwiGJsovbHJ6kI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Fi/XtO/C/8qK9jLO7lNLOuoERnTKBrBN1RfkMCYquwnsNjkiS8P7YcjIZMTxOiRFT
 P6ZrRdzQcuGao1sQiCc1Mf6XIdtElJ+KvIB4MhhOGQLBXAXx8DxEWp0rPenBhjPvAu
 76KD6QnqnkG6bv7Y93RzhIwxkINPSBoOKq0jtJoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [176.231.4.124] ([176.231.4.124]) by web-mail.gmx.net
 (3c-app-mailcom-bs06.server.lan [172.19.170.174]) (via HTTP); Wed, 3 Feb
 2021 17:56:40 +0100
MIME-Version: 1.0
Message-ID: <trinity-936e979a-507c-483e-aabf-37228fb4989d-1612371400065@3c-app-mailcom-bs06>
From: daggs <daggs@gmx.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: cdrom scsi passthough not working well
Content-Type: text/plain; charset=UTF-8
Date: Wed, 3 Feb 2021 17:56:40 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <46ec2226-2e5b-4e73-9b01-4e55f1f1fcbc@redhat.com>
References: <trinity-9b27278b-c96f-472f-a115-9bf29b44c103-1603862318112@3c-app-mailcom-bs15>
 <46ec2226-2e5b-4e73-9b01-4e55f1f1fcbc@redhat.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:oGxqlsPB9VEppAKZtFwO/7Q+VOe4J5qxYD+TOEAGRlrvDgQp+VGXDSzDes6v64e6/L4Kx
 Z/FSncAApNXd57AZsKeLN0X8uZtoWqXhf7TWVgB8QddWX92hK067+1P/O8zVpiCg6CX2MVRMUAqw
 WkJBvGnvRhZwJUfK3UvHnk1sNZA7xbvzEIdfmgizwOm+z6ylEHwabSN9x+IxDmrwvDGnl8KmJHNE
 QqZ/8J53wAz0DeWd5RusGtwn+CKAyxn/3fSHBrezoOaeF91Y4qxC8sw62giKmYcrM6yukOwk5wnV
 Bk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:W0+brmSB1eE=:wxaHIzS9WLtw01J5pRKPOS
 nBFUoTgRE5C2nMGjcRr1dvztT7PU/NpXSZA8oPNr/uZueYYJK1ts1OaAULAt7ksfyvt/oLFud
 6JrmgcDeT3fY5ivHUhyG6jWzehQF24NXeojFyG9S2/nF8XvZeXWssc0/X49akWuEyRJeDe1S4
 bI9tp9fLngE1Wpvn+D1HdOeLWKWxzZkVdV5BFwGhtAnsrRNuU+u13uCqdFAsb2uZw44kASZuN
 fZ4wopdLYOztl6XnWL7yYeUE/V6asQDibCPRFaFx4U1Ty51gnebycMIhs/5rzp2ZphKeynssA
 PDtbJPNEHcOrNtkkxOBVsM6ZYw2chJFCaWoxj/I3ZIL5sY7Dmxz+lUSJ3VBNQFU9rWUxAk/1z
 5/420akkgK3ZAsOCKQp3/yLwkQ8wB+BqYFQcfytqhQ1aLWQZwUoL8YNmt6DGKZ+GczS7SvtnH
 G+V8YQCmImi1M8TPEudr1C1/68pEhQsXhENhWg4rrXOhb8w3vgSj9NlUpjvaqn1+ZbLXVsRdO
 W0Lo31wrOq5rPp8NY0AvU+GiSVhgmhAqNBpAGhl+Lr5SZ2kQEWyLQt7FAKf+P6Tz3TGfufta7
 suzULjZuwm5wo=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=daggs@gmx.com;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Feb 2021 16:45:34 -0500
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greetings Philippe,

> Sent: Wednesday, February 03, 2021 at 6:48 PM
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat=2Ecom>
> To: "daggs" <daggs@gmx=2Ecom>, qemu-discuss@nongnu=2Eorg
> Cc: "qemu-devel" <qemu-devel@nongnu=2Eorg>, "Qemu-block" <qemu-block@non=
gnu=2Eorg>
> Subject: Re: cdrom scsi passthough not working well
>
> Cc'ing qemu-block@ developers=2E
>=20
> On 10/28/20 6:18 AM, daggs wrote:
> > Greetings,
> >=20
> > I have a vm running under qemu 5=2E1=2E0 with a cdrom scsi passthough =
into it=2E
> > I can eject the device in and out but when I insert a disc, is isn't d=
etected and the dmesg on the guest is filled with these prints:
> > [384216=2E443262] sr 0:0:0:0: ioctl_internal_command return code =3D 8=
000002
> > [384216=2E443268] sr 0:0:0:0: Sense Key : 0xb [current]
> > [384216=2E443272] sr 0:0:0:0: ASC=3D0x0 ASCQ=3D0x6
> > [384218=2E504142] sr 0:0:0:0: ioctl_internal_command return code =3D 8=
000002
> > [384218=2E504150] sr 0:0:0:0: Sense Key : 0xb [current]
> > [384218=2E504153] sr 0:0:0:0: ASC=3D0x0 ASCQ=3D0x6
> > [384220=2E561302] sr 0:0:0:0: ioctl_internal_command return code =3D 8=
000002
> > [384220=2E561308] sr 0:0:0:0: Sense Key : 0xb [current]
> > [384220=2E561312] sr 0:0:0:0: ASC=3D0x0 ASCQ=3D0x6
> >=20
> > the vm is uefi q35 based, generated by libvirt 6=2E8=2E0, the cdrom pa=
rt is this:
> > -blockdev {"driver":"host_device","filename":"/dev/sg0","node-name":"l=
ibvirt-2-backend","read-only":true}
> > -device scsi-generic,bus=3Dscsi0=2E0,channel=3D0,scsi-id=3D0,lun=3D0,d=
rive=3Dlibvirt-2-backend,id=3Dhostdev0
> >=20
> > id there something bad with the config or have I encountered a bug?
> >=20
> > Thanks,
> >=20
> > Dagg=2E
> >=20
>=20

I don't have this issue anymore, however, when I enter the cdrom, the read=
 light is blinking for a long time and when it is done, the disc isn't dete=
cted=2E
/dev/sr0 exists, both the drive and cd are good

Dagg=2E
>

