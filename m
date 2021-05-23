Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8FD38DB2A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 14:25:09 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lknAK-0007pZ-CZ
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 08:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghammer@redhat.com>)
 id 1lkn96-00078W-Ma
 for qemu-devel@nongnu.org; Sun, 23 May 2021 08:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghammer@redhat.com>)
 id 1lkn92-00028Q-Pg
 for qemu-devel@nongnu.org; Sun, 23 May 2021 08:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621772625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cO5/AcHi93cRobJvM+S0QZjVNSXUo8BjKi/Yjvbxcyw=;
 b=WRK12syvU0YwFxWIdu73iacIwiw2nEPVtCBbiNk+1hoIUfSa6Kk5xXXReeAkj32x4sR/q4
 tUAFYWua89RXus1krnx/hGxZFeN7dIgwKknfHk2u6DttUMND3c9xDvAgspt9qN67ll4chs
 b6OTCdAklxkDwr2egcmSJ9cfKGclD3U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-ZysF1m6xOmCoIVFUG4JHwg-1; Sun, 23 May 2021 08:23:43 -0400
X-MC-Unique: ZysF1m6xOmCoIVFUG4JHwg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso14013279edd.19
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 05:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cO5/AcHi93cRobJvM+S0QZjVNSXUo8BjKi/Yjvbxcyw=;
 b=Qs8dkaehCTo9NKF0sKioOEs0GgzJEdBJqqXFhcoi7M4TXSc6qzzPSMgmpa727tbCdV
 XqyoOpVBptwAYOR27KuyE6ZHSga9kny8wmoBPpMhAMZm1sYYEz3RM7M36N5CYbj6jhIk
 B8mSrFWTtBcts3dXaTbn8waCmEBVTgaTuerbmfsoZYjuYnKUQFxgePCyFHjl0kvfi4XZ
 bkhZJv1faFTXbRWwxijqT1QXQa8pycFUFEVRc6ra+BD45GOvZMgsFAfFomS/RaLZ1GXU
 RibO8zm0GS+zyBg7UAkKBNvATqvHFmjlADUTBoqzmNPxZZgxLtE/oBZY+kVNKhOxwbwX
 VSMw==
X-Gm-Message-State: AOAM5307zlIBn206f9/ZFSpLv43GlDwSWpCJnYJgukFEx6NQFu9i06CW
 pCd3r20kQEXtXKUx6MtzsdpKm4hkYF/hgclwbYcSmZrDiragfHS9BhF24tC+753/AKteYCP4rWr
 Ro77QoAbn6GbTh5Z9BNScAIKNeskd0z4=
X-Received: by 2002:aa7:d455:: with SMTP id q21mr20361783edr.2.1621772621846; 
 Sun, 23 May 2021 05:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaWdOv2bnU+aZCHitc9jdlbLGchMr8uWtUxwGZY5lw/5ry+R66+p3GMfo2vfeyCTmVlKMiAisnPS+AFAWatzA=
X-Received: by 2002:aa7:d455:: with SMTP id q21mr20361770edr.2.1621772621672; 
 Sun, 23 May 2021 05:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210520080652.GA16421@yangzhon-Virtual>
In-Reply-To: <20210520080652.GA16421@yangzhon-Virtual>
From: Gal Hammer <ghammer@redhat.com>
Date: Sun, 23 May 2021 15:23:30 +0300
Message-ID: <CAA2ifQy_R3q70D6-E1MmnLLMPsJY5_DwJxopePQJQuMSv6xRxQ@mail.gmail.com>
Subject: Re: The latest Qemu release can't bootup VM with latest guest kernel.
To: Yang Zhong <yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ghammer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000582f805c2fe5df2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ghammer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000582f805c2fe5df2
Content-Type: text/plain; charset="UTF-8"

Hi Yang,

On Thu, 20 May 2021 at 11:27, Yang Zhong <yang.zhong@intel.com> wrote:

