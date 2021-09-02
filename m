Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87D3FEDE2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:38:02 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlyj-00038B-6o
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mLlx2-0001gh-FC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:36:17 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mLlx0-0005Ov-GU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:36:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z5so3537239ybj.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8pcWUZ3Ndl2FCE9Y6MCBRM/4I2NcxdYkIcEl0VaPf7I=;
 b=Pg68SVUFvm8wBrG2eKr8vaYJC50sIg1GDZgSmlbzeGFSTuT5lLz/a4DkiCGKKqzDAQ
 0OoJcWFkRPCRy0sg32ZGBOAnNVOFRx98+EJdeaktyXily2doz1+Y/7JnZDYW88iObBhL
 I/zbonDh4KgHs1K0xuaRyw+prX/7EqgY24XM3MZcuhC0niDb8PSMZIrGU8mZBxE+Kt3x
 7qgZLNcKIICCWAgLb1G+GIN5RYZWhJ3Wv5VItu50zJz3Yczkvja6THojtDSJLBHA2zXI
 QWAKwroctUOwk4oXlTogJX6r7wpY/KVApD9p6Kp/mbdfdz4b35yiBqhpx30wL6rtMzqZ
 z23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8pcWUZ3Ndl2FCE9Y6MCBRM/4I2NcxdYkIcEl0VaPf7I=;
 b=qDa5SnkB5QNlPbKh1aOJaFjXdjsvnfgRunLVxYGAUKmGv9G8bdiDIT7tysVavWPoQ4
 EhtLu5/v3CC+LPMyFxkyrPGWm+kAjmHln5cQhXIzlc2vkz+rq0hs9o4UFvqGlxsp/zPt
 jZiA93KUKf0ncMi+xEK2MgNxDQe6YEvVJ8/8tfmA5D/HgLHxCTk4oqr7+FAnUiVktrKR
 DB1B86j5OEwl1p2D79jjw1C80MGj7B4cwFPP1QFmx/xCXgWunw8OuUzLaXQ6sgayPvKh
 ta7ZjApulsyIIh2zgB/4I91AQMMLDd6UOGlkczuzGq4wwh/MTml5EFGMkfsfAO5L5nuE
 8OjQ==
X-Gm-Message-State: AOAM531dql7X9pC74TGYwLvA+fpgYGkoGUuld2uvzZm7G55brfopdMIH
 yMBXelBBYG10LUKrRq4Ag5cwAUR+TEi8bVS792G7IDfjriItQPTY
X-Google-Smtp-Source: ABdhPJyJm7wHgLUTln48xLK2vinHnd5UAYgucagjNKldp5G7KcfNAtF957Pzc4FeCaf0STbQay0HsnFoU5OcBDHyWrY=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr4102059ybm.345.1630586172004; 
 Thu, 02 Sep 2021 05:36:12 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 2 Sep 2021 15:36:01 +0300
Message-ID: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
Subject: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008ef4cd05cb026d5d"
Received-SPF: none client-ip=2607:f8b0:4864:20::b31;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <michael.roth@amd.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008ef4cd05cb026d5d
Content-Type: text/plain; charset="UTF-8"

Hi Team,

We have several bugs related to 'guest-get-osinfo' command in Windows Guest
Agent:
https://bugzilla.redhat.com/show_bug.cgi?id=1998919
https://bugzilla.redhat.com/show_bug.cgi?id=1972070

This command returns the following data:
{
"name": "Microsoft Windows",
"kernel-release": "20344",
"version": "N/A",
"variant": "server",
"pretty-name": "Windows Server 2022 Datacenter",
"version-id": "N/A",
"variant-id": "server",
"kernel-version": "10.0",
"machine": "x86_64",
"id": "mswindows"
}

The problem is with "version" and "pretty-name". Windows Server
2016/2019/2022 and Windows 11 have the same MajorVersion ("kernel-version")
= 10, so to get pretty-name the guest agent uses a conversion matrix
between Windows build and name (
https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170
).

This solution has several problems: need to update the conversion matrix
for each Windows build, one Windows name can have different build numbers.
For example, Windows Server 2022 (preview) build number is 20344, Windows
Server 2022 build number is 20348.

There are two possible solutions:
1. Use build number range instead of one number. Known implementation
issue: Microsoft provides a table (
https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info)
only with stable build numbers. So, we exactly don't know the build number
range.

