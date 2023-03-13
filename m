Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4F6B7B17
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjY8-0004rI-4c; Mon, 13 Mar 2023 10:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbjXs-0004qm-BK
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:53:04 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbjXm-0004xm-L1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:53:04 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 264274123
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IGAPeaMLTFTEX6bvrR0ZlcFynXyQoLVcMsEvi/4bfWQNrUon1TZSm
 jcdUWDQPv7cMDPyc99xPNmzp0hT6JTVz9I3HQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim4c3l48sfrZ80s05a+q41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE/epVMVwqYIQivbxXIGQQq
 NwbERExR0XW7w626OrTpuhEg80iKIzyItpatC45iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxGMFKDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//RruTePlVYquFTrGNHPVeyxSdlWpE/Cp
 2fI0nzeIAhGBOXKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUKo28g8vF0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey1/CboTYZlatsOAbifI=
IronPort-HdrOrdr: A9a23:0io+TKjLbQ0auzVOICh8j9fTuXBQXgwji2hC6mlwRA09TyVXrb
 HIoB0+726ItN9xYgBbpTnkAsO9qBznhPxICOUqTNKftUzdyReVxeJZnPDfKl/balTDH4dmvM
 8KAstD4Z/LfCBHZK7BgDVQeOxQpuVvnprY4dv2/jNGYTsvRZtdzzpUPC6mL2wefng4OXP7Lv
 ahDwh8ygZItU54Ui1zPBZlY9T+
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 10:52:33 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 px10-20020a056214050a00b005ab138d7672so180690qvb.7
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678719153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/WQbc8dHCY1jIQT1/esFjZWkrmh4LClhizyASdDN3Uc=;
 b=eMlCUrrE8zCSQ1sbmonc7BB7pO722CiNv+AZEBG5M+B8E0Sq6jtRgJS6RX029QOCws
 FbsjDvO9dlj4Zlbb4R9To9HxgfED6a+oCAmmMVtkWBjsdp+cUUy9x3O5BPwvwiQh3ROf
 mjWp4Nl5pdxCmWEpT2bSgOzToevtmaHgE6yfv8E/n+ZZ7SR5zjV5jUcWgX/9meEwJj1t
 MjTWGc6EdnfBkx+eSXPPwwqe/fClMfYo0P575mcVt74fqnmgdoiG6RZEjV15H9iCRWEA
 KAejw2VkCjGuXn0R6Wa4I1iFUpw/m0J9qqQVu6dj5yY50m4GF6PZf7LGLbx//ibXRILY
 dBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678719153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WQbc8dHCY1jIQT1/esFjZWkrmh4LClhizyASdDN3Uc=;
 b=K36SlIr63XVAeDFUA1C17SaAyEdokzQgDJK3ZbJXQ3rKVYW59wBQafNFkN/2o5s7NP
 UmW3YJoW+tVAbPXoDsKfTA2oZfK5btprG7k0VSaLy7tYAp/fx35/WKz2hFEwLqZxAsDK
 ZxaSzhoGn58y75QSpy9uHiv67v1Y89upWdtKBqekQEqWbWkVwDEeqPiHvxYDniYikS0D
 iUNjYeOTMzHLFM8apZ8XR81DqVIYTYxXmPw3cG/s7T3Pa7FB5sPo/yBe6R75sgirsU6I
 X2RFpiwzcGJS+xZHy9xZ/QgtYAFnKkJbzTYgOmpJU1JnFrzjAQNwmv0jM7U1Bqb1zZ4g
 M/zA==
X-Gm-Message-State: AO0yUKXFuPlnAA9Ei5HPkwDloSRCtmWLJ/DQp0bnTYJqUf/rKuh1UdIU
 zCpc86vubofCnFzp0+mvMycLbvaPasQNGczsJl2sfCWJAj65xZfPzi1nyT1E8SsFWVpaQzS8TNH
 +sSwVBPFlkztaOc3Ic2nzMy+9ig+9eQ==
X-Received: by 2002:ad4:5d66:0:b0:56e:af8a:a84d with SMTP id
 fn6-20020ad45d66000000b0056eaf8aa84dmr14531256qvb.50.1678719152888; 
 Mon, 13 Mar 2023 07:52:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9rU5UDEj3DZ25j338bVAv/aAfOQXf4n25HMYKWGnyk9fXkBWFR7G73ZBpJ7bKKXtm9eHj4zg==
