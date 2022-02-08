Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DE4AE323
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:52:02 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYP3-0007c6-DG
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:52:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nHXye-0005wc-OC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:24:46 -0500
Received: from rn-mailsvcp-ppex-lapp15.rno.apple.com ([17.179.253.34]:60290
 helo=rn-mailsvcp-ppex-lapp15.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nHXyc-0001kn-6m
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:24:43 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp15.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp15.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 218LA4lq005847; Tue, 8 Feb 2022 13:24:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=o70s6+Ml66E4jBx+13yKXk8S/G0JPkzC/O3HmDgkMLg=;
 b=cKQVSzUCPxTu0DW1Yq0Bc8DAFKcvGG3huU7UuUYinjXbU8hrsiSY6tJliTcJnIUY3xyo
 WzZjp53gH1UT2enSqT9t9tdcrxMUoSeOw5unswpPkYrJLmacCd2a7f56VKBRAi08g/Bq
 Z7c9o5oz5VYh3qhB6D3GxW878/TaxjlY1JC1TMARhL8iGOmRjgARgww1P7zSXJqODcgk
 zCivtf2SAu7QjW7XNtaskbrHP/CkxjQVPAMx2Tr3vAHDFasXveEqrNbzJO2uYJZeGPvG
 LB5BwXmAeFybnVQ544najjTvbgmjrnxtMP1Iz8jw1a3xgmupjLl6mSQYXLGMNaE9to48 iw== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by rn-mailsvcp-ppex-lapp15.rno.apple.com with ESMTP id 3e1qpehm7g-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 08 Feb 2022 13:24:39 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7000NUF8T2SD60@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Tue, 08 Feb 2022 13:24:38 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7000H008RVR100@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:24:38 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 10eaa2cef73bb493679de983683c1902
X-Va-E-CD: 7d174c9aafcbc99645d0fe64ee5b3509
X-Va-R-CD: 38fff9db7f421575941ae7d379fe6b14
X-Va-CD: 0
X-Va-ID: 6ac5e984-74ad-4b6b-8431-2bbce89c8fd1
X-V-A: 
X-V-T-CD: 10eaa2cef73bb493679de983683c1902
X-V-E-CD: 7d174c9aafcbc99645d0fe64ee5b3509
X-V-R-CD: 38fff9db7f421575941ae7d379fe6b14
X-V-CD: 0
X-V-ID: 2a301f34-40b4-47bb-8379-35c994b52c32
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received: from smtpclient.apple ([17.149.229.60])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R70002M78T1QD10@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:24:38 -0800 (PST)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] hvf: Fix OOB write in RDTSCP instruction decode
From: Cameron Esfahani <dirty@apple.com>
In-reply-to: <20211030000232.2019-1-dirty@apple.com>
Date: Tue, 08 Feb 2022 13:24:37 -0800
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Content-transfer-encoding: quoted-printable
Message-id: <5AAD5B6B-D841-44CA-AE8C-DD975F276E44@apple.com>
References: <20211030000232.2019-1-dirty@apple.com>
To: Cameron Esfahani via <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received-SPF: pass client-ip=17.179.253.34; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp15.apple.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

Cameron


> On Oct 29, 2021, at 5:02 PM, Cameron Esfahani <dirty@apple.com> wrote:
>=20
> A guest could craft a specific stream of instructions that will have =
QEMU
> write 0xF9 to inappropriate locations in memory.  Add additional =
asserts
> to check for this.  Generate a #UD if there are more than 14 prefix =
bytes.
>=20
> Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>
>=20
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
> target/i386/hvf/x86_decode.c | 11 +++++++++--
> target/i386/hvf/x86hvf.c     |  8 ++++++++
> target/i386/hvf/x86hvf.h     |  1 +
> 3 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/i386/hvf/x86_decode.c =
b/target/i386/hvf/x86_decode.c
> index 062713b1a4..fbaf1813e8 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -24,6 +24,7 @@
> #include "vmx.h"
> #include "x86_mmu.h"
> #include "x86_descr.h"
> +#include "x86hvf.h"
>=20
> #define OPCODE_ESCAPE   0xf
>=20
> @@ -541,7 +542,8 @@ static void decode_lidtgroup(CPUX86State *env, =
struct x86_decode *decode)
>     };
>     decode->cmd =3D group[decode->modrm.reg];
>     if (0xf9 =3D=3D decode->modrm.modrm) {
> -        decode->opcode[decode->len++] =3D decode->modrm.modrm;
> +        VM_PANIC_ON(decode->opcode_len >=3D sizeof(decode->opcode));
> +        decode->opcode[decode->opcode_len++] =3D decode->modrm.modrm;
>         decode->cmd =3D X86_DECODE_CMD_RDTSCP;
>     }
> }
> @@ -1847,7 +1849,8 @@ void calc_modrm_operand(CPUX86State *env, struct =
x86_decode *decode,
>=20
> static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
> {
> -    while (1) {
> +    /* At most 14 prefix bytes. */
> +    for (int i =3D 0; i < 14; i++) {
>         /*
>          * REX prefix must come after legacy prefixes.
>          * REX before legacy is ignored.
> @@ -1892,6 +1895,8 @@ static void decode_prefix(CPUX86State *env, =
struct x86_decode *decode)
>             return;
>         }
>     }
> +    /* Too many prefixes!  Generate #UD. */
> +    hvf_inject_ud(env);
> }
>=20
> void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
> @@ -2090,11 +2095,13 @@ static void decode_opcodes(CPUX86State *env, =
struct x86_decode *decode)
>     uint8_t opcode;
>=20
>     opcode =3D decode_byte(env, decode);
> +    VM_PANIC_ON(decode->opcode_len >=3D sizeof(decode->opcode));
>     decode->opcode[decode->opcode_len++] =3D opcode;
>     if (opcode !=3D OPCODE_ESCAPE) {
>         decode_opcode_1(env, decode, opcode);
>     } else {
>         opcode =3D decode_byte(env, decode);
> +        VM_PANIC_ON(decode->opcode_len >=3D sizeof(decode->opcode));
>         decode->opcode[decode->opcode_len++] =3D opcode;
>         decode_opcode_2(env, decode, opcode);
>     }
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 05ec1bddc4..a805c125d9 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -425,6 +425,14 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
>             & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR));
> }
>=20
> +void hvf_inject_ud(CPUX86State *env)
> +{
> +    env->exception_nr =3D EXCP06_ILLOP;
> +    env->exception_injected =3D 1;
> +    env->has_error_code =3D false;
> +    env->error_code =3D 0;
> +}
> +
> int hvf_process_events(CPUState *cpu_state)
> {
>     X86CPU *cpu =3D X86_CPU(cpu_state);
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index 99ed8d608d..ef472a32f9 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -22,6 +22,7 @@
>=20
> int hvf_process_events(CPUState *);
> bool hvf_inject_interrupts(CPUState *);
> +void hvf_inject_ud(CPUX86State *);
> void hvf_set_segment(struct CPUState *cpu, struct vmx_segment =
*vmx_seg,
>                      SegmentCache *qseg, bool is_tr);
> void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
> --=20
> 2.30.1 (Apple Git-130)
>=20
>=20