2. We can read this string from the registry
(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion). Known
implementation issues: ProductName value is localized (in a Russian version
of Windows, the word "Microsoft' is translated), so we should ignore it.
ReleaseId value does not equal to Windows Server version (for Windows
Server 2019, ReleaseId is 1809)

In conclusion, I have the next questions:
What solution we should implement to get the Windows release name?
Does someone know how end-users use this information? Should it be English
only or it can be localized? Should we have exactly the same output as now?
What should we do with the 'Standard' server edition? Currently, the guest
agent always returns 'Datacenter'.

Best wishes,
Kostiantyn Kostiuk

--0000000000008ef4cd05cb026d5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,<br></div><div><br></div><di=
v>We have several bugs related to &#39;guest-get-osinfo&#39; command in Win=
dows Guest Agent: <br></div><div><a href=3D"https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1998919" target=3D"_blank">https://bugzilla.redhat.com/show_=
bug.cgi?id=3D1998919</a></div><div><a href=3D"https://bugzilla.redhat.com/s=
how_bug.cgi?id=3D1972070" target=3D"_blank">https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1972070</a></div><div><br></div><div>This command returns th=
e following data:</div><div>{</div><div>&quot;name&quot;: &quot;Microsoft W=
indows&quot;,</div><div>&quot;kernel-release&quot;: &quot;20344&quot;,</div=
><div>&quot;version&quot;: &quot;N/A&quot;,</div><div>&quot;variant&quot;: =
&quot;server&quot;, <br></div><div>&quot;pretty-name&quot;: &quot;Windows S=
erver 2022 Datacenter&quot;,</div><div>&quot;version-id&quot;: &quot;N/A&qu=
ot;,</div><div>&quot;variant-id&quot;: &quot;server&quot;,</div><div>&quot;=
kernel-version&quot;: &quot;10.0&quot;,</div><div>&quot;machine&quot;: &quo=
t;x86_64&quot;,</div><div>&quot;id&quot;: &quot;mswindows&quot;</div><div>}=
</div><div><br></div><div>The
 problem is with &quot;version&quot; and &quot;pretty-name&quot;. Windows S=
erver=20
2016/2019/2022 and Windows 11 have the same MajorVersion=20
(&quot;kernel-version&quot;) =3D 10, so to get pretty-name the guest agent =
uses a=20
conversion matrix between Windows build and name (<a href=3D"https://github=
.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-w=
in32.c#L2170">https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4=
e3526e353d8b6/qga/commands-win32.c#L2170</a>).<br></div><div><br></div><div=
><span lang=3D"en"><span><span>This solution has several problems</span></s=
pan></span>:
 need to update the conversion matrix for each Windows build, one=20
Windows name can have different build numbers. For example, Windows=20
Server 2022 (preview) build number is 20344, Windows Server 2022 build numb=
er is 20348.</div><div><br></div><div>There are two possible solutions:</di=
v><div>1. Use build number range instead of one number. Known implementatio=
n issue: Microsoft provides a table (<a href=3D"https://docs.microsoft.com/=
en-Us/windows-server/get-started/windows-server-release-info" target=3D"_bl=
ank">https://docs.microsoft.com/en-Us/windows-server/get-started/windows-se=
rver-release-info</a>) only with stable build numbers. So, we exactly don&#=
39;t know the build number range.</div><div><br></div><div>2. We can read t=
his string from the registry (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
 NT\CurrentVersion). Known implementation issues: ProductName value is loca=
lized (in a Russian version of Windows, the word &quot;Microsoft&#39; is tr=
anslated), so we should ignore it. ReleaseId value does not equal to=20
Windows Server version (for Windows Server 2019, ReleaseId is 1809)</div><d=
iv><br></div><div>In conclusion, I have the next questions: <br></div><div>=
What solution we should implement to get the Windows release name?</div><di=
v>Does someone know how end-users use this information? Should it be Englis=
h only or it can be localized? Should we have exactly the same output as no=
w? <br></div><div>What should we do with the &#39;Standard&#39; server edit=
ion? Currently, the guest agent always returns &#39;Datacenter&#39;.</div><=
div><br></div><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Best wishes,</div=
><div>Kostiantyn Kostiuk</div></div></div></div></div></div>

--0000000000008ef4cd05cb026d5d--

