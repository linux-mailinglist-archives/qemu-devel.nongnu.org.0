Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441733F6B6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:25:06 +0100 (CET)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZur-0002NX-CZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMZGF-00017M-Fx
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMZG9-0000AS-Jx
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615999380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWTt5sVsrxLu9Yckd5NYuA6HzVCDhEyiJNaDREhBjC8=;
 b=HaK4vkYmYUHNXxmVu9QfvKVLiQPLcTuutSQc8CtoRLbjMTJS8CzmfMUgX39a0i4kZ9pk9O
 aIG2aleNJ2tusL5Z6qb/IIqXCoH0ZjzYJzxK5+hp39se74hn7e6SUli6zhp37XbLGarLFP
 RWIMOedkMtTZkO/ObZkHiOJZMJuyAXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-YszWwWy-NmCfIyu6gwJe6w-1; Wed, 17 Mar 2021 12:42:56 -0400
X-MC-Unique: YszWwWy-NmCfIyu6gwJe6w-1
Received: by mail-wr1-f70.google.com with SMTP id 75so18525936wrl.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tWTt5sVsrxLu9Yckd5NYuA6HzVCDhEyiJNaDREhBjC8=;
 b=paNvnTh2bSBmw7pcQt+IQG3gf71eqW8ibggb+pglnS32eiLtuBAm7iwF/k8J+B+y22
 FMJeA/b3SlVvwuI9Q1WZ27bHzfcBstf7zYoRd65dGPsn4VwZSdrtdBff9bGUZ/Yu+Va2
 lQ1MDxGjlULuCnJRPmnHisKUVO6+kTpGj0+0AfGmufQbbxLvIfZs1ugV2+QOYhsI0jfS
 Ynn3Qo5tBfkWBcAYSiIYJlkhQilbmJdEHpc3bnTxhp5l3g6seKxUCdsMknHojbM0/IpQ
 JozY16Qxfe9TER/Lzvf3fwwzYotJG3e6u+pxFo5BFMFcBHzq8cSq0MEgXXXcsE0nJRg2
 qmmA==
X-Gm-Message-State: AOAM531oqWMBmWTBzg0e+ewwgaJZcNxxTQFcJN0CL4VEtqV4XTE8SfIE
 uOWQlCpLUomTLSXPUA0ntKfgNCeb+SYUThVxGLQN9kdF+pgSACMtNl7D8wZNzfQbD3U3eRr5tnZ
 m8WqiihfezK9G5SA=
X-Received: by 2002:a5d:4905:: with SMTP id x5mr5297483wrq.201.1615999374816; 
 Wed, 17 Mar 2021 09:42:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCa0Xo7Nf0hw7NkxMcn/Y0wYQUiI589DS9BsCul29ltKYeaoxpC6ETR8CcAAyy6aMePJ3sTQ==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr5297464wrq.201.1615999374539; 
 Wed, 17 Mar 2021 09:42:54 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d8sm3070448wrr.35.2021.03.17.09.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:42:54 -0700 (PDT)
Subject: Re: [PATCH v6 6/7] net/eth: Read ip6_ext_hdr_routing buffer before
 accessing it
To: Alexander Bulekov <alxndr@bu.edu>,
 QEMU Security <qemu-security@nongnu.org>, Prasad J Pandit <pjp@redhat.com>
References: <20210310183123.1212612-1-philmd@redhat.com>
 <20210310183123.1212612-7-philmd@redhat.com>
 <20210317163335.twgoqhlsdwlmjdhj@mozz.bu.edu>
 <20210317163539.qgcuajqbp2iw6k3h@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1ea66858-6597-7590-1919-2d56e5c98db1@redhat.com>
Date: Wed, 17 Mar 2021 17:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317163539.qgcuajqbp2iw6k3h@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 5:35 PM, Alexander Bulekov wrote:
> Correction: there was a response suggesting to add padding to ip6_ext_hdr.

Was the response on the public list or the private security one?

If it was public I missed it. On a private list such comment isn't
very helpful if nobody sends patches to fix it. Maybe we need to
review the security list process.

> On 210317 1233, Alexander Bulekov wrote:
>> Just noticed that I also reported this to QEMU-Security on 2020-05-17.
>> The problem was acknowledged, but I don't think there was any
>> communication after that, so I'm not sure whether this is also stuck in
>> some private issue tracker. Seems pretty tame as far as
>> memory-corrputions go, but I'll send a followup to the private report,
>> to see if it went anywhere..
>> -Alex
>>
>> On 210310 1931, Philippe Mathieu-Daudé wrote:
>>> We can't know the caller read enough data in the memory pointed
>>> by ext_hdr to cast it as a ip6_ext_hdr_routing.
>>> Declare rt_hdr on the stack and fill it again from the iovec.
>>>
>>> Since we already checked there is enough data in the iovec buffer,
>>> simply add an assert() call to consume the bytes_read variable.
>>>
>>> This fix a 2 bytes buffer overrun in eth_parse_ipv6_hdr() reported
>>> by QEMU fuzzer:
>>>
>>>   $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>>>     -accel qtest -monitor none \
>>>     -serial none -nographic -qtest stdio
>>>   outl 0xcf8 0x80001010
>>>   outl 0xcfc 0xe1020000
>>>   outl 0xcf8 0x80001004
>>>   outw 0xcfc 0x7
>>>   write 0x25 0x1 0x86
>>>   write 0x26 0x1 0xdd
>>>   write 0x4f 0x1 0x2b
>>>   write 0xe1020030 0x4 0x190002e1
>>>   write 0xe102003a 0x2 0x0807
>>>   write 0xe1020048 0x4 0x12077cdd
>>>   write 0xe1020400 0x4 0xba077cdd
>>>   write 0xe1020420 0x4 0x190002e1
>>>   write 0xe1020428 0x4 0x3509d807
>>>   write 0xe1020438 0x1 0xe2
>>>   EOF
>>>   =================================================================
>>>   ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>>>   READ of size 1 at 0x7ffdef904902 thread T0
>>>       #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>>>       #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>>>       #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
>>>       #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>>>       #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
>>>       #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>>>       #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>>>       #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>>>       #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
>>>
>>>   Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
>>>       #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
>>>
>>>     This frame has 1 object(s):
>>>       [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
>>>   HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
>>>         (longjmp and C++ exceptions *are* supported)
>>>   SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
>>>   Shadow bytes around the buggy address:
>>>     0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>>>   =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>     0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>   Shadow byte legend (one shadow byte represents 8 application bytes):
>>>     Addressable:           00
>>>     Partially addressable: 01 02 03 04 05 06 07
>>>     Stack left redzone:      f1
>>>     Stack right redzone:     f3
>>>   ==2859770==ABORTING
>>>
>>> Add the corresponding qtest case with the fuzzer reproducer.
>>>
>>> FWIW GCC 11 similarly reported:
>>>
>>>   net/eth.c: In function 'eth_parse_ipv6_hdr':
>>>   net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>>>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>>         |          ~~~~~^~~~~~~
>>>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>>>     485 |     struct ip6_ext_hdr ext_hdr;
>>>         |                        ^~~~~~~
>>>   net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>>>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>>         |                                 ~~~~~^~~~~~~~~
>>>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>>>     485 |     struct ip6_ext_hdr ext_hdr;
>>>         |                        ^~~~~~~
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
>>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  net/eth.c                      | 13 +++++----
>>>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>>>  MAINTAINERS                    |  1 +
>>>  tests/qtest/meson.build        |  1 +
>>>  4 files changed, 63 insertions(+), 5 deletions(-)
>>>  create mode 100644 tests/qtest/fuzz-e1000e-test.c


