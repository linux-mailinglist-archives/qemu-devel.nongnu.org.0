Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2737708C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 10:01:29 +0200 (CEST)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHtv-0005lt-SC
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 04:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHsg-0004vS-9s
 for qemu-devel@nongnu.org; Sat, 08 May 2021 04:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHsX-0004uh-DW
 for qemu-devel@nongnu.org; Sat, 08 May 2021 04:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620460799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TWJ01udfSU2X02ftV6JvWiWDxbbfvO5Ag72j32ane4w=;
 b=hHjkVeZUY76HTBjHzZikHjYMsPxxCxRph2Y1nR9/tjrmbkQ2IVGk2uJKQSQLAAleamTjnu
 WbsQDW7/FvqZHPt/Uou9I8SOeug6teQF5LttbcENa+g6SRL8pj32he90j5HhD+laNd26CT
 Khfeycrkiv4ndKW0ePzdn2J3Qo6rJpM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-hWsyL7nrNX6At1Gr6KoluQ-1; Sat, 08 May 2021 03:59:56 -0400
X-MC-Unique: hWsyL7nrNX6At1Gr6KoluQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 g6-20020a05651c0446b02900dee525f111so5920624ljg.19
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 00:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWJ01udfSU2X02ftV6JvWiWDxbbfvO5Ag72j32ane4w=;
 b=TATV5XnL92E0sLH5Bk4xd9V0J7vgyGClTt+L6bhbZI0DhfRfgGTETMV1n7axn4xDIu
 3V41qciuJ9C1+co9judatDcHXZtggvxHUUiT173gjSm7h2rhOBVSEJY7wEfzKCikOS10
 Oh85cUlMxfP3PU7nfARK6EPCX+2DI6mgpTEQoHE4vrFcjPkUWSglymN4k+1qImdxp5iA
 6HDj3v7aUkuyiqUHvmPxH/b6fsWUpkWKhjd9RQUh2niVd8iW6/Q67z4cwg3ITRNg91Bf
 jlgjXtrH+XOO0Oy8LoRlbB/RzRr/IMAXmQV/3oDcCCS/nO75L/duPCiDzPvNCQPWX9Sv
 6GHQ==
X-Gm-Message-State: AOAM533Vlrc1iWBblBf7xXAohc3xI7XUwKmrrIxAFbun0sPOWH31UErx
 FWjfIy8PUNk3BthKrcQaSSqZqgHH95PSvxol9vJcji9MtC6Q9f4qXzMfSRzM53anPzniKa4md4K
 6UwfhYfz6wHpeohY20czkUc91Hwcusmg=
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr11309045ljl.261.1620460794330; 
 Sat, 08 May 2021 00:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjIp5OkMNRJ0FvZwoBy3dtCtoDCv68CaQ0ZQipYCIn8Xfu4wa5gFMm9INPU0JccyOJqkZlO+LvMq3Jsp03EZE=
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr11309028ljl.261.1620460793946; 
 Sat, 08 May 2021 00:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
 <162045906038.18374.9779364641733516022@d887ba82c771>
In-Reply-To: <162045906038.18374.9779364641733516022@d887ba82c771>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 8 May 2021 15:59:42 +0800
Message-ID: <CACGkMEuuLEi+JVpacDiBxk8pg5ZS-v+8xVYWq8NAQLgxN2LDhA@mail.gmail.com>
Subject: Re: [PULL 00/10] Net patches
To: qemu-devel <qemu-devel@nongnu.org>, andrew@daynix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 8, 2021 at 3:31 PM <no-reply@patchew.org> wrote:
>
> Patchew URL: https://patchew.org/QEMU/1620458319-5670-1-git-send-email-jasowang@redhat.com/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:
>
> Type: series
> Message-id: 1620458319-5670-1-git-send-email-jasowang@redhat.com
> Subject: [PULL 00/10] Net patches
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/1620402803-9237-1-git-send-email-jag.raman@oracle.com -> patchew/1620402803-9237-1-git-send-email-jag.raman@oracle.com
>  * [new tag]         patchew/1620458319-5670-1-git-send-email-jasowang@redhat.com -> patchew/1620458319-5670-1-git-send-email-jasowang@redhat.com
> Switched to a new branch 'test'
> a34d81a tap-bsd: Remove special casing for older OpenBSD releases
> 4b987f4 virtio-net: failover: add missing remove_migration_state_change_notifier()
> 3dc299d hw/net/imx_fec: return 0xffff when accessing non-existing PHY
> 729e8df MAINTAINERS: Added eBPF maintainers information.
> ab65d98 docs: Added eBPF documentation.
> 905729a virtio-net: Added eBPF RSS to virtio-net.
> 5a7d393 ebpf: Added eBPF RSS loader.
> eae9462 ebpf: Added eBPF RSS program.
> b6962be net: Added SetSteeringEBPF method for NetClientState.
> 1207c8e net/tap: Added TUNSETSTEERINGEBPF code.



