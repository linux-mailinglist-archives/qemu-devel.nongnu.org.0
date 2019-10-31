Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6074EB097
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 13:51:01 +0100 (CET)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQ9um-0004QA-1W
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 08:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iQ9rK-0000zm-Dv
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 08:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iQ9rJ-0003nd-82
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 08:47:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iQ9rI-0003lh-Ux; Thu, 31 Oct 2019 08:47:25 -0400
Received: from [172.20.52.177] ([91.217.168.176]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1M91Tq-1iMHhc1Bzi-0069lP; Thu, 31 Oct 2019 13:47:14 +0100
Subject: Re: smb daemon get additional command line parameters from env
 variable
To: Jordi Pujol <jordipujolp@gmail.com>, qemu-trivial@nongnu.org
References: <CACTE=gpFbUSxXeTwu6_tzSeoh_9Yp905aMdzCPCUz3h7kcgeyw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <144c1b0a-5cd4-b657-025b-f44d5e812e06@vivier.eu>
Date: Thu, 31 Oct 2019 13:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACTE=gpFbUSxXeTwu6_tzSeoh_9Yp905aMdzCPCUz3h7kcgeyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hUjrROPXhsRqX4jqNGggYsukH6D/0IYDkt8vrq2hOt4oZ0FLBo2
 2752RmaEl1FY+ZWrKXvSLAZWizybd8sarWrs11//ke3y6wDEeDGkdaLQM9VVTngtb9SrCqg
 7Ik/qYL0i7i0vm0XA0lLMiRxJOMe64IT7I8WdlNzXE9B3gcbM9hD7KJzsTEYcsjfioJOQNc
 Rv77/PjfFHuFSzv8DYJSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0FiI78k2MYg=:1n1sddFwXFFiyJB8xPpGrr
 n1tbKLra/sJp/NTT7mYlrPYLhKa8+LWdLk60H7G54PQlcmdks1uzO5DyWAnuGqvO9cXDkCKLp
 KQM2ZUBjRucN9FQ8bPVlbsbMKXrYzm4Ro07zcQy61/baEgjQVRxwZfoq3rTQ5+6OCIo1eGlrw
 LYsQ6g/YOyF3kAa/eCNWCgiSPyaqK1IkE9+rakRk676XlO5WmpJI5LaOyTlNi2Rj8DoHSpx8T
 InuIrPaGn7/YAHDlR0DbPPv04e+QaHBT0OaTOi+kDrtke0i0fcpGlFsHrXlSyqpolVScKlC3x
 a1K3vMwYgYYJ8Jmmc5fCd2CEqAF5/wret+/U6tlH25HEutl3Cm5CZId2KracfENtJAZRfs4a+
 8wgnxNSt112QfXTsILfURo/Ogla4gbjMFpgksuzkX82llBSz4Bir8k6lI1Th1R31SU/jtMaZs
 sSRciu/Wtj8WcVfxe5wQxZA75LCjLmBRwExZ4LEA0LkdQUjoaIBO3WjYTt/niaWhlDzncUmOB
 /aZ4P5vBTArzgYs6XAerzQDUY9zELJivB1XkWcWEwAxo33+CQH+wkcCQqhDYeHidFgQwuh3eF
 z5GBev3OKlyFXa3+B3Mg2peDEi7b18MlJK9SuGKuDbUeuVuahYIPttacPJI4wpI82fT1GF4Zq
 4POIrKckj+tvwGDTkA1yJAarWnoQOflxRhCCWTe6JdHSaw+NBJdwqDuUsQSdVYF49yE+CrcyN
 MvUC1o/FTE0FC1+tPDTg/7ZDIsL8UHEGplqHZKPa1xK2ir9Gk8x0vM/NuVWMVZuYo7og26GDY
 8iXULTzgNYviWC/n4ph9ruLJWrSyjNACkmyjh2zw2O1De/I4IeRKKFECkiM5rTS43uNIymWpN
 h0GdkR8wGjWsQjR/Xw5vSQOFO4bWdejySHn5kMh0w=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 30/10/2019 08:55, Jordi Pujol wrote:
> Hello,
> 
> The new version 4 of Samba disables version 1 SMB protocols, now to
> run old Win clients we must modify the temporary configuration of the
> samba daemon to enable protocols before starting the samba client.
> This patch gets the value of the environment variable SMBDOPTIONS and
> appends it to the smbd command line; it allows the user to specify
> additional samba daemon parameters before starting qemu.
> It also patches the fork_exec function in misc.c, to parse correctly
> command lines that contain spaces.
> 
> Thanks,
> 
> Jordi Pujol
> 

cc'ed: qemu-devel and maintainers

To contribute, please follow the guideline
https://wiki.qemu.org/Contribute/SubmitAPatch

Thanks,
Laurent

