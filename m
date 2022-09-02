Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10385AB763
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:22:02 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAMj-000613-F1
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oUAI2-000408-0B
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:17:11 -0400
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199]:10561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oUAHm-0003xJ-Fp
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:17:09 -0400
X-IronPort-RemoteIP: 209.85.214.200
X-IronPort-MID: 239948371
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mRCyh67GddOtnr5eovpi6QxRtIXFchMFZxGqfqrLsTDasY5as4F+v
 mIYCG3XbvnYM2Hyctl1aY/j8UNV6J+EydBqSgI9/CFjEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37ayo4GhwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj695LA08JN5YEwfp6GFNe8
 aMVOT0kYCnW0opawJrjIgVtrsEqLc2uJIdG/386lWmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNFL2A3NHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTOCnVAhi+e0WDbTUvOGf+tvmkjEm
 j6c1GPCUxcbBfvO5SXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzIq9O08rhTzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdFFattPROWBcKeAEX
IronPort-HdrOrdr: A9a23:GKNFnKutZAb98td6E5SeMORH7skDWNV00zEX/kB9WHVpm5Sj5q
 STdYcgpHjJYVcqKQsdcL+7WJVoLUmwyXcx2/h1AV7AZniahILLFvAA0WKK+VSJcEfDH6xmpM
 VdmsNFZ+EYeGIasS+M2meF+rgbrOVvu5rY49s2h00dND2DIctbnn9E4yigYzZLeDU=
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2022 13:16:48 -0400
Received: by mail-pl1-f200.google.com with SMTP id
 k3-20020a170902c40300b001743aafd6c6so1595173plk.20
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=IEPAn6i4etY7pb/8k4Qbegjfa9d7BfOL0VwJHFdM+rM=;
 b=oUJEL2n1CYt/3c4BUQ3FuqOe28c6x3/0RO5fd7tURwTynVRLnsYtf8dsdTVZF+kscZ
 +QxfQZgQ6m8iKD2L+aUc4KwOdOh+PmeUpeyYkhU+bNI+nfLxkxhNVX0mooF0c2p5lMtX
 CYANrMNPREBrwM3hu4iTBxbCt99zIfyiFEElb6+d3TQBDoOAxkTWPTPQhuEuF79SRqAk
 IWh1fAdUgLXRyKToL29pqA6VVv4tFuEgpdZ6AT45l5s1wN8Z0bCythlFWLxb++cQeQcn
 6o2ldifX6MQi9iAS5zPGaciW0nVm7u/FhCZivuJ50xAPb1bfG7xSORpkHRq8WGF9/F2C
 ryvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=IEPAn6i4etY7pb/8k4Qbegjfa9d7BfOL0VwJHFdM+rM=;
 b=om3JHWxoRr3DikN/zhtcv8UQW0hsrfZbx0J/VBYnQf5kVoAo5DngnFSro72vuKtFip
 nhETaOJJUoiDjeR28PTsYzQJIgL5Weg92WuEOmtKpLKAHytSIJrWhjmGyg84lJaPAFUC
 3deSPm888tqU6jK6EyTzt2re3e7zzPnZY2FTUiKMFvGrTwCHyRBZS8YdNFwk3q0WmPH+
 7QMp/re7apK0vrKI/ucR7uonu4Q9bWWQuV4KcbNPTSPY7fxjAvxjm/0hHC9B1IODP4Ld
 JVX7SXex9A2k0ceHkw5rViB55kykpVG1u4ni0X56N57i1oIfpA7yLxdtsGvtB+ISygOH
 I0EQ==
X-Gm-Message-State: ACgBeo0T58jqfCt2xSEDJzbklUtgLcFfaAVCdbt6O7ucJJznxGe6SO+m
 oc9k8JZB5Z3AUqWNyJxwm5Zu4i3Sc//vJOxeYvpJyrq2LXUhYc6xaQH8OGKydol7RyumezXXej6
 ruKOqjrD5tBpkWv+YsV6QCJ9+kLvFLw==
X-Received: by 2002:a17:90b:4a0d:b0:1fe:57d0:ddd5 with SMTP id
 kk13-20020a17090b4a0d00b001fe57d0ddd5mr5781440pjb.65.1662139008256; 
 Fri, 02 Sep 2022 10:16:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR53drq2cQQOgeKuGAS3jZ7txsB3oqy4WzKlTNzLsX+L3/PNCyqI/R5Qjhi8HTrS9lG85vsjUg==
X-Received: by 2002:a17:90b:4a0d:b0:1fe:57d0:ddd5 with SMTP id
 kk13-20020a17090b4a0d00b001fe57d0ddd5mr5781388pjb.65.1662139007852; 
 Fri, 02 Sep 2022 10:16:47 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a17090a3f1700b001f94d25bfabsm5435491pjc.28.2022.09.02.10.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 10:16:47 -0700 (PDT)
