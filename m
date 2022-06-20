Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74A551881
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:12:50 +0200 (CEST)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GGv-00080z-VC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o3GEO-0005av-HS
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:10:12 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o3GEM-0005Vh-Nm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:10:12 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id x38so18584837ybd.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnIITciV8haa/THeYrVw9dV/Zy6FRpnqTaG6psHd29A=;
 b=OATyM+JQ2u9uVMIr2xQj/9fLdLWkSwzigXfnr+DSVYrzhVgdwmUOABDnO08WGx73t8
 GnH2eIoj5QngQI/+m4RBpuDIXVBce1GhQSOH9CwmxDuxdFM8+s1bTmxOUqb6NNQYCH9p
 98NFkXmBXE43aw7kzwrXlcvVSSptVua+VOnN993k/yfYdFAAHF6BZKwlfVRMeHWy33SI
 NQF60/rrL5MvaTKZHQMgFxSwdEZAh3U5B448xeMnJk+sxgGPDri2Y/LrHYQWFDZ+jcdn
 pDSrmkZNsFnzrMIU2ZdKIArmITV00WibuAIUzhpQ1v2smsHEryf18/fnflfYCpTzZ8lx
 /ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnIITciV8haa/THeYrVw9dV/Zy6FRpnqTaG6psHd29A=;
 b=Vt2y+ZZweeX456iYGld90BND/piCSgnPucs/1n8HMS17OjaprZw++p8PUM8T7m4fAI
 HPo5d8IQgs49A+TnkxS0CALEn0upNyVW/R8FEoWQvhfugqh9qArenRuJlxsH3hNOwJfu
 ozG/Xxpzxm29rmMkD9+amdQL0tzx1PdXcjaYdw71VQFE57WchHwBK6rnLf1/95qRlxdh
 H/N3Pc0fZdsSvd29iV2GNohnfs+Wn35YTr9oXouD84emA2TwFx6+xzA7q33KxcarNw1G
 aFdsQ5E5If7iiK2qT6G+Csc1QPvBw737WBjK1UCtWc38z+lp80n31oJnIXPo5MZxlRX/
 DByw==
X-Gm-Message-State: AJIora/U6Xb1sUXmRNnIkmcWb42csoEASb8Fq/A24zigBOUWcBd9ZGaC
 zV2AlvGt705OJwFYdAUUQZP5GbFhgutrkoPRmiw=
X-Google-Smtp-Source: AGRyM1t51D0NISsGIJpp7xYZEN7Zdlrqzj2R0ocHufaxlrwGUb6uth7bWq/uOvHx+zSWvVwGc7+5thbsIXGxD1SkNrY=
X-Received: by 2002:a25:f807:0:b0:668:b5ea:a36b with SMTP id
 u7-20020a25f807000000b00668b5eaa36bmr17657674ybd.335.1655727008218; Mon, 20
 Jun 2022 05:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220613104402.10279-1-lizhang@suse.de>
 <20220613161937.333a6b82@redhat.com>
 <CAD8of+pp-3bKX44Q0++gRofx4gmzzjpq1N2HfgRacXT196pR7w@mail.gmail.com>
 <2041c609-75e7-4743-d33a-dee0339a361e@redhat.com>
In-Reply-To: <2041c609-75e7-4743-d33a-dee0339a361e@redhat.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Mon, 20 Jun 2022 14:09:57 +0200
Message-ID: <CAD8of+oFOGUfuWNA9W5VqdyfKC8Qof3jnPGmzK36CR4VMMLDkg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
To: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Li Zhang <lizhang@suse.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 13, 2022 at 5:31 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 13.06.22 16:37, Li Zhang wrote:
> > On Mon, Jun 13, 2022 at 4:19 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >>
> >> On Mon, 13 Jun 2022 12:44:02 +0200
> >> Li Zhang <lizhang@suse.de> wrote:
> >>
> >>> When no memory backend is specified in machine options,
> >>> a default memory device will be added with default_ram_id.
> >>> However, if a memory backend object is added in QEMU options
> >>> and id is the same as default_ram_id, a coredump happens.
> >>>
> >>> Command line:
> >>> qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
> >>> -machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
> >>> -smp 16,sockets=16,cores=1,threads=1 \
> >>> -m 4G \
> >>> -object memory-backend-ram,id=pc.ram,size=4G \
> >>> -no-user-config -nodefaults -nographic
> >>>
> >>> Stack trace of thread 16903:
> >>>     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
> >>>     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
> >>>     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
> >>>     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
> >>>     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
> >>>     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
> >>>     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
> >>>     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
> >>>     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
> >>>     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
> >>>     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
> >>>     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
> >>>     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
> >>>     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
> >>>     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
> >>>
> >>> Signed-off-by: Li Zhang <lizhang@suse.de>
> >>
> >> Acked-by: Igor Mammedov <imammedo@redhat.com>
> >>
> >>
> >> CCing David as he probably would be the one to merge it
> >>
> >
> > Thanks for your review.
>
>
> Acked-by: David Hildenbrand <david@redhat.com>
>
>

Thanks David.

> Paolo, can you queue this?
>
> https://lore.kernel.org/qemu-devel/20220613104402.10279-1-lizhang@suse.de/
>

Hi Paolo,
It's been acked by Igor and David. Would you please queue this patch?

Thanks
Li

> --
> Thanks,
>
> David / dhildenb
>


--

Best Regards
-Li

