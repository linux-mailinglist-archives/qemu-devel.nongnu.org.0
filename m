Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39392425801
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:32:17 +0200 (CEST)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWJa-0003Sh-92
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1mYWFy-0008OJ-8i; Thu, 07 Oct 2021 12:28:30 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1mYWFv-0006s2-GO; Thu, 07 Oct 2021 12:28:29 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MowSu-1n8P291sWk-00qVhp; Thu, 07 Oct 2021 18:28:23 +0200
Received: by mail-wr1-f45.google.com with SMTP id r10so20862339wra.12;
 Thu, 07 Oct 2021 09:28:23 -0700 (PDT)
X-Gm-Message-State: AOAM532ppxAeOt2edif6iWVNyICBZbfw0WrAk2EUL1kSSAoLqiQftm/e
 DHbwGN3nZr6vE0Qalcwtj+/339a73pPIZtUkYVU=
X-Google-Smtp-Source: ABdhPJxTEwJkTlkTb3tGyNAFZKqqODt2wHJF2jHLTg6XzTeoU5SRvUgjHl5Uo+Dc5QvVaj8AX8I48sgMPjTb6lMweco=
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr6490031wrz.369.1633624102697; 
 Thu, 07 Oct 2021 09:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 18:28:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Message-ID: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:snee2HA876Xow5e2CcQ/wrHsZaOdW4/WMQbWHU3ImKaiGkcRmQ5
 ntuFjvtHbONTCNu2niTc9QPMnh7/AZtOj1EUAtF+phYgb0gY8cgFEKvx3lDgl1zUSzPb0Qn
 HPB1qZouI7MePM23wfz10kcKFpjfbs647a3tRMCybc7nRuDw/TDCkg2XfVRezDo1tW8Atw3
 +TuCHQLD7K97TxiT76+qQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+DImnj8Ysc=:ct/aF/IY1thGp6GHwKctzH
 Ben2h5m5X7opxd3qdg9sGebVREeZSs/F8HEKr9wqfN44kP7QtN0b1+PMb9pKMY+WIhAnTl9dR
 1v9N4hp3oTtvHABi3MctNzp7xTGh8oHyYpaZEp+r6RGAJqaTbNhveElYWzPvCYk4j3v+SrRA+
 sogiST2fy0cOLnEfdR7XjqF4FULBn4iaDkuUT6qhI6+40WgRhVRvucIP4/jYegcnJOjwmcF2h
 Qs1AlDWkCohRjj4mgbODSNGgCIHSHBkTfjs0WfWPXT7CWk2LGyjwo4yTzoZhpAvpwv8x7Pd6d
 9GgzJ1para+r0M1tciyLM6r+e3YEFZSfE62YzIyNmQZW/GysJ17aOnJmpbhMECuKrmZI/Fpo4
 TXA34SKCyUCNnhB1XQkhq0HHG1tqdMlNSa2NV7A6LqH6X1UaiWxX0JzXk6Mo+7qz5nn+Ygznf
 avDVYL5v0Q2Fw1ue60+EyMHHOunvjFFqsq+qEsMGHBdXTEN+ZE6vDNIZbAuCAuEemoX6psDBL
 OeXJ6BGEO72DMRxQywkG0yYAgVecPwEtaaDLKjMnnOd0+RWPskcK825P4Vwkp/HvpwS6PwLXk
 zq8RBQWIvl18TjZudsHGCpa8TJOIpZxzjfntdvAPiUsnAKM59UHU6z5/vjHo2nwuZP+9uzpH2
 vEZSJZR7WQsj3QnGRhJ095JWZbEqZ+A5qnCvMdVXuCw2JdSs9xUSQav+YrbJatI1wi1JOX25L
 RpHFZiEcNDZlcssPIkmxm65cN5hYQQJ6/qXDl+2WtJqzlaTu13/b6iAFDazSHWhlWY3jR34p9
 g9nC7QNEr4oHld95xay5HcQjMHY/Nd6oDB/Ri0V+X7s0fnfU9KmIze76lSS+xhDVdD4Rr7Rwi
 Vd/tND4oQ6TlMfkg1Lyg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: assad.hashmi@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
>
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.

Can you clarify how the code would run in this case? Does qemu-user
still emulate every single instruction, both the compatible and the incompa=
tible
ones, or is the idea here to run as much as possible natively and only
emulate the instructions that are not available natively, using either
SIGILL or searching through the object code for those instructions?

> Trap execve in QEMU linux-user
> ------------------------------
>
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.

This sounds like the obvious approach if you already do a full
instruction emulation. You'd still need to run the parent process
by calling qemu-user manually, but I suppose you need to do
something like this in any case.

> Add path mask to binfmt_misc
> ----------------------------
>
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).

The main downside I see here is that it requires kernel modification, so
it would not work for old kernels.

> Are there any other approaches you could take? Which do you think has
> the most merit?

If we modify binfmt_misc in the kernel, it might be helpful to do it
by extending it with namespace support, so it could be constrained
to a single container without having to do the emulation outside.
Unfortunately that does not solve the problem of preventing the
qemu-user binary from triggering the binfmt_misc lookup.

       Arnd

