Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D00681860
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYad-0001W0-LS; Mon, 30 Jan 2023 13:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMYab-0001VT-8v; Mon, 30 Jan 2023 13:09:09 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMYaZ-00011E-HH; Mon, 30 Jan 2023 13:09:08 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuV3i-1oWVvo1Dhi-00rc1G; Mon, 30 Jan 2023 19:09:02 +0100
Message-ID: <2cc505db-517e-4129-9c9a-7a41637b75f2@vivier.eu>
Date: Mon, 30 Jan 2023 19:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu 0/1] MAC address falls to permanent
Content-Language: fr
To: ~vlaomao <vlaomao@gmail.com>
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <167510125533.6740.18222174398575558338-0@git.sr.ht>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <167510125533.6740.18222174398575558338-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Id3xkcQpTvdI40qSXECT+E3qlUmUxDP7Y/s5heI0wsf7WxQy2iL
 JRA9wzLF+zm5KeVeOqllEJjL0WvDp5WDDV2ctbXQtNYm7j8JN3F0uSUv2PIoMUz+7wIwOJi
 eEVo+a2MHdjQJQsQmYq+hmoltdeMBSnYddXSjjYLEhyC7ORa6fw2eFRzP+KI7fYVXGN8qVZ
 Toip/G4cignnTJohNEZ4w==
UI-OutboundReport: notjunk:1;M01:P0:efwZuxWjHaw=;McfPzjbhdH/DErAhAKe0vbm3nC9
 8TW01qRjbUT2kIHuSxCP43NfqEGTOr+oTrYu/4z0DWdZnMp3C+Q8iW8oSmxJxAi2b4q5FKpBL
 DAiOCfbs2UzpLs1V/+ejMNuRcyPCB4aU5dz1LP829EbRLdKM5wZKL04k7zNEg2xI1OAtKR3hR
 vTQOb+12bEi9WrGvuGegGlZZyqu8UnZp7XpBafbcaNgd3YYNSOr4T6OEbAuqX7aH4gJmkqlkL
 76W5PAtjVwPz2brwDKZAVA+w0x7BC8CsCurfXy669go4oasXpf4zoXtwnfsZHdUzFYqo91px8
 s+k0hMx2oF/3kYqvS6NwTEgN51WSewPRc935ltqCJzsyto8y0Ce4tqDMDO8xVJf1Jtk8DAF9G
 oR6sskO8MK1Bcbm22WPerV13/UaehvNsNVDbkX7vWLzRvOvvyaKxPHhkUwkrSbssaIC86YfUB
 LrS8q7+O1AAV75S9xVhm0am0q7nFwAXs8j+XDh0dcjj3hldskle1hzi7fZnw5Q68rLGWwyGJ0
 CRZdyymNA5oLZ7MedDfoZxVPIKrGCCwXQU2GN40JMQ6o1bXqq/vbshnDsnIlccbF1VDLGCT4z
 aNr9NJSfvnNjv/JtxauVHBG0O3Lgpn+v2woObrEYqOcYy6R9O6ugZLaLMTMtMkHLi/qXXvJAJ
 SSrmb0B77CdRkc99Ooc0jFhEUPL57DLNmGPYIIPTrw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CC: maintainers and qemu-devel

Use ./scripts/get_maintainer.pl to have the list of the maintainers.

Always send your patches to qemu-devel&nongnu.org

Thanks,
Laurent

Le 30/01/2023 à 18:54, ~vlaomao a écrit :
> A bug was found with the vmxnet3 driver, after changing the MAC address
> and rebooting, it falls into the category of a permanent address until
> the VM is turned off. Here is log output:
> 
> -bash-4.4# ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
> group default qlen 1
>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>      inet 127.0.0.1/8 scope host lo
>         valid_lft forever preferred_lft forever
> 2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
> default qlen 1000
>      link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
> 
> -bash-4.4# ip link set dev ens3 address 33:33:33:33:33:33
> -bash-4.4# ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
> group default qlen 1
>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>      inet 127.0.0.1/8 scope host lo
>         valid_lft forever preferred_lft forever
> 2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
> default qlen 1000
>      link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
> -bash-4.4# ethtool -P ens3
> Permanent address: 52:54:00:12:34:56
> -bash-4.4# reboot
> 
> //rebooting
> 
> 
> -bash-4.4# ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
> group default qlen 1
>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>      inet 127.0.0.1/8 scope host lo
>         valid_lft forever preferred_lft forever
> 2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
> default qlen 1000
>      link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
> -bash-4.4# ethtool -P ens3
> Permanent address: 33:33:33:33:33:33
> -bash-4.4#
> 
> VlaoMao (1):
>    vmxnet3: add mac address restore upon reset
> 
>   hw/net/vmxnet3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 


