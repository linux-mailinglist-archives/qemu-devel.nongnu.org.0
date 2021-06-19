Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAA3AD96D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:35:59 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYKU-0000VY-62
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1luYJJ-00089F-21
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 06:34:45 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43728
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1luYJG-0005qn-BS
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 06:34:44 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 2325EDA07B3;
 Sat, 19 Jun 2021 12:34:40 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 adam.s@Safe-mail.net, qemu-devel@nongnu.org
References: <N1M-_seQmbowoO@Safe-mail.net>
 <1c25fadd-1f3f-b3ba-c2fb-d5654b6e6e29@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Shortcoming (oversight) in Windows installer
Message-ID: <dc74be85-c0d9-7433-a572-9cb1a7a484d8@weilnetz.de>
Date: Sat, 19 Jun 2021 12:34:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1c25fadd-1f3f-b3ba-c2fb-d5654b6e6e29@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.202,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 19.06.21 um 12:03 schrieb Philippe Mathieu-Daud=C3=A9:

> Hi Adam,
>
> On 6/19/21 12:55 AM, adam.s@Safe-mail.net wrote:
>> but I noticed this about the Windows installer:
>>
>> Does not add (nor offer to add) "C:\Program Files\qemu" to path.
>>
>> It should maybe be an optional choice in the installer.
> Can you try sending a patch via email?


Adding the installation directory to the search path is dangerous on=20
Windows and can result in an empty path when the length exceeds some=20
limit:=20
https://stackoverflow.com/questions/43014724/how-to-reset-system-variable=
-path-after-tesseract-installation.

In addition I don't like having a global path setting with lots of=20
entries for many different programs. That can cause ambiguities if=20
different path entries include incompatible EXE or DLL files with the=20
same name. Windows uses PATH not only for finding EXE files but also for =

DLL files.

Therefore I would not implement the suggested feature.

I suggest running the QEMU executables by specifying their full name=20
including their installation directory. And it's also easy to add a=20
local batch file which sets the right path temporarily.

Regards

Stefan



