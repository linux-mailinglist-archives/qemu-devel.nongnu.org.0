Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FC590C5B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 09:16:22 +0200 (CEST)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMOu5-0007Vk-DT
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 03:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oMOq8-00055f-M9
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 03:12:16 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:56274
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oMOq3-0001hn-Vb
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 03:12:14 -0400
Received: from [192.168.179.7] (unknown [77.47.17.210])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id F3AA1DA046A;
 Fri, 12 Aug 2022 09:12:06 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------sboAGHBP2BpiWhjnVWEaG9DS"
Message-ID: <f2db0a9c-37d4-f403-c518-0aca03baa633@weilnetz.de>
Date: Fri, 12 Aug 2022 09:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: Missing dll
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Butler <peter-butler@comcast.net>, qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>
References: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
 <a2c919f2-514e-834b-3271-2d7a46aeb4ac@amsat.org>
In-Reply-To: <a2c919f2-514e-834b-3271-2d7a46aeb4ac@amsat.org>
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

This is a multi-part message in MIME format.
--------------sboAGHBP2BpiWhjnVWEaG9DS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.08.22 um 01:34 schrieb Philippe Mathieu-Daudé:

> Cc'ing qemu-windows@ team
>
> On 10/8/22 23:42, Peter Butler wrote:
>> In x64 win10 I today I d/l QEMU into new directory. Then navigated to 
>> that dir and…
>>
>> qemu-system-aarch64 -boot d -cdrom 
>> f:\Downloads\debian-11.4.0-arm64-netinst.iso -m 2048
>>
>> Error message:…libncursesw6.dll not found…


This should be fixed since 2022-08-09. From notes on 
https://qemu.weilnetz.de/w64/:


      History

*2022-08-09*: New QEMU installers (7.1.0-rc1). Added missing DLL files.

*2022-08-05*: New QEMU installers (7.1.0-rc1). Missing DLL files.

*
*


--------------sboAGHBP2BpiWhjnVWEaG9DS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Am 12.08.22 um 01:34 schrieb Philippe Mathieu-Daudé:<br>
    </p>
    <blockquote type="cite"
      cite="mid:a2c919f2-514e-834b-3271-2d7a46aeb4ac@amsat.org">Cc'ing
      qemu-windows@ team
      <br>
      <br>
      On 10/8/22 23:42, Peter Butler wrote:
      <br>
      <blockquote type="cite">In x64 win10 I today I d/l QEMU into new
        directory. Then navigated to that dir and…
        <br>
        <br>
        qemu-system-aarch64 -boot d -cdrom
        f:\Downloads\debian-11.4.0-arm64-netinst.iso -m 2048
        <br>
        <br>
        Error <a class="moz-txt-link-freetext" href="message:…libncursesw6.dll">message:…libncursesw6.dll</a> not found…
        <br>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <p>This should be fixed since 2022-08-09. From notes on
      <a class="moz-txt-link-freetext" href="https://qemu.weilnetz.de/w64/">https://qemu.weilnetz.de/w64/</a>:</p>
    <h3>History</h3>
    <p><strong>2022-08-09</strong>: New QEMU installers (7.1.0-rc1).
      Added missing DLL files.</p>
    <p><strong>2022-08-05</strong>: New QEMU installers (7.1.0-rc1).
      Missing DLL files.</p>
    <p><strong><br>
      </strong></p>
    <p><br>
    </p>
  </body>
</html>

--------------sboAGHBP2BpiWhjnVWEaG9DS--