> Hello all,
>
> I found the latest Qemu release can't bootup the VM with latest guest
> kernel(>5.13).
>
> The normal v6.0.0 release is good to bootup the latest guest kernel.
>
> There are two issues were found
> 1. Guest kernel panic.
> 2. kvm disabled by bios
>
> The panic log as below:
> [    2.250024] BUG: unable to handle page fault for address:
> ffffffffac06c55f
> [    2.252226] #PF: supervisor write access in kernel mode
> [    2.253892] #PF: error_code(0x0003) - permissions violation
> [    2.255671] PGD 5940e067 P4D 5940f067 PUD 59410063 PMD 580001e1
> [    2.257567] Oops: 0003 [#1] SMP NOPTI
> [    2.258738] CPU: 2 PID: 313 Comm: systemd-udevd Not tainted 5.13.0-rc1+
> #1
> [    2.260899] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 0.0.0 02/06/2015
> [    2.263375] RIP: 0010:__send_ipi_mask+0x1bf/0x240
> [    2.264855] Code: c0 48 c7 44 24 18 00 00 00 00 e9 48 ff ff ff 48 89 d0
> 4c 09 c8 74 1b 49 63 d7 48 63 74 24 0c b8 0a 00 00 00 4c 89 cb 4c 89 d1
> <0f> 01 d9 48 85 c0 78 4a 48 f7 04 24 00 02 00 00 0f 84 80 fe ff ff
> [    2.270643] RSP: 0018:ff591a62c0193ab0 EFLAGS: 00010006
> [    2.272277] RAX: 000000000000000a RBX: 0000000000000009 RCX:
> 0000000000000000
> [    2.274482] RDX: 0000000000000000 RSI: 00000000000000fc RDI:
> ff13a83dc003c830
> [    2.276663] RBP: ff591a62c0193b08 R08: 0000000000000004 R09:
> 0000000000000009
> [    2.278866] R10: 0000000000000000 R11: 0000000000000000 R12:
> 0000000000000000
> [    2.281065] R13: ff13a83dc003c830 R14: 0000000000011580 R15:
> 0000000000000000
> [    2.283272] FS:  00007f23ebd07940(0000) GS:ff13a83e3bd00000(0000)
> knlGS:0000000000000000
> [    2.285794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.287574] CR2: ffffffffac06c55f CR3: 0000000106ce2003 CR4:
> 0000000000771ee0
> [    2.289757] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    2.291972] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    2.294177] PKRU: 55555554
> [    2.295043] Call Trace:
> [    2.295820]  kvm_smp_send_call_func_ipi+0xe/0x60
> [    2.297220]  smp_call_function_many_cond+0x25d/0x2a0
> [    2.298772]  ? flush_tlb_one_kernel+0x20/0x20
> [    2.300145]  on_each_cpu_cond_mask+0x1e/0x20
> [    2.301514]  flush_tlb_kernel_range+0x8d/0x90
> [    2.302799]  __purge_vmap_area_lazy+0xc1/0x6a0
> [    2.304097]  ? cpumask_next+0x1f/0x20
> [    2.305160]  ? purge_fragmented_blocks_allcpus+0x3d/0x210
> [    2.306686]  _vm_unmap_aliases+0xf1/0x120
> [    2.307861]  change_page_attr_set_clr+0x95/0x280
> [    2.309203]  set_memory_ro+0x26/0x30
> [    2.310259]  ? 0xffffffffc00f7000
> [    2.311214]  module_enable_ro.part.58+0x62/0xc0
> [    2.312417]  do_init_module+0x17a/0x230
> [    2.313460]  load_module+0x1a30/0x1b00
> [    2.314463]  ? __do_sys_finit_module+0xad/0x110
> [    2.315702]  __do_sys_finit_module+0xad/0x110
> [    2.316890]  do_syscall_64+0x39/0x80
> [    2.317868]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [    2.319226] RIP: 0033:0x7f23ea8f32bd
>
>
> I also used the bisect to get the bad commit id:
> f5cc5a5c168674f84bf061cdb307c2d25fba5448
>
> This issue is known issue? or some fixs are ready to fix those issues?
> thanks!
>

