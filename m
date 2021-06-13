Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA43A56CE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 08:54:16 +0200 (CEST)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsK0c-0001ZG-OT
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 02:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsJzI-0000tZ-0o
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:52:52 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:54096
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsJzF-00059f-M8
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:52:51 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 902E9DA07CF;
 Sun, 13 Jun 2021 08:52:46 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [gitlab] Renamed issue labels for target architecture
Message-ID: <c97f8092-0542-1fa5-1e0d-68f07ab909b9@weilnetz.de>
Date: Sun, 13 Jun 2021 08:52:46 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Am 13.06.21 um 00:32 schrieb Richard Henderson:

> I've renamed arch:* to target:* as there was some amount of confusion=20
> as to what "arch" really meant without context.=C2=A0 I've removed labe=
ls=20
> for lm32 and unicore32 which have been removed from qemu 6.1.=C2=A0 I'v=
e=20
> added a label for hexagon.
>
> I have not yet added labels for host architecture, because I couldn't=20
> figure out how best to word the description, or even if all of the=20
> target:* labels need re-wording to emphasize target.
>
> And then there's the special case of TCI.
>
> Thoughts on these?


A pragmatic solution for TCI could use the label "accel: TCI" as a=20
special case and instead of "accel: TCG".

We have an ambiguity for "os:" because it is unclear whether it relates=20
to the host or to the target system. That could be handled by using four =

labels "host:", "target:" (architecture), "host-os:", "target-os:"=20
(operating system). I'd prefer dropping the "os:" label and extending=20
"target:" (and the new "host:") to allow either architecture, operating=20
system or a combination of both (for example target: i386, target:=20
i386-Windows, host: Windows).

Stefan





