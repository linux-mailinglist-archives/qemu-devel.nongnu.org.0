Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF6B2F63A0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:04:34 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04As-0001Nm-2O
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l046O-0000OG-HA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l046J-0008AG-U4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610636381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwxAEHxVPNIsjT7TVMhPE+U4JtrsmQWPoaUF3BbS9/s=;
 b=hnlJPvBXLR3MFo4xv4InYc55duH9sJj6FUTrreokiiv8BeDDkkXCUl5wSyPcVADyAkkswA
 eIQnyrP5KvRBAMNiFOfRmJLMP4Yf40soxHx5mjZ/J2GpCI8Ydp3G9vE/ySgwxB4nNr/LRZ
 uS+/+UVYdce6M3D6feblYJKO6y8LrcA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-11qxwFv7NVKeh4fI2btUHQ-1; Thu, 14 Jan 2021 09:59:39 -0500
X-MC-Unique: 11qxwFv7NVKeh4fI2btUHQ-1
Received: by mail-wr1-f70.google.com with SMTP id e12so2715974wrp.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uwxAEHxVPNIsjT7TVMhPE+U4JtrsmQWPoaUF3BbS9/s=;
 b=PvvLLFgTODPwbDRig7PD9kPKS+gZ5BQY4s3/+j4ReQQ4ik0Sx73th00YFPDyB0uDLS
 Xn48vjQ5abMC1W1Vj6hvDVf3h0cniIUM0Kgt7NVQD89hfW71KYwtgkjJB4w4b0mx7hHv
 /2ScBGlQnmD8OfHV4S58HVUqkv0YpKcOpxdURUBNK4M8h8mfZC+LCndCtYx2H8LSEf+Z
 unEywQJEJhI40Qb+yViI/oCkqpmOu9g0qTlCwgK3LfPNzN1/Su45w4Jbjnq8QRbEes2O
 m3o9HQ2BwPGGkdsBmlu8Tz9Cqvhm6sNfNmNP9vEx4S8EANVQ4dPxkvlrYqGVCmceLA5T
 YH3g==
X-Gm-Message-State: AOAM5307jiuPdWCh3MxnGgdlJMJfnTruWC5rLmuL8sa05Eue7+TvsBmp
 vD2ik8ScOMyqKvEV3AvODQLCAT3CIe3HR2wx/p1AxMXoL+Jo4Y2Nsgo/8/XV75lEDj9/DSpB9oL
 6rE4z7peVR3UBe9o=
X-Received: by 2002:a5d:570e:: with SMTP id a14mr8302897wrv.126.1610636378678; 
 Thu, 14 Jan 2021 06:59:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQJOjAqPipKYeivG5Wi5hrYH/8pZej4iNrw/N6gR+Vy0dPfZZXXv5LqKQoae38N/RFY3y+kg==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr8302867wrv.126.1610636378319; 
 Thu, 14 Jan 2021 06:59:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n11sm11737227wra.9.2021.01.14.06.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 06:59:37 -0800 (PST)
