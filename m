Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FED343C2E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:58:58 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGOm-0007Ri-KU
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOGNP-00070b-4T
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:57:31 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOGNL-0002c9-H3
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:57:30 -0400
Received: from email.seznam.cz
 by email-smtpc14b.ng.seznam.cz (email-smtpc14b.ng.seznam.cz [10.23.14.165])
 id 44923c4b249d1bf942a1775c; Mon, 22 Mar 2021 09:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616403440;
 bh=+VFcbuWPznL9wzW8dZFEiy/my8vK2zFtroTAmmZjxtE=;
 h=Received:To:Cc:References:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language;
 b=QdqQuQpEyrpPF+zZUJddt3v53Mi19+pJ1zjyi/09C7qEyXXDPp9L5GwEa9JBcbtUM
 7NDXycrCS55yifwaZpzq7cg84ezjVADaAHD3Pb0DQ1DH/o4iFQRsMlUY8QBAe0DJNq
 xok8h4AzhFBe/0oh96RgDITSD9HrgQZ6vKW7AuGg=
Received: from [IPv6:2a01:510:d502:b200:c1b:ad27:bde0:341a]
 (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay28.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Mon, 22 Mar 2021 09:57:17 +0100 (CET)  
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com>
From: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 0/2] block/raw: implemented persistent dirty bitmap and
 ability to dump bitmap content via qapi
Message-ID: <a87aadc1-d795-27cd-35c7-a5c4175df687@patrikjanousek.cz>
Date: Mon, 22 Mar 2021 09:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------2660444B817F14DD0A9770FE"
Content-Language: cs
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------2660444B817F14DD0A9770FE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello, thank you for the quick reply.

On 3/22/21 9:29 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi Patrik!
>
> 20.03.2021 12:32, Patrik Janou=C5=A1ek wrote:
>> Currently, QEMU doesn't support persistent dirty bitmaps for raw forma=
t
>
> That's right, we don't have such feature now.
>
>> and also dirty bitmaps are for internal use only, and cannot be access=
ed
>> using third-party applications.
>
> And that's is not. Bitmaps are accessible through bitmap QMP API
>
> =C2=A0 block-dirty-bitmap-{add,remove,clear,merge}
I know about these commands, but they're useless to me without providing
access to the content of bitmap.
>
> And to retrieve the context of dirty bitmap you can export it through
> NBD protocol (see bitmaps argument in nbd specific options of
> block-export-add command)
Ok, I'll look at it.
>
>> These facts are very limiting
>> in case someone would like to develop their own backup tool becaouse
>> without access to the dirty bitmap it would be possible to implement
>> only full backups.
>
> We do have external incremental backups, based on Qemu bitmap API. But
> it depends of course on qcow2 persistent bitmaps feature.
Yes, I know. And that's the problem. The point of my bachelor thesis is
to implement a backup solution for the raw format.
>
>> And without persistent dirty bitmaps, it wouldn't
>> be possible to keep track of changed data after QEMU is restarted. And=

>> this is exactly what I do as a part of my bachelor thesis. I've
>> developed a tool that is able to create incremental backups of drives
>> in raw format that are LVM volumes (ability to create snapshot is
>> required).
>>
>> Please keep in mind that this is my first submission to such a large
>> project and also the first time when I send patch over the email.
>> So I hope I did it correctly.
>>
>> Patrik Janou=C5=A1ek (2):
>> =C2=A0=C2=A0 block/raw: added support of persistent dirty bitmaps
>> =C2=A0=C2=A0 qapi: implementation of the block-dirty-bitmap-dump comma=
nd
>>
>> =C2=A0 block/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 block/monitor/bitmap-qmp-cmds.c |=C2=A0 61 ++++++++
>> =C2=A0 block/raw-format-bitmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 163 ++++++++++++++++++++
>> =C2=A0 block/raw-format.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 256 ++++++++++++++++++++++++++++++--
>> =C2=A0 block/raw-format.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 50 +++++++
>> =C2=A0 qapi/block-core.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 64 +++++++-
>> =C2=A0 6 files changed, 583 insertions(+), 12 deletions(-)
>> =C2=A0 create mode 100644 block/raw-format-bitmap.c
>> =C2=A0 create mode 100644 block/raw-format.h
>>
>
>
Patrik=C2=A0Janou=C5=A1ek

I=C4=8CO: 09291849


	+420 724 123 897 <tel:+420 724 123 897>

	pj@patrikjanousek.cz <mailto:pj@patrikjanousek.cz>


--------------2660444B817F14DD0A9770FE
Content-Type: multipart/related;
 boundary="------------AF18D4E68AD6C022094A8651"


