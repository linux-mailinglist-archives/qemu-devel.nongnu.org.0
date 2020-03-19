Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3C18BCAC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 17:35:34 +0100 (CET)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEy8r-0007l7-MJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 12:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jEy7k-0007AK-KC
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 12:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jEy7j-0006Dp-Hy
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 12:34:24 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jEy7j-0006BL-9L
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 12:34:23 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDykM-1j7IbZ2nlE-009w1y; Thu, 19 Mar 2020 17:34:05 +0100
Subject: Re: [PATCH 0/4] linux-user: Fix some issues in termbits.h files
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <1579227117-6310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <994d96ac-ce43-9ff5-7212-eda6e12264fb@vivier.eu>
 <CAL1e-=jOUxOKHFdVa06TpDwsbicKyGrn8mJ=dJtRcaAX6sFriQ@mail.gmail.com>
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
Message-ID: <b400bf37-3364-cb31-991d-443970e6309f@vivier.eu>
Date: Thu, 19 Mar 2020 17:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=jOUxOKHFdVa06TpDwsbicKyGrn8mJ=dJtRcaAX6sFriQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D+Xr1K372/b9aoW5g9B5f+wk0LbDYwtK3t2pUBIqqb/dAyrmz3J
 BFD1ayHVEFUceXZzhNpELoi5aNF14LrStonlLlOfR4bZC9AI4JdNVSlpNJXwFjqAmGHVHNF
 s0TwIUTDFc4o+l6eIDCqDsT5Pwca6dtM6cN2dis9ugF2HLFdvCtGZyQoqRRsJcz37Ox+8hH
 uvei4IYpS+1lu7qQHysJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wit/17bV+/4=:QZU22FJcICf7sgko1/CTqj
 mXeMrdbWeDCMafBZKA9Wut929Ih8Qz8E/jFB3iYbbeiLrjdecnTlYyLJPSHUUTmeRt+1QMdQf
 5ShE7rvST4b7CZKTIOO7O6mN2Nz0InV1e1Al69etjmbOxynMdburo9rbF8RRXg/9gZ2AkzUra
 TxRZ+JZICosHqiSgSHGDyDVl1zi6E5kY/LJwz8jlJVFYlGHlhy0A3vAMzgdoHKeDlqGNb6tJF
 0j1dZXdFylve/TmHbG5HePXjL0GFmGkLpnio6X0MwwZcHVPk1hKCxj7I/kCOjciL7dEL8jJvx
 7MvuoTwNWuaKNF4cDFRgy71GycFmXCrOCmwIKfbNpJ2aYm8C5hM2lS61d1gsCp3F2ZzPdECaU
 mUf1HzTF/I8ubTmfNrZbVg0XN41MaXUVAmKNpEWHIpQE38hhuy0CfSNPGo+qY0u8V76OeK1ZP
 KtAwDlt67pJlEY3Kc3RS0ul0KJwunLhK9w2huLTXTL/Gqi73Ey3R6wQw0QVP3T5tUGbUiY42r
 VyYFrXYQbigRxnE6w14xpays1YoClAL0RGycmn989z2z4re4spJiGWzxv+JZ7ugDjd8FkNBGE
 n4ESNM2ySvs0nwG+o6DR5axy8EklIcMMAmULqufjVGQUCYZBT+iHk6NbEvnWWludczhN+lA1U
 wEby/973eHkItwBlJdL/rqBgj27jL7T5ViR2mgWfiHnSK8amSYDOXjlznydNvVmogWE9talK0
 NiDeoVf39h+N23xvm9vMWlwvq+JLKCfHWqZjgB4NErUaDg5Dc76DNiO2WBXZyftxdebjhTxlJ
 67QlLUvoT/eSvk4otnH0/88vYUgT91NIN4VceS5XmVjYERD2WOQImklWvnWUbHnUTe6nMEp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2020 à 17:24, Aleksandar Markovic a écrit :
>> I think we should first introduce a linux-user/generic/termbits.h as we
>> have an asm-generic/termbits.h in the kernel and use it with all the
>> targets except alpha, mips, hppa, sparc and xtensa.
>>
>> I think this linux-user/generic/termbits.h could be copied from
>> linux-user/openrisc/termbits.h (without the ioctl definitions)
>>
>> Then you could update the remaining ones.
>>
> 
> I agree with you, Laurent, that would be the cleanest
> implementation.
> 
> However, I think it requires at least several days of meticulous
> dev work, that I can't afford at this moment. May I ask you to
> accept this series as is for 5.0, as a sort of bridge towards
> the implementation you described? It certainly fixes a majority
> of termbits-related bugs, many of them remained latent just
> by fact that XXX and TARGET_XXX were identical. The most
> affected targets, xtensa, mips and alpha should be cleaned up
> by this series wrt termbits, and for great majority of issues
> are cleaned up for all platforms.
> 
> I just don't have enough time resources to additionally
> devote to this problem.

ok, but I need to review and test them, I don't know if I will have
enough time for that. I will try...

Thanks,
Laurent

