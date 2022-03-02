Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC64C9AF3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 03:07:33 +0100 (CET)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEOq-00008y-AF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 21:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nPENk-0007sS-U1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 21:06:24 -0500
Received: from sysprogs.com ([45.79.83.98]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nPENj-00016Y-8C
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 21:06:24 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id B773211A357;
 Wed,  2 Mar 2022 02:06:20 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
 <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
 <87v8x433o2.fsf@linaro.org> <030301d82996$c385f900$4a91eb00$@sysprogs.com>
 <096b01d82c5c$04a0f3a0$0de2dae0$@sysprogs.com> <87czj7nuy3.fsf@linaro.org>
 <0aee01d82d11$450e03f0$cf2a0bd0$@sysprogs.com>
In-Reply-To: <0aee01d82d11$450e03f0$cf2a0bd0$@sysprogs.com>
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Tue, 1 Mar 2022 18:06:19 -0800
Message-ID: <0ce601d82dda$1c88fdd0$559af970$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNIFN5a+FOAvRiv4eJOlcn7oK8VcgKLbPilArczCsgBeoy2sQJTpbLJArW9O3QBWNoVrQGUBQp2AO/OEsupTm+cEA==
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Paolo Bonzini' <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Is there anything I could do to get the WHPX debugging support accepted =
into QEMU? Would the proposed callback AccelOpsClass work for you, or =
would you prefer another approach?

Best,
Ivan

-----Original Message-----
From: Qemu-devel <qemu-devel-bounces+ivan=3Dsysprogs.com@nongnu.org> On =
Behalf Of Ivan Shcherbakov
Sent: Monday, February 28, 2022 6:09 PM
To: 'Alex Benn=C3=A9e' <alex.bennee@linaro.org>
Cc: 'Peter Maydell' <peter.maydell@linaro.org>; mst@redhat.com; =
qemu-devel@nongnu.org; armbru@redhat.com; 'Paolo Bonzini' =
<pbonzini@redhat.com>
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and =
stepping

Hi Alex,

Thanks for getting back to me. It is definitely the latter case (i.e. it =
is possible to change it while the target is stopped at a breakpoint =
before resuming any VCPUs).
vm_state_notify() does look like it's intended for this type of =
notifications, but unfortunately, it doesn't make a distinction between =
stepping and running normally.
Below is the relevant code from gdbstub.c:

>static int gdb_continue_partial(char *newstates) {
>    int flag =3D 0;
>
>    /* Various corner cases omitted for brevity  */
>        if (vm_prepare_start()) {
>            return 0;
>        }
>    CPU_FOREACH(cpu) {
>        switch (newstates[cpu->cpu_index]) {
>        case 's':
>            trace_gdbstub_op_stepping(cpu->cpu_index);
>            cpu_single_step(cpu, gdbserver_state.sstep_flags);
>            cpu_resume(cpu);
>            flag =3D 1;
>            break;
>        case 'c':
>            trace_gdbstub_op_continue_cpu(cpu->cpu_index);
>            cpu_resume(cpu);
>            flag =3D 1;
>            break;
>        default:
>            res =3D -1;
>            break;
>        }
>    }
>}

Also:

>int vm_prepare_start(void)
>{
>    runstate_set(RUN_STATE_RUNNING);
>    vm_state_notify(1, RUN_STATE_RUNNING);
>    return 0;
>}

and:

>void vm_state_notify(bool running, RunState state);

So, currently, vm_prepare_start() has no way of distinguishing between =
single-stepping and normal running unless gdb_continue_partial() scans =
the 'newstates' array before calling it, and passes some extra argument =
to vm_prepare_start(), indicating whether a step request was present =
anywhere in the array.

I couldn't find any existing run state that would match single-stepping, =
and adding another run state looks like a very non-trivial change that =
can easily backfire. Adding another argument to vm_state_notify() could =
be easier, but I am still afraid it could break some other part of QEMU, =
so I thought adding a new member to AccelOpsClass would be a safer bet. =
But again, if you think another way to do it is better, I am very open =
to it.

Best regards,
Ivan

-----Original Message-----
From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Sent: Monday, February 28, 2022 2:28 AM
To: Ivan Shcherbakov <ivan@sysprogs.com>
Cc: 'Peter Maydell' <peter.maydell@linaro.org>; 'Paolo Bonzini' =
<pbonzini@redhat.com>; qemu-devel@nongnu.org; armbru@redhat.com; =
mst@redhat.com
Subject: Re: [PATCH 3/3] whpx: Added support for breakpoints and =
stepping

Is the limitation that whpx_set_exception_exit_bitmap needs to be set =
before any vCPU can be run or that it cannot be set if any vCPUs are =
currently running?
If it is the later wouldn't adding a hook into the vm_change_state_head =
callbacks be enough?


