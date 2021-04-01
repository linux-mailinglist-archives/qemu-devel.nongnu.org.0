Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB33351012
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:25:37 +0200 (CEST)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRrhw-00050F-NM
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lRrgW-000436-Ht
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:24:10 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:38868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lRrgS-0001ip-7p
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:24:08 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so334644oor.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o16T19NAMFwoQrpfUvQjEEY5h9zWKnF/QNFGeDVKZqA=;
 b=zaA5DE4z/jazQL3hmS7l09akE8eikRJ8bbL3Dq92kHUhiNvREctWF1VtcuhnWzDWC/
 KtUZSxwZO1MMZ9eGy7WmbxXfYQp+hxeIXfaWmgwtoys3KtpSJP/7SCntKrGITZuYBJX+
 iOmrdQVCo81I/5xtz87k7K+sdNIpC7oUR1h6apJ3K2kNERMw10EbRReHfbdD0vNf4fhp
 RY++Ns5IJyfp9sJoyydPcTpcW+hnQ+UmmU9pY3ji1n2qkDsPSqgjvkP5p3pSDE5ehWyL
 CB4zKrnw5+JM32mj1k6HQ3DcijpitxIcxpSkw9SkQo6Qehf+I8xgKQBNzpqUT3db6XeI
 sqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o16T19NAMFwoQrpfUvQjEEY5h9zWKnF/QNFGeDVKZqA=;
 b=k+wXM8mHQGsoVapAdj6h6eyrAGIRbbI8iehdyJGUApNBdE5KQi8RKXD8YQ1SxVwCbO
 fI0/W52gXiMgxtGDuSHV5QyXMTV5I5esfDevUbkyDlX4AlYg6wngkKmf1ZvLQ2K2JTjK
 ABipR6aYHbTKwxXtmkIO2T+EclxM51RuwFgoTBrTD6EK+DYGA0T6H8046YHYZ00aIDLh
 Zo4SaY1D9A+glX803vBRh/0haqfynQDk/TAcbCFJxSLbQtJc3QEmvlJT9W8oCKFvE5Sk
 uYbseAnkpxK6+so+Dy0KhDrvytZR92extrzJDULvrpXjT3OYwM4ota1+7Nq584x3OD41
 MtRg==
X-Gm-Message-State: AOAM531S7ACMnro6kG4qGD7L24cN5J8QdrgeXLQ/WhkmrAQP6uA0675h
 sV1nxESqh87CkQPr7LJNJxG6zJs3lBnSdUSZOJwSzebSsJRzlgQd
X-Google-Smtp-Source: ABdhPJzkhC1xJyobfRL+Iaj7JrmnNeYGwQFUznUlPb4Z8k2tsjh2t1T3zAkAZcSELOUvajU0a+BNuOoAcrawKF7CxbI=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr6025555oov.66.1617261842275; 
 Thu, 01 Apr 2021 00:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153529.75831-1-andrew@daynix.com>
 <161668791685.4923.12339857183621777474@72b6d80f974b>
In-Reply-To: <161668791685.4923.12339857183621777474@72b6d80f974b>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 1 Apr 2021 10:22:37 +0300
Message-ID: <CABcq3pECgKYk34_pSZHcyGJLYpcXXPXTE6er2dpSOgCj+4+qOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] eBPF RSS support for virtio-net
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009e31e205bee41d57"
Received-SPF: none client-ip=2607:f8b0:4864:20::c32;
 envelope-from=andrew@daynix.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, berrange@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e31e205bee41d57
Content-Type: text/plain; charset="UTF-8"

The skeleton is generated file. Style issues with rss.bpf.c would be fixed
in upcoming patches.

On Thu, Mar 25, 2021 at 5:58 PM <no-reply@patchew.org> wrote:

