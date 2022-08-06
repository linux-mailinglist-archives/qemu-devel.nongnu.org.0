Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A458B6D3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 18:28:32 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKMf9-0000gF-9o
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 12:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1oKMdl-0007cg-4y
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 12:27:05 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nlachtar@umich.edu>)
 id 1oKMdj-000299-4A
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 12:27:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id c24so232126pgg.11
 for <qemu-devel@nongnu.org>; Sat, 06 Aug 2022 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:content-language:accept-language:message-id:date
 :thread-index:thread-topic:subject:to:from:from:to:cc;
 bh=pmP+EfQYm55O/Kd9YNhj7BI/htfWUFm7FY4IZxPiF88=;
 b=HKRcGNF2xCZlNQzVu2WT5DgFZ01ayJL+WLtuL+hVJ+4WXe+x1eO/WtUgCttRdbdW0H
 lct0xY0xdMAl8uClo3qlp253Z3bX56ca/5ryix1p807xlvXFHcOy4v+FRlpcVeJLRpmV
 fhAHfHD/aCYAq1U6hHf4WNcREQcLz1yOtG5pJZA64WhpLKH9OHjCa2GZOsJKvkDw40Ca
 wIeTKblP9xHKyrqfHxUSU5YYNaSc8sHXF+dlHjYb/h8YQGScng0XjncxAcpqh5Zs1TUn
 ufseSjtbu0DE08+KBCv2XfM0KkHr8Nl9dRhEZ+yWE6mBu8hrhCEFoqL9QAfU4Dd6JsKa
 rEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:content-language:accept-language:message-id:date
 :thread-index:thread-topic:subject:to:from:x-gm-message-state:from
 :to:cc;
 bh=pmP+EfQYm55O/Kd9YNhj7BI/htfWUFm7FY4IZxPiF88=;
 b=lYs5B76Wv5PravFNkQrkXyMY3cR8NTUC1eQamJfzagWuzflqb4D7VMVlNEgN0HuCfa
 kv3TmhT/ZN7/zl5x4ehqeLDhA+kHUjBEmpgWXyqQQB9REwmiFc0LqKIcJa6orOYAjZbj
 mxCBXSFgHVXM+HuHVokL8IRjgNIgKp3vzC953zkCI3QiC2872e0jvTA6Ue3im61tqeu4
 ZMW4PeloXFrvHv4D2ktYO+MvM4Xw0i1DGtt4wC6BcvB4hHv3rXXDVgH6CGh/XPTFp4G9
 5N2x9Up0swpAZV+x0RpMme3gSiiHr+86Vyzcxps4labna0LMSqAiVFrWddwBL4RZVVPV
 HDLA==
X-Gm-Message-State: ACgBeo1XJzQ+t+h2dxCyuRxMQNCAzjYbcbDDBcThS86+DUQC5bM7VZdX
 dhDpzVXvvvEifzMK9oteu7JAdWbx5V+xqx+7jrCZjl7MLN6PFAUTnBCy0mTIErwmkk3bdgw6pHB
 VA7cTq3+28ltaE/6B0MISUgD/nVXc03WG9sf06h2CWiIV0OhIr5iiPaWbPiRti0rzXw==
X-Google-Smtp-Source: AA6agR6mUj7fYNM6v3ICjlNQ40T7BvUwiRvLtYOit4HaRIem2A28q+0YQPwX6iuOPV3LiD2h305MCw==
X-Received: by 2002:a63:2110:0:b0:41d:234f:16aa with SMTP id
 h16-20020a632110000000b0041d234f16aamr4492370pgh.481.1659803216689; 
 Sat, 06 Aug 2022 09:26:56 -0700 (PDT)
Received: from PH0P220MB0747.NAMP220.PROD.OUTLOOK.COM ([2603:1036:30c:112::5])
 by smtp.gmail.com with ESMTPSA id
 ne9-20020a17090b374900b001f30bf6346csm7575161pjb.30.2022.08.06.09.26.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Aug 2022 09:26:56 -0700 (PDT)
From: Nada Lachtar <nlachtar@umich.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Read/write into the guest RAM
Thread-Topic: Read/write into the guest RAM
Thread-Index: AQHYqbB+vlCVGX47kUamE6/jFIyF+Q==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sat, 6 Aug 2022 16:26:53 +0000
Message-ID: <PH0P220MB0747DBDCD24E5F5F7F44877DFD619@PH0P220MB0747.NAMP220.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
 boundary="_000_PH0P220MB0747DBDCD24E5F5F7F44877DFD619PH0P220MB0747NAMP_"
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=nlachtar@umich.edu; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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

--_000_PH0P220MB0747DBDCD24E5F5F7F44877DFD619PH0P220MB0747NAMP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

Can I get some clarity about the fast path load/store to RAM memory for  x8=
6 systems guest? I would like to understand more about how Qemu read/write =
into the guest RAM?

I=92m trying to implement a type of cache to record the addresses being acc=
essed by load/store instructions.

Thank you,


--_000_PH0P220MB0747DBDCD24E5F5F7F44877DFD619PH0P220MB0747NAMP_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can I get some clarity about the fast path load/stor=
e to RAM memory for &nbsp;x86 systems guest? I would like to understand mor=
e about how Qemu read/write into the guest RAM?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I=92m trying to implement a type of cache to record =
the addresses being accessed by load/store instructions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH0P220MB0747DBDCD24E5F5F7F44877DFD619PH0P220MB0747NAMP_--

