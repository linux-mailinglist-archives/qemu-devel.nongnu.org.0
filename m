Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A4A2C2091
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:57:52 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khU91-0004Es-RQ
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khU6u-0002Mt-8K
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khU6q-00042A-N1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606208135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alC+rmFFZkeSUHHMj2fMfVzvk+2SGhmoZ5HaHs1Av1E=;
 b=EXvIzwmdAn3qB9BycC+bCceBfywvqtuK3txQCVho0Y5FPrNehiNQP6/mQT8KsiVtN1aCP4
 3wbsyej9RlRaxXWLfBmHRdaVC3HYUZkxupGxAqByDgayDfOExXp9e+9iawN/Ghy3sDHsb2
 XwHBNs30A272xBhXbkGegFTxE3Ob5FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-BrWUNV-7PHeIJi1E2Z8nQw-1; Tue, 24 Nov 2020 03:55:31 -0500
X-MC-Unique: BrWUNV-7PHeIJi1E2Z8nQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47B3A9A221;
 Tue, 24 Nov 2020 08:55:30 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45EE760875;
 Tue, 24 Nov 2020 08:55:15 +0000 (UTC)
Subject: Re: [RFC PATCH v2 5/5] docs: Added eBPF documentation.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-6-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <41b81b86-225f-8d5a-3acc-0cae799c11d3@redhat.com>
Date: Tue, 24 Nov 2020 16:54:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119111305.485202-6-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
>
> Also, added maintainers information.
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   MAINTAINERS       |   7 +++
>   docs/ebpf_rss.rst | 133 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)
>   create mode 100644 docs/ebpf_rss.rst
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c22bbca5a..d93c85b867 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3111,6 +3111,13 @@ S: Maintained
>   F: hw/semihosting/
>   F: include/hw/semihosting/
>   
> +EBPF:
> +M: Jason Wang <jasowang@redhat.com>
> +R: Andrew Melnychenko <andrew@daynix.com>
> +R: Yuri Benditovich <yuri.benditovich@daynix.com>
> +S: Maintained
> +F: ebpf/*
> +
>   Build and test automation
>   -------------------------
>   Build and test automation
> diff --git a/docs/ebpf_rss.rst b/docs/ebpf_rss.rst
> new file mode 100644
> index 0000000000..f832defdf4
> --- /dev/null
> +++ b/docs/ebpf_rss.rst
> @@ -0,0 +1,133 @@
> +===========================
> +eBPF RSS virtio-net support
> +===========================
> +
> +RSS(Receive Side Scaling) is used to distribute network packets to guest virtqueues
> +by calculating packet hash. Usually every queue is processed then by a specific guest CPU core.
> +
> +For now there are 2 RSS implementations in qemu:
> +- 'in-qemu' RSS (functions if qemu receives network packets, i.e. vhost=off)
> +- eBPF RSS (can function with also with vhost=on)
> +
> +eBPF support (CONFIG_EBPF) is enabled by 'configure' script.
> +To enable eBPF RSS support use './configure --enable-bpf'.
> +
> +If steering BPF is not set for kernel's TUN module, the TUN uses automatic selection
> +of rx virtqueue based on lookup table built according to calculated symmetric hash
> +of transmitted packets.
> +If steering BPF is set for TUN the BPF code calculates the hash of packet header and
> +returns the virtqueue number to place the packet to.
> +
> +Simplified decision formula:
> +
> +.. code:: C
> +
> +    queue_index = indirection_table[hash(<packet data>)%<indirection_table size>]
> +
> +
> +Not for all packets, the hash can/should be calculated.
> +
> +Note: currently, eBPF RSS does not support hash reporting.
> +
> +eBPF RSS turned on by different combinations of vhost-net, vitrio-net and tap configurations:
> +
> +- eBPF is used:
> +
> +        tap,vhost=off & virtio-net-pci,rss=on,hash=off
> +
> +- eBPF is used:
> +
> +        tap,vhost=on & virtio-net-pci,rss=on,hash=off
> +
> +- 'in-qemu' RSS is used:
> +
> +        tap,vhost=off & virtio-net-pci,rss=on,hash=on
> +
> +- eBPF is used, hash population feature is not reported to the guest:
> +
> +        tap,vhost=on & virtio-net-pci,rss=on,hash=on
> +
> +If CONFIG_EBPF is not set then only 'in-qemu' RSS is supported.
> +Also 'in-qemu' RSS, as a fallback, is used if the eBPF program failed to load or set to TUN.
> +
> +RSS eBPF program
> +----------------
> +
> +RSS program located in ebpf/tun_rss_steering.h as an array of 'struct bpf_insn'.
> +So the program is part of the qemu binary.
> +Initially, the eBPF program was compiled by clang and source code located at ebpf/rss.bpf.c.
> +Prerequisites to recompile the eBPF program (regenerate ebpf/tun_rss_steering.h):
> +
> +        llvm, clang, kernel source tree, python3 + (pip3 pyelftools)
> +        Adjust 'linuxhdrs' in Makefile.ebpf to reflect the location of the kernel source tree
> +
> +        $ cd ebpf
> +        $ make -f Makefile.ebpf
> +
> +Note the python script for convertation from eBPF ELF object to '.h' file - Ebpf_to_C.py:
> +
> +        $ python EbpfElf_to_C.py rss.bpf.o tun_rss_steering
> +
> +The first argument of the script is ELF object, second - section name where the eBPF program located.
> +The script would generate <section name>.h file with eBPF instructions and 'relocate array'.
> +'relocate array' is an array of 'struct fixup_mapfd_t' with the name of the eBPF map and instruction offset where the file descriptor of the map should be placed.
> +
> +Current eBPF RSS implementation uses 'bounded loops' with 'backward jump instructions' which present in the last kernels.
> +Overall eBPF RSS works on kernels 5.8+.


This reminds me that we probably need to probe this ability via 
configure script.

Thanks


> +
> +eBPF RSS implementation
> +-----------------------
> +
> +eBPF RSS loading functionality located in ebpf/ebpf_rss.c and ebpf/ebpf_rss.h.
> +
> +The `struct EBPFRSSContext` structure that holds 4 file descriptors:
> +
> +- ctx - pointer of the libbpf context.
> +- program_fd - file descriptor of the eBPF RSS program.
> +- map_configuration - file descriptor of the 'configuration' map. This map contains one element of 'struct EBPFRSSConfig'. This configuration determines eBPF program behavior.
> +- map_toeplitz_key - file descriptor of the 'Toeplitz key' map. One element of the 40byte key prepared for the hashing algorithm.
> +- map_indirections_table - 128 elements of queue indexes.
> +
> +`struct EBPFRSSConfig` fields:
> +
> +- redirect - "boolean" value, should the hash be calculated, on false  - `default_queue` would be used as the final decision.
> +- populate_hash - for now, not used. eBPF RSS doesn't support hash reporting.
> +- hash_types - binary mask of different hash types. See `VIRTIO_NET_RSS_HASH_TYPE_*` defines. If for packet hash should not be calculated - `default_queue` would be used.
> +- indirections_len - length of the indirections table, maximum 128.
> +- default_queue - the queue index that used for packet that shouldn't be hashed. For some packets, the hash can't be calculated(g.e ARP).
> +
> +Functions:
> +
> +- `ebpf_rss_init()` - sets ctx to NULL, which indicates that EBPFRSSContext is not loaded.
> +- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from tun_rss_steering.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
> +- `ebpf_rss_set_all()` - sets values for eBPF maps. `indirections_table` length is in EBPFRSSConfig. `toeplitz_key` is VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
> +- `ebpf_rss_unload()` - close all file descriptors and set ctx to NULL.
> +
> +Simplified eBPF RSS workflow:
> +
> +.. code:: C
> +
> +    struct EBPFRSSConfig config;
> +    config.redirect = 1;
> +    config.hash_types = VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | VIRTIO_NET_RSS_HASH_TYPE_TCPv4;
> +    config.indirections_len = VIRTIO_NET_RSS_MAX_TABLE_LEN;
> +    config.default_queue = 0;
> +
> +    uint16_t table[VIRTIO_NET_RSS_MAX_TABLE_LEN] = {...};
> +    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {...};
> +
> +    struct EBPFRSSContext ctx;
> +    ebpf_rss_init(&ctx);
> +    ebpf_rss_load(&ctx);
> +    ebpf_rss_set_all(&ctx, &config, table, key);
> +    if (net_client->info->set_steering_ebpf != NULL) {
> +        net_client->info->set_steering_ebpf(net_client, ctx->program_fd);
> +    }
> +    ...
> +    ebpf_unload(&ctx);
> +
> +
> +NetClientState SetSteeringEBPF()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +For now, `set_steering_ebpf()` method supported by Linux TAP NetClientState. The method requires an eBPF program file descriptor as an argument.


