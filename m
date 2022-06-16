Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E254E210
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:36:02 +0200 (CEST)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pfF-0004Bj-Mo
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o1paf-0008Sj-EH
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:31:17 -0400
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49]:15970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o1pac-0001bx-7c
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:31:16 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 205947832
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kmlsmqDLyrOMqBVW/73hw5YqxClBgxIJ4kV8jS/XYbTApDoh1TUGz
 TdOXGmCbKuJZDT1etBwbYu1pBkC6JDVz4BqTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn29Aw27BVPivW0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgS1LPsvyB94KE3fMldG0DFrrx8RYZWc
 QpiIIaRpQs19z91Yj+sfy2SnkciG9Y+NiDX4pZatjTLbrGvaUXe345iXMfwZ3u7hB2E3IBsz
 fIc76avYgUUIq/sxqM7UiBhRnQW0a1uoNcrIFC6uM2XilTFKj7imqQ/Sk4xOoIc96B8BmQmG
 f4wcmhcKEDewbjsmvTiG7gEascLdaEHOKsWvmFmwSvxB+tgTJzeK0nPzYUAgWZs2ZAVR54yY
 eIkeQdXYDTFOyRLYHFHI7USneWKiiTwJmgwRFW94PBfD3Lo5BV81aWoPNfLd9iiQ8JTkUCF4
 GXc8AzE7goyMdWezX+c8SvpiLaezGX0X4UdELD+/flv6LGO+lEu5NQtfQPTiZGEZoSWBrqz9
 2R8FvISkJUP
IronPort-HdrOrdr: A9a23:z9HvUaGQJ46NU4BgpLqE5MeALOsnbusQ8zAXPiFKJSC9Hfbzqy
 nDppUmPGbP+VQssSgb6LO90cq7Kk80l6QZ3WBLB8bGYOCOggLBEGgI1+XfKlPbexEWjdQz6U
 /tGZIObOHNMQ==
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 09:31:04 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 bk10-20020a05620a1a0a00b006a6b1d676ebso1791126qkb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YsIaG59KwH6Gj7f2wx+X0cBrzMCcGmiIguK4X8XqT+o=;
 b=crGLGuL05vXThP+VDX83+7PiZcwSvhDQpT0HkZXIAdhjus7VfsE60wU6UdHxMJzxyj
 wYgIY0ABWnX6LVlxkkErlvVcj8NTgrL7Q4YtP7Zuu1H8J9YD8RqE0cjkqs5AfolmeLvE
 7VqFwm3ZzQOErZnUz9DlmaIm0FDumhWTqtBBrvEDyO6BdS+tYMaG72LPMGCkEpETKUhG
 mPTZjtx1W83kNSpgdT+fx3cPDRXFWo+1+lMm0GMResD06t9BWi8EPxGLBcMiofTnMhgs
 t0slWRbH5J3MfRhiGmtbPu7EsCWjjVrpmwUhdiXHjRSuBLVmUMNsoK01BZFAMyPfrcTO
 tanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YsIaG59KwH6Gj7f2wx+X0cBrzMCcGmiIguK4X8XqT+o=;
 b=cvaNc8PR6BJ3fhm84iNNRRRgDksk8TFsUwpLTdv6p2ygTh9w3FKCbUdUWHXrq6OHb5
 JczVuJvoMOaglmvRsel2acOGxyOjfKziedpImvzop8vlXQjPULI9Tma+clJJDgtFeSAs
 K9VcKZkG9EQ5rKGf2Y3ijxAGj1Ly/Eu+Ouy54PTdf5jehjDmIZ24vircp1ZnRJkI1WLO
 oLSUheCUzo7wIAsLKqZP8n7PSPLvLn8FyGnNZBsRaKwRaljGwWggate0Wv5GEskE6wZc
 uym0zoygoGjnnb5hmzVOfN09GHX/INdUBB2DrcqbDGdOlzVw0R0d+4VrxB4XbjxBW4iu
 3ZLw==
