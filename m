Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FE2E18B4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:00:49 +0100 (CET)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxCZ-00079o-NG
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krxAy-0006bw-Uo
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 00:59:09 -0500
Received: from mail-oln040092254047.outbound.protection.outlook.com
 ([40.92.254.47]:38927 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krxAu-0007FQ-6L
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 00:59:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDxdVcJnW7m7by6khRIk0hphN80Ui4smLvf0mpfNLEViQve9UToUSQjutpB7LtEBkti05aEMpIRgPTxsASqP7ud5NRSvKEGgaOG42Cej1j3vvrEOTALIxjVmOt8ZTzMQXu8H/2/bAXcuVILWlhptkDgNg2dFywhKSq8APKD91/a7yFXd8mZSfaPRc917wEyQ5SyjvkbpIE+5PYn41sn2QALLQI6OOt0sNvjU94u7/K3L1/VrGKx/WFTfWTYGciuRGyJ0C4UAp2kTk+mLap3qOvXtRVssn269jKVOnBaFFKlMxD+35iZKetSIVzrDt58nXRia1wTGfOYT60Mt+rpsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGyIMVmeuZ7hWWz8Ppay036ia7Zrd2MVhaQpAbNIohA=;
 b=OpP1gCZRag/6wXF6LhfL3JUcHucOlw/YjocRNiNyEEuhFEw5BSxQWIZDz3iwtlODCVFtbYCgiOmT1vEKwn0mnMpboANa+sJSsF82igafR98nLObIuxFo0FgclI/qK16F9a2CdKIn8XqtQ0Gaq5FvYhHzQ+ABgd4rj6A6OZycGbi2a5h/eDWhagANEU3tqRI7E3+s6T9NNKigahnfjmlXYm6UybYjW2H/Lfu4C0C2EBgR4GhqJtML8BDpjCQ5WorsmwCQTpITUhUAwfXiic2rbDHlNDADUSeUQj84mKtTnVewKGbR0cW6ffIEZY8gaeVRO/VrzjfTzwPCncYWV6dk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGyIMVmeuZ7hWWz8Ppay036ia7Zrd2MVhaQpAbNIohA=;
 b=SLMKy86c9ra/snvgR4vLcytzv32ab8TI931wqqrg+lWdb0QH8RKnhUOSq2tjVfEn2XKcEgJeO1XHasSna7U1fc5vhr3vTBBeKoWWWqwJjLztxwtx3MMmXF5QaiMnoeQrOf1g7RTneeLPfF5sfOC16+1IdsrfXoClbwpYjYzBwCC1S5ZU/lWO4nB09OCQ6bLri1zpDGbZoNx1YQ1vNqDlmK5LaEL3QO2XJixpwxwpndoT/Ld9QjSGQFc1dja8qj+vpBOuw+V5kB59csqfHQURNJnRfoV1E0jTHMlYdmGHYm43IEgc99LZKtOqHCYd/XU8pAGRmtFhNQ65aBuHTAVaQg==
Received: from SG2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::50) by
 SG2APC01HT013.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::189)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Wed, 23 Dec
 2020 05:58:52 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (10.152.250.53) by
 SG2APC01FT054.mail.protection.outlook.com (10.152.250.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Wed, 23 Dec 2020 05:58:52 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%8]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 05:58:52 +0000
