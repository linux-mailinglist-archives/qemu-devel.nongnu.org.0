Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3D3CB8A1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:20:05 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4OhA-0002r6-70
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m4Og1-00025c-R5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m4Ofx-0006i6-II
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626445128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smRtIMAjkMgnp7k8DZobIq9s3JktBEtj30n/8R7U3DQ=;
 b=fq7mQHMMVqPVZ+TnFJyzlbZuMLa174fxfq7V7wqJVAaguMyOUhX1kszKpPh1AS3y14QYWO
 dyBJBjp7XI+TJz3Qn2tmbMIaNKQGFwsjght1qslb9cGhV+4OFL648NBkwhIFB7QH4Tfms8
 PSTHaUC2KJDnx/tCjDohP7k/k5j0sjY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Ld0-QNf0Oz-6PNb0qvnpkg-1; Fri, 16 Jul 2021 10:18:46 -0400
X-MC-Unique: Ld0-QNf0Oz-6PNb0qvnpkg-1
Received: by mail-qv1-f71.google.com with SMTP id
 l4-20020a0ce8440000b02902d89f797d08so6694317qvo.17
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 07:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LKje1lynK5nXhmeBIiESZGRz6S89BMz2TN73LUOeCcs=;
 b=NSawxiFzZNaoWX1OP2yJqStgUGsGSycUQZBGbQ7jHXAq9hyXvzodyqjzMg3QgHy+s4
 P3ubZIQROEZ2AzL6QGeIZEZHp1gWtRCKfndVFVPCGSVC17YrsRdmZ1QkIhjMtBhFh7oz
 VUGGRKyYNQHaoOnI3yGjFeuJsPxG6Xxy0MfEnwwBM6o4ODMlmQXeYYyldrhvAxoMJWfG
 /XJbf28usq1KPcjrFyUHwWYx7wqiyAGTMPHutJAqWfLYuB53E83AqQLoZZXgKArkXxOZ
 RM49l3SL1Qz3fddjDV1vVj9PNw0cKBgkCL4BRdc6tsQs1RGF8tfU5HUUpllmpZl6LIcf
 TWOA==
X-Gm-Message-State: AOAM5301ICqXCRznSEQrQ2Vuoc1+xloDD16Xj4ppSTrBJzCGojvJEsxM
 u334srt0RkFIUhVZvoilJrWuwROKRTkUbjc1SO/I9l+3U/JSw9EEQ2fWLTcb4ufA/Hy+w3PKE+3
 vnTIli4YKWnGwzOU=
X-Received: by 2002:a05:620a:f85:: with SMTP id
 b5mr10139879qkn.162.1626445125624; 
 Fri, 16 Jul 2021 07:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ2uxFb9UvCuZ/deQNDrsyQHP6BlOC9KNJ12WyyPsTnjrLYsqBqQU7kac3lF4T/HaAiJ1Bfw==
X-Received: by 2002:a05:620a:f85:: with SMTP id
 b5mr10139856qkn.162.1626445125381; 
 Fri, 16 Jul 2021 07:18:45 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id f24sm262540qtq.82.2021.07.16.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:18:44 -0700 (PDT)
