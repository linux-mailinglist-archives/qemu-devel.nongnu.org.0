Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271022CA79A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:02:49 +0100 (CET)
Received: from localhost ([::1]:59654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk876-00082K-4G
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kk83u-00050m-Nk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:30 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:57441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kk83s-0008Vw-UE
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:59:30 -0500
Received: from [192.168.1.155] ([77.4.99.220]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M4JiJ-1kkPAz2lcX-000IVS; Tue, 01 Dec 2020 16:59:24 +0100
Subject: Re: [PATCH] python 3.5 compatibility
To: Markus Armbruster <armbru@redhat.com>
References: <20201127183619.8958-1-info@metux.net>
 <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
 <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
 <87r1oa9gsx.fsf@dusky.pond.sub.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <20f78421-28b7-93d1-a691-05d6e98da5dc@metux.net>
Date: Tue, 1 Dec 2020 16:59:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87r1oa9gsx.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SGutLeeY1GaEw8G3ayFjS6i0ZU8yTNC+995f5dp9jyIIE02dMFU
 biO+M6I2GrOqBSCM+tnxQIieWvl9GkALL+tpF9oT40XWLJqXswFgBn+RfzHpJG3VqJVrgiy
 YUmPpjpoq2sXVEILJA13l+Q167YfizP577zqXCm7oTgevniRKnHRhrZDP19ofLANi8kECtr
 zokVyOtaOX6oxPQChKYAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nDu4iOei1OM=:DxPou1/rUAu9niG5xMTi5H
 eIY+xr5y/DI8+49+yh81ybOJwEL7R7/xtW6JQ/liKOX0ZWicwxU2iD3bVtFCQF6/IW85O39md
 rqsD7sp1fpG20g+s89Xs8uEb0RL08eKRrHfzLIpwxvURvbJYdoz9ZP204vsy7N3HiQYm/kI80
 RBL079hKmDk6Xuts+8fQ4t1nyr6x5aaiNY5M3WPSB2QPNI5mbXHRWrIMsO4m7IKZ+FgcGm22K
 Oa7mvp6O7LwtAXQbFvHU0omZc1G7w78x1mQDie+JTgYrgUoJ5SPHBe16FaRJS9CQpXNpKN7E1
 fDgoC6Ef/6GvZCRG6fDThX2kxwUYqF95zKU31rI/9Egxz8VfHzbtamIbC0bnC2KtVz0v/1RYD
 MR9YEWULLx9B4eNULXwbLreisrA//+XwfFzAa6+BNs7zCPj+AdfmGHd2qn/e7
Received-SPF: none client-ip=212.227.17.24; envelope-from=lkml@metux.net;
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

On 01.12.20 07:33, Markus Armbruster wrote:

> Which has oldstable status.  Good for running the old and stable
> software packaged by it (such as QEMU 2.8), and old (and hopefully
> stable) software of similar vintage.

It's still heavily used out in the field, and officially supported.
But that's just one example.

Perhaps I should add some more details on the situation: I'm using
(specially built) qemu with ptxdist/dkit - not the distro package.
The idea w/ ptxdist is that you just pull the trigger and it builds
everything needed for some project. Qemu is built specifically for
the configured target. Perhaps you've noticed I'm also doing development
of new qemu features - something that one doesn't want to do on old
versions.

> Have you considered upgrading to stable?

This would solve the problem just for me alone, not for others out
there, who're working w/ the BSP. And asking everybody (especially in
enterprise environments) to do a full release upgrade just for one
single tool (qemu) isn't someting that works easily.

If you insist in having python3.6 a hard requirement for qemu, you're
putting me into the situation of having to do lots of backport work
for quite long time (until everybody really did the upgrade). :(

This individual patch wasn't very complicated, but expect even more
(and more tricky cases) on the horizon.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