X-Received: by 2002:ad4:5d66:0:b0:56e:af8a:a84d with SMTP id
 fn6-20020ad45d66000000b0056eaf8aa84dmr14531215qvb.50.1678719152602; 
 Mon, 13 Mar 2023 07:52:32 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 c145-20020ae9ed97000000b0074280fc7bd8sm3868180qkg.60.2023.03.13.07.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 07:52:32 -0700 (PDT)
Date: Mon, 13 Mar 2023 10:52:28 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Message-ID: <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

On 230313 1502, Thomas Huth wrote:
> On 13/03/2023 09.24, Alexander Bulekov wrote:
> > v6 -> v7:
> >      - Fix bad qemu_bh_new_guarded calls found by Thomas (Patch 4)
> >      - Add an MR-specific flag to disable reentrancy (Patch 5)
> >      - Disable reentrancy checks for lsi53c895a's RAM-like MR (Patch 6)
> >      Patches 5 and 6 need review. I left the review-tags for Patch 4,
> >      however a few of the qemu_bh_new_guarded calls have changed.
> 
>  Hi Alexander,
> 
> there seems to be another issue with one of the avocado tests:
> 
>  make -j8 qemu-system-aarch64
>  make check-venv
>  ./tests/venv/bin/avocado run \
>    tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
> 
> ... works fine for me with the master branch, but it fails
> for me after applying your patch series.
> Can you reproduce that failure?

#0  __GI_exit (status=0x1) at ./stdlib/exit.c:143
#1  0x0000555555f05819 in access_with_adjusted_size (addr=0x0, addr@entry=0x7ffff3b609d0, value=0x7ffff3b609d0, size=size@entry=0x4, access_size_min=0x1, access_size_max=0x4, access_fn=0x555555f0b4b0 <memory_region_read_accessor>, mr=0x7
#2  0x0000555555f05380 in memory_region_dispatch_read1 (mr=0x7ffff3e34990, addr=0x1, pval=<optimized out>, size=0x4, attrs=...) at ../softmmu/memory.c:1442
#3  memory_region_dispatch_read (mr=<optimized out>, mr@entry=0x7ffff3e34990, addr=0x1, pval=<optimized out>, pval@entry=0x7ffff3b609d0, op=<optimized out>, attrs=..., attrs@entry=...) at ../softmmu/memory.c:1476
#4  0x0000555555f1278f in address_space_ldl_internal (as=<optimized out>, addr=<optimized out>, attrs=..., result=0x0, endian=DEVICE_LITTLE_ENDIAN) at ../memory_ldst.c.inc:41
#5  0x00005555559ebb5d in ldl_le_phys (as=0x7ffff3e35258, addr=0x80) at /home/alxndr/Development/qemu-demo/qemu/include/exec/memory_ldst_phys.h.inc:79
#6  bcm2835_mbox_update (s=0x7ffff3e34f20) at ../hw/misc/bcm2835_mbox.c:109
#7  0x00005555559ecd5d in bcm2835_property_write (opaque=0x7ffff3e34600, offset=<optimized out>, value=<optimized out>, size=<optimized out>) at ../hw/misc/bcm2835_property.c:349
#8  0x0000555555f05903 in memory_region_write_accessor (mr=0x7ffff3e34990, addr=0x0, value=<optimized out>, size=0x4, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:493
#9  0x0000555555f0576b in access_with_adjusted_size (addr=addr@entry=0x0, value=0x7ffff3b60c38, value@entry=0x7ffff3b60c28, size=size@entry=0x4, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x555555f05820 <
attrs=...) at ../softmmu/memory.c:570
#10 0x0000555555f055c6 in memory_region_dispatch_write (mr=<optimized out>, mr@entry=0x7ffff3e34990, addr=0x0, data=<optimized out>, data@entry=0x2f2228, op=<optimized out>, attrs=..., attrs@entry=...) at ../softmmu/memory.c:1532
#11 0x0000555555f132ec in address_space_stl_internal (as=<optimized out>, addr=<optimized out>, val=0x2f2228, attrs=..., result=0x0, endian=DEVICE_LITTLE_ENDIAN) at ../memory_ldst.c.inc:319
#12 0x00005555559eb9a4 in stl_le_phys (as=<optimized out>, addr=0x80, val=0x2f2228) at /home/alxndr/Development/qemu-demo/qemu/include/exec/memory_ldst_phys.h.inc:121
#13 bcm2835_mbox_write (opaque=0x7ffff3e34f20, offset=<optimized out>, value=0x2f2228, size=<optimized out>) at ../hw/misc/bcm2835_mbox.c:227
#14 0x0000555555f05903 in memory_region_write_accessor (mr=0x7ffff3e352b0, addr=0xa0, value=<optimized out>, size=0x4, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:493
#15 0x0000555555f0576b in access_with_adjusted_size (addr=addr@entry=0xa0, value=0x7ffff3b60e48, value@entry=0x7ffff3b60e38, size=size@entry=0x4, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x555555f05820 
 attrs=...) at ../softmmu/memory.c:570