Date: Fri, 16 Jul 2021 10:18:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: Question on memory commit during MR finalize()
Message-ID: <YPGVQ0ONUc/qPSNz@t490s>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Levon <john.levon@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16, 2021 at 11:42:02AM +0000, Thanos Makatos wrote:
> > -----Original Message-----
> > From: Peter Xu <peterx@redhat.com>
> > Sent: 15 July 2021 19:35
> > To: Thanos Makatos <thanos.makatos@nutanix.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>; Markus Armbruster
> > <armbru@redhat.com>; QEMU Devel Mailing List <qemu-
> > devel@nongnu.org>; John Levon <john.levon@nutanix.com>; John G
> > Johnson <john.g.johnson@oracle.com>
> > Subject: Re: Question on memory commit during MR finalize()
> >=20
> > On Thu, Jul 15, 2021 at 02:27:48PM +0000, Thanos Makatos wrote:
> > > Hi Peter,
> >=20
> > Hi, Thanos,
> >=20
> > > We're hitting this issue using a QEMU branch where JJ is using vfio-u=
ser as
> > the transport for multiprocess-qemu
> > (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__github.com_oracle_qemu_issues_9&d=3DDwIBaQ&c=3Ds883GpUCOChKOHi
> > ocYtGcg&r=3DXTpYsh5Ps2zJvtw6ogtti46atk736SI4vgsJiUKIyDE&m=3D9nFuGF9kg5l
> > ZsKPi03BNzo9pckG8DlodVG0LuEofnKw&s=3Ddcp70CIgJljcWFwSRZm5zZRJj80jX
> > XERLwpbH6ZcgzQ&e=3D ). We can reproduce it fairly reliably by migrating=
 a
> > virtual SPDK NVMe controller (the NVMf/vfio-user target with experiment=
al
> > migration support, https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__review.spdk.io_gerrit_c_spdk_spdk_-
> > 2B_7617_14&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw
> > 6ogtti46atk736SI4vgsJiUKIyDE&m=3D9nFuGF9kg5lZsKPi03BNzo9pckG8DlodVG0
> > LuEofnKw&s=3DiXolOQM5sYj4IB-cf__Ta8jgKXZqisYE-uuwq6qnbLo&e=3D ). I can
> > provide detailed repro instructions but first I want to make sure we're=
 not