> Patchew URL:
> https://patchew.org/QEMU/20210325153529.75831-1-andrew@daynix.com/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:
>
> Type: series
> Message-id: 20210325153529.75831-1-andrew@daynix.com
> Subject: [PATCH v5 0/7] eBPF RSS support for virtio-net
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
> Switched to a new branch 'test'
> ad293ca MAINTAINERS: Added eBPF maintainers information.
> 57b0f9a docs: Added eBPF documentation.
> 043dbde virtio-net: Added eBPF RSS to virtio-net.
> aa652c0 ebpf: Added eBPF RSS loader.
> 9f24275 ebpf: Added eBPF RSS program.
> 6a33681 net: Added SetSteeringEBPF method for NetClientState.
> ad82041 net/tap: Added TUNSETSTEERINGEBPF code.
>
> === OUTPUT BEGIN ===
> 1/7 Checking commit ad820417b22d (net/tap: Added TUNSETSTEERINGEBPF code.)
> 2/7 Checking commit 6a33681ca4bf (net: Added SetSteeringEBPF method for
> NetClientState.)
> 3/7 Checking commit 9f24275a1eef (ebpf: Added eBPF RSS program.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/
> checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #22:
> new file mode 100755
>
> WARNING: line over 80 characters
> #210: FILE: tools/ebpf/rss.bpf.c:156:
> + * According to
> https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml
>
> WARNING: line over 80 characters
> #213: FILE: tools/ebpf/rss.bpf.c:159:
> + * Need to choose reasonable amount of maximum extensions/options we may
> check to find
>
> ERROR: braces {} are necessary for all arms of this statement
> #235: FILE: tools/ebpf/rss.bpf.c:181:
> +        if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #243: FILE: tools/ebpf/rss.bpf.c:189:
> +            if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #254: FILE: tools/ebpf/rss.bpf.c:200:
> +                if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #271: FILE: tools/ebpf/rss.bpf.c:217:
> +                if (err)
> [...]
>
> WARNING: line over 80 characters
> #283: FILE: tools/ebpf/rss.bpf.c:229:
> +                        *l4_offset + opt_offset + offsetof(struct
> ipv6_destopt_hao, addr),
>
> ERROR: braces {} are necessary for all arms of this statement
> #286: FILE: tools/ebpf/rss.bpf.c:232:
> +                    if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #316: FILE: tools/ebpf/rss.bpf.c:262:
> +    if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #330: FILE: tools/ebpf/rss.bpf.c:276:
> +    if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #359: FILE: tools/ebpf/rss.bpf.c:305:
> +        if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #373: FILE: tools/ebpf/rss.bpf.c:319:
> +        if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #383: FILE: tools/ebpf/rss.bpf.c:329:
> +        if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #394: FILE: tools/ebpf/rss.bpf.c:340:
> +            if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #405: FILE: tools/ebpf/rss.bpf.c:351:
> +            if (err)
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #429: FILE: tools/ebpf/rss.bpf.c:375:
> +    if (err)
> [...]
>
> total: 13 errors, 4 warnings, 574 lines checked
>
> Patch 3/7 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 4/7 Checking commit aa652c04e4a0 (ebpf: Added eBPF RSS loader.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/
> checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #71:
> new file mode 100644
>
> WARNING: architecture specific defines should be avoided
> #353: FILE: ebpf/rss.bpf.skeleton.h:4:
> +#ifndef __RSS_BPF_SKEL_H__
>
> ERROR: code indent should never use tabs
> #360: FILE: ebpf/rss.bpf.skeleton.h:11:
> +^Istruct bpf_object_skeleton *skeleton;$
>
> ERROR: code indent should never use tabs
> #361: FILE: ebpf/rss.bpf.skeleton.h:12:
> +^Istruct bpf_object *obj;$
>
> ERROR: code indent should never use tabs
> #362: FILE: ebpf/rss.bpf.skeleton.h:13:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #363: FILE: ebpf/rss.bpf.skeleton.h:14:
> +^I^Istruct bpf_map *tap_rss_map_configurations;$
>
> ERROR: code indent should never use tabs
> #364: FILE: ebpf/rss.bpf.skeleton.h:15:
> +^I^Istruct bpf_map *tap_rss_map_indirection_table;$
>
> ERROR: code indent should never use tabs
> #365: FILE: ebpf/rss.bpf.skeleton.h:16:
> +^I^Istruct bpf_map *tap_rss_map_toeplitz_key;$
>
> ERROR: code indent should never use tabs
> #366: FILE: ebpf/rss.bpf.skeleton.h:17:
> +^I} maps;$
>
> ERROR: code indent should never use tabs
> #367: FILE: ebpf/rss.bpf.skeleton.h:18:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #368: FILE: ebpf/rss.bpf.skeleton.h:19:
> +^I^Istruct bpf_program *tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #369: FILE: ebpf/rss.bpf.skeleton.h:20:
> +^I} progs;$
>
> ERROR: code indent should never use tabs
> #370: FILE: ebpf/rss.bpf.skeleton.h:21:
> +^Istruct {$
>
> ERROR: code indent should never use tabs
> #371: FILE: ebpf/rss.bpf.skeleton.h:22:
> +^I^Istruct bpf_link *tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #372: FILE: ebpf/rss.bpf.skeleton.h:23:
> +^I} links;$
>
> ERROR: code indent should never use tabs
> #378: FILE: ebpf/rss.bpf.skeleton.h:29:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #378: FILE: ebpf/rss.bpf.skeleton.h:29:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #379: FILE: ebpf/rss.bpf.skeleton.h:30:
> +^I^Ireturn;$
>
> ERROR: code indent should never use tabs
> #380: FILE: ebpf/rss.bpf.skeleton.h:31:
> +^Iif (obj->skeleton)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #380: FILE: ebpf/rss.bpf.skeleton.h:31:
> +       if (obj->skeleton)
> [...]
>
> ERROR: code indent should never use tabs
> #381: FILE: ebpf/rss.bpf.skeleton.h:32:
> +^I^Ibpf_object__destroy_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #382: FILE: ebpf/rss.bpf.skeleton.h:33:
> +^Ifree(obj);$
>
> ERROR: code indent should never use tabs
> #391: FILE: ebpf/rss.bpf.skeleton.h:42:
> +^Istruct rss_bpf *obj;$
>
> ERROR: code indent should never use tabs
> #393: FILE: ebpf/rss.bpf.skeleton.h:44:
> +^Iobj = (struct rss_bpf *)calloc(1, sizeof(*obj));$
>
> ERROR: code indent should never use tabs
> #394: FILE: ebpf/rss.bpf.skeleton.h:45:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #394: FILE: ebpf/rss.bpf.skeleton.h:45:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #395: FILE: ebpf/rss.bpf.skeleton.h:46:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #396: FILE: ebpf/rss.bpf.skeleton.h:47:
> +^Iif (rss_bpf__create_skeleton(obj))$
>
> ERROR: braces {} are necessary for all arms of this statement
> #396: FILE: ebpf/rss.bpf.skeleton.h:47:
> +       if (rss_bpf__create_skeleton(obj))
> [...]
>
> ERROR: code indent should never use tabs
> #397: FILE: ebpf/rss.bpf.skeleton.h:48:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #398: FILE: ebpf/rss.bpf.skeleton.h:49:
> +^Iif (bpf_object__open_skeleton(obj->skeleton, opts))$
>
> ERROR: braces {} are necessary for all arms of this statement
> #398: FILE: ebpf/rss.bpf.skeleton.h:49:
> +       if (bpf_object__open_skeleton(obj->skeleton, opts))
> [...]
>
> ERROR: code indent should never use tabs
> #399: FILE: ebpf/rss.bpf.skeleton.h:50:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #401: FILE: ebpf/rss.bpf.skeleton.h:52:
> +^Ireturn obj;$
>
> ERROR: code indent should never use tabs
> #403: FILE: ebpf/rss.bpf.skeleton.h:54:
> +^Irss_bpf__destroy(obj);$
>
> ERROR: code indent should never use tabs
> #404: FILE: ebpf/rss.bpf.skeleton.h:55:
> +^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #410: FILE: ebpf/rss.bpf.skeleton.h:61:
> +^Ireturn rss_bpf__open_opts(NULL);$
>
> ERROR: code indent should never use tabs
> #416: FILE: ebpf/rss.bpf.skeleton.h:67:
> +^Ireturn bpf_object__load_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #422: FILE: ebpf/rss.bpf.skeleton.h:73:
> +^Istruct rss_bpf *obj;$
>
> ERROR: code indent should never use tabs
> #424: FILE: ebpf/rss.bpf.skeleton.h:75:
> +^Iobj = rss_bpf__open();$
>
> ERROR: code indent should never use tabs
> #425: FILE: ebpf/rss.bpf.skeleton.h:76:
> +^Iif (!obj)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #425: FILE: ebpf/rss.bpf.skeleton.h:76:
> +       if (!obj)
> [...]
>
> ERROR: code indent should never use tabs
> #426: FILE: ebpf/rss.bpf.skeleton.h:77:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #427: FILE: ebpf/rss.bpf.skeleton.h:78:
> +^Iif (rss_bpf__load(obj)) {$
>
> ERROR: code indent should never use tabs
> #428: FILE: ebpf/rss.bpf.skeleton.h:79:
> +^I^Irss_bpf__destroy(obj);$
>
> ERROR: code indent should never use tabs
> #429: FILE: ebpf/rss.bpf.skeleton.h:80:
> +^I^Ireturn NULL;$
>
> ERROR: code indent should never use tabs
> #430: FILE: ebpf/rss.bpf.skeleton.h:81:
> +^I}$
>
> ERROR: code indent should never use tabs
> #431: FILE: ebpf/rss.bpf.skeleton.h:82:
> +^Ireturn obj;$
>
> ERROR: code indent should never use tabs
> #437: FILE: ebpf/rss.bpf.skeleton.h:88:
> +^Ireturn bpf_object__attach_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #443: FILE: ebpf/rss.bpf.skeleton.h:94:
> +^Ireturn bpf_object__detach_skeleton(obj->skeleton);$
>
> ERROR: code indent should never use tabs
> #449: FILE: ebpf/rss.bpf.skeleton.h:100:
> +^Istruct bpf_object_skeleton *s;$
>
> ERROR: code indent should never use tabs
> #451: FILE: ebpf/rss.bpf.skeleton.h:102:
> +^Is = (struct bpf_object_skeleton *)calloc(1, sizeof(*s));$
>
> ERROR: code indent should never use tabs
> #452: FILE: ebpf/rss.bpf.skeleton.h:103:
> +^Iif (!s)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #452: FILE: ebpf/rss.bpf.skeleton.h:103:
> +       if (!s)
> [...]
>
> ERROR: code indent should never use tabs
> #453: FILE: ebpf/rss.bpf.skeleton.h:104:
> +^I^Ireturn -1;$
>
> ERROR: code indent should never use tabs
> #454: FILE: ebpf/rss.bpf.skeleton.h:105:
> +^Iobj->skeleton = s;$
>
> ERROR: code indent should never use tabs
> #456: FILE: ebpf/rss.bpf.skeleton.h:107:
> +^Is->sz = sizeof(*s);$
>
> ERROR: code indent should never use tabs
> #457: FILE: ebpf/rss.bpf.skeleton.h:108:
> +^Is->name = "rss_bpf";$
>
> ERROR: code indent should never use tabs
> #458: FILE: ebpf/rss.bpf.skeleton.h:109:
> +^Is->obj = &obj->obj;$
>
> ERROR: code indent should never use tabs
> #460: FILE: ebpf/rss.bpf.skeleton.h:111:
> +^I/* maps */$
>
> ERROR: code indent should never use tabs
> #461: FILE: ebpf/rss.bpf.skeleton.h:112:
> +^Is->map_cnt = 3;$
>
> ERROR: code indent should never use tabs
> #462: FILE: ebpf/rss.bpf.skeleton.h:113:
> +^Is->map_skel_sz = sizeof(*s->maps);$
>
> ERROR: code indent should never use tabs
> #463: FILE: ebpf/rss.bpf.skeleton.h:114:
> +^Is->maps = (struct bpf_map_skeleton *)calloc(s->map_cnt,
> s->map_skel_sz);$
>
> ERROR: code indent should never use tabs
> #464: FILE: ebpf/rss.bpf.skeleton.h:115:
> +^Iif (!s->maps)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #464: FILE: ebpf/rss.bpf.skeleton.h:115:
> +       if (!s->maps)
> [...]
>
> ERROR: code indent should never use tabs
> #465: FILE: ebpf/rss.bpf.skeleton.h:116:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #467: FILE: ebpf/rss.bpf.skeleton.h:118:
> +^Is->maps[0].name = "tap_rss_map_configurations";$
>
> ERROR: code indent should never use tabs
> #468: FILE: ebpf/rss.bpf.skeleton.h:119:
> +^Is->maps[0].map = &obj->maps.tap_rss_map_configurations;$
>
> ERROR: code indent should never use tabs
> #470: FILE: ebpf/rss.bpf.skeleton.h:121:
> +^Is->maps[1].name = "tap_rss_map_indirection_table";$
>
> ERROR: code indent should never use tabs
> #471: FILE: ebpf/rss.bpf.skeleton.h:122:
> +^Is->maps[1].map = &obj->maps.tap_rss_map_indirection_table;$
>
> ERROR: code indent should never use tabs
> #473: FILE: ebpf/rss.bpf.skeleton.h:124:
> +^Is->maps[2].name = "tap_rss_map_toeplitz_key";$
>
> ERROR: code indent should never use tabs
> #474: FILE: ebpf/rss.bpf.skeleton.h:125:
> +^Is->maps[2].map = &obj->maps.tap_rss_map_toeplitz_key;$
>
> ERROR: code indent should never use tabs
> #476: FILE: ebpf/rss.bpf.skeleton.h:127:
> +^I/* programs */$
>
> ERROR: code indent should never use tabs
> #477: FILE: ebpf/rss.bpf.skeleton.h:128:
> +^Is->prog_cnt = 1;$
>
> ERROR: code indent should never use tabs
> #478: FILE: ebpf/rss.bpf.skeleton.h:129:
> +^Is->prog_skel_sz = sizeof(*s->progs);$
>
> WARNING: line over 80 characters
> #479: FILE: ebpf/rss.bpf.skeleton.h:130:
> +       s->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt,
> s->prog_skel_sz);
>
> ERROR: code indent should never use tabs
> #479: FILE: ebpf/rss.bpf.skeleton.h:130:
> +^Is->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt,
> s->prog_skel_sz);$
>
> ERROR: code indent should never use tabs
> #480: FILE: ebpf/rss.bpf.skeleton.h:131:
> +^Iif (!s->progs)$
>
> ERROR: braces {} are necessary for all arms of this statement
> #480: FILE: ebpf/rss.bpf.skeleton.h:131:
> +       if (!s->progs)
> [...]
>
> ERROR: code indent should never use tabs
> #481: FILE: ebpf/rss.bpf.skeleton.h:132:
> +^I^Igoto err;$
>
> ERROR: code indent should never use tabs
> #483: FILE: ebpf/rss.bpf.skeleton.h:134:
> +^Is->progs[0].name = "tun_rss_steering_prog";$
>
> ERROR: code indent should never use tabs
> #484: FILE: ebpf/rss.bpf.skeleton.h:135:
> +^Is->progs[0].prog = &obj->progs.tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #485: FILE: ebpf/rss.bpf.skeleton.h:136:
> +^Is->progs[0].link = &obj->links.tun_rss_steering_prog;$
>
> ERROR: code indent should never use tabs
> #487: FILE: ebpf/rss.bpf.skeleton.h:138:
> +^Is->data_sz = 7864;$
>
> ERROR: code indent should never use tabs
> #488: FILE: ebpf/rss.bpf.skeleton.h:139:
> +^Is->data = (void *)"\$
>
> ERROR: code indent should never use tabs
> #766: FILE: ebpf/rss.bpf.skeleton.h:417:
> +^Ireturn 0;$
>
> ERROR: code indent should never use tabs
> #768: FILE: ebpf/rss.bpf.skeleton.h:419:
> +^Ibpf_object__destroy_skeleton(s);$
>
> ERROR: code indent should never use tabs
> #769: FILE: ebpf/rss.bpf.skeleton.h:420:
> +^Ireturn -1;$
>
> total: 85 errors, 3 warnings, 758 lines checked
>
> Patch 4/7 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 5/7 Checking commit 043dbde56379 (virtio-net: Added eBPF RSS to
> virtio-net.)
> WARNING: line over 80 characters
> #185: FILE: hw/net/virtio-net.c:2868:
> +                    warn_report("Can't post-load eBPF RSS - fallback to
> software RSS");
>
> total: 0 errors, 1 warnings, 214 lines checked
>
> Patch 5/7 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 6/7 Checking commit 57b0f9a94036 (docs: Added eBPF documentation.)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/
> checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #16:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 129 lines checked
>
> Patch 6/7 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 7/7 Checking commit ad293ca1c684 (MAINTAINERS: Added eBPF maintainers
> information.)
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> The full log is available at
>
> http://patchew.org/logs/20210325153529.75831-1-andrew@daynix.com/testing.checkpatch/?type=message
> .
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--0000000000009e31e205bee41d57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The skeleton is generated file. Style issues with rss.bpf.=
c would be fixed in upcoming patches.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 5:58 PM &lt;<a=
 href=3D"mailto:no-reply@patchew.org">no-reply@patchew.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Patchew URL: <a h=
ref=3D"https://patchew.org/QEMU/20210325153529.75831-1-andrew@daynix.com/" =
rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/2021032515352=
9.75831-1-andrew@daynix.com/</a><br>
<br>
<br>
<br>
Hi,<br>
<br>
This series seems to have some coding style problems. See output below for<=
br>
more information:<br>
<br>
Type: series<br>
Message-id: <a href=3D"mailto:20210325153529.75831-1-andrew@daynix.com" tar=
get=3D"_blank">20210325153529.75831-1-andrew@daynix.com</a><br>
Subject: [PATCH v5 0/7] eBPF RSS support for virtio-net<br>
<br>
=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
git rev-parse base &gt; /dev/null || exit 0<br>
git config --local diff.renamelimit 0<br>
git config --local diff.renames True<br>
git config --local diff.algorithm histogram<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bl=
ank">checkpatch.pl</a> --mailback base..<br>
=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384<br>
Switched to a new branch &#39;test&#39;<br>
ad293ca MAINTAINERS: Added eBPF maintainers information.<br>
57b0f9a docs: Added eBPF documentation.<br>
043dbde virtio-net: Added eBPF RSS to virtio-net.<br>
aa652c0 ebpf: Added eBPF RSS loader.<br>
9f24275 ebpf: Added eBPF RSS program.<br>
6a33681 net: Added SetSteeringEBPF method for NetClientState.<br>
ad82041 net/tap: Added TUNSETSTEERINGEBPF code.<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
1/7 Checking commit ad820417b22d (net/tap: Added TUNSETSTEERINGEBPF code.)<=
br>
2/7 Checking commit 6a33681ca4bf (net: Added SetSteeringEBPF method for Net=
ClientState.)<br>
3/7 Checking commit 9f24275a1eef (ebpf: Added eBPF RSS program.)<br>
Use of uninitialized value $acpi_testexpected in string eq at ./scripts/<a =
href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpat=
ch.pl</a> line 1529.<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#22: <br>
new file mode 100755<br>
<br>
WARNING: line over 80 characters<br>
#210: FILE: tools/ebpf/rss.bpf.c:156:<br>
+ * According to <a href=3D"https://www.iana.org/assignments/ipv6-parameter=
s/ipv6-parameters.xhtml" rel=3D"noreferrer" target=3D"_blank">https://www.i=
ana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml</a><br>
<br>
WARNING: line over 80 characters<br>
#213: FILE: tools/ebpf/rss.bpf.c:159:<br>
+ * Need to choose reasonable amount of maximum extensions/options we may c=
heck to find<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#235: FILE: tools/ebpf/rss.bpf.c:181:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#243: FILE: tools/ebpf/rss.bpf.c:189:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#254: FILE: tools/ebpf/rss.bpf.c:200:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#271: FILE: tools/ebpf/rss.bpf.c:217:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
WARNING: line over 80 characters<br>
#283: FILE: tools/ebpf/rss.bpf.c:229:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *l4_offset + opt_offset + offsetof(struct ipv6_destopt_hao, addr=
),<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#286: FILE: tools/ebpf/rss.bpf.c:232:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#316: FILE: tools/ebpf/rss.bpf.c:262:<br>
+=C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#330: FILE: tools/ebpf/rss.bpf.c:276:<br>
+=C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#359: FILE: tools/ebpf/rss.bpf.c:305:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#373: FILE: tools/ebpf/rss.bpf.c:319:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#383: FILE: tools/ebpf/rss.bpf.c:329:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#394: FILE: tools/ebpf/rss.bpf.c:340:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#405: FILE: tools/ebpf/rss.bpf.c:351:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#429: FILE: tools/ebpf/rss.bpf.c:375:<br>
+=C2=A0 =C2=A0 if (err)<br>
[...]<br>
<br>
total: 13 errors, 4 warnings, 574 lines checked<br>
<br>
Patch 3/7 has style problems, please review.=C2=A0 If any of these errors<b=
r>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
4/7 Checking commit aa652c04e4a0 (ebpf: Added eBPF RSS loader.)<br>
Use of uninitialized value $acpi_testexpected in string eq at ./scripts/<a =
href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpat=
ch.pl</a> line 1529.<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#71: <br>
new file mode 100644<br>
<br>
WARNING: architecture specific defines should be avoided<br>
#353: FILE: ebpf/rss.bpf.skeleton.h:4:<br>
+#ifndef __RSS_BPF_SKEL_H__<br>
<br>
ERROR: code indent should never use tabs<br>
#360: FILE: ebpf/rss.bpf.skeleton.h:11:<br>
+^Istruct bpf_object_skeleton *skeleton;$<br>
<br>
ERROR: code indent should never use tabs<br>
#361: FILE: ebpf/rss.bpf.skeleton.h:12:<br>
+^Istruct bpf_object *obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#362: FILE: ebpf/rss.bpf.skeleton.h:13:<br>
+^Istruct {$<br>
<br>
ERROR: code indent should never use tabs<br>
#363: FILE: ebpf/rss.bpf.skeleton.h:14:<br>
+^I^Istruct bpf_map *tap_rss_map_configurations;$<br>
<br>
ERROR: code indent should never use tabs<br>
#364: FILE: ebpf/rss.bpf.skeleton.h:15:<br>
+^I^Istruct bpf_map *tap_rss_map_indirection_table;$<br>
<br>
ERROR: code indent should never use tabs<br>
#365: FILE: ebpf/rss.bpf.skeleton.h:16:<br>
+^I^Istruct bpf_map *tap_rss_map_toeplitz_key;$<br>
<br>
ERROR: code indent should never use tabs<br>
#366: FILE: ebpf/rss.bpf.skeleton.h:17:<br>
+^I} maps;$<br>
<br>
ERROR: code indent should never use tabs<br>
#367: FILE: ebpf/rss.bpf.skeleton.h:18:<br>
+^Istruct {$<br>
<br>
ERROR: code indent should never use tabs<br>
#368: FILE: ebpf/rss.bpf.skeleton.h:19:<br>
+^I^Istruct bpf_program *tun_rss_steering_prog;$<br>
<br>
ERROR: code indent should never use tabs<br>
#369: FILE: ebpf/rss.bpf.skeleton.h:20:<br>
+^I} progs;$<br>
<br>
ERROR: code indent should never use tabs<br>
#370: FILE: ebpf/rss.bpf.skeleton.h:21:<br>
+^Istruct {$<br>
<br>
ERROR: code indent should never use tabs<br>
#371: FILE: ebpf/rss.bpf.skeleton.h:22:<br>
+^I^Istruct bpf_link *tun_rss_steering_prog;$<br>
<br>
ERROR: code indent should never use tabs<br>
#372: FILE: ebpf/rss.bpf.skeleton.h:23:<br>
+^I} links;$<br>
<br>
ERROR: code indent should never use tabs<br>
#378: FILE: ebpf/rss.bpf.skeleton.h:29:<br>
+^Iif (!obj)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#378: FILE: ebpf/rss.bpf.skeleton.h:29:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#379: FILE: ebpf/rss.bpf.skeleton.h:30:<br>
+^I^Ireturn;$<br>
<br>
ERROR: code indent should never use tabs<br>
#380: FILE: ebpf/rss.bpf.skeleton.h:31:<br>
+^Iif (obj-&gt;skeleton)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#380: FILE: ebpf/rss.bpf.skeleton.h:31:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;skeleton)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#381: FILE: ebpf/rss.bpf.skeleton.h:32:<br>
+^I^Ibpf_object__destroy_skeleton(obj-&gt;skeleton);$<br>
<br>
ERROR: code indent should never use tabs<br>
#382: FILE: ebpf/rss.bpf.skeleton.h:33:<br>
+^Ifree(obj);$<br>
<br>
ERROR: code indent should never use tabs<br>
#391: FILE: ebpf/rss.bpf.skeleton.h:42:<br>
+^Istruct rss_bpf *obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#393: FILE: ebpf/rss.bpf.skeleton.h:44:<br>
+^Iobj =3D (struct rss_bpf *)calloc(1, sizeof(*obj));$<br>
<br>
ERROR: code indent should never use tabs<br>
#394: FILE: ebpf/rss.bpf.skeleton.h:45:<br>
+^Iif (!obj)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#394: FILE: ebpf/rss.bpf.skeleton.h:45:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#395: FILE: ebpf/rss.bpf.skeleton.h:46:<br>
+^I^Ireturn NULL;$<br>
<br>
ERROR: code indent should never use tabs<br>
#396: FILE: ebpf/rss.bpf.skeleton.h:47:<br>
+^Iif (rss_bpf__create_skeleton(obj))$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#396: FILE: ebpf/rss.bpf.skeleton.h:47:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rss_bpf__create_skeleton(obj))<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#397: FILE: ebpf/rss.bpf.skeleton.h:48:<br>
+^I^Igoto err;$<br>
<br>
ERROR: code indent should never use tabs<br>
#398: FILE: ebpf/rss.bpf.skeleton.h:49:<br>
+^Iif (bpf_object__open_skeleton(obj-&gt;skeleton, opts))$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#398: FILE: ebpf/rss.bpf.skeleton.h:49:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bpf_object__open_skeleton(obj-&gt;skeleton,=
 opts))<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#399: FILE: ebpf/rss.bpf.skeleton.h:50:<br>