Andrew, please fix those style issues except for the skeleton which is
generated by bpftool and I will send a new version of pull request.

>
> === OUTPUT BEGIN ===
> 1/10 Checking commit 1207c8e2a076 (net/tap: Added TUNSETSTEERINGEBPF code.)
> 2/10 Checking commit b6962be9ca91 (net: Added SetSteeringEBPF method for NetClientState.)
> 3/10 Checking commit eae94621a4b1 (ebpf: Added eBPF RSS program.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #23:
> new file mode 100755
>
> WARNING: line over 80 characters
> #211: FILE: tools/ebpf/rss.bpf.c:157:
> + * According to https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml
>
> WARNING: line over 80 characters
> #214: FILE: tools/ebpf/rss.bpf.c:160:
> + * Need to choose reasonable amount of maximum extensions/options we may check to find
>
> WARNING: line over 80 characters
> #281: FILE: tools/ebpf/rss.bpf.c:227:
> +                        *l4_offset + opt_offset + offsetof(struct ipv6_destopt_hao, addr),
>
> total: 0 errors, 4 warnings, 590 lines checked
>
> Patch 3/10 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 4/10 Checking commit 5a7d3933bfa3 (ebpf: Added eBPF RSS loader.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #72:
> new file mode 100644
>
> WARNING: architecture specific defines should be avoided
> #354: FILE: ebpf/rss.bpf.skeleton.h:4:
> +#ifndef __RSS_BPF_SKEL_H__
>
> ERROR: code indent should never use tabs
> #361: FILE: ebpf/rss.bpf.skeleton.h:11:
> +^Istruct bpf_object_skeleton *skeleton;$
>
> ERROR: code indent should never use tabs
> #362: FILE: ebpf/rss.bpf.skeleton.h:12:
> +^Istruct bpf_object *obj;$
>
> ERROR: code indent should never use tabs
> #363: FILE: ebpf/rss.bpf.skeleton.h:13:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #364: FILE: ebpf/rss.bpf.skeleton.h:14:
> +^I^Istruct bpf_map *tap_rss_map_configurations;$
>
> ERROR: code indent should never use tabs
> #365: FILE: ebpf/rss.bpf.skeleton.h:15:
> +^I^Istruct bpf_map *tap_rss_map_indirection_table;$
>
> ERROR: code indent should never use tabs
> #366: FILE: ebpf/rss.bpf.skeleton.h:16:
> +^I^Istruct bpf_map *tap_rss_map_toeplitz_key;$
>
> ERROR: code indent should never use tabs
> #367: FILE: ebpf/rss.bpf.skeleton.h:17:
> +^I} maps;$
>
> ERROR: code indent should never use tabs
> #368: FILE: ebpf/rss.bpf.skeleton.h:18:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #369: FILE: ebpf/rss.bpf.skeleton.h:19:
> +^I^Istruct bpf_program *tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #370: FILE: ebpf/rss.bpf.skeleton.h:20:
> +^I} progs;$
>
> ERROR: code indent should never use tabs
> #371: FILE: ebpf/rss.bpf.skeleton.h:21:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #372: FILE: ebpf/rss.bpf.skeleton.h:22:
> +^I^Istruct bpf_link *tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #373: FILE: ebpf/rss.bpf.skeleton.h:23:
> +^I} links;$
>
> ERROR: code indent should never use tabs
> #379: FILE: ebpf/rss.bpf.skeleton.h:29:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #379: FILE: ebpf/rss.bpf.skeleton.h:29:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #380: FILE: ebpf/rss.bpf.skeleton.h:30:
> +^I^Ireturn;$
>
> ERROR: code indent should never use tabs
> #381: FILE: ebpf/rss.bpf.skeleton.h:31:
> +^Iif (obj->skeleton)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #381: FILE: ebpf/rss.bpf.skeleton.h:31:
> +       if (obj->skeleton)
> [...]
>
> ERROR: code indent should never use tabs
> #382: FILE: ebpf/rss.bpf.skeleton.h:32:
> +^I^Ibpf_object__destroy_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #383: FILE: ebpf/rss.bpf.skeleton.h:33:
> +^Ifree(obj);$
>
> ERROR: code indent should never use tabs
> #392: FILE: ebpf/rss.bpf.skeleton.h:42:
> +^Istruct rss_bpf *obj;$
>
> ERROR: code indent should never use tabs
> #394: FILE: ebpf/rss.bpf.skeleton.h:44:
> +^Iobj = (struct rss_bpf *)calloc(1, sizeof(*obj));$
>
> ERROR: code indent should never use tabs
> #395: FILE: ebpf/rss.bpf.skeleton.h:45:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #395: FILE: ebpf/rss.bpf.skeleton.h:45:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #396: FILE: ebpf/rss.bpf.skeleton.h:46:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #397: FILE: ebpf/rss.bpf.skeleton.h:47:
> +^Iif (rss_bpf__create_skeleton(obj))$
>
> ERROR: braces {} are necessary for all arms of this statement
> #397: FILE: ebpf/rss.bpf.skeleton.h:47:
> +       if (rss_bpf__create_skeleton(obj))
> [...]
>
> ERROR: code indent should never use tabs
> #398: FILE: ebpf/rss.bpf.skeleton.h:48:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #399: FILE: ebpf/rss.bpf.skeleton.h:49:
> +^Iif (bpf_object__open_skeleton(obj->skeleton, opts))$
>
> ERROR: braces {} are necessary for all arms of this statement
> #399: FILE: ebpf/rss.bpf.skeleton.h:49:
> +       if (bpf_object__open_skeleton(obj->skeleton, opts))
> [...]
>
> ERROR: code indent should never use tabs
> #400: FILE: ebpf/rss.bpf.skeleton.h:50:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #402: FILE: ebpf/rss.bpf.skeleton.h:52:
> +^Ireturn obj;$
>
> ERROR: code indent should never use tabs
> #404: FILE: ebpf/rss.bpf.skeleton.h:54:
> +^Irss_bpf__destroy(obj);$
>
> ERROR: code indent should never use tabs
> #405: FILE: ebpf/rss.bpf.skeleton.h:55:
> +^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #411: FILE: ebpf/rss.bpf.skeleton.h:61:
> +^Ireturn rss_bpf__open_opts(NULL);$
>
> ERROR: code indent should never use tabs
> #417: FILE: ebpf/rss.bpf.skeleton.h:67:
> +^Ireturn bpf_object__load_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #423: FILE: ebpf/rss.bpf.skeleton.h:73:
> +^Istruct rss_bpf *obj;$
>
> ERROR: code indent should never use tabs
> #425: FILE: ebpf/rss.bpf.skeleton.h:75:
> +^Iobj = rss_bpf__open();$
>
> ERROR: code indent should never use tabs
> #426: FILE: ebpf/rss.bpf.skeleton.h:76:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #426: FILE: ebpf/rss.bpf.skeleton.h:76:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #427: FILE: ebpf/rss.bpf.skeleton.h:77:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #428: FILE: ebpf/rss.bpf.skeleton.h:78:
> +^Iif (rss_bpf__load(obj)) {$
>
> ERROR: code indent should never use tabs
> #429: FILE: ebpf/rss.bpf.skeleton.h:79:
> +^I^Irss_bpf__destroy(obj);$
>
> ERROR: code indent should never use tabs
> #430: FILE: ebpf/rss.bpf.skeleton.h:80:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #431: FILE: ebpf/rss.bpf.skeleton.h:81:
> +^I}$
>
> ERROR: code indent should never use tabs
> #432: FILE: ebpf/rss.bpf.skeleton.h:82:
> +^Ireturn obj;$
>
> ERROR: code indent should never use tabs
> #438: FILE: ebpf/rss.bpf.skeleton.h:88:
> +^Ireturn bpf_object__attach_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #444: FILE: ebpf/rss.bpf.skeleton.h:94:
> +^Ireturn bpf_object__detach_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #450: FILE: ebpf/rss.bpf.skeleton.h:100:
> +^Istruct bpf_object_skeleton *s;$
>
> ERROR: code indent should never use tabs
> #452: FILE: ebpf/rss.bpf.skeleton.h:102:
> +^Is = (struct bpf_object_skeleton *)calloc(1, sizeof(*s));$
>
> ERROR: code indent should never use tabs
> #453: FILE: ebpf/rss.bpf.skeleton.h:103:
> +^Iif (!s)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #453: FILE: ebpf/rss.bpf.skeleton.h:103:
> +       if (!s)
> [...]
>
> ERROR: code indent should never use tabs
> #454: FILE: ebpf/rss.bpf.skeleton.h:104:
> +^I^Ireturn -1;$
>
> ERROR: code indent should never use tabs
> #455: FILE: ebpf/rss.bpf.skeleton.h:105:
> +^Iobj->skeleton = s;$
>
> ERROR: code indent should never use tabs
> #457: FILE: ebpf/rss.bpf.skeleton.h:107:
> +^Is->sz = sizeof(*s);$
>
> ERROR: code indent should never use tabs
> #458: FILE: ebpf/rss.bpf.skeleton.h:108:
> +^Is->name = "rss_bpf";$
>
> ERROR: code indent should never use tabs
> #459: FILE: ebpf/rss.bpf.skeleton.h:109:
> +^Is->obj = &obj->obj;$
>
> ERROR: code indent should never use tabs
> #461: FILE: ebpf/rss.bpf.skeleton.h:111:
> +^I/* maps */$
>
> ERROR: code indent should never use tabs
> #462: FILE: ebpf/rss.bpf.skeleton.h:112:
> +^Is->map_cnt = 3;$
>
> ERROR: code indent should never use tabs
> #463: FILE: ebpf/rss.bpf.skeleton.h:113:
> +^Is->map_skel_sz = sizeof(*s->maps);$
>
> ERROR: code indent should never use tabs
> #464: FILE: ebpf/rss.bpf.skeleton.h:114:
> +^Is->maps = (struct bpf_map_skeleton *)calloc(s->map_cnt, s->map_skel_sz);$
>
> ERROR: code indent should never use tabs
> #465: FILE: ebpf/rss.bpf.skeleton.h:115:
> +^Iif (!s->maps)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #465: FILE: ebpf/rss.bpf.skeleton.h:115:
> +       if (!s->maps)
> [...]
>
> ERROR: code indent should never use tabs
> #466: FILE: ebpf/rss.bpf.skeleton.h:116:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #468: FILE: ebpf/rss.bpf.skeleton.h:118:
> +^Is->maps[0].name = "tap_rss_map_configurations";$
>
> ERROR: code indent should never use tabs
> #469: FILE: ebpf/rss.bpf.skeleton.h:119:
> +^Is->maps[0].map = &obj->maps.tap_rss_map_configurations;$
>
> ERROR: code indent should never use tabs
> #471: FILE: ebpf/rss.bpf.skeleton.h:121:
> +^Is->maps[1].name = "tap_rss_map_indirection_table";$
>
> ERROR: code indent should never use tabs
> #472: FILE: ebpf/rss.bpf.skeleton.h:122:
> +^Is->maps[1].map = &obj->maps.tap_rss_map_indirection_table;$
>
> ERROR: code indent should never use tabs
> #474: FILE: ebpf/rss.bpf.skeleton.h:124:
> +^Is->maps[2].name = "tap_rss_map_toeplitz_key";$
>
> ERROR: code indent should never use tabs
> #475: FILE: ebpf/rss.bpf.skeleton.h:125:
> +^Is->maps[2].map = &obj->maps.tap_rss_map_toeplitz_key;$
>
> ERROR: code indent should never use tabs
> #477: FILE: ebpf/rss.bpf.skeleton.h:127:
> +^I/* programs */$
>
> ERROR: code indent should never use tabs
> #478: FILE: ebpf/rss.bpf.skeleton.h:128:
> +^Is->prog_cnt = 1;$
>
> ERROR: code indent should never use tabs
> #479: FILE: ebpf/rss.bpf.skeleton.h:129:
> +^Is->prog_skel_sz = sizeof(*s->progs);$
>
> WARNING: line over 80 characters
> #480: FILE: ebpf/rss.bpf.skeleton.h:130:
> +       s->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt, s->prog_skel_sz);
>
> ERROR: code indent should never use tabs
> #480: FILE: ebpf/rss.bpf.skeleton.h:130:
> +^Is->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt, s->prog_skel_sz);$
>
> ERROR: code indent should never use tabs
> #481: FILE: ebpf/rss.bpf.skeleton.h:131:
> +^Iif (!s->progs)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #481: FILE: ebpf/rss.bpf.skeleton.h:131:
> +       if (!s->progs)
> [...]
>
> ERROR: code indent should never use tabs
> #482: FILE: ebpf/rss.bpf.skeleton.h:132:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #484: FILE: ebpf/rss.bpf.skeleton.h:134:
> +^Is->progs[0].name = "tun_rss_steering_prog";$
>
> ERROR: code indent should never use tabs
> #485: FILE: ebpf/rss.bpf.skeleton.h:135:
> +^Is->progs[0].prog = &obj->progs.tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #486: FILE: ebpf/rss.bpf.skeleton.h:136:
> +^Is->progs[0].link = &obj->links.tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #488: FILE: ebpf/rss.bpf.skeleton.h:138:
> +^Is->data_sz = 8088;$
>
> ERROR: code indent should never use tabs
> #489: FILE: ebpf/rss.bpf.skeleton.h:139:
> +^Is->data = (void *)"\$
>
> ERROR: code indent should never use tabs
> #775: FILE: ebpf/rss.bpf.skeleton.h:425:
> +^Ireturn 0;$
>
> ERROR: code indent should never use tabs
> #777: FILE: ebpf/rss.bpf.skeleton.h:427:
> +^Ibpf_object__destroy_skeleton(s);$
>
> ERROR: code indent should never use tabs
> #778: FILE: ebpf/rss.bpf.skeleton.h:428:
> +^Ireturn -1;$
>
> total: 85 errors, 3 warnings, 779 lines checked
>
> Patch 4/10 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 5/10 Checking commit 905729afbb3f (virtio-net: Added eBPF RSS to virtio-net.)
> WARNING: line over 80 characters
> #186: FILE: hw/net/virtio-net.c:2868:
> +                    warn_report("Can't post-load eBPF RSS - fallback to software RSS");
>
> total: 0 errors, 1 warnings, 214 lines checked
>
> Patch 5/10 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 6/10 Checking commit ab65d982d37d (docs: Added eBPF documentation.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #17:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 129 lines checked
>
> Patch 6/10 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 7/10 Checking commit 729e8df02f0b (MAINTAINERS: Added eBPF maintainers information.)
> 8/10 Checking commit 3dc299dfc4b7 (hw/net/imx_fec: return 0xffff when accessing non-existing PHY)
> 9/10 Checking commit 4b987f4d63d7 (virtio-net: failover: add missing remove_migration_state_change_notifier())
> 10/10 Checking commit a34d81aa5179 (tap-bsd: Remove special casing for older OpenBSD releases)
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> The full log is available at
> http://patchew.org/logs/1620458319-5670-1-git-send-email-jasowang@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com