What's your qemu command line?

I'm also having a kernel crash (although I think mine is with a different
call stack) when using "-cpu host". The crash doesn't occur when I use
"kvm64" cpu type.

    Gal.


>
> Regards,
>
> Yang
>
>
>
>

--0000000000000582f805c2fe5df2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Yang,<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 May 2021 at 11:27=
, Yang Zhong &lt;<a href=3D"mailto:yang.zhong@intel.com">yang.zhong@intel.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello all,<br>
<br>
I found the latest Qemu release can&#39;t bootup the VM with latest guest k=
ernel(&gt;5.13).<br>
<br>
The normal v6.0.0 release is good to bootup the latest guest kernel.<br>
<br>
There are two issues were found<br>
1. Guest kernel panic.<br>
2. kvm disabled by bios<br>
<br>
The panic log as below:<br>
[=C2=A0 =C2=A0 2.250024] BUG: unable to handle page fault for address: ffff=
ffffac06c55f<br>
[=C2=A0 =C2=A0 2.252226] #PF: supervisor write access in kernel mode<br>
[=C2=A0 =C2=A0 2.253892] #PF: error_code(0x0003) - permissions violation<br=
>
[=C2=A0 =C2=A0 2.255671] PGD 5940e067 P4D 5940f067 PUD 59410063 PMD 580001e=
1<br>
[=C2=A0 =C2=A0 2.257567] Oops: 0003 [#1] SMP NOPTI<br>
[=C2=A0 =C2=A0 2.258738] CPU: 2 PID: 313 Comm: systemd-udevd Not tainted 5.=
13.0-rc1+ #1<br>
[=C2=A0 =C2=A0 2.260899] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)=
, BIOS 0.0.0 02/06/2015<br>
[=C2=A0 =C2=A0 2.263375] RIP: 0010:__send_ipi_mask+0x1bf/0x240<br>
[=C2=A0 =C2=A0 2.264855] Code: c0 48 c7 44 24 18 00 00 00 00 e9 48 ff ff ff=
 48 89 d0 4c 09 c8 74 1b 49 63 d7 48 63 74 24 0c b8 0a 00 00 00 4c 89 cb 4c=
 89 d1 &lt;0f&gt; 01 d9 48 85 c0 78 4a 48 f7 04 24 00 02 00 00 0f 84 80 fe =
