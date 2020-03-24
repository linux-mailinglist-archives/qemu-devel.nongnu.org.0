Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C927190786
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 09:29:21 +0100 (CET)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGew4-000395-6C
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 04:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jGev8-0002Pk-1F
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jGev6-0006fG-OJ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:28:21 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45581)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jGev6-0006eq-Ev; Tue, 24 Mar 2020 04:28:20 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOi1H-1itn8w1MXH-00QEmU; Tue, 24 Mar 2020 09:27:53 +0100
Subject: Re: [PATCH v4 1/3] scsi/esp-pci: Remove redundant statement in
 esp_pci_io_write()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
 <20200324082235.27980-2-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0179e5e1-9879-6aca-2f5c-8ed46169c7d9@vivier.eu>
Date: Tue, 24 Mar 2020 09:27:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324082235.27980-2-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9xb5X251l/nBi4c/2iYcuV5ccmOn1hHtHV3ae0SaDDuCUmAcvJ/
 r1DXfPzW7HQINIdfc+AQuEZQtw8Dyob672XSbOg5n44f8kJCBRsOCS79mt49n1zCgr9g79G
 a0ZvYJozRJQQXkg4ntdwY4rkUPIuwSo4FLpw+onGE0RnqmsHq2rP/GHtwJZC6X0n+eLjeEI
 EwOZEtJP99nacuS06bRwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/D2aHEd/ebw=:rAy7uIB/huzuly5izAXpyN
 bDK6LUqCooqiouWRD1NusKN+IyuKOpHVdd4abg3srhbuimd+J8VrV8nBjUGtvlIy9WWaakvIw
 CcU4zWCazt1lXQQNVq8O1pIr90Ie9vxEAu5IHAZJhiCA9ekm+dlTZnIzVGvGWd5JQm/9eOU4r
 /5q7BgequOsFDhCjfhMMMxinW9Udr2y4WRN+fb8rNcflK9e1aXtbA3NbZPAaZ1x5P9U7ElJ2S
 CNVrfzOYBXxJWLWMll8qGMUZHbpg+FQ4IvK4JH0+bGujObHlTSruAqV75GGTsVy+LZ4ijRiPG
 21qpiYSDweBaqyA/dfVGiUudzWOyzi5boSTUBHV7KkJHLLChuiqiLG8a6GFewObn3BZYilJi7
 QrOGHLJC+Alg5b437izuOUCioMHgoURxl7OOP+DmKNLhEe084urKiSoW49SqioE8GVU9Psh7s
 Y3HWDurOgYeFOaFJ5dF4cRNWQ4AqmQVjiOxGIMeCaBjlP4kJg01jiz/mkFYpVTE00N0WET/ox
 mXiT1OyshlOv09P+lblBzwVT0qzxyheST9bAJQ2fhY0CG7azrGKz+Lo6qze5nVsNKz1H15RCG
 ofaAwu7H2J3tA7Y1AxxCk5PZ4BwyHIWJ86zrdVHz20cLbN++eXWQGcbdPP5vRVKiea37A7TG/
 rC5mfj1D54e+KLVBty1LPD+RocZaxFJc/JK/KUYVYoYHGm1WFirB+pyKG5tdPIW3Ac3a06YMZ
 GqQHWHehNCZQe/ibii8Kn2Yux4fNQGqpkmseIUFzGkiuDNwCW4nWOJR6ma6moAhZjljLL+/J1
 VgfcTmq1ktyGgoIT1FeS7VuuNqadoACAgwYhN9LCM16SUz0NVq84+ql296M0qvqXeSfOAck
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2020 à 09:22, Chen Qun a écrit :
> Clang static code analyzer show warning:
>   hw/scsi/esp-pci.c:198:9: warning: Value stored to 'size' is never read
>         size = 4;
>         ^      ~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc:Fam Zheng <fam@euphon.net>
> v1->v2:
> keep ' size = 4'  and  add 'g_assert(size >= 4)' after if() statement.
> (Base on Laurent's comments)
> ---
>  hw/scsi/esp-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index d5a1f9e017..497a8d5901 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -197,6 +197,7 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
>          addr &= ~3;
>          size = 4;
>      }
> +    g_assert(size >= 4);
>  
>      if (addr < 0x40) {
>          /* SCSI core reg */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

