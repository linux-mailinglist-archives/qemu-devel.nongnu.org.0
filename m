Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0043103617
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 09:35:20 +0100 (CET)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXLSJ-00026m-Jn
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 03:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iXLRF-0001e1-C0
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:34:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iXLRE-0004UM-By
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:34:13 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:45689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iXLRE-0004TI-2n
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:34:12 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MV6Bs-1iNtU134lC-00SArD; Wed, 20 Nov 2019 09:33:51 +0100
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1574121497-2433-1-git-send-email-tsimpson@quicinc.com>
 <a77ce406-5307-cee8-8e0b-7c08056fb0df@redhat.com>
 <BYAPR02MB488666AA94EBB57C2A318004DE4C0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <8c92b107-b707-b8a7-6284-5b1ed8e95897@vivier.eu>
 <BYAPR02MB4886E559B9286FE580C28556DE4F0@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Subject: Re: [PATCH] Add minimal Hexagon target - First in a series of patches
 - linux-user changes + linux-user/hexagon + skeleton of
 target/hexagon -
 Files in target/hexagon/imported are from another project and therefore do
 not conform to qemu coding standards
Message-ID: <98464579-194a-2b96-5cb9-3b7a7d9e680d@vivier.eu>
Date: Wed, 20 Nov 2019 09:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886E559B9286FE580C28556DE4F0@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dsiDUnhOC5q+eMiM1DWAV0+KceT05AdFKHBXdFUEbuUSvj/XXuW
 wy5qv5lQxMD51TcrphPsAzgBIKRsBPsP426QxC3Jp0ZY4MYes02Jx4aQQQ0M4Pr32aUINPT
 A0iIuPQttQXDaZL2HzCaF7UD0IFdkWTBP4uGF0mr+BhqXmHD75BXwdmmBo1urbSb45tFSd5
 tJ2s3Dc5VruGMoh7kFfMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a87z6mYlU6w=:fBfu9NVKK8ugnJaEGCyVml
 HWs0fUC0DB+h4BplkQHlUYOkq+PV3bZWdIiB1T4X/SAg1gCU0PBC/jN7n7C02UTAeOcUY3W6M
 UgfVr5P6m36p+uQyi/bwMQjOrByrh9BkOQxIc6NlNNsPkp5k7mAIMg5A05EiaOqmZZg47/3pt
 vNR56xiVYtMosgQd2WDc3Ec5oHM+7KCmK6nW5qTLZ0glF3pw8efDbWx3Yi366M8uTZPf63eqS
 6ng1eJdk5V/UDgW87MAMytFaMHNzr8qZvczZrCfm8r7r/XKPqJYIAod7IbwsjMRnI7Rr134np
 06W8FBHySm/fURDqjLTfsFR++8P2h7BLp7vQuiuu7oQ7t2wtDE2FCTSCjFnBU9y90PxxanVJo
 1hBXWYCf29O5N30mH1j8dpbTUoEDg4OxAYTI3jPqtezJUPbmSMXo5hGKRlLhyTFRqQZF28Ziu
 jhLhL6l4n2lJm3vEKvZap1lyD6dTueM4NVwYoFQ1UWxEQpzp4XGQg+LYo36RcJ75J5lDQAv7O
 RaCpWP58Jzeq5zD51AO2puXtOHVynphzeGvVKxtSDhvg0jlBcy75g4Qq6AZBv4HjvlzD0vPpr
 MzdOPV4vhKkbzTtSZZl20mw3M4dgbzkFUhWTug94R1UXCeNvlHtfZsSaqb6tqftdqlywf4T8g
 5k8Xe1idKEuigQXXUzdKMlkw2c6i10he7WmwfaWUfxalkP69J9bmJulpJytI7xyweT3ncXJcz
 n8DXvdTDLrLZoVEYU8I3shsTctZvRaRvjgGy9gs8ZPq3m4TAuQQ7JXKEP5uj90bZK9ACzA5xw
 LYHtfv7lNBF3FqvWJZ/ju2OHOpwUq3K+EZYMdoCD6tG12DpvnqWKOLkEuzYPRJY73d2DCWq8Z
 SsfbN+spD9ZjFm2lfWaQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.10
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

Le 20/11/2019 à 05:48, Taylor Simpson a écrit :
> For the general DEBUG_HEX messages, I think the trace infrastructure isn't quite what I'm looking for.
> 
> Here's a sample of what it prints
> Start packet: pc = 0x4002f0
> Packet committed: pc = 0x4002f0
> Regs written
>         r18 = -69420 (0xfffef0d4)
>         r19 = -69412 (0xfffef0dc)
> Stores
>         memd[0xfffef0b0] = 0 (0x0000000000000000)
> Next PC = 0x4002f8
> Exec counters: pkt = 17, insn = 24, hvx = 0
> 
> For performance, I'd like a way to disable them completely when --enable-debug isn't passed to configure.  It looks like #ifdef CONFIG_DEBUG_TCG will work for this.  Then, I'd like a command-line option to turn them on.  The "-d exec" seems like a reasonable place.  So, the code will look like this
> 
> #ifdef CONFIG_DEBUG_TCG
>     if (qemu_loglevel_maks(CPU_LOG_EXEC)) {
>         qemu_log(...);
>     }
> #endif
> 
> Please let me know if I'm on the right track here.
> 

I'm not sure CONFIG_DEBUG_TCG is the good choice (Richard should
know...), you should keep your DEBUG_HEX in this case.

But the performance impact should not be big without the #ifdef as
qemu_loglevel_maks() is a simple test and the rest of the code is not
executed (Perhaps an "unlikely(qemu_loglevel_maks(CPU_LOG_EXEC))" could
help).

Thanks,
Laurent

