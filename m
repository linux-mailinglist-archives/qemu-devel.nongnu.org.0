Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077927A05
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:07:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTkdG-0001W6-1j
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:07:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>) id 1hTkc3-0000qQ-Qt
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>) id 1hTkc2-0002lx-SC
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:06:15 -0400
Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10]:62011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>)
	id 1hTkc2-0002hn-BQ; Thu, 23 May 2019 06:06:14 -0400
Received: from cpsps-ews12.kpnxchange.com ([10.94.84.179]) by
	cpsmtpb-ews07.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
	Thu, 23 May 2019 12:06:09 +0200
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
	te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=TPaUtGta c=1 sm=1 tr=0 cx=a_idp_e
	a=LO2mTXPAMClkaqVt2RTykg==:117 a=LO2mTXPAMClkaqVt2RTykg==:17
	a=eIHzyqS2sMcA:10 a=8nJEP1OIZ-IA:10 a=xqWC_Br6kY4A:10
	a=E5NmQfObTbMA:10 a=HncMbvH-hF9fpHxAu3oA:9 a=wPNLvfGTeEIA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.12]) by cpsps-ews12.kpnxchange.com
	over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384);
	Thu, 23 May 2019 12:06:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:content-type:message-id:date:subject:to:from;
	bh=dQCat8ZAYe8CLJv7VORLbgrgLOnjx91tvEE1R5Qiwso=;
	b=O0N9ctex9lOPDD5ADR+Wi09+IZXSaEHvf+JUVmB18QoFkRg6rQPlHCSo6wX4KdlcdM6CypBNInXrB
	VT5s+xVDaYj/Yq0LJwXT7EIgpTaBqFoCuw+YKbn38W8A6exZRaVq89CORMvzm9Zwx9gQMezN7mrSf1
	P5DNNWNv72XgWG6A=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
	by smtp.kpnmail.nl (Halon) with ESMTPS
	id 62d1bb63-7d42-11e9-96e0-00505699772e;
	Thu, 23 May 2019 12:06:09 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
	(192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Thu, 23 May 2019 12:05:41 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
	Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
	15.00.0847.040; Thu, 23 May 2019 12:05:41 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: aspeed qemu question
Thread-Index: AdULwnm8cADYiO1ZRNGvxixzeWIzuQAJZaCAACbA8VAAASgwgACVvbogAJv1XjA=
Date: Thu, 23 May 2019 10:05:40 +0000
Message-ID: <fed595d26ce54222b42e005566b70308@Eltsrv03.Eltan.local>
References: <d0fea426e8b245769f3022dad121c17e@Eltsrv03.Eltan.local>
	<3ee8eb5a-d38c-9570-3da5-a055e9f147e5@kaod.org> 
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginalArrivalTime: 23 May 2019 10:06:09.0351 (UTC)
	FILETIME=[24B94D70:01D5114F]
X-RcptDomain: nongnu.org
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 213.75.39.10
Subject: Re: [Qemu-devel] aspeed qemu question
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello C=E9dric,

I have another question regarding the ASPEED Qemu support. This is regardin=
g the SPI support.

I noticed that in general the fmc_model and the spi_model for the flash dev=
ice are different even though there is only one flash device connected.

I would expect that in this case the models used would be identical.

Can you explain how this is works and how I select the correct model for th=
e fmc and for the spi controller.

Best regards,

Wim Vervoorn





