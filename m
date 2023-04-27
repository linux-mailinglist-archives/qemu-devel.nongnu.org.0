Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6B6F06D9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:46:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1wC-000351-KN; Thu, 27 Apr 2023 09:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps1w5-00034h-7E
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:45:25 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps1w3-0007wy-2w
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:45:24 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 272144296
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kAu9va+M4sJ4vG/jzOEUDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WQXUG7QOK7bZjejKtEnPtyx9UIPvpHcx4VnSQJuqCkxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNFg06/gEk35q+q5GlH5gZWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHAGNrYaoc1UO0oU2
 78nOGk1MAqP2O3jldpXSsE07igiBMziPYdao285iD+GVbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspM0yojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKMllUtjOK8brI5fPSGbMxNuXac/
 1jepXXmDVYQLdiR4iKapyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBfJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:QsXziKNl47Bb78BcTsWjsMiBIKoaSvp037BN7TEWdfU1SL3+qy
 nKpp4mPHDP6Qr5NEtOpTniAtjjfZq/z+8Q3WB5B97LMDUO3lHYT72KhbGI/9SKIUPDH4BmtZ
 uII5ISNDWzZWIK6PrH3A==
X-Talos-CUID: 9a23:R2vwymxtLD37SJNyd/3wBgUlKssecCb27037eWH7NnYwcOOPRQCfrfY=
X-Talos-MUID: 9a23:bo1yowk0tT7y8kyBd/dWdnpuHc5wxJSqUXoVy4QZtI6OLCh+EC+C2WE=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 09:45:18 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef640838f6so49608636d6.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682603117; x=1685195117;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6sRjZsKV+KteiwWISjwiORtyK11E4RoKaDeW0FvT5d4=;
 b=iuLRXG5E75Vbzwb0b2UVEnzfY1Zrvjb8XJWby1DSwsSkXqq8EHDAi+QuWsNea98P33
 XwSD2Gdfz9LB436xAtgz7IgYasm4dsNzt74lRSp6rC2uBAmPTPBbbR9C8IC3ImzmWEjT
 EDm2oKzpw3s4Iwm4DvukEg/cbBxiAqa4SPMFhwZSpKzHXkvC5dxZns1AEOoazAs1/RSw
 fSU0Uuasa+/mCgQUk8jYY6nU2TlLaT3fEgk8qyQiXS5ovFAFU9aKbiIyzWRX5rM/SA7h
 j13Qf3qyhcWJI5BZLvcx1X4sMKQBGw3374mTTaU0RXJG6yjgksSwx6beZSzDs8+frVLt
 7w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682603117; x=1685195117;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6sRjZsKV+KteiwWISjwiORtyK11E4RoKaDeW0FvT5d4=;
 b=fQJOA1xQATgpqxWL8Mt0mPZwEZAY/rPx2GcDK48iNxQB8A63n8anesXuiJFCD55cAf
 s5eoP6tcZ3ajn5LVrjgZlQ+HWN4+qHnCujAmPq+jogKDhrD12sBf0CF/LPzvTzvSX8sM
 IpO3mFWxlqMF0CQEVqKb+waXyA76zlpKlnqMyY9PoplC4v/GiEudO3nLet1ZCCoBZu0D
 DqwBsyiztheejaaHWESyqj9jquQybjU09644S/GZ+Mr0hzPaR3kh1AX5Q6kcmnSncVgK
 tfWJ/6wnO6Mo8CW8F7EwAgCQ7AtguRrMy2+HcAwFAGvUO2almQNPVxzDd3bE5Y3ctUJS
 8qSg==
X-Gm-Message-State: AC+VfDwg4/2xrZFV39XuhYpKkT0ub0QLO8SghzyzycBaCZ502lyOUmfo
 +l0VWX5r+/NuI/ZlLK/6i9fOZU+A4ehrR7iTuM8nxEOohTa0ujv1MDZQ9IB3pYdUFhiZ5pQK0U8
 5BCBBd0XEGSfnp09ZXGTXCrq5qADnow==
