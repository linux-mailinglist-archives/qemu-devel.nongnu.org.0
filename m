Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED6681DD4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcNX-0003Bk-3D; Mon, 30 Jan 2023 17:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMcNU-0003BR-7F
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:11:52 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMcNS-0001mc-1g
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675116703; bh=ebFHlYwtOt6OrwsAkAgaekWohnL3uD74511HAM4471U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TnZXLbZBKVmOcvb2dmMBTxMZvMb+xKE4VbTCXyvZnz1Ar4deBofXgiG0U0dkgkYxO
 2ISbl2O6sqj/QR2nvKpfeZFexRZmCUoM+ZGMXiG5r+U9PlsBNb0pntWkmm+1wveKx4
 1GwHxqz+Cv5pNNzSQJ7yc9/SajfRjrn0d9O3PiXgTYjtc8jjPVoMHDO5Xdf9megGks
 X7HQ1MWbGghim4nQcmZsSvi1lo1AbZGjdEkMRdCMalCl/7CyUp7wcqVuQS9IZvwsmJ
 XLQ+DowTt8my4kf1MI/0tt7DobDtEX6bU/yFKnwwaYRkntcrDgMThRrWLrYsJh2vqe
 KwDMm0GHW76pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.179.117]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1oyveH0cqg-00OpJz; Mon, 30
 Jan 2023 23:11:43 +0100
Message-ID: <79a67002-0294-3a87-41ed-82bbb2689bf0@gmx.de>
Date: Mon, 30 Jan 2023 23:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
 <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a96FNeg1hmQjGmZKxPC8zQes7ZzQHPReFIl8VP1NVVARSMOPp3a
 bSmT4Xl51961xtVEZ9DuYwo7l4iPpymfK330Z5h0YMoOjXEcQCEVfXeViQCyxbQpd1IVPs7
 ktaLv9AHq3I59P8PYV+Njj2Eg53OI+mSA0Ccp2V9NTnFXnxS6Hvx7n4yuE7dsl1n4FRYlnw
 MAh2kmPD2hgEousEQqK9A==
UI-OutboundReport: notjunk:1;M01:P0:uFJG+l7f9gY=;FG3WCDl3EycP4vXrHRfKnpaSCDI
 /gtUCfLi9hH01lXfVvbF3zy+5SOXx4Y1nrbDIUdG6VTDUnax+6NUBo46iqK7x7ofUE5H05b/a
 Wc+IPBUdJhFsuhYNyrQmVfICZHYpcYgCCb7730wDynThU1qdk4zD0PObGN94oMMP+FbUFDkyv
 DWED3mandbDpzvCXOaw5FMlyd1DgqZBD1mIEp2FNWpCn8mUf/p5DMwjWS2DBPyNX6CIjiGOK+
 SiBYD7wmMvKdgDxyohS7b1fLfDArKnlmqprF9LKiES5pzOYyRMUHsIGXKnd7fswyOd5+xBaw0
 5jcqCo9UN6oMDGqjsZ4cLkGi1kKJMkwMBZqw3U5Q6IK65bh11bT6qEkEeo1AxcHjH2aC5Co5v
 Tpkcye5qbld6BHUuh9S08L0ZGkaUcfekXC8f/N58NJN7OyFefjBS7Euu99JYmae/PEQWk2YY3
 /quVsjHQfP8p1clGwJph2ul20xCbkjuX9YNMQNrgz9zoSmuPVXo8Hvk2oEH+wkS7ETP9JfmIa
 O8JEd1LNz3+S2NyIszvQAn88jvI3gCyCxqJ5zFB+ExC1XRk3N1dJPXmgH4xgL+vyfRzeHk9tA
 wxQRSGFLnhzut442pkEfVAQtI7BoFndt8uDzyOs3sCGsEcocL1Zu9E0tRfJGOwHqTX/bYW8Up
 myJDh4rksVg7R3JLirah34i8izjzw65Yzf1ciFUgw4lU2NTpDeIP+B9tTqnl9NRhC3mwzANOV
 +u7GIHJIypsGRaTc96+LvF7gGJMklXyGbQzVRr9iroYQ6xYQz7VyiKt7sV5y3EQZ4mylC48rw
 ywrmqk+MCOXfXLUMvOpszS7OVWvSEiTrkD6ZwKuvmWMHcJFoFXeCcbb9gi5SBnJZyDnezed9g
 6QELXNoZcsxl7lEX3FvztZGWA6Ui0m9fCODrgEFdV4Vf7o6kA5U2xRmsfIswSkq5a1H3mxQ6Z
 oUORSw==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/30/23 10:26, Laurent Vivier wrote:
> Le 27/01/2023 =C3=A0 21:58, Helge Deller a =C3=A9crit=C2=A0:
>> Make the strace look nicer for those two syscalls.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vi=
vier
>>
>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>> index 82dc1a1e20..379536f5c9 100644
>> --- a/linux-user/strace.c
>> +++ b/linux-user/strace.c
>> @@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>>
>> +#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
>> +static void
>> +print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *na=
me,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long =
arg0, abi_long arg1, abi_long arg2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_long =
arg3, abi_long arg4, abi_long arg5)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg3 =3D arg4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg4 =3D arg5;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
>> +=C2=A0=C2=A0=C2=A0 print_raw_param("%d", arg0, 0);
>> +=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 0);
>> +=C2=A0=C2=A0=C2=A0 print_raw_param("%d", arg2, 0);
>> +=C2=A0=C2=A0=C2=A0 qemu_log("%lld", (long long)target_offset64(arg3, a=
rg4));
>
> better to use:
>
> print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);

I thought of that as well, but that won't work, as print_raw_param()
takes an "abi_long" value, which is just a 32-bit value on 32-bit targets.
See print_rlimit64(), it's used there with qemu_log() as well.

Helge