#16 0x0000555555f055c6 in memory_region_dispatch_write (mr=<optimized out>, mr@entry=0x2, addr=addr@entry=0xa0, data=<optimized out>, data@entry=0x2f2228, op=<optimized out>, op@entry=MO_32, attrs=...) at ../softmmu/memory.c:1532
#17 0x0000555555f9b3ae in io_writex (env=0x7ffff3dd60e0, full=0x55555790c710, mmu_idx=0x7, val=0x4, val@entry=0x2f2228, addr=0x3f00b8a0, retaddr=retaddr@entry=0x7fffac01f9dd, op=MO_32) at ../accel/tcg/cputlb.c:1430
#18 0x0000555555f90062 in store_helper (env=<optimized out>, addr=<optimized out>, val=0x2f2228, oi=<optimized out>, retaddr=0x7ffff3b609d0, op=MO_32) at ../accel/tcg/cputlb.c:2454
#19 full_le_stl_mmu (env=<optimized out>, addr=<optimized out>, val=0x2f2228, oi=<optimized out>, retaddr=0x7ffff3b609d0) at ../accel/tcg/cputlb.c:2542
#20 0x00007fffac01f9dd in code_gen_buffer ()
#21 0x0000555555f7367e in cpu_tb_exec (cpu=cpu@entry=0x7ffff3dd4210, itb=itb@entry=0x7fffac01f8c0 <code_gen_buffer+129171>, tb_exit=tb_exit@entry=0x7ffff3b6148c) at ../accel/tcg/cpu-exec.c:460
#22 0x0000555555f744f9 in cpu_loop_exec_tb (cpu=0x7ffff3dd4210, tb=<optimized out>, pc=<optimized out>, tb_exit=0x7ffff3b6148c, last_tb=<optimized out>) at ../accel/tcg/cpu-exec.c:894
#23 cpu_exec_loop (cpu=cpu@entry=0x7ffff3dd4210, sc=sc@entry=0x7ffff3b61510) at ../accel/tcg/cpu-exec.c:1005
#24 0x0000555555f73c27 in cpu_exec_setjmp (cpu=cpu@entry=0x7ffff3dd4210, sc=sc@entry=0x7ffff3b61510) at ../accel/tcg/cpu-exec.c:1037
#25 0x0000555555f73aee in cpu_exec (cpu=cpu@entry=0x7ffff3dd4210) at ../accel/tcg/cpu-exec.c:1063
#26 0x0000555555f9da4f in tcg_cpus_exec (cpu=cpu@entry=0x7ffff3dd4210) at ../accel/tcg/tcg-accel-ops.c:81
#27 0x0000555555f9e019 in mttcg_cpu_thread_fn (arg=arg@entry=0x7ffff3dd4210) at ../accel/tcg/tcg-accel-ops-mttcg.c:95
#28 0x000055555611d0c5 in qemu_thread_start (args=0x555557923bf0) at ../util/qemu-thread-posix.c:541
#29 0x00007ffff6960fd4 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
#30 0x00007ffff69e166c in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

Some sort of relationship between bcm2835_property and
bcm2835_mbox 

bcm2835_property calls directly into bcm2835_mbox which reads from
bcm2835_property..

Guess bcm2835_property s->iomem needs to be marked as reentrancy-safe
as-well.

Do the avocado tests exit on failure, or do you know if there are any
other test failures?
Thank you
-Alex

