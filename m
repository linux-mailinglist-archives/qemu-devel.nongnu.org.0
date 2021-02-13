Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F1B31AE7E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:23:11 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB4Fq-0006PO-MJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4Dk-0005Cp-61; Sat, 13 Feb 2021 18:21:01 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:56967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4Dh-0002NW-1H; Sat, 13 Feb 2021 18:20:59 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDygG-1l3Oif43c4-009ybL; Sun, 14 Feb 2021 00:20:46 +0100
Subject: Re: [PATCH 0/4] qga: Fix some style problems
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 AlexChen <alex.chen@huawei.com>
References: <5F96915D.2040102@huawei.com>
 <CAJ+F1CJT7SDt63ZyUAVCZhoYJ=Ep4KXF7MbcQJREaDHrTZXBeA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4a7adb06-c911-1d1b-631a-7cb06d39f89d@vivier.eu>
Date: Sun, 14 Feb 2021 00:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJT7SDt63ZyUAVCZhoYJ=Ep4KXF7MbcQJREaDHrTZXBeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:St2G8ephLjWCtO0bROC8Cnqm61Yrg+n4LWwqAyU5+KCr6+fWqKt
 pkxVDnY51idL3pQ7ipMgJETJwiLy4RzD7HXlp6tgS2hbQWxQtncWzw59a37sEXmIiI/iDNr
 iLJ4dP2AY1QDc1ldLkAxC79SzrD4MnUc8kH6DYggQ0iEXiLv63tPVp7CpCGK0XgiMHqxUlG
 giAby6m933iuatpZWcqxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U3KAusQNez0=:dSOFEjWrA9olGOFg9uM9bY
 V9M1m4hKEnxbRL+oMYpThBnkOwEiOZoBX7lgXey3TKF+Q8O+K7M0c+kK1K8MlXK5iKlihenNq
 hbObDNSk1fpAJNQ1TZpqa5tQsW/cXbHpmlOjKckgnVSOUoezmtTAlPfSAgGb1nib+wRyuNGKY
 RzLy8w7gIE+gk0MYUfi3YG18qyUCRjYvWt1uar68mrfri4CxzDUN9UQSwc8thWpKsmVqjadyk
 R8xNSCJlAMSjkGaEI7GLnOd5/MZwnI2I+d6EC5ciqAmggMKjEgCKukQYjFCqyTyP8SFOaJbIV
 w6OBHzVnYqOuYnvKV4VLURw7UCo8hRI1m26Om3NfPpz55yZMs4u+iCSglCNDQSvZI7n8zWB5y
 U9yM4BW6pfyoLNEiZljFN3zrtS6PRkbQ+dA7fwcWeEvk4UiMzUj2kOfKwwqBv
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu trival <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/11/2020 à 08:46, Marc-André Lureau a écrit :
> 
> 
> On Mon, Oct 26, 2020 at 1:16 PM AlexChen <alex.chen@huawei.com <mailto:alex.chen@huawei.com>> wrote:
> 
>     Fix some error style problems found by checkpatch.pl <http://checkpatch.pl>.
> 
>     alexchen (4):
>       qga: Add spaces around operator
>       qga: Delete redundant spaces
>       qga: Open brace '{' following struct go on the same
>       qga: switch and case should be at the same indent
> 
>      qga/channel-win32.c  |  6 ++---
>      qga/commands-posix.c |  4 +--
>      qga/commands-win32.c | 28 ++++++++++-----------
>      qga/commands.c       |  4 +--
>      qga/main.c           | 59 ++++++++++++++++++++++----------------------
>      5 files changed, 50 insertions(+), 51 deletions(-)
> 
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>

Where are the patches?

I don't find them in my mailbox and patchew didn't receive them:

https://patchew.org/QEMU/5F96915D.2040102@huawei.com/

Thanks,
Laurent