+^I^Igoto err;$<br>
<br>
ERROR: code indent should never use tabs<br>
#401: FILE: ebpf/rss.bpf.skeleton.h:52:<br>
+^Ireturn obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#403: FILE: ebpf/rss.bpf.skeleton.h:54:<br>
+^Irss_bpf__destroy(obj);$<br>
<br>
ERROR: code indent should never use tabs<br>
#404: FILE: ebpf/rss.bpf.skeleton.h:55:<br>
+^Ireturn NULL;$<br>
<br>
ERROR: code indent should never use tabs<br>
#410: FILE: ebpf/rss.bpf.skeleton.h:61:<br>
+^Ireturn rss_bpf__open_opts(NULL);$<br>
<br>
ERROR: code indent should never use tabs<br>
#416: FILE: ebpf/rss.bpf.skeleton.h:67:<br>
+^Ireturn bpf_object__load_skeleton(obj-&gt;skeleton);$<br>
<br>
ERROR: code indent should never use tabs<br>
#422: FILE: ebpf/rss.bpf.skeleton.h:73:<br>
+^Istruct rss_bpf *obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#424: FILE: ebpf/rss.bpf.skeleton.h:75:<br>
+^Iobj =3D rss_bpf__open();$<br>
<br>
ERROR: code indent should never use tabs<br>
#425: FILE: ebpf/rss.bpf.skeleton.h:76:<br>
+^Iif (!obj)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#425: FILE: ebpf/rss.bpf.skeleton.h:76:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#426: FILE: ebpf/rss.bpf.skeleton.h:77:<br>
+^I^Ireturn NULL;$<br>
<br>
ERROR: code indent should never use tabs<br>
#427: FILE: ebpf/rss.bpf.skeleton.h:78:<br>
+^Iif (rss_bpf__load(obj)) {$<br>
<br>
ERROR: code indent should never use tabs<br>
#428: FILE: ebpf/rss.bpf.skeleton.h:79:<br>
+^I^Irss_bpf__destroy(obj);$<br>
<br>
ERROR: code indent should never use tabs<br>
#429: FILE: ebpf/rss.bpf.skeleton.h:80:<br>
+^I^Ireturn NULL;$<br>
<br>
ERROR: code indent should never use tabs<br>
#430: FILE: ebpf/rss.bpf.skeleton.h:81:<br>
+^I}$<br>
<br>
ERROR: code indent should never use tabs<br>
#431: FILE: ebpf/rss.bpf.skeleton.h:82:<br>
+^Ireturn obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#437: FILE: ebpf/rss.bpf.skeleton.h:88:<br>
+^Ireturn bpf_object__attach_skeleton(obj-&gt;skeleton);$<br>
<br>
ERROR: code indent should never use tabs<br>
#443: FILE: ebpf/rss.bpf.skeleton.h:94:<br>
+^Ireturn bpf_object__detach_skeleton(obj-&gt;skeleton);$<br>
<br>
ERROR: code indent should never use tabs<br>
#449: FILE: ebpf/rss.bpf.skeleton.h:100:<br>
+^Istruct bpf_object_skeleton *s;$<br>
<br>
ERROR: code indent should never use tabs<br>
#451: FILE: ebpf/rss.bpf.skeleton.h:102:<br>
+^Is =3D (struct bpf_object_skeleton *)calloc(1, sizeof(*s));$<br>
<br>
ERROR: code indent should never use tabs<br>
#452: FILE: ebpf/rss.bpf.skeleton.h:103:<br>
+^Iif (!s)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#452: FILE: ebpf/rss.bpf.skeleton.h:103:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#453: FILE: ebpf/rss.bpf.skeleton.h:104:<br>
+^I^Ireturn -1;$<br>
<br>
ERROR: code indent should never use tabs<br>
#454: FILE: ebpf/rss.bpf.skeleton.h:105:<br>
+^Iobj-&gt;skeleton =3D s;$<br>
<br>
ERROR: code indent should never use tabs<br>
#456: FILE: ebpf/rss.bpf.skeleton.h:107:<br>
+^Is-&gt;sz =3D sizeof(*s);$<br>
<br>
ERROR: code indent should never use tabs<br>
#457: FILE: ebpf/rss.bpf.skeleton.h:108:<br>
+^Is-&gt;name =3D &quot;rss_bpf&quot;;$<br>
<br>
ERROR: code indent should never use tabs<br>
#458: FILE: ebpf/rss.bpf.skeleton.h:109:<br>
+^Is-&gt;obj =3D &amp;obj-&gt;obj;$<br>
<br>
ERROR: code indent should never use tabs<br>
#460: FILE: ebpf/rss.bpf.skeleton.h:111:<br>
+^I/* maps */$<br>
<br>
ERROR: code indent should never use tabs<br>
#461: FILE: ebpf/rss.bpf.skeleton.h:112:<br>
+^Is-&gt;map_cnt =3D 3;$<br>
<br>
ERROR: code indent should never use tabs<br>
#462: FILE: ebpf/rss.bpf.skeleton.h:113:<br>
+^Is-&gt;map_skel_sz =3D sizeof(*s-&gt;maps);$<br>
<br>
ERROR: code indent should never use tabs<br>
#463: FILE: ebpf/rss.bpf.skeleton.h:114:<br>
+^Is-&gt;maps =3D (struct bpf_map_skeleton *)calloc(s-&gt;map_cnt, s-&gt;ma=
p_skel_sz);$<br>
<br>
ERROR: code indent should never use tabs<br>
#464: FILE: ebpf/rss.bpf.skeleton.h:115:<br>
+^Iif (!s-&gt;maps)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#464: FILE: ebpf/rss.bpf.skeleton.h:115:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;maps)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#465: FILE: ebpf/rss.bpf.skeleton.h:116:<br>
+^I^Igoto err;$<br>
<br>
ERROR: code indent should never use tabs<br>
#467: FILE: ebpf/rss.bpf.skeleton.h:118:<br>
+^Is-&gt;maps[0].name =3D &quot;tap_rss_map_configurations&quot;;$<br>
<br>
ERROR: code indent should never use tabs<br>
#468: FILE: ebpf/rss.bpf.skeleton.h:119:<br>
+^Is-&gt;maps[0].map =3D &amp;obj-&gt;maps.tap_rss_map_configurations;$<br>
<br>
ERROR: code indent should never use tabs<br>
#470: FILE: ebpf/rss.bpf.skeleton.h:121:<br>
+^Is-&gt;maps[1].name =3D &quot;tap_rss_map_indirection_table&quot;;$<br>
<br>
ERROR: code indent should never use tabs<br>
#471: FILE: ebpf/rss.bpf.skeleton.h:122:<br>
+^Is-&gt;maps[1].map =3D &amp;obj-&gt;maps.tap_rss_map_indirection_table;$<=
br>
<br>
ERROR: code indent should never use tabs<br>
#473: FILE: ebpf/rss.bpf.skeleton.h:124:<br>
+^Is-&gt;maps[2].name =3D &quot;tap_rss_map_toeplitz_key&quot;;$<br>
<br>
ERROR: code indent should never use tabs<br>
#474: FILE: ebpf/rss.bpf.skeleton.h:125:<br>
+^Is-&gt;maps[2].map =3D &amp;obj-&gt;maps.tap_rss_map_toeplitz_key;$<br>
<br>
ERROR: code indent should never use tabs<br>
#476: FILE: ebpf/rss.bpf.skeleton.h:127:<br>
+^I/* programs */$<br>
<br>
ERROR: code indent should never use tabs<br>
#477: FILE: ebpf/rss.bpf.skeleton.h:128:<br>
+^Is-&gt;prog_cnt =3D 1;$<br>
<br>
ERROR: code indent should never use tabs<br>
#478: FILE: ebpf/rss.bpf.skeleton.h:129:<br>
+^Is-&gt;prog_skel_sz =3D sizeof(*s-&gt;progs);$<br>
<br>
WARNING: line over 80 characters<br>
#479: FILE: ebpf/rss.bpf.skeleton.h:130:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;progs =3D (struct bpf_prog_skeleton *)cal=
loc(s-&gt;prog_cnt, s-&gt;prog_skel_sz);<br>
<br>
ERROR: code indent should never use tabs<br>
#479: FILE: ebpf/rss.bpf.skeleton.h:130:<br>
+^Is-&gt;progs =3D (struct bpf_prog_skeleton *)calloc(s-&gt;prog_cnt, s-&gt=
;prog_skel_sz);$<br>
<br>
ERROR: code indent should never use tabs<br>
#480: FILE: ebpf/rss.bpf.skeleton.h:131:<br>
+^Iif (!s-&gt;progs)$<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#480: FILE: ebpf/rss.bpf.skeleton.h:131:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;progs)<br>
[...]<br>
<br>
ERROR: code indent should never use tabs<br>
#481: FILE: ebpf/rss.bpf.skeleton.h:132:<br>
+^I^Igoto err;$<br>
<br>
ERROR: code indent should never use tabs<br>
#483: FILE: ebpf/rss.bpf.skeleton.h:134:<br>
+^Is-&gt;progs[0].name =3D &quot;tun_rss_steering_prog&quot;;$<br>
<br>
ERROR: code indent should never use tabs<br>
#484: FILE: ebpf/rss.bpf.skeleton.h:135:<br>
+^Is-&gt;progs[0].prog =3D &amp;obj-&gt;progs.tun_rss_steering_prog;$<br>
<br>
ERROR: code indent should never use tabs<br>
#485: FILE: ebpf/rss.bpf.skeleton.h:136:<br>
+^Is-&gt;progs[0].link =3D &amp;obj-&gt;links.tun_rss_steering_prog;$<br>
<br>
ERROR: code indent should never use tabs<br>
#487: FILE: ebpf/rss.bpf.skeleton.h:138:<br>
+^Is-&gt;data_sz =3D 7864;$<br>
<br>
ERROR: code indent should never use tabs<br>
#488: FILE: ebpf/rss.bpf.skeleton.h:139:<br>
+^Is-&gt;data =3D (void *)&quot;\$<br>
<br>
ERROR: code indent should never use tabs<br>
#766: FILE: ebpf/rss.bpf.skeleton.h:417:<br>
+^Ireturn 0;$<br>
<br>
ERROR: code indent should never use tabs<br>
#768: FILE: ebpf/rss.bpf.skeleton.h:419:<br>
+^Ibpf_object__destroy_skeleton(s);$<br>
<br>
ERROR: code indent should never use tabs<br>
#769: FILE: ebpf/rss.bpf.skeleton.h:420:<br>
+^Ireturn -1;$<br>
<br>
total: 85 errors, 3 warnings, 758 lines checked<br>
<br>
Patch 4/7 has style problems, please review.=C2=A0 If any of these errors<b=
r>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
5/7 Checking commit 043dbde56379 (virtio-net: Added eBPF RSS to virtio-net.=
)<br>
WARNING: line over 80 characters<br>
#185: FILE: hw/net/virtio-net.c:2868:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn=
_report(&quot;Can&#39;t post-load eBPF RSS - fallback to software RSS&quot;=
);<br>
<br>
total: 0 errors, 1 warnings, 214 lines checked<br>
<br>
Patch 5/7 has style problems, please review.=C2=A0 If any of these errors<b=
r>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
6/7 Checking commit 57b0f9a94036 (docs: Added eBPF documentation.)<br>
Use of uninitialized value $acpi_testexpected in string eq at ./scripts/<a =
href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpat=
ch.pl</a> line 1529.<br>
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?<b=
r>
#16: <br>
new file mode 100644<br>
<br>
total: 0 errors, 1 warnings, 129 lines checked<br>
<br>
Patch 6/7 has style problems, please review.=C2=A0 If any of these errors<b=
r>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
7/7 Checking commit ad293ca1c684 (MAINTAINERS: Added eBPF maintainers infor=
mation.)<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br>
<br>
<br>
The full log is available at<br>
<a href=3D"http://patchew.org/logs/20210325153529.75831-1-andrew@daynix.com=
/testing.checkpatch/?type=3Dmessage" rel=3D"noreferrer" target=3D"_blank">h=
ttp://patchew.org/logs/20210325153529.75831-1-andrew@daynix.com/testing.che=
ckpatch/?type=3Dmessage</a>.<br>
---<br>
Email generated automatically by Patchew [<a href=3D"https://patchew.org/" =
rel=3D"noreferrer" target=3D"_blank">https://patchew.org/</a>].<br>
Please send your feedback to <a href=3D"mailto:patchew-devel@redhat.com" ta=
rget=3D"_blank">patchew-devel@redhat.com</a></blockquote></div>

--0000000000009e31e205bee41d57--

