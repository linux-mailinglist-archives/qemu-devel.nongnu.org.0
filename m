Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07002D3270
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:54:49 +0100 (CET)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi8O-0002Ea-N6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kmhfs-0004np-TP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:25:20 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:44529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kmhfq-0000Tc-9Y
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:25:20 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mt6x5-1jtEZN27a5-00tW6n; Tue, 08 Dec 2020 19:25:12 +0100
To: Matteo Croce <mcroce@linux.microsoft.com>
References: <20201208001727.17433-1-mcroce@linux.microsoft.com>
 <f37589e0-90d9-a5f0-a5a9-423c583c675d@vivier.eu>
 <CAFnufp1QkXMxMwVksczL8jSHET2zwLSgv4Lm34MgqWd5jyYTNA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: add option to chroot before emulation
Message-ID: <5b7460b5-922e-3208-0c8a-161baf8b9c55@vivier.eu>
Date: Tue, 8 Dec 2020 19:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFnufp1QkXMxMwVksczL8jSHET2zwLSgv4Lm34MgqWd5jyYTNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NpoyxS4+gj60NiMO5/Ny0hEXcQ718XFxocQjZ1v/tCSX+hNq6mH
 RnqTTGH/9/089z0bgPRbHxxbzAOOhSiwcD7yxhUWE6EpLPut3n410MXm6/48+JifUyvYkky
 4I5YExPKfSvJG1/Uew+T0j/03BlsajXFD+E+pzsJmd8HNQdp3UnUINkhzOl4ayZtfPLkbXl
 MDMexgKQG7Whqwol/gAVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GNJiJhEH+cI=:dXqZ5R/qeEl0VxY5c8rArQ
 XHZ2VMjRWCFUVxTNOoomURcBQDbtRmXKh+dGKo4gVo2FQZlHcQVW56yM7AqiMY6qQecK13F8B
 vuIsouFo0ok5f2GnTQ4IIm/vcEDbIgeAP1Wbd4/7XWx3O2nQdUt0zv7UPcPhDaA/dz1JarhID
 jIW8aN2b0EFd0vQtVWclzHM7qrij2BtJESQsaPdZTO/iiU1F/v5l3JLZp0MqZOMQeCkcloWk+
 ufZy/CKHfzxvoh9JAdtTp0CWkg4crozubgs4zIPzQujHLexDjHXm2VGvAky/BES1vVmw+mmrK
 QHZzMGPka0YWgiF+iAJLMMuu7MrLkQRLE2tlfMCBlhadq99g8QoqzqnTcz154F8gKsEFQmBfh
 faPHJXgvOtBaemKFoXV5QW2/isrp7bqnky522H8IANlet5hvOZFw/+oNqWJL64j7lUlPb9bkV
 c7kFhLoZEw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/12/2020 à 17:04, Matteo Croce a écrit :
> On Tue, Dec 8, 2020 at 9:21 AM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 08/12/2020 à 01:17, Matteo Croce a écrit :
>>> From: Matteo Croce <mcroce@microsoft.com>
>>>
>>> Add a '-c' option which does a chroot() just before starting the
>>> emulation. This is useful when the static QEMU user binary can't
>>> be copied into the target root filesystem, e.g. if it's readonly.
>>
>> Did you try to use the binfmt_misc 'F' flag (fix binary)?
>>
>> https://www.kernel.org/doc/Documentation/admin-guide/binfmt-misc.rst
>>
>> ``F`` - fix binary
>>
>> The usual behaviour of binfmt_misc is to spawn the
>> binary lazily when the misc format file is invoked.  However,
>> this doesn``t work very well in the face of mount namespaces and
>> changeroots, so the ``F`` mode opens the binary as soon as the
>> emulation is installed and uses the opened image to spawn the
>> emulator, meaning it is always available once installed,
>> regardless of how the environment changes.
>>
>> This can be configured with scripts/qemu-binfmt-conf.sh and
>> "--persistent yes"" option
>>
> 
> Yes, this works too.
> Basically it's the same trick, open the binary early and then emulate.
> The only difference is that with binfmt emulation the procfs open
> still fails:
> 
> # strace -feopenat chroot debian /bin/true 2>&1 |grep /proc/sys
> [pid  9359] openat(AT_FDCWD, "/proc/sys/vm/mmap_min_addr", O_RDONLY) =
> -1 ENOENT (No such file or directory)
> 
> vs
> 
> # strace -feopenat qemu-aarch64 -c debian /bin/true 2>&1 |grep /proc/sys
> [pid  9348] openat(AT_FDCWD, "/proc/sys/vm/mmap_min_addr", O_RDONLY) = 3
> 

If you want to have the /proc mounted earlier you can use "unshare".

something like:

unshare --mount-proc -R debian /bin/true

There is also the "-L" option, something like:

qemu-aarch64 -L debian debian/bin/true

Thanks,
Laurent

