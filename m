Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB62509D1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 22:12:35 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAIpW-0006ql-BH
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 16:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kAIop-0006S0-4Q
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 16:11:51 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kAIon-0004xq-EF
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 16:11:50 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N32y5-1kcIsh3okP-013L9C; Mon, 24 Aug 2020 22:11:39 +0200
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200731190637.66698-1-Filip.Bozuta@syrmia.com>
 <20200731190637.66698-2-Filip.Bozuta@syrmia.com>
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
Subject: Re: [PATCH 1/3] linux-user: Modify 'sendmmsg()' and 'recvmmsg()'
 implementation
Message-ID: <379457f8-3619-5438-566c-d74302188b55@vivier.eu>
Date: Mon, 24 Aug 2020 22:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731190637.66698-2-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8nm0iAC2v/bq3NWegmoq9Bq220jlnHuT15FipmeUZ0Grgxf8PIF
 thYVw0nxocYgHO1OhyeUPUBlcj8km/8hsy7Q3UemoZYi6DQr39CGHSvmi9H87E2sGmU35YX
 AZnuzlJf5mHYPwKFgKrnjaKZwJqV+BYE5rXFu0NBiuMFHyaLrtra7BPIxBbh1lpKf5IhIb5
 HeqeAdL11RwuEjICDJlyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M1ukPrMHmEU=:fI057ieO8lnED9BZxhuKmh
 c+7j+zaKZpnMgcT0AdGjbdVpMcK7em8t2RmpdH5WyIw/TC+JtETKORl7cd86QuqPcxPB0mYF2
 sNNgPGFwt6ryDIew4eDcCAEIONVS+MKtLfnxMxfamgHfcb0vBFK7sLotwI1faUbvk9hJbFHTJ
 6rziajmclTLaHq6CHfBA+pFycAipshuy4fsuwMPVwGOtHlKlEyphHYyqDJSETOvqTksKFxMQZ
 UE8Tesj8LlBDOsJHSiSfpfwFz+lzuem2voQ/R8NtiwqUHCrjB+Sm+Ji9j0/cIRL/u0dPdLWlp
 FtRUwBcrr9cJBtKFvB9KGh3i8weR0vcHB0eWzSx40Xe5+7Y9bDndXO/1olXJwwjED2AjwiGX4
 3vfBNUqGcMWYtZNa+6suUZ5ryS09/fttgrVsc7BivRr0p+AKN4yXOH0ubd9ELXWtIpNLAAIGs
 6x6jNm/A2eLFq7CPBvYJzkBRLRjqYHEHkD3KfGTie4zO6hdKmb9oJYAh+z3bGVE3QpEe8qb3Z
 Vbeci2bLWCtAB2OlkocZo+WWKsBn9eIMvbMXNRuTa3hsbCVSz/QXZMpFrLj9xvl7NUp0pM6HV
 RVpPfTA1ioTwOKMKRX2OqRhS+JzohJ8e3hLEZwNAyKMyx+AQUXkHhsnt6zG6TI5YR7fT8bAee
 rz/h0v/xZO8R6MMFpGsEpRg6WkYarl6h3fn5z/Bjul5ubes4azzTCma3HMNaEliIMfcAYKPUG
 jydo/jlJv1hu0IlBJGnVgBtr4Qfq4+78/nDU0R2qpXbt8CKMeSsZ+nRwkCJpH/vlqKyACv9xg
 xJT2gD13BFUpt7PtxXi5GN8q8OSQgBWWDOBtYG7Bezu4k2FltbE7ayTkCJNN6oYfoU2MOyk
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 15:35:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.25,
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/07/2020 à 21:06, Filip Bozuta a écrit :
> Implementations of 'sendmmsg()' and 'recvmmsg()' in 'syscall.c' use
> a loop over a host command of 'sendmsg()' and 'recvmsg()' respectively
> to send/receive individual messages from a socket. This patch changes
> these implementations to use the host commands 'sendmmsg()' and 'recvmmsg()'
> to send all messages without looping over 'sendmsg()' and 'recvmsg()'.
> 
> Implementation notes:
> 
>     Parts of code from 'do_sendrecvmsg_locked()', that are used to transfer
>     values of 'struct msghdr' between host and target, were moved to separate
>     functions 'target_to_host_msghdr()' and 'host_to_target_msghdr()'. These
>     functions are used in 'do_sendrecvmmsg()' to transfer the data of each
>     individual 'struct msghdr' from the 'msgvec' argument. Memory allocation
>     for the 'iovec' field is done outside of these functions as to ensure that
>     the memory is freed after the syscall execution.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c | 243 ++++++++++++++++++++++++++++---------------
>  1 file changed, 159 insertions(+), 84 deletions(-)
> 

I'm sorry but after studying the changes needed I think it's better to
keep the existing code.

For instance, if we have a EFAULT (or EMSGSIZE) while reading the iovec
we must stop to send  data and exit with the error code.

Your code correctly manages the detection of the error and stops the
conversion of the iovec. Then it uses the converted iovecs with
sendmmsg() and recvmmsg(), but "ret" is overwritten and the error is lost.

So, in the end, and as it is done in kernel, the best is to loop around
sendmsg()... and this is what the existing code does.

Thanks,
Laurent

