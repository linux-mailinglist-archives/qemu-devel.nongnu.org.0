Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EACD42AB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 19:58:32 +0200 (CEST)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maM2o-00054g-DH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 13:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1maLx3-0002N8-EJ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:52:35 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1maLx0-0003tu-1L
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:52:32 -0400
Received: by mail-qk1-x72e.google.com with SMTP id r15so11988031qkp.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 10:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :accept-language:content-language:mime-version;
 bh=89sitvKGgQwnk58kF4KMc8g336qvv42b5OhiJzOKcmo=;
 b=Osh1yAdGCbSKJ3LrH69sv4GMnRpYK3953EqV/W6vQpuar7G1x5K3sKn1IdI376Mzg2
 UfHYjPUtKS3+cPMMTKpuefjcpVc7ha9evbAW2UFGWtpT9LQp5V2G5ObuTxKebjFZxogI
 Ni9YXIL5YH2brtEJYDzuGvkKzGxIjuWfdCkqq7RhFBGDHgG0P1G/rXjINyFpwmElDfEL
 HfKaEkPTm8soFJp4xh7INaefgyHffUKPGBJlsA1u25KUUuCyOGUhfO/XEPSr7pykcCBz
 MrNhvKiIxwWL3MXDWGVhht422bCEuu21+JFKjdRPRjmek4ZGmZrCgX438o4rMayL7PQy
 4/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:accept-language:content-language:mime-version;
 bh=89sitvKGgQwnk58kF4KMc8g336qvv42b5OhiJzOKcmo=;
 b=bixPyvn5iTrIZLh4fKbI+QDQKp04W85oBuZvsih6fKNb3n2tZIW/rCCWpKWnk7XBv1
 DuNeNMGul2SXKgg+4LIy1wzbb40kdYg0DpgEe7FMIm2I9DUNOppDN5JEt3NCTT+sdSzZ
 kbDXKe4IvpwQJMJRUJEAENqZiOIOgIhqp6OwRJwgGEOSPVajPcMmAAOZfyhJCcZtJNKR
 MkY9Z5uME6JTZZlK4IurlkyVvuulTzosz7NUDMAwX3bdt3rCmkfjD1S4IafoUk/pb2x1
 g+38eIWz8Nj/+R+N4H1dtXcQCTWRyxaaD7NMeb9V3Km1M2uZ8LWZ77Ky5aOJimj6kGKz
 OXnQ==
X-Gm-Message-State: AOAM5337KQ94u+88geE+R0EQYux5ezXAYfDX/viwQwYSyZeNAemzMPr4
 mYzpFMBkAsr9tr+SUglJAAzepiidqOkF+aU4n6K5cfG54duPqui8U1ghzc3fw+6tAvji7+aQs4Z
 ecktlSQd8xGts1VoXQWaRo0Kd8PEOLxF+aDTAeGf/6+PRNZgepEjrWvzhVebV/AB56g==
X-Google-Smtp-Source: ABdhPJxUDrYqWROpEKb9Fpq35bK5rZRxNmcgd9I6xDQZ3Po0Wq5FHiZQQpyFxUbC6/TNc+lqqRsNAg==
X-Received: by 2002:a37:a9c2:: with SMTP id
 s185mr20672991qke.508.1634061146414; 
 Tue, 12 Oct 2021 10:52:26 -0700 (PDT)
Received: from MN2PR14MB4015.namprd14.prod.outlook.com
 ([2603:1036:302:4102::5])
 by smtp.gmail.com with ESMTPSA id a3sm6120559qkh.67.2021.10.12.10.52.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 10:52:25 -0700 (PDT)
From: Nada Lachtar <nlachtar@umich.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Storage controller access to data
Thread-Topic: Storage controller access to data
Thread-Index: AQHXv4l91z0xcxpgPEyohw6rKdMm7g==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 12 Oct 2021 17:52:23 +0000
Message-ID: <MN2PR14MB40158028639DACBC17BFFD4DFDB69@MN2PR14MB4015.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
 boundary="_000_MN2PR14MB40158028639DACBC17BFFD4DFDB69MN2PR14MB4015namp_"
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=nlachtar@umich.edu; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_MN2PR14MB40158028639DACBC17BFFD4DFDB69MN2PR14MB4015namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

I=92m working on a project that requires me to read the data being sent to =
storage and it to a file for analysis. To be more specific, I=92m trying to=
 analyze the data in the phase of being written to the storage disk, thus, =
I=92m trying to read the data when it=92s going through a storage controlle=
r on x86 device. I=92ve been looking into the implementation of different s=
torage controllers, but I need help to pinpoint where I can read such data.

I hope my question is clear. Thank you for your time and help,



--_000_MN2PR14MB40158028639DACBC17BFFD4DFDB69MN2PR14MB4015namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I=92m working on a project that requires me to read =
the data being sent to storage and it to a file for analysis. To be more sp=
ecific, I=92m trying to analyze the data in the phase of being written to t=
he storage disk, thus, I=92m trying to read
 the data when it=92s going through a storage controller on x86 device. I=
=92ve been looking into the implementation of different storage controllers=
, but I need help to pinpoint where I can read such data.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope my question is clear. Thank you for your time=
 and help,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MN2PR14MB40158028639DACBC17BFFD4DFDB69MN2PR14MB4015namp_--