> > missing any patches.
> >=20
> > I don't think you missed any bug fix patches, as the issue I mentioned =
can
> > only be trigger with my own branch at that time, and that's fixed when =
my
> > patchset got merged.
> >=20
> > However if you encountered the same issue, it's possible that there's a=
n
> > incorrect use of qemu memory/cpu API too somewhere there so similar
> > issue is triggered.  For example, in my case it was run_on_cpu() called
> > incorrectly within memory layout changing so BQL is released without be=
ing
> > noticed.
> >=20
> > I've got a series that tries to expose these hard to debug issues:
> >=20
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__lore.kernel.org_qemu-2Ddevel_20200421162108.594796-2D1-2Dpeterx-
> > 40redhat.com_&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJ
> > vtw6ogtti46atk736SI4vgsJiUKIyDE&m=3D9nFuGF9kg5lZsKPi03BNzo9pckG8Dlod
> > VG0LuEofnKw&s=3DkQRJEb4CQmxEirS-III15QJz_phzhCYLIgjOF-SB9Pk&e=3D
> >=20
> > Obviously the series didn't track enough interest so it didn't get merg=
ed.
> > However maybe that's also something useful to what you're debugging, so
> > you can apply those patches onto your branch and see the stack when it
> > reproduces again. Logically with these sanity patches it could fail ear=
lier than
> > what you've hit right now (which I believe should be within the RCU thr=
ead;
> > btw it would be interesting to share your stack too when it's hit) and =
it could
> > provide more useful information.
> >=20
> > I saw that the old series won't apply onto master any more, so I rebase=
d it
> > and pushed it here (with one patch dropped since someone wrote a simila=
r
> > patch and got merged, so there're only 7 patches in the new tree):
> >=20
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__github.com_xzpeter_qemu_tree_memory-
> > 2Dsanity&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6og
> > tti46atk736SI4vgsJiUKIyDE&m=3D9nFuGF9kg5lZsKPi03BNzo9pckG8DlodVG0LuE
> > ofnKw&s=3DG-8FV-H-VcZTgCVRfTEVKo1GALIk2PqBvTdAcAXFoZ0&e=3D
> >=20
> > No guarantee it'll help, but IMHO worth trying.
>=20
> The memory-sanity branch fails to build:
>=20
> ./configure --prefix=3D/opt/qemu-xzpeter --target-list=3Dx86_64-linux-use=
r  --enable-debug
> make -j 8
> ...
> [697/973] Linking target qemu-x86_64
> FAILED: qemu-x86_64
> c++  -o qemu-x86_64 libcommon.fa.p/cpus-common.c.o libcommon.fa.p/page-va=
ry-common.c.o libcommon.fa.p/disas_i386.c.o libcommon.fa.p/disas_capstone.c=
.o libcommon.fa.p/hw_core_cpu-common.c.o libcommon.fa.p/ebpf_ebpf_rss-stub.=
c.o libcommon.fa.p/accel_accel-user.c.o libqemu-x86_64-linux-user.fa.p/targ=
et_i386_tcg_user_excp_helper.c.o libqemu-x86_64-linux-user.fa.p/target_i386=
_tcg_user_seg_helper.c.o libqemu-x86_64-linux-user.fa.p/linux-user_x86_64_s=
ignal.c.o libqemu-x86_64-linux-user.fa.p/linux-user_x86_64_cpu_loop.c.o lib=
qemu-x86_64-linux-user.fa.p/target_i386_cpu.c.o libqemu-x86_64-linux-user.f=
a.p/target_i386_gdbstub.c.o libqemu-x86_64-linux-user.fa.p/target_i386_help=
er.c.o libqemu-x86_64-linux-user.fa.p/target_i386_xsave_helper.c.o libqemu-=
x86_64-linux-user.fa.p/target_i386_cpu-dump.c.o libqemu-x86_64-linux-user.f=
a.p/target_i386_sev-stub.c.o libqemu-x86_64-linux-user.fa.p/target_i386_kvm=
_kvm-stub.c.o libqemu-x86_64-linux-user.fa.p/target_i386_tcg_bpt_helper.c.o=
 libqemu-x86_64-linux-user.fa.p/target_i386_tcg_cc_helper.c.o libqemu-x86_6=
4-linux-user.fa.p/target_i386_tcg_excp_helper.c.o libqemu-x86_64-linux-user=
.fa.p/target_i386_tcg_fpu_helper.c.o libqemu-x86_64-linux-user.fa.p/target_=
i386_tcg_int_helper.c.o libqemu-x86_64-linux-user.fa.p/target_i386_tcg_mem_=
helper.c.o libqemu-x86_64-linux-user.fa.p/target_i386_tcg_misc_helper.c.o l=
ibqemu-x86_64-linux-user.fa.p/target_i386_tcg_mpx_helper.c.o libqemu-x86_64=
-linux-user.fa.p/target_i386_tcg_seg_helper.c.o libqemu-x86_64-linux-user.f=
a.p/target_i386_tcg_tcg-cpu.c.o libqemu-x86_64-linux-user.fa.p/target_i386_=
tcg_translate.c.o libqemu-x86_64-linux-user.fa.p/trace_control-target.c.o l=
ibqemu-x86_64-linux-user.fa.p/cpu.c.o libqemu-x86_64-linux-user.fa.p/disas.=
c.o libqemu-x86_64-linux-user.fa.p/gdbstub.c.o libqemu-x86_64-linux-user.fa=
.p/page-vary.c.o libqemu-x86_64-linux-user.fa.p/tcg_optimize.c.o libqemu-x8=
6_64-linux-user.fa.p/tcg_region.c.o libqemu-x86_64-linux-user.fa.p/tcg_tcg.=
c.o libqemu-x86_64-linux-user.fa.p/tcg_tcg-common.c.o libqemu-x86_64-linux-=
user.fa.p/tcg_tcg-op.c.o libqemu-x86_64-linux-user.fa.p/tcg_tcg-op-gvec.c.o=
 libqemu-x86_64-linux-user.fa.p/tcg_tcg-op-vec.c.o libqemu-x86_64-linux-use=
r.fa.p/fpu_softfloat.c.o libqemu-x86_64-linux-user.fa.p/accel_accel-common.=
c.o libqemu-x86_64-linux-user.fa.p/accel_tcg_tcg-all.c.o libqemu-x86_64-lin=
ux-user.fa.p/accel_tcg_cpu-exec-common.c.o libqemu-x86_64-linux-user.fa.p/a=
ccel_tcg_cpu-exec.c.o libqemu-x86_64-linux-user.fa.p/accel_tcg_tcg-runtime-=
gvec.c.o libqemu-x86_64-linux-user.fa.p/accel_tcg_tcg-runtime.c.o libqemu-x=
86_64-linux-user.fa.p/accel_tcg_translate-all.c.o libqemu-x86_64-linux-user=
.fa.p/accel_tcg_translator.c.o libqemu-x86_64-linux-user.fa.p/accel_tcg_use=
r-exec.c.o libqemu-x86_64-linux-user.fa.p/accel_tcg_user-exec-stub.c.o libq=
emu-x86_64-linux-user.fa.p/accel_tcg_plugin-gen.c.o libqemu-x86_64-linux-us=
er.fa.p/accel_stubs_hax-stub.c.o libqemu-x86_64-linux-user.fa.p/accel_stubs=
_xen-stub.c.o libqemu-x86_64-linux-user.fa.p/accel_stubs_kvm-stub.c.o libqe=
mu-x86_64-linux-user.fa.p/plugins_loader.c.o libqemu-x86_64-linux-user.fa.p=
/plugins_core.c.o libqemu-x86_64-linux-user.fa.p/plugins_api.c.o libqemu-x8=
6_64-linux-user.fa.p/linux-user_elfload.c.o libqemu-x86_64-linux-user.fa.p/=
linux-user_exit.c.o libqemu-x86_64-linux-user.fa.p/linux-user_fd-trans.c.o =
libqemu-x86_64-linux-user.fa.p/linux-user_linuxload.c.o libqemu-x86_64-linu=
x-user.fa.p/linux-user_main.c.o libqemu-x86_64-linux-user.fa.p/linux-user_m=
map.c.o libqemu-x86_64-linux-user.fa.p/linux-user_safe-syscall.S.o libqemu-=
x86_64-linux-user.fa.p/linux-user_signal.c.o libqemu-x86_64-linux-user.fa.p=
/linux-user_strace.c.o libqemu-x86_64-linux-user.fa.p/linux-user_syscall.c.=
o libqemu-x86_64-linux-user.fa.p/linux-user_uaccess.c.o libqemu-x86_64-linu=
x-user.fa.p/linux-user_uname.c.o libqemu-x86_64-linux-user.fa.p/thunk.c.o l=
ibqemu-x86_64-linux-user.fa.p/meson-generated_.._x86_64-linux-user-gdbstub-=
xml.c.o libqemu-x86_64-linux-user.fa.p/meson-generated_.._trace_generated-h=
elpers.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libh=
wcore.fa libqom.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -W=
l,-z,now -m64 -fstack-protector-strong -Wl,--start-group libcapstone.a libq=
emuutil.a libhwcore.fa libqom.fa -ldl -Wl,--dynamic-list=3D/root/src/qemu/b=
uild/qemu-plugins-ld.symbols -lrt -lutil -lm -pthread -Wl,--export-dynamic =
-lgmodule-2.0 -lglib-2.0 -lstdc++ -Wl,--end-group
> /usr/bin/ld: libcommon.fa.p/cpus-common.c.o: in function `do_run_on_cpu':
> /root/src/qemu/build/../cpus-common.c:153: undefined reference to `qemu_c=
ond_wait_iothread'
> collect2: error: ld returned 1 exit status
> [698/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_ui64_r_minMag.c.o
> [699/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_i32_r_minMag.c.o
> [700/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_f16.c.o
> [701/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_f64.c.o
> [702/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_i64_r_minMag.c.o
> [703/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_extF80M.c.o
> [704/973] Compiling C object tests/fp/libsoftfloat.a.p/berkeley-softfloat=
-3_source_f32_to_extF80.c.o
> ninja: build stopped: subcommand failed.
> make[1]: *** [Makefile:154: run-ninja] Error 1
> make[1]: Leaving directory '/root/src/qemu/build'
> make: *** [GNUmakefile:11: all] Error 2

So it fails linux-user...  I can fix the compilation, but it should pass
x86_64-softmmu. More importantly - are you using linux-user binaries?  The
thing is my branch will only be helpful to debug BQL related issues, so if
that's the case then please ignore the branch as linux-user shouldn't be us=
ing
bql, then my branch won't help.

>=20
> Regarding the stack trace, I can very easily reproduce it on our branch, =
I know exactly where to set the breakpoint:
>=20
> (gdb) r
> Starting prThread 0x7fffeffff7 In: __pthread_cond_waitu host -enable-kvm =
-smp 4 -nographic -m 2G -object memory-backend-file,id=3Dmem0,size=3D2G,mem=
-path=3D/dev/hugepages,share=3Don,prealloc=3Dyes, -numa node,memdev=3Dmem0 =
-L88   PC: 0x7ffff772700cuThread 8 "qemu-system-x86" received signal SIGUSR=
1, User defined signal 1.
>                         f58c1        GI_raise                            =
                                                                           =
                                                                 50        =
       58f7bb
> #0  0x00007ffff758f7bb in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:50
> #1  0x00007ffff757a535 in __GI_abort () at abort.c:79
> #2  0x0000555555c9301e in kvm_set_phys_mem (kml=3D0x5555568ee830, section=
=3D0x7ffff58c05e0, add=3Dtrue) at ../accel/kvm/kvm-all.c:1194
> #3  0x0000555555c930cd in kvm_region_add (listener=3D0x5555568ee830, sect=
ion=3D0x7ffff58c05e0) at ../accel/kvm/kvm-all.c:1211
> #4  0x0000555555bd6c9e in address_space_update_topology_pass (as=3D0x5555=
56648420 <address_space_memory>, old_view=3D0x555556f21730, new_view=3D0x7f=
fff0001cb0, adding=3Dtrue) at ../softmmu/memory.c:971
> #5  0x0000555555bd6f98 in address_space_set_flatview (as=3D0x555556648420=
 <address_space_memory>) at ../softmmu/memory.c:1047
> #6  0x0000555555bd713f in memory_region_transaction_commit () at ../softm=
mu/memory.c:1099
> #7  0x0000555555bd89a5 in memory_region_finalize (obj=3D0x555556e21800) a=
t ../softmmu/memory.c:1751
> #8  0x0000555555cca132 in object_deinit (obj=3D0x555556e21800, type=3D0x5=
555566a8f80) at ../qom/object.c:673
> #9  0x0000555555cca1a4 in object_finalize (data=3D0x555556e21800) at ../q=
om/object.c:687
> #10 0x0000555555ccb196 in object_unref (objptr=3D0x555556e21800) at ../qo=
m/object.c:1186
> #11 0x0000555555bb11f0 in phys_section_destroy (mr=3D0x555556e21800) at .=
./softmmu/physmem.c:1171
> #12 0x0000555555bb124a in phys_sections_free (map=3D0x5555572cf9a0) at ..=
/softmmu/physmem.c:1180
> #13 0x0000555555bb4632 in address_space_dispatch_free (d=3D0x5555572cf990=
) at ../softmmu/physmem.c:2562
> #14 0x0000555555bd4485 in flatview_destroy (view=3D0x5555572cf950) at ../=
softmmu/memory.c:291
> #15 0x0000555555e367e8 in call_rcu_thread (opaque=3D0x0) at ../util/rcu.c=
:281
> #16 0x0000555555e68e57 in qemu_thread_start (args=3D0x555556665e30) at ..=
/util/qemu-thread-posix.c:521
> #17 0x00007ffff7720fa3 in start_thread (arg=3D<optimized out>) at pthread=
_create.c:486lot=3D10, start=3D0xfebd1000, size=3D0x1000: File exists
> #18 0x00007ffff76514cf in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

Yes indeed it looks alike.

--=20
Peter Xu