--------------AF18D4E68AD6C022094A8651
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello, thank you for the quick reply.<br>
    </p>
    <div class="moz-cite-prefix">On 3/22/21 9:29 AM, Vladimir
      Sementsov-Ogievskiy wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com">Hi
      Patrik!
      <br>
      <br>
      20.03.2021 12:32, Patrik Janoušek wrote:
      <br>
      <blockquote type="cite">Currently, QEMU doesn't support persistent
        dirty bitmaps for raw format
        <br>
      </blockquote>
      <br>
      That's right, we don't have such feature now.
      <br>
      <br>
      <blockquote type="cite">and also dirty bitmaps are for internal
        use only, and cannot be accessed
        <br>
        using third-party applications.
        <br>
      </blockquote>
      <br>
      And that's is not. Bitmaps are accessible through bitmap QMP API
      <br>
      <br>
        block-dirty-bitmap-{add,remove,clear,merge}
      <br>
    </blockquote>
    I know about these commands, but they're useless to me without
    providing access to the content of bitmap.<br>
    <blockquote type="cite"
      cite="mid:09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com">
      <br>
      And to retrieve the context of dirty bitmap you can export it
      through NBD protocol (see bitmaps argument in nbd specific options
      of block-export-add command)
      <br>
    </blockquote>
    Ok, I'll look at it.<br>
    <blockquote type="cite"
      cite="mid:09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com">
      <br>
      <blockquote type="cite">These facts are very limiting
        <br>
        in case someone would like to develop their own backup tool
        becaouse
        <br>
        without access to the dirty bitmap it would be possible to
        implement
        <br>
        only full backups.
        <br>
      </blockquote>
      <br>
      We do have external incremental backups, based on Qemu bitmap API.
      But it depends of course on qcow2 persistent bitmaps feature.
      <br>
    </blockquote>
    Yes, I know. And that's the problem. The point of my bachelor thesis
    is to implement a backup solution for the raw format.<br>
    <blockquote type="cite"
      cite="mid:09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com">
      <br>
      <blockquote type="cite">And without persistent dirty bitmaps, it
        wouldn't
        <br>
        be possible to keep track of changed data after QEMU is
        restarted. And
        <br>
        this is exactly what I do as a part of my bachelor thesis. I've
        <br>
        developed a tool that is able to create incremental backups of
        drives
        <br>
        in raw format that are LVM volumes (ability to create snapshot
        is
        <br>
        required).
        <br>
        <br>
        Please keep in mind that this is my first submission to such a
        large
        <br>
        project and also the first time when I send patch over the
        email.
        <br>
        So I hope I did it correctly.
        <br>
        <br>
        Patrik Janoušek (2):
        <br>
           block/raw: added support of persistent dirty bitmaps
        <br>
           qapi: implementation of the block-dirty-bitmap-dump command
        <br>
        <br>
          block/meson.build               |   1 +
        <br>
          block/monitor/bitmap-qmp-cmds.c |  61 ++++++++
        <br>
          block/raw-format-bitmap.c       | 163 ++++++++++++++++++++
        <br>
          block/raw-format.c              | 256
        ++++++++++++++++++++++++++++++--
        <br>
          block/raw-format.h              |  50 +++++++
        <br>
          qapi/block-core.json            |  64 +++++++-
        <br>
          6 files changed, 583 insertions(+), 12 deletions(-)
        <br>
          create mode 100644 block/raw-format-bitmap.c
        <br>
          create mode 100644 block/raw-format.h
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <div class="moz-signature">
      <table class="sc-gPEVay eQYmiW" style="vertical-align:
        -webkit-baseline-middle; font-size: medium; font-family: Arial;"
        cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td>
              <table class="sc-gPEVay eQYmiW" style="vertical-align:
                -webkit-baseline-middle; font-size: medium; font-family:
                Arial;" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td style="padding: 0px; vertical-align: middle;">
                      <p color="#000000" class="sc-fBuWsC eeihxG"
                        style="margin: 0px;font-size: 14px;font-weight:
                        bold;color: rgb(0, 0, 0);"><span>Patrik</span><span> </span><span>Janoušek</span></p>
                      <p color="#000000" font-size="medium"
                        class="sc-eqIVtm kRufpp" style="color: rgb(0, 0,
                        0);margin: 0px;font-size: 12px;line-height:
                        22px;"><span>IČO: 09291849</span></p>
                      <table class="sc-gPEVay eQYmiW"
                        style="vertical-align:
                        -webkit-baseline-middle;font-size:
                        medium;font-family: Arial;width:
                        100%;margin-top: 10px;" cellspacing="0"
                        cellpadding="0">
                        <tbody>
                          <tr>
                            <td color="#54a2f2" direction="horizontal"
                              class="sc-jhAzac hmXDXQ" style="width:
                              100%; border-bottom: 1px solid rgb(84,
                              162, 242); border-left: none; display:
                              block;" height="1"><br>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      <table class="sc-gPEVay eQYmiW"
                        style="vertical-align:
                        -webkit-baseline-middle;font-size:
                        medium;font-family: Arial;" cellspacing="0"
                        cellpadding="0">
                        <tbody>
                          <tr style="vertical-align: middle;"
                            height="25">
                            <td style="vertical-align: middle;"
                              width="30">
                              <table class="sc-gPEVay eQYmiW"
                                style="vertical-align:
                                -webkit-baseline-middle; font-size:
                                medium; font-family: Arial;"
                                cellspacing="0" cellpadding="0">
                                <tbody>
                                  <tr>
                                    <td style="vertical-align: bottom;"><span
                                        color="#54a2f2" width="11"
                                        class="sc-jlyJG bbyJzT"
                                        style="display: block;
                                        background-color: rgb(84, 162,
                                        242);"><img
                                          src="cid:part1.7B719948.5AA7E82F@patrikjanousek.cz"
                                          color="#54a2f2"
                                          class="sc-iRbamj blSEcj"
                                          style="display: block;
                                          background-color: rgb(84, 162,
                                          242);" width="13"></span></td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                            <td style="padding: 0px; color: rgb(0, 0,
                              0);"><a href="tel:+420 724 123 897"
                                color="#000000" class="sc-gipzik iyhjGb"
                                style="text-decoration: none; color:
                                rgb(0, 0, 0); font-size: 12px;"><span>+420
                                  724 123 897</span></a></td>
                          </tr>
                          <tr style="vertical-align: middle;"
                            height="25">
                            <td style="vertical-align: middle;"
                              width="30">
                              <table class="sc-gPEVay eQYmiW"
                                style="vertical-align:
                                -webkit-baseline-middle; font-size:
                                medium; font-family: Arial;"
                                cellspacing="0" cellpadding="0">
                                <tbody>
                                  <tr>
                                    <td style="vertical-align: bottom;"><span
                                        color="#54a2f2" width="11"
                                        class="sc-jlyJG bbyJzT"
                                        style="display: block;
                                        background-color: rgb(84, 162,
                                        242);"><img
                                          src="cid:part3.778A8751.4A1C40AD@patrikjanousek.cz"
                                          color="#54a2f2"
                                          class="sc-iRbamj blSEcj"
                                          style="display: block;
                                          background-color: rgb(84, 162,
                                          242);" width="13"></span></td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                            <td style="padding: 0px;"><a
                                href="mailto:pj@patrikjanousek.cz"
                                color="#000000" class="sc-gipzik iyhjGb"
                                style="text-decoration: none; color:
                                rgb(0, 0, 0); font-size: 12px;"><span>pj@patrikjanousek.cz</span></a></td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>