X-Gm-Message-State: AJIora8o1OCVXL0a/b239zxgF+r2IVdw11zLsmNiZtG9VHjL+ET5Vq0p
 jbCivKBbGDi+zmGwie8Y6qNaQ1Xzsoi9bymBx4W83HDX1mVjji/VV2n88DzR/n8xn0wTHRq/EHB
 aaBKRGVMj8pzY1SDqYjrKOiqNT+em9g==
X-Received: by 2002:a05:6214:29ec:b0:46d:82b5:b02f with SMTP id
 jv12-20020a05621429ec00b0046d82b5b02fmr4127003qvb.118.1655386262565; 
 Thu, 16 Jun 2022 06:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhQkMKQAJvdx0Q8RBfCO83vuScnUPwvdTJ9++9U9KHSw7LvHC0DIOwEoijaMwo0yq35t6U2A==
X-Received: by 2002:a05:6214:29ec:b0:46d:82b5:b02f with SMTP id
 jv12-20020a05621429ec00b0046d82b5b02fmr4126982qvb.118.1655386262237; 
 Thu, 16 Jun 2022 06:31:02 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac857d1000000b002f39b99f69csm1978653qta.54.2022.06.16.06.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 06:31:01 -0700 (PDT)
Date: Thu, 16 Jun 2022 09:30:57 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Patrick Venture <venture@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Subject: Re: misaligned-pointer-use libslirp/src/tcp_input.c
Message-ID: <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
References: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this an --enable-sanitizers build? The virtual-device fuzzer catches
these periodically while fuzzing network-devices. However I don't think
OSS-Fuzz creates reports for them for some reason. I can create qtest
reproducers, if that is useful. 
-Alex

On 220615 0942, Patrick Venture wrote:
> Hey - I wanted to ask if someone else has seen this or has suggestions on
> how to fix it in libslirp / qemu.
> 
> libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9
> 
> The blow is line:
> https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310
> 
> I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
> third_party/libslirp/src/tcp_input.c:310:56: runtime error: member access
> within misaligned address 0xffff9a4000f4 for type 'struct qlink', which
> requires 8 byte alignment
> I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU: 0xffff9a4000f4: note:
> pointer points here
> I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00 00 00 00 00
> 00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01 86 dd 60 02
> dd 79
> I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:               ^
> I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0 0xaaaacbe34bd8
> in tcp_input third_party/libslirp/src/tcp_input.c:310:56
> I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1 0xaaaacbe22a94
> in ip6_input third_party/libslirp/src/ip6_input.c:74:9
> I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2 0xaaaacbe0bbbc
> in slirp_input third_party/libslirp/src/slirp.c:1169:13
> I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3 0xaaaacbd55f6c
> in net_slirp_receive third_party/qemu/net/slirp.c:136:5
> I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4 0xaaaacbd4e77c
> in nc_sendv_compat third_party/qemu/net/net.c
> I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5 0xaaaacbd4e77c
> in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
> I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6 0xaaaacbd50bfc
> in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11
> I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7 0xaaaacbd50bfc
> in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
> I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8 0xaaaacbd4a88c
> in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
> I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9 0xaaaacacb1de0
> in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15
> I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
> 0xaaaacacb1580 in virtio_net_tx_bh
> third_party/qemu/hw/net/virtio-net.c:2703:11
> I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
> 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5
> I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
> 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13
> I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
> 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5
> I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
> 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5
> I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
> 0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:27
> I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
> 0xaaaacc3a7690 in g_main_context_dispatch
> third_party/glib/glib/gmain.c:4135:7
> I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
> 0xaaaacc2de3ec in glib_pollfds_poll third_party/qemu/util/main-loop.c:232:9
> I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
> 0xaaaacc2de3ec in os_host_main_loop_wait
> third_party/qemu/util/main-loop.c:255:5
> I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
> 0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11
> I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
> 0xaaaacbd82798 in qemu_main_loop third_party/qemu/softmmu/runstate.c:727:9
> I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
> 0xaaaacadacb5c in main
> 
> Patrick