Date: Fri, 2 Sep 2022 13:16:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 0/8] tests: Make expliction defaults for tests
Message-ID: <20220902171640.qki2azr6qffhj6lp@mozz.bu.edu>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220902 1851, Juan Quintela wrote:
> Hi
> 
> For a long, long time I have had local hacks on my tree to be able to
> run "make tests" when I have a minimal configure guest.  This is a
> first try to upstream some of it.
> 
> - by default we always setup -display none (it already was the
>   default, but some places added it anyways)
> 
> - by default we always setup -net none.  Not clear what was the
>   default, but no tests use the default net, so it is safe change and
>   now it is explicit.
> 
> - by default we always setup -vga none.  This is a complete difference
>   can of worms.  Every tests that use vga already set vga correctly,
>   so this is quite obvious, right?  Now they are acpi tables.  They
>   are a mess.  And basically this means remove a device for each one
>   of them.  Why going through all the trouble?  Because while I am
>   develping, I normall compile out vga.
> 
> - Fix several error strings that were set with copy paste.
> 
> - replication test requires CONFIG_REPLICATION.
> - test-crypto-secret requires CONFIG_SECRET_KEYRING.
> 
> Please review.  Except for the acpi changes (that I hope I have done
> right following the instructions) the rest is quite obvious.

I think this might break some of the fuzz regression tests, because they
have "baked-in" PCI configuration commands with hard-coded PCI
addresses, which will shift around if some device is removed (e.g. with
-net none). Probably the fix is to add addr=... to the -device parameter
in the fuzz tests to keep the PCI address stable.
-Alex

> 
> Later, Juan.
> 
> Juan Quintela (8):
>   qtest: "-display none" is set in qtest_init()
>   qtest: Set "-net none" in qtest_init()
>   tests/acpi: The new default is -vga none
>   tests/qtest: Add -vga none by default
>   tests/acpi: Regenerate all needed tables
>   tests: Fix error strings
>   meson-build: Enable CONFIG_REPLICATION only when replication is set
>   meson-build: test-crypto-secret depends on CONFIG_SECRET_KEYRING
> 
>  meson.build                           |   2 +-
>  tests/qtest/bios-tables-test.c        |   2 +-
>  tests/qtest/boot-serial-test.c        |   4 ++--
>  tests/qtest/dbus-display-test.c       |   2 +-
>  tests/qtest/display-vga-test.c        |  12 ++++++------
>  tests/qtest/e1000-test.c              |   2 +-
>  tests/qtest/es1370-test.c             |   2 +-
>  tests/qtest/fuzz-lsi53c895a-test.c    |   2 +-
>  tests/qtest/fuzz-megasas-test.c       |   2 +-
>  tests/qtest/fuzz-sb16-test.c          |   6 +++---
>  tests/qtest/fuzz-sdcard-test.c        |   6 +++---
>  tests/qtest/fuzz-virtio-scsi-test.c   |   2 +-
>  tests/qtest/fuzz-xlnx-dp-test.c       |   2 +-
>  tests/qtest/fuzz/generic_fuzz.c       |   3 +--
>  tests/qtest/fuzz/i440fx_fuzz.c        |   2 +-
>  tests/qtest/fuzz/qos_fuzz.c           |   2 +-
>  tests/qtest/libqtest.c                |   2 ++
>  tests/data/acpi/pc/DSDT               | Bin 5987 -> 5992 bytes
>  tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 5959 bytes
>  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7317 bytes
>  tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 8658 bytes
>  tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6456 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 7646 bytes
>  tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 5959 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3023 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6064 bytes
>  tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7351 bytes
>  tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 5850 bytes
>  tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 5998 bytes
>  tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6151 bytes
>  tests/data/acpi/pc/ERST.acpierst      | Bin 912 -> 912 bytes
>  tests/data/acpi/q35/DMAR.dmar         | Bin 120 -> 112 bytes
>  tests/data/acpi/q35/DSDT              | Bin 8274 -> 8228 bytes
>  tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8245 bytes
>  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9553 bytes
>  tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8274 bytes
>  tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 10944 bytes
>  tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8692 bytes
>  tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9502 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9882 bytes
>  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8303 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8317 bytes
>  tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8245 bytes
>  tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9587 bytes
>  tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9358 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8524 bytes
>  tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8086 bytes
>  tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8234 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8329 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8834 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8860 bytes
>  tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9339 bytes
>  tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35591 bytes
>  tests/data/acpi/q35/ERST.acpierst     | Bin 912 -> 912 bytes
>  tests/data/acpi/q35/IVRS.ivrs         | Bin 104 -> 100 bytes
>  tests/data/acpi/q35/VIOT.viot         | Bin 112 -> 112 bytes
>  tests/unit/meson.build                |   4 +++-
>  57 files changed, 31 insertions(+), 28 deletions(-)
> 
> -- 
> 2.37.2
> 