X-Received: by 2002:a05:6214:20ca:b0:5ef:5138:1e5d with SMTP id
 10-20020a05621420ca00b005ef51381e5dmr2299199qve.49.1682603117308; 
 Thu, 27 Apr 2023 06:45:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yDRhuG5dJBH7uycdVgHnXRBJhaZBy6oFqWRm2vIGYd/ncDctYEwlZ57YZJY2tyyRtmk4oJA==
X-Received: by 2002:a05:6214:20ca:b0:5ef:5138:1e5d with SMTP id
 10-20020a05621420ca00b005ef51381e5dmr2299138qve.49.1682603117038; 
 Thu, 27 Apr 2023 06:45:17 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a0ccb8f000000b005dd8b93457asm5619194qvk.18.2023.04.27.06.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 06:45:16 -0700 (PDT)
Date: Thu, 27 Apr 2023 09:45:12 -0400
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
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v9 0/8] memory: prevent dma-reentracy issues
Message-ID: <20230427134512.aj63etlkw3zuuohr@mozz.bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
 <4761c580-ca69-bfbd-0501-999fa7bc4059@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4761c580-ca69-bfbd-0501-999fa7bc4059@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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

On 230427 1504, Thomas Huth wrote:
> On 26/04/2023 18.19, Alexander Bulekov wrote:
> > v8-> v9:
> >      - Disable reentrancy checks for raven's iomem (Patch 8)
> >      - Fix non-bisectable disable_reentrancy_guard patch by squashing it
> >        into Patch 1.
> >      - Fix trailing whitespace
> 
> Sorry for not noticing earlier (I think the test is not run on gitlab-CI),
> but I just noticed another failing avocado test:
> 
> tests/venv/bin/avocado --show console run \
>  tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_x86_64
> 
> ... seems to hang now (and finally gets "INTERRUPTED").
> 
> If I got that right, the test is basically more or less doing:
> 
>  wget https://storage.tuxboot.com/x86_64/bzImage
>  wget https://storage.tuxboot.com/x86_64/rootfs.ext4.zst
>  unzstd rootfs.ext4.zst
>  qemu-system-x86_64 -cpu Nehalem -M q35 -kernel bzImage \
>   -hda rootfs.ext4 -m 2G -append "root=/dev/sda console=ttyS0" \
>   -serial stdio
> 
> Then log in as "root" and shut down with "halt".
> 
> The "halt" works fine with git master, but it fails for me when I have your
> patches applied. Could you please have a look?

#0  trace_memory_region_reentrant_io  at trace/trace-softmmu.h:335
#1  0x0000555555fad303 in access_with_adjusted_size  at ../softmmu/memory.c:549
#2  0x0000555555fad0eb in memory_region_dispatch_write  at ../softmmu/memory.c:1531
#3  0x0000555555fbb543 in address_space_stl_internal  at ../memory_ldst.c.inc:319
#4  0x0000555555f29149 in stl_le_phys  at /home/alxndr/Development/qemu-demo/qemu/include/exec/memory_ldst_phys.h.inc:121
#5  ioapic_service  at ../hw/intc/ioapic.c:138
#6  0x0000555555f28bd1 in ioapic_eoi_broadcast  at ../hw/intc/ioapic.c:286
#7  0x0000555555f26e4a in apic_eoi  at ../hw/intc/apic.c:432
#8  0x0000555555f2687c in apic_mem_write  at ../hw/intc/apic.c:788
#9  0x0000555555fad3f9 in memory_region_write_accessor  at ../softmmu/memory.c:493
gef➤  p ((MemoryRegion*)mr)->name
$2 = 0x5555578cbbe0 "apic-msi"

I'll send a patch to mark this re-entrancy safe based-on this series.
-Alex

