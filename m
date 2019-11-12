Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE83F8BFE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 10:38:35 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUSd8-000501-OE
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 04:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iUScH-0004FQ-JL
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 04:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iUScF-0007Qm-U5
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 04:37:41 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54117)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iUScD-0007Pj-LP; Tue, 12 Nov 2019 04:37:37 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9d91-1hsFZO1i9V-015dA0; Tue, 12 Nov 2019 10:37:31 +0100
Subject: Re: [PATCH v2] ivshmem-server: Terminate also on SIGINT
To: Markus Armbruster <armbru@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <99c1a7bd-1876-66a2-4b8e-d5bc86116fe7@web.de>
 <fed41c57-c433-9723-e5db-5eb3a10c4f8b@siemens.com>
 <87a7968km1.fsf@dusky.pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b0fda46b-6518-4228-b7e3-2bd1bdf27817@vivier.eu>
Date: Tue, 12 Nov 2019 10:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87a7968km1.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nQNyJBWKmy47yS9fg7wGpnBBnonEJ8lSB4igRqbxxvF/7R59GWZ
 ray5CprKCKS22by/InN/eSPKSmdNYFEh1AjYbsJOI5GJWQh+QvSQjBmijYa8rutTkQKSw94
 BTLLY68oNy4oW305ZqbDUsw894Vx9Pz2FxAo8yWf75YxxG/RN0fCgwfyqCLCX05VJzy0c/h
 OGjWdbfnPwv3BuANyn/Ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rkkrestwDpg=:IO1ZeCBV7K+DaPAaZTl7GK
 y7qvCn+mGYAilp7bA3bfKlkk92QLfyMLf1OZQuZtq9FZjgIHHtD3ku8eS1kvMHlHq+nfFrv8+
 EYMPygCT+AXmHqOL2+BVdtYrj51tDQ/FXGjtXtn6QqRjB/eBhH06DpVQrMVKcG041QMfsL9EU
 OhNFCGCCu3Foge7wDz0fMsBCgQt4Aks/C5yZebGg1rVt7p6hKm6AIXj70Y/PfJI3nXOKhy28f
 QtWduxKWoPvLPYnt9ygHPIgHL21ciinMh16ZOUqHVPCvtiwjOMk+GRqzUyowWjbkgDBJGlAoa
 JkwMhKewvp9hJXuBRwpJa2pnPG6IrYFHd+S6ZXpTaXD2umKZQGkegfEvQxzHGtdzqJbhNHQd4
 pdl8bVXrekeQ1BJ/WOpVRiSOyaVYp8kx+5A6+T9CbmmW/A5a/Dao7+v0wQ3th9fVEAFNVS/Ck
 ENS9WvWrFA4gahGD1Z2niSY78Xt826fSz5BiWKKg+ke69RNS7zyVNOv7waaA7lAK1ut3aJyCB
 M2St+yKXHpTqpOmtscBiyit2GA+jz1LTu814WkmNmz6AyaDE+MdlHIaQ8lHdyaL/waw16rsSj
 fV2HQ4Z/H205jNcFT6JqGMfKXQ9s2EHZ3j24+eDjcR1bjkrsHjUcbduv0Fto0PeuJPZfiNJjD
 z7HtB9zRwUkUe+Vx4idRIscQw8sZhUxKQXSSACbmObPwTwt1waOmRdWWQljOjXuyTxLv/Uaya
 38Bhe9yffCk/ziEuZr0TzulPllFZiAW9EKI4EyXvI+teHRDG5YFN11WLk5sUmEGXZ9NB0ihyc
 h6dHCYwhrvM4/ppcBLn33kngBHHBIyfAyLRPU4jCJkfF3HKiYW+AybL2khPMv5tG6VZ38wl/c
 KKrkqVACzEFDXnQauvowGQbHm8H8Vndqgf4c4e3WQ=
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
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2019 à 16:15, Markus Armbruster a écrit :
> Jan Kiszka <jan.kiszka@siemens.com> writes:
> 
>> On 03.08.19 15:22, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Allows to shutdown a foreground session via ctrl-c.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>
>>> Changes in v2:
>>>   - adjust error message
>>>
>>>   contrib/ivshmem-server/main.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
>>> index 197c79c57e..e4cd35f74c 100644
>>> --- a/contrib/ivshmem-server/main.c
>>> +++ b/contrib/ivshmem-server/main.c
>>> @@ -223,8 +223,9 @@ main(int argc, char *argv[])
>>>       sa_quit.sa_handler = ivshmem_server_quit_cb;
>>>       sa_quit.sa_flags = 0;
>>>       if (sigemptyset(&sa_quit.sa_mask) == -1 ||
>>> -        sigaction(SIGTERM, &sa_quit, 0) == -1) {
>>> -        perror("failed to add SIGTERM handler; sigaction");
>>> +        sigaction(SIGTERM, &sa_quit, 0) == -1 ||
>>> +        sigaction(SIGINT, &sa_quit, 0) == -1) {
>>> +        perror("failed to add signal handler; sigaction");
>>>           goto err;
>>>       }
>>>
>>> --
>>> 2.16.4
>>>
>>>
>>
>> ...and this one for you as well, Markus?
> 
> Cc: qemu-trivial
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