--------------AF18D4E68AD6C022094A8651
Content-Type: image/png;
 name="kaohbpgmkipimblo.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.7B719948.5AA7E82F@patrikjanousek.cz>
Content-Disposition: inline;
 filename="kaohbpgmkipimblo.png"

iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAQAAAD8fJRsAAAAeElEQVR4AQXBoQ3CAAAAwU+Q
LECDxVYUwRgEhWAIEuYiQTAL6QR13aDmuMvmbrIAAORZcrIAADlWyRkAyFAlDwAgt5KrDQDI
u+QHABAuMloBgDDby2jF5mGyEPjayejnWnKyBPjaV1WVTAGYXaqq5B4A+Lg5GLxsf0ch2ZQh
OuUBAAAAAElFTkSuQmCC
--------------AF18D4E68AD6C022094A8651
Content-Type: image/png;
 name="biakegienjdedpnc.png"
Content-Transfer-Encoding: base64
Content-ID: <part3.778A8751.4A1C40AD@patrikjanousek.cz>
Content-Disposition: inline;
 filename="biakegienjdedpnc.png"

iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAQAAAD8fJRsAAAAcUlEQVR42pWPsQmAMBREbwAD
Fs5hI2aAqJXgCg6UQS2EkEzwLKJiBAv/VXeveHzxcfoGnob6lQYvDJYePWKxGCEcEXfPZ8tl
IZ3IkVjQBVZ2IjMzkZ31AgOBlomNjZGWwIiyvCvkXZZ7TDELUeH1+/MDOILUFTkKgt8AAAAA
SUVORK5CYII=
--------------AF18D4E68AD6C022094A8651--

--------------2660444B817F14DD0A9770FE--

