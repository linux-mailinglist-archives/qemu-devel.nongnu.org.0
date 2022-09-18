Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2735BBF65
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 20:54:52 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZzRL-0004XQ-2K
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 14:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oZzPO-0002rK-Rk
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 14:52:50 -0400
Received: from mout.gmx.net ([212.227.17.20]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oZzPK-0007rY-94
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 14:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663527155;
 bh=oRgSv/eT10x555yDS/aLW/v3WXkAxB1PD3vvQifSWnU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Vi5PgM+HKNUrMpC8ala1yBkb89YauHEtmxuqvBcjmlOlBthUKItZ7jj57itIzPWgM
 lL2j23PpHHGDxDKbDn6yIj0xx7eQTC38NuaV5D86JYw3dxNg/bwdnWHvgGLaxlkCg2
 K0dwlyRYqlIyZpvEFjYQrL/4KgzR1jxz6BgeJ7b4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.224]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVDM-1oti7H0rYu-00JuPc; Sun, 18
 Sep 2022 20:52:35 +0200
Message-ID: <6051f061-06ba-bf0a-5dcb-9b084a94cf9a@gmx.de>
Date: Sun, 18 Sep 2022 20:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 00/12] linux-user patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20220913191321.96747-1-deller@gmx.de>
 <CAJSP0QWfUhRVhRJ7og1ntfbrjdpcuU31xRnUNWTOBhshpP8cTQ@mail.gmail.com>
 <467e4795-31ea-54b7-1735-ef5c2857ca5f@amsat.org>
 <CAJSP0QVNsqY7ovqJSXgHraX=z_WSTwUXhh520oki2soJ3pa=NA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAJSP0QVNsqY7ovqJSXgHraX=z_WSTwUXhh520oki2soJ3pa=NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6d/bma2H/OR99t4gfXfQatnuVE6jW0w1VeKZ6fCwv9ZKjCNmqe6
 YnGIqnI2sKTfq1a+Uhet7O4FK8+bv0X/pU0Jd5eLRR6egTRjrZizlBK3FaxegqoU3DOJFhw
 LV4NLBPEh4k3+daInHaLGcRAUb3tfW6dcIXHOFPJttzIEwUyGdFDw4N8KfGMolV+7Rf3AnF
 V05RBwdacU4hEvqzaYxVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G9YMuNhEME0=:IlJ0+W+v+AANSEi7e6YYzh
 UFGB9NOyyGuC0t3SYUUNqR6if26QlyWo5wIgxxzd42s+e9PoiEUXHO78PY1U3CfPxhftqNFVi
 d3BH4X1sxXhy62C2teYl47VeA97UmNZOILuUUUPNyBAt3We9j5Ksqt8tMg4QAG4p4UKo0ojDE
 0AAp9lLCzU04QQHCVyyL/BIkGbAN9c70kptrkCcUivn0/EyYsJcLszLooj+7rIGsb+38ynkcU
 eLzvTMMZQJ2B/Q2KDrIRFLQa9CwbVCZN8rS8jGjJOYI78R7K7Cmaz8IiLVlH9USjHQidDMEqZ
 hh5cb2jIHmfQqheSIwkt4RTX22cTizmUMRwwemKC0m9Yk7NFonZX4khBR8hzz/tfsVo8MI8oK
 tbW7XyVMr0pvnSTlxQ+0XeidtCp/t21rf0WgV2sX4ecAR3BDYYLKW5rLZekMUgUyqV5hc6rGe
 STchm96SEeky/Tb3eq9cS0JzwbS6f9CcHfd1Lnp/4XylNjsW7MVZ4ESGvSbbuLqNIbGRaTlYg
 1KFqKwiBsI0Pc/45+oexLTNIB5uWIA6MOBIt8jiM4N8dm6GbpDNbYX39p9SiM2iSHS+oqoF7U
 oQ/YryLH8o9QBzZT+3gxFMHrWG3u1+gpB8yZShMf0hmdo0hnrspo+DSa8ZB/b+8jp7NuRSrwA
 wU0Wqu4sXXbSKQC4GpuEVJjvGwJSNk5BImnseXZuEG2uuOD7hAGy/a5NrJwTTujAr2UlFwdC4
 W8rU+xJC0vqN2srafJoJlag4L33gpZg92GOTM8zwcieQSsuha/EwZfsuWIVMDKGe0fVilQ6M0
 SV/MV9yBZAkyvqxkkAswiytFy6FwVMb82gg2X11aluJYTCKidKJvGAn+vra9/sgVHQLMbKFP2
 D1ZA/sbmYzOp+40EkohChzUdggPgLuz0odeJMwm71/G8DgIwiZ3Lk4qe4JM3B9LVwCKKpyaE+
 U4zPC+SAc6BQtYBzZmFoLuzL/YcA6yEixR1savNm1UzirH6VgnU2z/cx7vGTuQry+gCbTAhSh
 7KRcxmUNgzkEaISRxxkjWkfZXI9vd7uZGhPLxS+U0OKPdTBILp4GnNXbhBcwCCCY4XTOS1iKV
 jzLHC++P5pKBukENiuasHDoIHnVaT54zoexTPGctULysu1NmYfAJQSLAfXEGrWXKeMDmJnPZs
 jm8tWtCR6JBOX23QjDtwaEHwRl
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/17/22 22:11, Stefan Hajnoczi wrote:
> On Sat, 17 Sept 2022 at 15:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>>
>> On 17/9/22 16:26, Stefan Hajnoczi wrote:
>>> The close_range(2) man page says:
>>> close_range() first appeared in Linux 5.9.  Library support was added
>>> in glibc in version 2.34.
>>>
>>> The qemu-user GitLab CI jobs are failing. For example, see
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3043629417:
>>>
>>> ../linux-user/syscall.c:8734:26: error: implicit declaration of
>>> function 'close_range' is invalid in C99
>>> [-Werror,-Wimplicit-function-declaration]
>>> return get_errno(close_range(arg1, arg2, arg3));
>>>                              ^
>>>
>>> There is a second issue with this pull request:
>>> ../linux-user/syscall.c:357:16: error: =E2=80=98pidfd_getfd=E2=80=99 d=
efined but not
>>> used [-Werror=3Dunused-function]
>>> 357 | _syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned
>>> int, flags);
>>>          | ^~~~~~~~~~~
>>> ../linux-user/syscall.c:251:13: note: in definition of macro =E2=80=98=
_syscall3=E2=80=99
>>>
>>> See https://gitlab.com/qemu-project/qemu/-/jobs/3043629434.

Stefan, Thanks for testing those patches!
I'll send a new series with those issues fixed soon.


>> Hmm apparently this PR hasn't been reviewed (although the patches were
>> on the list for 2 weeks).
>>
>> The 'check DCO' job - looking for S-o-b tags -  is green:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3043629425.
>> Should we complete it by a R-b/A-b check over the commit range?
>
> In some areas there will be no R-b/A-b, so I don't think we can
> require those checks.
>
> Was this pull request supposed to go through Laurent instead of being
> applied directly by me?

I'm fine with either way :-)

Thanks!
Helge

Btw, I have a whole bunch of additional patches on top of this
series so it would be good to get this series in first...