From: Li Qiuhao <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/4] fuzz: refine crash detection mechanism
Thread-Topic: [PATCH 1/4] fuzz: refine crash detection mechanism
Thread-Index: AQHW1jirXm9uSvG/UE+Jy47G840piqoDV/eAgAFiJAA=
Date: Wed, 23 Dec 2020 05:58:52 +0000
Message-ID: <2a2f191d468ab547bacb6f5aab33156d2bb82ebc.camel@outlook.com>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14924A6558A105B7FBFA579DFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <87a6u5kcsg.fsf@stormtrooper.vrmnet>
In-Reply-To: <87a6u5kcsg.fsf@stormtrooper.vrmnet>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (15.20.3700.026)
user-agent: Evolution 3.36.4-0ubuntu1 
x-incomingtopheadermarker: OriginalChecksum:E41747C3EDA394A3F7B881CC87F7336A0E82CFC07505DDC12518744E8BD697F2;
 UpperCasedChecksum:EB262AC6578EEE3FBB7D50CB8A80CCB112A9A423D58D3C5E5200ACC399B81D70;
 SizeAsReceived:7314; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Ox0ccDYPhW6x2Jr6ekjhRCtmDDzgEBQh]
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a54b5e4b-5461-4af3-ea76-08d8a707d384
x-ms-traffictypediagnostic: SG2APC01HT013:
x-ms-exchange-minimumurldomainage: launchpad.net#6176
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sEhCjoH1uHIDj95LgmD639JKfy1adsli1rSlfDcU2D1KKbWT5dU59GUZU1leAu1e1aQuQnkspr0M2XzrNxMSY0+rEuJitP7tIpPFw3pBy493Qg34C+Bv735f65HJY7I3JB1tdBD0kiU30Nib82D/1wC/YMhAPV9u1e9JlRL05khcGx9UVgYu3IocpTvxOD6m7sgVsx4Ghg9tHz8/GhfXD//PyXsCIrVZToY0LYK2akG99CbxPClM2mMeeS2sdJvhN+tSJCZkVW2LmlIPaaHDrhZ2EA72l6vEwRcCHxXOnNs=
x-ms-exchange-antispam-messagedata: K2neDGsFTdae5yypZVodAl/Zs/dcCRcZpk34MSBtaXigl4pbQbpqIp88J7hZcpG3S7wvTVIwtxQVfyk63NL6psoPXYdiOKIBXhCw7OIV5yAYBPVbgTivif/80buZiOXxiBO8cDN9EJe4n1/bd8+QOQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <25E86174F3471D4CB353E5561A2EC548@sct-15-20-3174-20-msonline-outlook-8dac2.templateTenant>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a54b5e4b-5461-4af3-ea76-08d8a707d384
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 05:58:52.7800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT013
Received-SPF: pass client-ip=40.92.254.47; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "darren.kenny@oracle.com" <darren.kenny@oracle.com>,
 "bsd@redhat.com" <bsd@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-12-22 at 11:47 -0500, Alexander Bulekov wrote:=0A=
> Oops let me try to resend this..=0A=
> =0A=
> Qiuhao Li <Qiuhao.Li@outlook.com> writes:=0A=
> =0A=
> > The original crash detection method is to fork a process to test=0A=
> > our new=0A=
> > trace input. If the child process exits in time and the second-to-=0A=
> > last line=0A=
> > is the same as the first crash, we think it is a crash triggered by=0A=
> > the same=0A=
> > bug. However, in some situations, it doesn't work since it is a=0A=
> > hardcoded-offset string comparison.=0A=
> > =0A=
> > For example, suppose an assertion failure makes the crash. In that=0A=
> > case, the=0A=
> > second-to-last line will be 'timeout: the monitored command dumped=0A=
> > core',=0A=
> > =0A=
> =0A=
> Ah - I have not encountered this message. Are you running an=0A=
> --enable-sanitizers build? I believe ASAN disables coredumps, by=0A=
> default. I have to turn them on with:=0A=
> ASAN_OPTIONS=3Dabort_on_error=3D1:disable_coredump=3D0:unmap_shadow_on_ex=
it=0A=
> =3D1=0A=
> =0A=
> Maybe this is a matter of setting the correct env variables/disabling=0A=
> coredumps?=0A=
=0A=
Yes, I built emu-system-i386 with=A0--enable-fuzzing --enable-sanitizers.=
=0A=
=0A=
I tested a program built with ASAN, but it did try to dump core:=0A=
=0A=
---=0A=
=0A=
qiuhao@XPS-13-9360:~/tmp$ cat test.c=0A=
#include <signal.h>=0A=
int main (void) {=0A=
raise(SIGABRT);=0A=
return(0);=0A=
}=0A=
=0A=
qiuhao@XPS-13-9360:~/tmp$ clang --version=0A=
clang version 10.0.0-4ubuntu1=A0=0A=
Target: x86_64-pc-linux-gnu=0A=
Thread model: posix=0A=
InstalledDir: /usr/bin=0A=
=0A=
qiuhao@XPS-13-9360:~/tmp$ clang -g -O0 -fsanitize=3Daddress test.c && ./a.o=
ut=0A=
Aborted (core dumped)=0A=
=0A=
---=0A=
=0A=
Only when I test a program built with "-fanitizer=3Daddress,fuzzer" will it=
 disable the core dump and print the stack backtrace and info deadly signal=