Subject: Re: [PATCH 2/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
To: qemu-devel@nongnu.org
References: <20210114145041.2865440-1-philmd@redhat.com>
 <20210114145041.2865440-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c8421518-ee88-88ab-d1c4-618151e0b75f@redhat.com>
Date: Thu, 14 Jan 2021 15:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114145041.2865440-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, Prasad J Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 3:50 PM, Philippe Mathieu-Daudé wrote:
> QEMU fuzzer reported a buffer overflow in _eth_get_rss_ex_dst_addr()
> reproducible as:
> 
>   $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>     -accel qtest -monitor none \
>     -serial none -nographic -qtest stdio
>   outl 0xcf8 0x80001010
>   outl 0xcfc 0xe1020000
>   outl 0xcf8 0x80001004
>   outw 0xcfc 0x7
>   write 0x25 0x1 0x86
>   write 0x26 0x1 0xdd
>   write 0x4f 0x1 0x2b
>   write 0xe1020030 0x4 0x190002e1
>   write 0xe102003a 0x2 0x0807
>   write 0xe1020048 0x4 0x12077cdd
>   write 0xe1020400 0x4 0xba077cdd
>   write 0xe1020420 0x4 0x190002e1
>   write 0xe1020428 0x4 0x3509d807
>   write 0xe1020438 0x1 0xe2
>   EOF
>   =================================================================
>   ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>   READ of size 1 at 0x7ffdef904902 thread T0
>       #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>       #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>       #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
>       #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>       #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
>       #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>       #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>       #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>       #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
> 
>   Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
>       #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
> 
>     This frame has 1 object(s):
>       [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
>   HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
>         (longjmp and C++ exceptions *are* supported)
>   SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
>   Shadow bytes around the buggy address:
>     0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>   =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   Shadow byte legend (one shadow byte represents 8 application bytes):
>     Addressable:           00
>     Partially addressable: 01 02 03 04 05 06 07
>     Stack left redzone:      f1
>     Stack right redzone:     f3
>   ==2859770==ABORTING
> 
> Similarly GCC 11 reports:
> 
>   net/eth.c: In function 'eth_parse_ipv6_hdr':
>   net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>         |          ~~~~~^~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
>   net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>         |                                 ~~~~~^~~~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
> 
> In eth_parse_ipv6_hdr() we called iov_to_buf() to fill the 2 bytes of
> the 'ext_hdr' buffer, then _eth_get_rss_ex_dst_addr() tries to access
> beside the 2 filled bytes.
> 
> Fix by reworking the function, filling the full rt_hdr buffer on the
> stack calling iov_to_buf() again.
> 
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  net/eth.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/net/eth.c b/net/eth.c
> index 7d4dd48c1ff..ae4db37888e 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -401,26 +401,23 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
>  
>  static bool
>  _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
> -                        size_t rthdr_offset,
> +                        size_t ext_hdr_offset,
>                          struct ip6_ext_hdr *ext_hdr,
>                          struct in6_address *dst_addr)
>  {
> -    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
> +    struct ip6_ext_hdr_routing rt_hdr;
> +    size_t input_size = iov_size(pkt, pkt_frags);
> +    size_t bytes_read;
>  
> -    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
> +    if (input_size < ext_hdr_offset + sizeof(rt_hdr)) {
> +        return false;
> +    }
>  
> -        size_t input_size = iov_size(pkt, pkt_frags);
> -        size_t bytes_read;
> +    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
> +                            &rt_hdr, sizeof(rt_hdr));
>  
> -        if (input_size < rthdr_offset + sizeof(*ext_hdr)) {
> -            return false;
> -        }
> -
> -        bytes_read = iov_to_buf(pkt, pkt_frags,
> -                                rthdr_offset + sizeof(*ext_hdr),
> -                                dst_addr, sizeof(*dst_addr));
> -
> -        return bytes_read == sizeof(*dst_addr);
> +    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
> +        return bytes_read == sizeof(*ext_hdr) + sizeof(*dst_addr);
>      }
>  
>      return false;
> 

Sorry I forgot to commit the qtest:

-- >8 --
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index cdb1100a0b8..61500ca2510 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -97,6 +97,32 @@ static void test_mmio_oob_from_memory_region_cache(void)
     qtest_quit(s);
 }

+/*
+ * https://bugs.launchpad.net/qemu/+bug/1879531
+ */
+static void test_lp1879531_eth_get_rss_ex_dst_addr(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -monitor none -serial none -M pc-q35-5.0");
+
+    qtest_outl(s, 0xcf8 0x80001010);
+    qtest_outl(s, 0xcfc 0xe1020000);
+    qtest_outl(s, 0xcf8 0x80001004);
+    qtest_outw(s, 0xcfc 0x7);
+    qtest_writeb(s, 0x25 0x1 0x86);
+    qtest_writeb(s, 0x26 0x1 0xdd);
+    qtest_writeb(s, 0x4f 0x1 0x2b);
+    qtest_writel(s, 0xe1020030, 0x190002e1);
+    qtest_writew(s, 0xe102003a, 0x0807);
+    qtest_writel(s, 0xe1020048, 0x12077cdd);
+    qtest_writel(s, 0xe1020400, 0xba077cdd);
+    qtest_writel(s, 0xe1020420, 0x190002e1);
+    qtest_writel(s, 0xe1020428, 0x3509d807);
+    qtest_writeb(s, 0xe1020438, 0xe2);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -110,6 +136,8 @@ int main(int argc, char **argv)
                        test_lp1878642_pci_bus_get_irq_level_assert);
         qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
                        test_mmio_oob_from_memory_region_cache);
+        qtest_add_func("fuzz/test_lp1879531_eth_get_rss_ex_dst_addr",
+                       test_lp1879531_eth_get_rss_ex_dst_addr);
     }

     return g_test_run();
---


