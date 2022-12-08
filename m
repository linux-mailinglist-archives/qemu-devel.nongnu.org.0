Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B56474FC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 18:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3KeH-0004Ag-Pu; Thu, 08 Dec 2022 12:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p3KeB-00047q-OG; Thu, 08 Dec 2022 12:25:23 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p3Kdv-0000GE-DU; Thu, 08 Dec 2022 12:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670520303; bh=Xf5FzWQaq3YhaZwuhZUAgSoDuhbHZTlEvB4Y8D4dU9E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZMrLEntH0AaEz/9Qj9CYAHF4kRLhxVcnu6jxNAoyeEHPj7r9+83klBGF8Nnoly5MR
 LT/lIBo1DYa6PTYimhVxGa/lqZVgcinuKKlh2pmZk4jKBuXsEHF8tgJE2Yq0eKA3Hg
 /zAxUcbOTfSW5Zd3gnvDzckW9AonPxCYUaYYt+f+j3pWBoHlgLkE4MzxRG3SQKsn7d
 FZVhJgU3KJdgQQ1brkWEpNtWyyYcKKdqpUwEMLZMKnG2ovrZUem5+xWep7xicds2uo
 zWpL1JPPedKVuislSFPYTNPdLEiDJEGuIJpectlurPS97CH+k/r3hPK8SCYqECIOUx
 4WyxddMOfqRnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([92.225.24.60]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1okGDx2pH4-00zCtO; Thu, 08
 Dec 2022 18:25:03 +0100
Message-ID: <2cbdc0b8-ff8e-f6e3-379a-82d25ad43514@gmx.de>
Date: Thu, 8 Dec 2022 18:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
Content-Language: de-DE, en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
 <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
 <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
 <CAFEAcA88QfXmos_vCMGnDsmH7L22jtMz+-MRrMimObhDaFrwXA@mail.gmail.com>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA88QfXmos_vCMGnDsmH7L22jtMz+-MRrMimObhDaFrwXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TLFqP/t/D5WI1TCWLKptcJQKRX3ulSrUjrZ0hPAdgKOk+54inKF
 MSP6DBLjl5hbbp+KWawbvnlpugtkkKrUtSwnbxgyJbfo/xwZlNcvUlRNcwm8ff9ijkWTK5Z
 u6Yq+CXen6Y74BTQeL/v9cR8GYA0GafrJCtbh/7z1QWxrER+f47GWgCoyZ74Z/tazNtjQta
 /WZ9GcRdkFjAk2ANiNS+w==
UI-OutboundReport: notjunk:1;M01:P0:uPtXiDqpeTc=;vZE1oSjWsRQ5F/wgVXvzT3CAWXn
 HoojOfzHvA0GPDI+TxrTQcrsSgXloCR/LsAYeYNsABni3NEyYA1ho1t0NRVCpN9mfyrld731y
 yBqr6Bt3Btl8FT/G5mzNIyTomWOFCzir2zoB1RNMRLVTlePW556Bt1PEKlMoF3o1DjvVpkN/B
 vKK/cXnl2KcM6iNzpHAHbpZFx1ZdVT4SNUVpIc8MX1wqh6m8bSJMbY/X2kTSrrz1PI2/Io2r+
 a4LpuzGiQmNcajHGE1j+QG4L/zxPbtEcIaK0wp7JQVIk4yANPwjvXcZE7XqcxX4cr8Je4c7C9
 4a6NIQXV6g9uMit1vRvzpy9UIDurvG0fpHMxJ4vIYJyA9CF3xsuNkpYhHzXK3mPLtXMYqZwBy
 f5Xz6ZgdObgpewLXjFQ1QSSggA8DLiRRsRi7V62FESDudTgIWFceIF2N7l8hgydchYYhvpLW+
 WAwpFE6m4kOm0RJ6krJ0hJD5tqhcLAMSWZy9TeGier2wzpJVSExuA8rU68PVr0i23q4cOqeze
 ZjpaL/ZAoMdW0LDPmfMkJmklAxH1DePKXZRWsTg2wkovirWWNz6va5Ayinxy4L2UoqXSZZ3ZU
 LdNPdH7Lz4LDZdUJLjaqHW3+6j3fY1fRvi34e1zOLL2NOlvcBML0qhVb5snxEE731W1JVey7a
 uIQXiFVVn6TbJzn/pj2f+QiTSo5zdBDkMzNyyLYf7zmEOeeRH0de5HhaW/4b+z5XG/sWiUbpj
 zcNvbZ+i91ljl4qf3pLN4DcFSoOvoL6qOzr538M46PISa8MIaFc9QaGLbxN2FVDFgqcAV102/
 41ihcgbKBtf0lSiX9lBM4qNYVdg+lllcCMgB4QSsnslUJWLUfMAbUqKyIJjeIQLZPGHFiEu7w
 zv5BNAo+5AzgyX6olDQfnLRe8txJNcWOJKIMTUC/By1o/ti5qkZQKqTTh7fT7SIycFn1+jxkS
 2vBNfKvczbN1/tH/dVneSAeJdmY=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.266, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter,


>> For the seL4 specific case, this is currently not possible in
>> the standard configuration. It's only exposed for a special
>> debug and benchmarking configuration.
>>
> It's not clear to me what you mean here -- the generic
> timer in the CPU exists in all configurations, so there
> should be no obstacle to seL4 using it.

Access is not exposed to userland in the standard configuration
and the standard kernel API has no no timeouts besides zero and
infinite. It's a design thing in the end. Nothing that could not
be hacked around or be changed in the design in the long run. But
my goal is not to hack around, but have a "proper" machine
simulation instead. Which basically falls down to having a generic
machine in mainline that has a few more customization options.

>> The really cool customization option would be passing a DTB
>> to QEMU that describes exactly what "virt" machine is to be
>> emulated.
>
> This is a firm "no" -- it sounds on the surface like a good
> idea but it doesn't actually work in practice -- DTB files
> don't provide enough info to be able to build a board from,
> except in some specific restricted situations like the Xilinx
> one.

I can see the point. But what about supporting an overlay DTB
that takes a stripped down virt machine as base? This might avoid
some limitation. In the long run, customization via a DTB seems
still better then adding parameters to the command line. For the
short term, a few more command line options seem good enough.

What is the general feeling about having a more general system
emulation option when it comes to the "virt" machine, and a way
of resolving the usage (and security) conflict with the KVM
usecase.

Axel




