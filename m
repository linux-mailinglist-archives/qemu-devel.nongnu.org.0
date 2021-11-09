Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5111044A7A1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:33:16 +0100 (CET)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLd4-0001hn-DZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkLHl-00015u-23; Tue, 09 Nov 2021 02:11:14 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkLHj-0002sx-B8; Tue, 09 Nov 2021 02:11:12 -0500
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1gWU-1mZZli12vQ-0120aK; Tue, 09 Nov 2021 08:11:06 +0100
Message-ID: <6d67f83e-924b-b715-1207-01c14cf80aa5@vivier.eu>
Date: Tue, 9 Nov 2021 08:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/qtest/virtio-net: fix hotplug test case
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028173014.139692-1-lvivier@redhat.com>
 <7380e0bd-f144-c6eb-b370-7b711c09b0e2@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <7380e0bd-f144-c6eb-b370-7b711c09b0e2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DchP+IpmJtFb798w7L2RGdt7pep2DCm/gRZ1RiWtBB3KumM1YAz
 YEEFVj2j+kdIJIc93qA4hkJqxwun9mP/f4Eo99Cbe7vtgypciz4/JBVD8gKAyXxEx4SGvyT
 mQMvR9Y8A8HuYt7aGPdQWaGNCwF6LkTGJxCCLAkLiEml2aBiBaCvjmj1aPPoe8RygGp86TP
 8qvsOj+itbgW7SmeyYBww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I/UIdqXQ9Z8=:52DdieO4ADG6/+2DLfWNmC
 6lVU2FkSfajm0v2pPsJnaWDvPknb6QNdCEox386mvJ7p/Y+FJQudeX7K5RSyzTNncVW67MUki
 5RYpIoi3dSrZb7mtaI+Ix1tdPiqgY4ywrhMS2XVmT3I4aUPtQ20X5hd1EIlzIUJ4dxJJoCR+F
 HOS21lyAk3ib0F4239gwRdei4NCDw++Lps4r6ik7PA/ZOscNk3tJ0Gppvp9CbVYpI5Pbd44+D
 f4M8XxVP7lUYUkr9QIIr4LVzGQdB7BIp1X793gZUc5RQYNuaRx1A1aL06SP9b99bYP658kRsW
 MZMvzrvMxgvSLKxobnJJwJOc6w/tAkCHXKjUB3hKg4TjvNHK/ijSmWLI2+ai1z72ljyFZ4FuI
 JO8Vs1jVRMeX+HUH1AGnvMd/nlOVipr2mxA4RvCTZmwx23q8D+e53gL/85MMTW+yHXBuNkq3Q
 dBpOfIxzo2nLv+U40TVzj9bSAj5OtAuqCwENWUkS5qI397V3pDGbL44VcTYF+5ArUkCZfniKA
 YFBFjGhKL0Tnu74eFd/bWcgPvWKocwjP4mYZIS0XGTGFhKGQ+4xzJ4DmESm3zz4mUcgIMFoz7
 Ytn7xsefyipdw5dxNJ/cgHzR+42JBnBNk+Z82viutRxywr6kxzOcpC78BfGBanQaqPnDAyTrI
 Z6Yjbp3TB9OpDyURCtrVK++PKfpFYVIXIiv9RDxtikMOSRp9J8waFLnHZUxnjcWETQEA=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2021 à 18:12, Thomas Huth a écrit :
> On 28/10/2021 19.30, Laurent Vivier wrote:
>> virtio-net-test has an hotplug testcase that is never executed.
>>
>> This is because the testcase is attached to virtio-pci interface
>> rather than to virtio-net-pci.
>>
>>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>>    /x86_64/.../pci-ohci-tests/ohci_pci-test-hotplug
>>    /x86_64/.../e1000e/e1000e-tests/hotplug
>>    /x86_64/.../virtio-blk-pci/virtio-blk-pci-tests/hotplug
>>    /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>>    /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>>    /x86_64/.../virtio-scsi/virtio-scsi-tests/hotplug
>>    /x86_64/.../virtio-serial/virtio-serial-tests/hotplug
>>
>> With this fix:
>>
>>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>>    ...
>>    /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>>    /x86_64/.../virtio-net-pci/virtio-net-pci-tests/hotplug
>>    /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>>    ...
>>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -p 
>> /x86_64/.../virtio-net-pci-tests/hotplug
>>    /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net-pci-tests/hotplug: OK
>>
>> Fixes: 6ae333f91b99 ("qos-test: virtio-net test node")
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   tests/qtest/virtio-net-test.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
>> index a08e2ffe123f..8bf74e516cce 100644
>> --- a/tests/qtest/virtio-net-test.c
>> +++ b/tests/qtest/virtio-net-test.c
>> @@ -319,7 +319,7 @@ static void register_virtio_net_test(void)
>>           .before = virtio_net_test_setup,
>>       };
>> -    qos_add_test("hotplug", "virtio-pci", hotplug, &opts);
>> +    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
>>   #ifndef _WIN32
>>       qos_add_test("basic", "virtio-net", send_recv_test, &opts);
>>       qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
>>
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