:=0A=
=0A=
---=0A=
=0A=
qiuhao@XPS-13-9360:~/tmp$ cat fuzz.cc=A0=0A=
#include <stdint.h>=0A=
#include <signal.h>=0A=
=0A=
extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {=
=0A=
=A0 raise(SIGABRT);=0A=
=A0 return 0;=0A=
}=0A=
=0A=
qiuhao@XPS-13-9360:~/tmp$ clang++ -fsanitize=3Daddress,fuzzer fuzz.cc && ./=
a.out=A0=0A=
INFO: Seed: 3533057472=0A=
INFO: Loaded 1 modules=A0=A0=A0(1 inline 8-bit counters): 1 [0x5a6ec0, 0x5a=
6ec1),=A0=0A=
INFO: Loaded 1 PC tables (1 PCs): 1 [0x56b140,0x56b150),=A0=0A=
INFO: -max_len is not provided; libFuzzer will not generate inputs larger t=
han 4096 bytes=0A=
=3D=3D38847=3D=3D ERROR: libFuzzer: deadly signal=0A=
=A0=A0=A0=A0#0 0x526d21 in __sanitizer_print_stack_trace (/home/qiuhao/tmp/=
a.out+0x526d21)=0A=
=A0=A0=A0=A0#1 0x471e78 in fuzzer::PrintStackTrace() (/home/qiuhao/tmp/a.ou=
t+0x471e78)=0A=
=A0=A0=A0=A0#2 0x456fc3 in fuzzer::Fuzzer::CrashCallback() (/home/qiuhao/tm=
p/a.out+0x456fc3)=0A=
=A0=A0=A0=A0#3 0x7fe3df4b63bf=A0=A0(/lib/x86_64-linux-gnu/libpthread.so.0+0=
x153bf)=0A=
=A0=A0=A0=A0#4 0x7fe3df4b624a in __libc_signal_restore_set /build/glibc-ZN9=
5T4/glibc-2.31/nptl/../sysdeps/unix/sysv/linux/internal-signals.h:86:3=0A=
=A0=A0=A0=A0#5 0x7fe3df4b624a in raise /build/glibc-ZN95T4/glibc-2.31/nptl/=
../sysdeps/unix/sysv/linux/raise.c:48:3=0A=
=A0=A0=A0=A0#6 0x550291 in LLVMFuzzerTestOneInput (/home/qiuhao/tmp/a.out+0=
x550291)=0A=
=A0=A0=A0=A0#7 0x458681 in fuzzer::Fuzzer::ExecuteCallback(unsigned char co=
nst*, unsigned long) (/home/qiuhao/tmp/a.out+0x458681)=0A=
=A0=A0=A0=A0#8 0x45a3ba in fuzzer::Fuzzer::ReadAndExecuteSeedCorpora(std::_=
_Fuzzer::vector<fuzzer::SizedFile, fuzzer::fuzzer_allocator<fuzzer::SizedFi=
le> >&) (/home/qiuhao/tmp/a.out+0x45a3ba)=0A=
=A0=A0=A0=A0#9 0x45aa49 in fuzzer::Fuzzer::Loop(std::__Fuzzer::vector<fuzze=
r::SizedFile, fuzzer::fuzzer_allocator<fuzzer::SizedFile> >&) (/home/qiuhao=
/tmp/a.out+0x45aa49)=0A=
=A0=A0=A0=A0#10 0x44971e in fuzzer::FuzzerDriver(int*, char***, int (*)(uns=
igned char const*, unsigned long)) (/home/qiuhao/tmp/a.out+0x44971e)=0A=
=A0=A0=A0=A0#11 0x472562 in main (/home/qiuhao/tmp/a.out+0x472562)=0A=
=A0=A0=A0=A0#12 0x7fe3df2a80b2 in __libc_start_main /build/glibc-ZN95T4/gli=
bc-2.31/csu/../csu/libc-start.c:308:16=0A=
=A0=A0=A0=A0#13 0x41e4bd in _start (/home/qiuhao/tmp/a.out+0x41e4bd)=0A=
=0A=
NOTE: libFuzzer has rudimentary signal handlers.=0A=
=A0=A0=A0=A0=A0=A0Combine libFuzzer with AddressSanitizer or similar for be=
tter crash reports.=0A=
SUMMARY: libFuzzer: deadly signal=0A=
MS: 0 ; base unit: 0000000000000000000000000000000000000000=0A=
=0A=
=0A=
artifact_prefix=3D'./'; Test unit written to ./crash-da39a3ee5e6b4b0d3255bf=
ef95601890afd80709=0A=
Base64:=A0=0A=
=0A=
---=0A=
=0A=
Did I miss something? Or I misused ASAN?=0A=
=0A=
> I like the idea of switching out CRASH_TOKEN for a regex, however I=0A=
> am=0A=
> not sure about using the hardcoded crash_patterns to perform=0A=
> matching:=0A=
> =0A=
> 1.) You risk missing some crash pattern. E.g. I don't think=0A=
> abort()/hw_error() are covered right now.=0A=
=0A=
I reversed your fallback in Patch, just renamed it :)=0A=
=0A=
- =A0 =A0CRASH_TOKEN =3D os.getenv("CRASH_TOKEN")=0A=
+ =A0 =A0crash_pattern =3D os.getenv("CRASH_PATTERN")=0A=
=0A=
> 2.) At some point ASAN/compiler-rt might change the way it outputs=0A=
> crashes.=0A=
=0A=
You are right, but the lines[-2] has the same problem.=0A=
=0A=
> I think the current lines[-2] approach is ugly, but it is small,=0A=
> works=0A=
> in most cases (when coredumps are disabled), and has a simple=0A=
> CRASH_TOKEN fallback mechanism. We should fix the coredump problem.=0A=
> =0A=
> Is there any way to do this without hardcoding patterns (or at least=0A=
> fall-back to something if you don't find a pattern)?=0A=
> =0A=
> -Alex=0A=
=0A=
The major reason I choose to use regex pattern is that we can keep trimming=
 the input trace when removing a instruction triggers a different crash out=
put, especially caused by a changed leaf stack frame. For example,=A0Bug 19=
07497,=A0https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg02380.=
html. Suppose there are duplicate writes which can still crash:=0A=
=0A=
outl 0xcf8 0x80000804=0A=
outw 0xcfc 0xffff=0A=
write 0x0 0x1 0x12=0A=
write 0x2 0x1 0x2f=0A=
outl 0xcf8 0x80000811=0A=
outl 0xcfc 0x5a6a4406=0A=
write 0x6a44005a 0x1 0x11=A0=A0<-- The only one we really need=0A=
write 0x6a44005a 0x1 0x11=A0=A0<-- useless=0A=
write 0x6a44005a 0x1 0x11=A0=A0<-- useless=0A=
write 0x6a44005c 0x1 0x3f=0A=
write 0x6a442050 0x4 0x0000446a=0A=
write 0x6a44204a 0x1 0xf3=0A=
write 0x6a44204c 0x1 0xff=0A=
writeq 0x6a44005a 0x17b3f0011=0A=
write 0x6a442050 0x4 0x0000446a=0A=
write 0x6a44204a 0x1 0xf3=0A=
write 0x6a44204c 0x1 0xff=0A=
=0A=
For this fake input, The lines[-2] would be:=0A=
=0A=
SUMMARY: AddressSanitizer: stack-overflow (/home/qiuhao/hack/qemu/build/qem=
u-system-i386+0x27ca049) in __asan_memcpy=0A=
=0A=
But after we removed a useless write, the lines[-2] **has a chance (around =
1 out of 5)** to be:=0A=
=0A=
SUMMARY: AddressSanitizer: stack-overflow /home/qiuhao/hack/qemu/build/../s=
oftmmu/physmem.c:309:27 in phys_page_find=0A=
=0A=
or=0A=
=0A=
SUMMARY: AddressSanitizer: stack-overflow /home/qiuhao/hack/qemu/build/../s=
oftmmu/physmem.c:354 in address_space_translate_internal=0A=
=0A=
or=0A=
=0A=
SUMMARY: AddressSanitizer: stack-overflow /home/qiuhao/hack/qemu/build/../s=
oftmmu/physmem.c:298 in section_covers_addr=0A=
=0A=
This will stop us from trimming the useless writes.=0A=
=0A=
---=0A=
=0A=
In all, how about we try this:=0A=
=0A=
1. If CRASH_PATTERN defined (fallback), use it.=0A=
2. Else if we can find a pre-defined pattern in the crash output, use it.=
=0A=
3. Use the second-to-end line as the string for comparison.=0A=
=0A=
P.S.=0A=
There are some sophisticated crash case deduplication methods like stack ba=
cktrace hashing or coverage-based comparison, semantics-aware Deduplication=
[1]. But for now, I think our solution can cover most cases.=0A=
=0A=
[1]=A0https://arxiv.org/abs/1812.00140=A06.3.1=A0Deduplication=0A=
=0A=
> > which doesn't contain any information about the assertion failure=0A=
> > like where=0A=
> > it happened or the assertion statement. This may lead to a=0A=
> > minimized input=0A=
> > triggers assertion failure but may indicate another bug. As for=0A=
> > some=0A=
> > sanitizers' crashes, the direct string comparison may stop us from=0A=
> > getting a=0A=
> > smaller input, since they may have a different leaf stack frame.=0A=
> > =0A=
> > Perhaps we can detect crashes using both precise output string=0A=
> > comparison=0A=
> > and rough pattern string match and info the user when the trace=0A=
> > input=0A=
> > triggers different but a seminar output.=0A=
> > =0A=
> > Tested:=0A=
> > Assertion failure, https://bugs.launchpad.net/qemu/+bug/1908062=0A=
> > AddressSanitizer, https://bugs.launchpad.net/qemu/+bug/1907497=0A=
> > Trace input that doesn't crash=0A=
> > Trace input that crashes Qtest=0A=
> > =0A=
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>=0A=
> > ---=0A=
> > =A0scripts/oss-fuzz/minimize_qtest_trace.py | 59 ++++++++++++++++++=0A=
> > ------=0A=
> > =A01 file changed, 46 insertions(+), 13 deletions(-)=0A=
> > =0A=
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py=0A=
> > b/scripts/oss-fuzz/minimize_qtest_trace.py=0A=
> > index 5e405a0d5f..d3b09e6567 100755=0A=
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py=0A=
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py=0A=
> > @@ -10,11 +10,16 @@ import os=0A=
> > =A0import subprocess=0A=
> > =A0import time=0A=
> > =A0import struct=0A=
> > +import re=0A=
> > =0A=
> > =A0QEMU_ARGS =3D None=0A=
> > =A0QEMU_PATH =3D None=0A=
> > =A0TIMEOUT =3D 5=0A=
> > -CRASH_TOKEN =3D None=0A=
> > +=0A=
> > +crash_patterns =3D ("Assertion.+failed",=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0"SUMMARY.+Saniti=
zer")=0A=
> > +crash_pattern =3D None=0A=
> > +crash_string =3D None=0A=
> > =0A=
> > =A0write_suffix_lookup =3D {"b": (1, "B"),=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"w": (2, "H"),=0A=
> > @@ -24,13 +29,12 @@ write_suffix_lookup =3D {"b": (1, "B"),=0A=
> > =A0def usage():=0A=
> > =A0=A0=A0=A0=A0sys.exit("""\=0A=
> > =A0Usage: QEMU_PATH=3D"/path/to/qemu" QEMU_ARGS=3D"args" {} input_trace=
=0A=
> > output_trace=0A=
> > -By default, will try to use the second-to-last line in the output=0A=
> > to identify=0A=
> > -whether the crash occred. Optionally, manually set a string that=0A=
> > idenitifes the=0A=
> > -crash by setting CRASH_TOKEN=3D=0A=
> > +By default, we will try to search predefined crash patterns=0A=
> > through the=0A=
> > +tracing output to see whether the crash occred. Optionally,=0A=
> > manually set a=0A=
> > +string that idenitifes the crash by setting CRASH_PATTERN=3D=0A=
> > =A0""".format((sys.argv[0])))=0A=
> > =0A=
> > =A0def check_if_trace_crashes(trace, path):=0A=
> > -=A0=A0=A0=A0global CRASH_TOKEN=0A=
> > =A0=A0=A0=A0=A0with open(path, "w") as tracefile:=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0tracefile.write("".join(trace))=0A=
> > =0A=
> > @@ -42,17 +46,47 @@ def check_if_trace_crashes(trace, path):=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0shell=3DTrue,=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0stdin=3Dsubprocess.PIPE,=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0stdout=3Dsubprocess.PIPE)=0A=
> > +=A0=A0=A0=A0if rc.returncode =3D=3D 137:=A0=A0=A0=A0# Timed Out=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0return False=0A=
> > +=0A=
> > =A0=A0=A0=A0=A0stdo =3D rc.communicate()[0]=0A=
> > =A0=A0=A0=A0=A0output =3D stdo.decode('unicode_escape')=0A=
> > =A0=A0=A0=A0=A0> -=A0=A0=A0=A0if rc.returncode =3D=3D 137:=A0=A0=A0=A0#=
 Timed Out=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0return False=0A=
> > -=A0=A0=A0=A0if len(output.splitlines()) < 2:=0A=
> > +=A0=A0=A0=A0output_lines =3D output.splitlines()=0A=
> > +=A0=A0=A0=A0# Usually we care about the summary info in the last few=
=0A=
> > lines, reverse.=0A=
> > +=A0=A0=A0=A0output_lines.reverse()=0A=
> > +=0A=
> > +=A0=A0=A0=A0global crash_pattern, crash_patterns, crash_string=0A=
> > +=A0=A0=A0=A0if crash_pattern is None: # Initialization=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0for line in output_lines:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0for c in crash_patterns:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if re.search(c, line) =
is not None:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0crash_patt=
ern =3D c=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0crash_stri=
ng =3D line=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("Ide=
ntifying crash pattern by this=0A=
> > string: ",\=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0crash_string)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("Usi=
ng regex pattern: ", crash_pattern)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return Tru=
e=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0print("Failed to initialize crash pattern: no =
match.")=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0return False=0A=
> > =0A=
> > -=A0=A0=A0=A0if CRASH_TOKEN is None:=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0CRASH_TOKEN =3D output.splitlines()[-2]=0A=
> > +=A0=A0=A0=A0# First, we search exactly the previous crash string.=0A=
> > +=A0=A0=A0=A0for line in output_lines:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0if crash_string =3D=3D line:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return True=0A=
> > +=0A=
> > +=A0=A0=A0=A0# Then we decide whether a similar (same pattern) crash=0A=
> > happened.=0A=
> > +=A0=A0=A0=A0# Slower now :(=0A=
> > +=A0=A0=A0=A0for line in output_lines:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0if re.search(crash_pattern, line) is not None:=
=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("\nINFO: The crash string ch=
anged during our=0A=
> > minimization process.")=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("Before: ", crash_string)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("After: ", line)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print("The original regex pattern =
can still match,=0A=
> > updated the crash string.")=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0crash_string =3D line=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return True=0A=
> > =0A=
> > -=A0=A0=A0=A0return CRASH_TOKEN in output=0A=
> > +=A0=A0=A0=A0# The input did not trigger (the same type) bug.=0A=
> > +=A0=A0=A0=A0return False=0A=
> > =0A=
> > =0A=
> > =A0def minimize_trace(inpath, outpath):=0A=
> > @@ -66,7 +100,6 @@ def minimize_trace(inpath, outpath):=0A=
> > =A0=A0=A0=A0=A0print("Crashed in {} seconds".format(end-start))=0A=
> > =A0=A0=A0=A0=A0TIMEOUT =3D (end-start)*5=0A=
> > =A0=A0=A0=A0=A0print("Setting the timeout for {} seconds".format(TIMEOU=
T))=0A=
> > -=A0=A0=A0=A0print("Identifying Crashes by this string:=0A=
> > {}".format(CRASH_TOKEN))=0A=
> > =0A=
> > =A0=A0=A0=A0=A0i =3D 0=0A=
> > =A0=A0=A0=A0=A0newtrace =3D trace[:]=0A=
> > @@ -152,6 +185,6 @@ if __name__ =3D=3D '__main__':=0A=
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0usage()=0A=
> > =A0=A0=A0=A0=A0# if "accel" not in QEMU_ARGS:=0A=
> > =A0=A0=A0=A0=A0#=A0=A0=A0=A0=A0QEMU_ARGS +=3D " -accel qtest"=0A=
> > -=A0=A0=A0=A0CRASH_TOKEN =3D os.getenv("CRASH_TOKEN")=0A=
> > +=A0=A0=A0=A0crash_pattern =3D os.getenv("CRASH_PATTERN")=0A=
> > =A0=A0=A0=A0=A0QEMU_ARGS +=3D " -qtest stdio -monitor none -serial none=
 "=0A=
> > =A0=A0=A0=A0=A0minimize_trace(sys.argv[1], sys.argv[2])=0A=
> > --=0A=
> > 2.25.1=