ff ff<br>
[=C2=A0 =C2=A0 2.270643] RSP: 0018:ff591a62c0193ab0 EFLAGS: 00010006<br>
[=C2=A0 =C2=A0 2.272277] RAX: 000000000000000a RBX: 0000000000000009 RCX: 0=
000000000000000<br>
[=C2=A0 =C2=A0 2.274482] RDX: 0000000000000000 RSI: 00000000000000fc RDI: f=
f13a83dc003c830<br>
[=C2=A0 =C2=A0 2.276663] RBP: ff591a62c0193b08 R08: 0000000000000004 R09: 0=
000000000000009<br>
[=C2=A0 =C2=A0 2.278866] R10: 0000000000000000 R11: 0000000000000000 R12: 0=
000000000000000<br>
[=C2=A0 =C2=A0 2.281065] R13: ff13a83dc003c830 R14: 0000000000011580 R15: 0=
000000000000000<br>
[=C2=A0 =C2=A0 2.283272] FS:=C2=A0 00007f23ebd07940(0000) GS:ff13a83e3bd000=
00(0000) knlGS:0000000000000000<br>
[=C2=A0 =C2=A0 2.285794] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033<br>
[=C2=A0 =C2=A0 2.287574] CR2: ffffffffac06c55f CR3: 0000000106ce2003 CR4: 0=
000000000771ee0<br>
[=C2=A0 =C2=A0 2.289757] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000<br>
[=C2=A0 =C2=A0 2.291972] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400<br>
[=C2=A0 =C2=A0 2.294177] PKRU: 55555554<br>
[=C2=A0 =C2=A0 2.295043] Call Trace:<br>
[=C2=A0 =C2=A0 2.295820]=C2=A0 kvm_smp_send_call_func_ipi+0xe/0x60<br>
[=C2=A0 =C2=A0 2.297220]=C2=A0 smp_call_function_many_cond+0x25d/0x2a0<br>
[=C2=A0 =C2=A0 2.298772]=C2=A0 ? flush_tlb_one_kernel+0x20/0x20<br>
[=C2=A0 =C2=A0 2.300145]=C2=A0 on_each_cpu_cond_mask+0x1e/0x20<br>
[=C2=A0 =C2=A0 2.301514]=C2=A0 flush_tlb_kernel_range+0x8d/0x90<br>
[=C2=A0 =C2=A0 2.302799]=C2=A0 __purge_vmap_area_lazy+0xc1/0x6a0<br>
[=C2=A0 =C2=A0 2.304097]=C2=A0 ? cpumask_next+0x1f/0x20<br>
[=C2=A0 =C2=A0 2.305160]=C2=A0 ? purge_fragmented_blocks_allcpus+0x3d/0x210=
<br>
[=C2=A0 =C2=A0 2.306686]=C2=A0 _vm_unmap_aliases+0xf1/0x120<br>
[=C2=A0 =C2=A0 2.307861]=C2=A0 change_page_attr_set_clr+0x95/0x280<br>
[=C2=A0 =C2=A0 2.309203]=C2=A0 set_memory_ro+0x26/0x30<br>
[=C2=A0 =C2=A0 2.310259]=C2=A0 ? 0xffffffffc00f7000<br>
[=C2=A0 =C2=A0 2.311214]=C2=A0 module_enable_ro.part.58+0x62/0xc0<br>
[=C2=A0 =C2=A0 2.312417]=C2=A0 do_init_module+0x17a/0x230<br>
[=C2=A0 =C2=A0 2.313460]=C2=A0 load_module+0x1a30/0x1b00<br>
[=C2=A0 =C2=A0 2.314463]=C2=A0 ? __do_sys_finit_module+0xad/0x110<br>
[=C2=A0 =C2=A0 2.315702]=C2=A0 __do_sys_finit_module+0xad/0x110<br>
[=C2=A0 =C2=A0 2.316890]=C2=A0 do_syscall_64+0x39/0x80<br>
[=C2=A0 =C2=A0 2.317868]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae<br>
[=C2=A0 =C2=A0 2.319226] RIP: 0033:0x7f23ea8f32bd<br>
<br>
<br>
I also used the bisect to get the bad commit id: f5cc5a5c168674f84bf061cdb3=
07c2d25fba5448<br>
<br>
This issue is known issue? or some fixs are ready to fix those issues? than=
ks!<br></blockquote><div><br></div><div><div style=3D"font-family:verdana,s=
ans-serif" class=3D"gmail_default">What&#39;s your qemu command line?</div>=
<div style=3D"font-family:verdana,sans-serif" class=3D"gmail_default"><br><=
/div><div style=3D"font-family:verdana,sans-serif" class=3D"gmail_default">=
I&#39;m also having a kernel crash (although I think mine is with a differe=
nt call stack) when using &quot;-cpu host&quot;. The crash doesn&#39;t occu=
r when I use &quot;kvm64&quot; cpu type.<br></div></div><div><br></div><div=
><div style=3D"font-family:verdana,sans-serif" class=3D"gmail_default">=C2=
=A0=C2=A0=C2=A0 Gal.<br></div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Regards,<br>
<br>
Yang<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000582f805c2fe5df2--


