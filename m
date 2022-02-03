Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03E4A8BDB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:48:21 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFh9Y-0000A4-HE
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:48:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFgOM-00058a-0B
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:59:34 -0500
Received: from mout.gmx.net ([212.227.17.20]:55549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFgOH-0006nN-3a
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643911152;
 bh=HuFvKZECPK9moIYxIu0fyryIgAbt/SHah+BCPopWXmM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NLUyujEpSrLW7q8phNuRCCEe0Yk8DQT0PwqEX0RvyVOY4ch2SUhCaIvVn/wOrZw2i
 IsTAIt97u5Vcd1kiq1nI1Q/cFuKifAqwOtSqx6cEChpHznXt/uOjRfBv2lbkiTYIIP
 iWwqhM0t4SG1lJXMYSzcV10hvtF7jd7o2eHVYFo4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1mtS8V2fNn-00Ny4b; Thu, 03
 Feb 2022 18:59:12 +0100
Message-ID: <67254f36-2b17-1f97-9191-b68e983ae052@gmx.de>
Date: Thu, 3 Feb 2022 18:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 0/6] hppa target updates and fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220202181139.124485-1-deller@gmx.de>
 <CAFEAcA8oowdEN+Hogfq3bLa7v99RWmAhGyon4udjoTX6a2Jh7w@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA8oowdEN+Hogfq3bLa7v99RWmAhGyon4udjoTX6a2Jh7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XVlBt8k5Kmgbd78sq8e9nB/tvgWDIKd4LhhZ+M3V0L0jV8aaHle
 4PUv9cQIcemRuwI9zqANkGUlowI9fS6nEYDUE203m1r+EyWXHmZxWwUxXdvSr8f9DG7ViEK
 olkWgZnHAQ/MZ12bV8SR17HL/f8Kasp+kVpUWkKAHqVUwTdc02ZbgM4K491d4wafktGhc/H
 iZ6mq1n0yzxDe6ZM6Nhew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YW8cn7zu+/c=:/b0SCCYw5he5PVYgDhcCxR
 Zl0OOOSUR+yNT9yPnCO+MD+jYyomo8JvtTrebhWLX/0EbRUQGPfIcIC+G2WH/48/B4CgYmaux
 SDb+lm/cI4ev+odAmDnmYv5DnexgFet7hkqftC8ypEn6rl0MFWTKxx28Tbq5uxcO1LUiomjKA
 80kC3/ktyvf521t7/Eec4LWwqd2XK8ID1TxBomPSr8Nd8E5KRbpey1nlXDWG0/7kIXAXYD3i3
 3eocbna4VvphvKS5OD4L85U5DDsN71tyk5f3PSPgHTZKE1Q7KYvjNpYjjt+X/gj9SNn0DP7Xn
 Q1+UuWkO5rt88PueOFBAHJeGleXbtr7SWawhqXUYmqGbToC8txvpWwNKhLdQJZs4+2mpRCBmD
 jGWCVy4lMrzgdBNGtWlhE9KQDMabKrWgOGoiy5P+he1VL6UWWdWG2ZR7JSOR+rB4wDk8CUSj7
 stmaJNeH8Y6hRgXKWRpO451XqvoGBISsFOzmQLehK9Y7sLXm0hmwJT/BPEdk8fDddfaBCXtJc
 aU7x332YJt0DWX5t/LLnjGRs4JTmM4h0B3na1AjPb3OPpPgeec1/YTZevUmJ8hCKh0O/S2as8
 cC9isuAi/uy2FGDkz45Lf3dtT+ZdkMAlMeovk/pKO0W6vcl8tq7uCz0fG9YPoGnG3YGW10lfy
 jSLO4Wq47Oh4GdCw3chxaR/f73o3JoPr5fEZCAgs6+6+Xw8xw7ODttdGIr8B++O/VvGEYxh6E
 Krys/gFBNbeSRC1mk/nulNr0dhYl3mxyJVjJ6DDTJHxrxb/dEGz58cGkYPwzz+jYQWmi5wuKn
 eVq9tXNESiWDdxPpfEsR+eusGqwCkBnWsaR9V3RFfQDlBhbbWEHVQ79PAbkg0WBWtMEhiaXG5
 cFASYX3LKxeG5Q7le+ZxIf3thPCn/xjAXihY1MVpRbuPdjPpHnTBwmUkJyQycXFSWcX0UnlNS
 qryrscuedgUYoxgV08dlFqxQ7FEzvE7f3ky5WIZtumjB36Jxas3/TkAE5uxKrQ/O1H0/KED7i
 /dgxWuU78k6Up7loc3mwI9R+DECeOTe3FQJf/wF36v6qxZYNmzfpeccjYFdoD7YCZQdD7s9Nd
 CQks7DLS881mXo=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 16:42, Peter Maydell wrote:
> On Wed, 2 Feb 2022 at 18:11, Helge Deller <deller@gmx.de> wrote:
>>
>> The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b5=
6a36:
>>
>>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-=
for-7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/hdeller/qemu-hppa.git tags/hppa-updates-pull-reque=
st
>>
>> for you to fetch changes up to d449eee3af37937f788c02ad88f2caa8bbfb19aa=
:
>>
>>   hw/display/artist: Fix draw_line() artefacts (2022-02-02 18:46:45 +01=
00)
>>
>> ----------------------------------------------------------------
>> Fixes and updates for hppa target
>>
>> This patchset fixes some important bugs in the hppa artist graphics dri=
ver:
>> - Fix artist graphics for HP-UX and Linux
>> - Mouse cursor fixes for HP-UX
>> - Fix draw_line() function on artist graphic
>>
>> and it adds new qemu features for hppa:
>> - Allow up to 16 emulated CPUs (instead of 8)
>> - Add support for an emulated TOC/NMI button
>>
>> A new Seabios-hppa firmware is included as well:
>> - Update SeaBIOS-hppa to VERSION 3
>> - New opt/hostid fw_cfg option to change hostid
>> - Add opt/console fw_cfg option to select default console
>> - Added 16x32 font to STI firmware
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
>
> Applied, thanks.

Thank you!

> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> for any user-visible changes.

Sure, done now.

Helge

