Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3759D311D9A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 15:17:37 +0100 (CET)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8OP1-0005fA-L8
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 09:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l8OJ5-0004zT-53; Sat, 06 Feb 2021 09:11:27 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:49580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l8OIz-0002l7-MQ; Sat, 06 Feb 2021 09:11:26 -0500
Received: from smtp.vodafone.de (smtpa06.fra-mediabeam.com [10.2.0.36])
 by smtpout2.vodafonemail.de (Postfix) with ESMTP id 42E44608E6;
 Sat,  6 Feb 2021 15:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
 s=vfde-smtpout-mb-15sep; t=1612620676;
 bh=kp7u8smFK4vQgWRYupbNWH/ojcByFtzdrJxpADzMcQw=;
 h=From:Subject:Date:References:Cc:In-Reply-To:To;
 b=qUL0bayjjV7HpGno4fKVpeaU7Inn5pXCvuoiWq42UNQBRl7gyepbNmcalwww9J+Ce
 Y/F8YZYx78KTQdvSjcI826A/S8MWOPP4ZPhIzeTGwOxf2bOmNDy/dxLFQk7pRBiCNF
 aSfEOIK51QodDBAoVCNxTkjAZOINx8hor5vT9IhU=
Received: from [10.11.12.25]
 (ipservice-092-218-117-062.092.218.pools.vodafone-ip.de [92.218.117.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id C9431140265;
 Sat,  6 Feb 2021 14:11:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-25B9AED2-0E94-4BD6-A242-1925129C72E4
Content-Transfer-Encoding: 7bit
From: Stefan <stefan-guix@vodafonemail.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
Date: Sat, 6 Feb 2021 15:11:15 +0100
Message-Id: <03D81A4B-DFE7-4B1F-98D6-F2A506E9DD72@vodafonemail.de>
References: <5B52EBE5-2490-4997-B7CB-944DE3F3AB6D@vodafonemail.de>
In-Reply-To: <5B52EBE5-2490-4997-B7CB-944DE3F3AB6D@vodafonemail.de>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailer: iPhone Mail (18D52)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2265
X-purgate-ID: 155817::1612620675-000006DC-1F3C61BA/0/0
Received-SPF: pass client-ip=145.253.239.133;
 envelope-from=stefan-guix@vodafonemail.de; helo=smtpout2.vodafonemail.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MIME_QP_LONG_LINE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail-25B9AED2-0E94-4BD6-A242-1925129C72E4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

ping

http://patchwork.ozlabs.org/project/qemu-devel/patch/60AA0765-53DD-43D1-A3D2=
-75F1778526F6@vodafonemail.de/#2615112

Hi!

I=E2=80=99d like to remind you to this trivial patch to get ioclt(=E2=80=A6,=
 SIOCGIFCONF, =E2=80=A6) working properly on 64 bit target architectures.


Bye

Stefan

--Apple-Mail-25B9AED2-0E94-4BD6-A242-1925129C72E4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><span style=3D"-webkit-text-size-adjust: au=
to;">ping</span><br style=3D"-webkit-text-size-adjust: auto;"><span style=3D=
"-webkit-text-size-adjust: auto;"></span><br><a href=3D"http://patchwork.ozl=
abs.org/project/qemu-devel/patch/60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafo=
nemail.de/#2615112">http://patchwork.ozlabs.org/project/qemu-devel/patch/60A=
A0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de/#2615112</a><br style=3D"-=
webkit-text-size-adjust: auto;"><br style=3D"-webkit-text-size-adjust: auto;=
"><span style=3D"-webkit-text-size-adjust: auto;">Hi!</span><br style=3D"-we=
bkit-text-size-adjust: auto;"><span style=3D"-webkit-text-size-adjust: auto;=
"></span><br style=3D"-webkit-text-size-adjust: auto;"><span style=3D"-webki=
t-text-size-adjust: auto;">I=E2=80=99d like to remind you to this trivial pa=
tch to get ioclt(=E2=80=A6, SIOCGIFCONF, =E2=80=A6) working properly on 64 b=
it target architectures.</span><br style=3D"-webkit-text-size-adjust: auto;"=
><span style=3D"-webkit-text-size-adjust: auto;"></span><br style=3D"-webkit=
-text-size-adjust: auto;"><span style=3D"-webkit-text-size-adjust: auto;"></=
span><br style=3D"-webkit-text-size-adjust: auto;"><span style=3D"-webkit-te=
xt-size-adjust: auto;">Bye</span><br style=3D"-webkit-text-size-adjust: auto=
;"><span style=3D"-webkit-text-size-adjust: auto;"></span><br style=3D"-webk=
it-text-size-adjust: auto;"><span style=3D"-webkit-text-size-adjust: auto;">=
Stefan</span><br></body></html>=

--Apple-Mail-25B9AED2-0E94-4BD6-A242-1925129C72E4--

