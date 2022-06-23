Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6505584A2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:45:34 +0200 (CEST)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QtZ-0004Ld-OV
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1o4Qr3-0002vu-SL
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:42:57 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1o4Qr1-0005HI-WC
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:42:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id go6so327943pjb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :accept-language:content-language:mime-version;
 bh=ZGmACSi7DJ7m00rAggYm2bkIdJ5m3wcnPYtryUggYYk=;
 b=YJ9bdUEnR0oNN4scef+fISHP3Vz49ubh5vE6fBxRtkdBf4habPFivQrl95DctmQqnh
 PX51jC7gUU35Ow7oY2C7+9isA9Mj4mC+ptu0Ge6cOyWCL6uY2wWTsL626MzUofexb1G1
 Nn5nYdmc6jDk2pC6L9f5Mr55wECSRx93h2P5G2CbBLGFa6vh4E5Jd9ZlGVzzb6plISH5
 Y4rBS1HdAWGlsSKDX8oY4GtZc9X3whoogVsa1she0CzvmXYWdqxbBWXgE8jeBLTqViB1
 YtpSgSRKJ+5j6DVoj/tgG3TQ+1vHnjNJAkoIeUowi4NqtWlQomHjlZ04KWVZr2igKnOC
 WptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:accept-language:content-language:mime-version;
 bh=ZGmACSi7DJ7m00rAggYm2bkIdJ5m3wcnPYtryUggYYk=;
 b=L080SW+ayIBMWzZmderumbD1v1PMb0lG/GA5ro8L2O15sBcXiK3QuBkqzlYbr6jAxL
 0Kqc2Z5UjpA34go9XIH0OzMISOduUzc3+BOgJmlihs+22/4gO3wzoDxfA4Fi9x6c8CD3
 ykMmiKszXRiWSRA5agqYjpgI+6eBFnRlrsT0SBxFoK2B9ol2JbzSGhFJpFoYKAOGsk8+
 avZs/MmztUNfdMz8Lvmq5MczuX+b2xjm3004zzrHsKTYMwgERnNAD/44LTLN2sZ8JAKL
 Wer6m4WVKp2nebIQJtgrW28VqcY2/VVkCahGw96fMIhcN9xVFF0TegYf1TAoJRBgku2U
 8uWQ==
X-Gm-Message-State: AJIora8P00d+teTTEB388aw/hDgZZtcXU6erc9mTHJDLtmeAPvo4pBck
 A4Yc0KML/rerXJvBFC+vEiKnxRq7qfVT3wv1SJZpr+KmqN/rMeMTD/I0pJdk892ZAn3FtOxLVRa
 EahWQYds8zYFSfAQAM4SJT+Y4zVmzTGqr49zJo0iNjEbQStVNRKsrMAyb8E/b1XP5dQ==
X-Google-Smtp-Source: AGRyM1vQxTyVoUgdcwwP2WO2hdumwdHpMDTi+IlIF1GVH/rUiopjui6ULavopczxQq/ChF+jsWDy4g==
X-Received: by 2002:a17:90b:3b50:b0:1ec:eff8:462d with SMTP id
 ot16-20020a17090b3b5000b001eceff8462dmr5100419pjb.189.1656006170277; 
 Thu, 23 Jun 2022 10:42:50 -0700 (PDT)
Received: from SJ0P220MB0738.NAMP220.PROD.OUTLOOK.COM ([2603:1036:307:4961::5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902b58b00b0015e8d4eb26esm67998pls.184.2022.06.23.10.42.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jun 2022 10:42:49 -0700 (PDT)
From: Nada Lachtar <nlachtar@umich.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Question about RAM and block data
Thread-Topic: Question about RAM and block data
Thread-Index: AQHYhygRXZ+kkZHsOEa6KZXyP8IPZA==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 23 Jun 2022 17:42:48 +0000
Message-ID: <SJ0P220MB07380663FDD6E5513511D285FDB59@SJ0P220MB0738.NAMP220.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
 boundary="_000_SJ0P220MB07380663FDD6E5513511D285FDB59SJ0P220MB0738NAMP_"
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=nlachtar@umich.edu; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--_000_SJ0P220MB07380663FDD6E5513511D285FDB59SJ0P220MB0738NAMP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

I=92m trying to trace the physical address in the RAM for some data that is=
 being written to a block device. I have access to the QEMUIOVector buffer =
that hold that data. However, I=92m not sure how to trace how=92s it being =
written from the RAM to the buffer, and how to get the physical address for=
 the data in the RAM if possible?

I hope you can help me with this,

Thank you,


--_000_SJ0P220MB07380663FDD6E5513511D285FDB59SJ0P220MB0738NAMP_
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
<p class=3D"MsoNormal">I=92m trying to trace the physical address in the RA=
M for some data that is being written to a block device. I have access to t=
he QEMUIOVector buffer that hold that data. However, I=92m not sure how to =
trace how=92s it being written from the
 RAM to the buffer, and how to get the physical address for the data in the=
 RAM if possible?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope you can help me with this,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0P220MB07380663FDD6E5513511D285FDB59SJ0P220MB0738NAMP_--

