Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4E1797EE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 19:30:45 +0100 (CET)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Yn5-0005Pb-KD
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 13:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rprior@dcc.fc.up.pt>) id 1j9Y25-0002LE-33
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 12:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rprior@dcc.fc.up.pt>) id 1j9Y24-0005Vl-0s
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 12:42:08 -0500
Received: from smtp.dcc.fc.up.pt ([193.136.39.16]:50808)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <rprior@dcc.fc.up.pt>) id 1j9Y22-0005UK-8h
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 12:42:07 -0500
Received: from [192.168.50.99] (khlimt.dcc.fc.up.pt [192.168.50.99])
 by smtp.dcc.fc.up.pt (Postfix) with ESMTPSA id 50DFDC3010
 for <qemu-devel@nongnu.org>; Wed,  4 Mar 2020 17:42:03 +0000 (WET)
To: qemu-devel@nongnu.org
From: Rui Prior <rprior@dcc.fc.up.pt>
Subject: vmx=on with -accel hax
Autocrypt: addr=rprior@dcc.fc.up.pt; keydata=
 mQGiBD6RUUARBACNS5MXZ5fUZExUm5No2PbG7Dn6kRpy95PvzBE0zEC28Kdm8AVrXSt0iw6T
 78ykx7fpmBzQuhqW/r2Z+B6whXOk9b5XOSswIesdLH+TvttIDqbZ81+XwgqVoNaGXzZtZ5IH
 jlSMfcuBu+nUw5iLZoUqk4lh/jbrDbUrr2izmU5BPwCg8Dmd9QZ+H8FM4LuGH9Kwl7Epj88D
 /iKc6IpmvjBwdBETPnHv92T2JgmojxSc159jGKHYKBiB3LjucWtwoBb5BTj8hmFwvecfLE19
 Pq/UmOUkc0K9a2H8JV2oQW9xX1tV0YrMk3xmUsRrGip+BjFiTmlxp2outdOe9w11ZJ9O8QuW
 lWlvG9Mn8Nv7QSraIit4VZsBSuxjA/4nX0dnvMygVsL1eunoioGMe/9g3KRw0TyPVqm9oeeb
 Db6du9QlRNcOQQvNrfg/sOCzIkRNVh5NQoztPut69suyhbLbdlAV+Yt2SxMF+KbW3RVtti/6
 zfcWRQ1Gb/KOFAAr1p8JD93V90oi7miOTrn5o/Xm4iy3p5RNIsUTXYydjLQfUnVpIFByaW9y
 IDxycHJpb3JAZGNjLmZjLnVwLnB0PohgBBMRAgAgBQJIVqb8AhsjBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQ37LZ2CbRGqqc7wCfYaS5Cjp3vaycp3HV0GMLWDavkX8AoOnJB1NRQ53n
 ghT4rR2nulZ3156kuQENBD6RUUMQBACooq0FiRxfgzYvGcfPPDIP6aLlRrdZAerr8ybuOwRm
 on72t8wYxORh+e977ToFEbbyFJBBUFWVigSoMPynjV797uLpLJUJoISzh+n6TjNXseHDAa/6
 GUcw5C74nMZbUxt9jdp428skCLIZjfmp+sgqVf/uaDNKF/jwWdYbJlbTVwAFEwQAoi9u2NoU
 toIH1YCXoipIHuHrVGxtkvXLoCO4m1HzD4M5fbroz46pHlVvZSo7p2wiGI5XF1mxduRJwIVK
 8autRXk7IwNTyurBy2Qw10d+JvzD8kauOn9aglTE/KomdX174vv7zxzKYPVkoJ3MoryMP1BK
 KJVnYrnRYodZZnwq2MaIRgQYEQIABgUCPpFRQwAKCRDfstnYJtEaqrWrAKC7Ro9EC1VZ6zs5
 JaVBzUjAns3DoQCgzfwecvdaIYRBHkgJJk1C4cWbsgI=
Message-ID: <19980599-1cbf-9179-070d-59aa68847968@dcc.fc.up.pt>
Date: Wed, 4 Mar 2020 17:42:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 193.136.39.16
X-Mailman-Approved-At: Wed, 04 Mar 2020 13:28:31 -0500
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

Dear qemu developers,

I found a bug/limitation of qemu on windows (qemu-w64-setup-20200201.exe
from https://qemu.weilnetz.de/w64/ ) that makes qemu terminate
immediately with "VCPU shutdown request" (twice) if I try to use the
"vmx=3Don" CPU option while simultaneously using "-accel hax".  Without
"vmx=3Don", it works fine (but it prevents me from using nested
virtualization).

I am using HAXM v7.5.6.

Should you need any further information, please let me know.

Best regards,
--=20
Rui Prior
*********************************************
Departamento de Ci=C3=AAncia de Computadores,
Faculdade de Ci=C3=AAncias, Universidade do Porto
*********************************************
Instituto de Telecomunica=C3=A7=C3=B5es
*********************************************

