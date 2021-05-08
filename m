Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95037749A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 01:51:32 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfWjK-00025l-L7
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 19:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lfWiU-0001M8-Fb
 for qemu-devel@nongnu.org; Sat, 08 May 2021 19:50:38 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:32768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lfWiS-0001se-EX
 for qemu-devel@nongnu.org; Sat, 08 May 2021 19:50:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 35EFD3CB;
 Sun,  9 May 2021 01:50:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IAMp23EcU30; Sun,  9 May 2021 01:50:31 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 290334F;
 Sun,  9 May 2021 01:50:27 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lfWiI-000amk-99; Sun, 09 May 2021 01:50:26 +0200
Date: Sun, 9 May 2021 01:50:26 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [OSS-Fuzz] Assertion Failure: !in6_zero(&ip_addr) (#111)
Message-ID: <20210508235026.qftjygq6wgr6mg3w@begin>
References: <20210503200933.aqi4fg7x5lilbug3@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210503200933.aqi4fg7x5lilbug3@mozz.bu.edu>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 35EFD3CB
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; SUBJECT_HAS_EXCLAIM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Alexander Bulekov, le lun. 03 mai 2021 16:09:33 -0400, a ecrit:
> Forwarding this along to the list, so it doesn't get burried during the
> gitlab issue migration.

Thanks!

Pushed a proposed fix on

https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/86

Samuel

> ----- Forwarded message from "Alexander Bulekov (@a1xndr)" <gitlab@mg.gitlab.com> -----
> 
> Alexander Bulekov created an issue: https://gitlab.com/qemu-project/qemu/-/issues/111
> 
> Hello,
> Reproducer
> ```
> cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> 512M -M q35 -nodefaults -device e1000e,netdev=net0 -netdev user,id=net0 \
> -qtest stdio
> outl 0xcf8 0x80000813
> outl 0xcfc 0x56
> outl 0xcf8 0x80000801
> outl 0xcfc 0x06000000
> write 0x56000403 0x1 0x02
> write 0x5600042b 0x1 0x80
> write 0x20a 0x1 0x86
> write 0x20b 0x1 0xdd
> write 0x20c 0x1 0x60
> write 0x212 0x1 0x11
> write 0x213 0x1 0x01
> write 0x224 0x1 0xfe
> write 0x225 0x1 0xc0
> write 0x233 0x1 0x02
> write 0x237 0x1 0x45
> write 0x23d 0x1 0x01
> write 0xb 0x1 0x24
> write 0x10 0x1 0xfe
> write 0x11 0x1 0x01
> write 0x19 0x1 0x01
> write 0x1a 0x1 0x10
> write 0x1b 0x1 0x25
> write 0x5600043a 0x1 0x04
> EOF
> ```
> 
> Stack-trace:
> ```
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../net/eth.c:374:27 in
> ../net/eth.c:375:27: runtime error: member access within misaligned address 0x631000014846 for type 'struct ip6_header', which requires 4 byte alignment
> 0x631000014846: note: pointer points here
>  00 00 11 11 60 00  00 00 00 00 11 11 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 fe c0  00 00
>              ^
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../net/eth.c:375:27 in
> qemu-fuzz-i386: ../slirp/src/ndp_table.c:59: _Bool ndp_table_search(Slirp *, struct in6_addr, uint8_t *): Assertion `!in6_zero(&ip_addr)' failed.
> 
> #8 in __assert_fail assert/assert.c:101:3
> #9 in ndp_table_search /slirp/src/ndp_table.c:59:5
> #10 in if_encap6 /slirp/src/slirp.c:926:10
> #11 in if_encap /slirp/src/slirp.c:967:15
> #12 in if_start /slirp/src/if.c:183:45
> #13 in ip6_output /slirp/src/ip6_output.c:35:9
> #14 in tftp_udp_output /slirp/src/tftp.c:161:9
> #15 in tftp_send_error /slirp/src/tftp.c:223:5
> #16 in tftp_handle_rrq /slirp/src/tftp.c
> #17 in tftp_input /slirp/src/tftp.c:453:9
> #18 in udp6_input /slirp/src/udp6.c:81:9
> #19 in slirp_input /slirp/src/slirp.c:847:13
> #20 in net_slirp_receive /net/slirp.c:136:5
> #21 in nc_sendv_compat /net/net.c
> #22 in qemu_deliver_packet_iov /net/net.c:765:15
> #23 in qemu_net_queue_deliver_iov /net/queue.c:179:11
> #24 in qemu_net_queue_send_iov /net/queue.c:246:11
> #25 in net_tx_pkt_sendv /hw/net/net_tx_pkt.c:558:9
> #26 in net_tx_pkt_send /hw/net/net_tx_pkt.c:633:9
> #27 in e1000e_tx_pkt_send /hw/net/e1000e_core.c:659:16
> #28 in e1000e_process_tx_desc /hw/net/e1000e_core.c:736:17
> #29 in e1000e_start_xmit /hw/net/e1000e_core.c:927:9
> #30 in e1000e_set_tdt /hw/net/e1000e_core.c:2444:9
> #31 in e1000e_core_write /hw/net/e1000e_core.c:3256:9
> #32 in memory_region_write_accessor /softmmu/memory.c:491:5
> #33 in access_with_adjusted_size /softmmu/memory.c:552:18
> #34 in memory_region_dispatch_write /softmmu/memory.c
> #35 in flatview_write_continue /softmmu/physmem.c:2746:23
> #36 in flatview_write /softmmu/physmem.c:2786:14
> #37 in address_space_write /softmmu/physmem.c:2878:18
> ```
> 
> Test-case:
> ```
> /*
>  * Autogenerated Fuzzer Test Case
>  *
>  * Copyright (c) 2021 <name of author>
>  *
>  * This work is licensed under the terms of the GNU GPL, version 2 or later.
>  * See the COPYING file in the top-level directory.
>  */
> 
> #include "qemu/osdep.h"
> 
> #include "libqos/libqtest.h"
> 
> static void test_fuzz(void)
> {
>     QTestState *s = qtest_init("-display none , -m 512M -M q35 -nodefaults -device "
>                                "e1000e,netdev=net0 -netdev user,id=net0");
>     qtest_outl(s, 0xcf8, 0x80000813);
>     qtest_outl(s, 0xcfc, 0x56);
>     qtest_outl(s, 0xcf8, 0x80000801);
>     qtest_outl(s, 0xcfc, 0x06000000);
>     qtest_bufwrite(s, 0x56000403, "\x02", 0x1);
>     qtest_bufwrite(s, 0x5600042b, "\x80", 0x1);
>     qtest_bufwrite(s, 0x20a, "\x86", 0x1);
>     qtest_bufwrite(s, 0x20b, "\xdd", 0x1);
>     qtest_bufwrite(s, 0x20c, "\x60", 0x1);
>     qtest_bufwrite(s, 0x212, "\x11", 0x1);
>     qtest_bufwrite(s, 0x213, "\x01", 0x1);
>     qtest_bufwrite(s, 0x224, "\xfe", 0x1);
>     qtest_bufwrite(s, 0x225, "\xc0", 0x1);
>     qtest_bufwrite(s, 0x233, "\x02", 0x1);
>     qtest_bufwrite(s, 0x237, "\x45", 0x1);
>     qtest_bufwrite(s, 0x23d, "\x01", 0x1);
>     qtest_bufwrite(s, 0xb, "\x24", 0x1);
>     qtest_bufwrite(s, 0x10, "\xfe", 0x1);
>     qtest_bufwrite(s, 0x11, "\x01", 0x1);
>     qtest_bufwrite(s, 0x19, "\x01", 0x1);
>     qtest_bufwrite(s, 0x1a, "\x10", 0x1);
>     qtest_bufwrite(s, 0x1b, "\x25", 0x1);
>     qtest_bufwrite(s, 0x5600043a, "\x04", 0x1);
>     qtest_quit(s);
> }
> int main(int argc, char **argv)
> {
>     const char *arch = qtest_get_arch();
> 
>     g_test_init(&argc, &argv, NULL);
> 
>     if (strcmp(arch, "i386") == 0) {
>         qtest_add_func("fuzz/test_fuzz", test_fuzz);
>     }
> 
>     return g_test_run();
> }
> ```
> 
> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33873
> 

-- 
Samuel
Tu as lu les docs. Tu es devenu un informaticien. Que tu le veuilles
ou non. Lire la doc, c'est le Premier et Unique Commandement de
l'informaticien.
-+- TP in: Guide du Linuxien pervers - "L'évangile selon St Thomas"

