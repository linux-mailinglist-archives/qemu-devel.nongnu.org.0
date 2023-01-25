Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F867B192
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 12:37:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKe4l-0002iZ-4K; Wed, 25 Jan 2023 06:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nick.hudson@gmx.co.uk>)
 id 1pKe4i-0002gs-Bh
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:36:20 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nick.hudson@gmx.co.uk>)
 id 1pKe4g-0000Tt-Jl
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:36:20 -0500
Received: from [192.168.1.239] ([109.158.255.86]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MV63q-1pDb4Q32hC-00S3ai; Wed, 25
 Jan 2023 12:36:08 +0100
Message-ID: <3413ad2e-28dc-438c-a962-9a74533b25dc@gmx.co.uk>
Date: Wed, 25 Jan 2023 11:36:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: NetBSD and libfdt (was: Re: MSYS2 and libfdt)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@gmail.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Biswapriyo Nath <nathbappai@gmail.com>, skrll@netbsd.org
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <2bce671f-d91a-72ab-d38f-2e284d9d3ee2@redhat.com>
 <4f30fcd1-a773-40af-48c3-0e017f85e079@redhat.com>
Content-Language: en-US
From: Nick Hudson <nick.hudson@gmx.co.uk>
In-Reply-To: <4f30fcd1-a773-40af-48c3-0e017f85e079@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qt1tXGQYOR9AaHCeSJym3JBq++2gbcKqqm223aHPZcOxJotw+yX
 Q/QA+7UfZ+2GuC5uO/JvaYgLlxqN0riOWhUo9kP+NKlypgTHI1VpJ2qoqhDM3noOY6k9/yh
 rp6gBj22XY/4cj6QMTPOmhW1wKwh+sk7XYJVtg+Uf53XkLZEJdn44rflRDuaBKuNzuPDajR
 65HvGNDe6i3GAEgbG0CeA==
UI-OutboundReport: notjunk:1;M01:P0:pYGhfgYWDHQ=;OuJL2P8hm/4b2FiTlROXfPpNj6E
 oa6Zps0iuXkVFHfK6Mu9OMq7hn56uEvkjYaSyvCjh9ZgkOIi02kmfMg6xRaihCrQEinslBP9y
 HLuUf0eyphVdCjfYuk1fmb3yFTX+WX325G3CxnSum5y8toQgRbgRT+1gzZZbqYgHTR6gSihY4
 5bgvXAScAFmNZPR9I4kZDbbejza3MaNMqE+aznm14+wF6RpfhGDcmj3oBI3D3IyzqhpEvev1n
 r9Bbw2SBSRL+Yu8ycSUUxn2lI0lcdUR+nUuTH3DZmkp8nGywtBH5+lG57BR87Ew5/jO/VS2Ug
 lKSP9pu41DYXO5yuFUpiXYZo31Pw+fzQ/HWx8RZsiGb/xzxC7Xv85ED5mxVcnE3Rkrn8wPPeW
 7dLBj2VfGViT5NC338a7RPgCLL7dmriRgKROEkIVN7JMxhrCSqZuDUWRmuZZZsExYKJPiMjcK
 cRogHMe+V8Id/raFCphWovxLn59LtKyZXJk3tbxduj2aJ1lfrzKGcEKJLwbiu9Y2C7PWKAHt7
 NMeZPRPUjdmItu6yfb6jppwnvgDynXaB9qRvtpTva0YCzyzDQda2TZW0HyMTf2CAxJP1HFNWA
 aL4etrhHZU8zbZ99ENWNxKXdPrg2ZY4nB5ft9xztvBOfl6fdjDsjRS+w6SEwKtzSGS5EhJmej
 XT/dQHRkibdDY9Cl5cu6z7LfP4lIWxUFhgNZTV9Iqr/xOTbklg8rNwFWZIbb/IMSCyUQNEKxP
 NLW4vd+NHWZjeWIwYuaRx7uN6lIVIMxjJc4aDBU93+uGaN3O6frYWVwPEny7APuxW7yUvMNCX
 Ns8flz8QXEY6nH2slBotJsM2pw0IAB3dCSuOeRBZL8EJbxRvvCuBUzjnb8VO3tWKbCCo6gqtA
 RpMrb3EGRUoM9Ceh/h89SHR1P7dhD9P512BJzlSS/JygO2BDFZK7Yg0Uxa+C/soFpcuzpQzrt
 SOHAHN83PiqZUdWbcJ0+kCGLKFM=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=nick.hudson@gmx.co.uk;
 helo=mout.gmx.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

hi,

On 24/01/2023 11:27, Thomas Huth wrote:
> On 24/01/2023 10.20, Thomas Huth wrote:
> [...]
>>>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> 
>>>>>> wrote:
>>>>>>>
>>>>>>>     Hi all,
>>>>>>>
>>>>>>> in some spare minutes, I started playing with a patch to try to 
>>>>>>> remove the
>>>>>>> dtc submodule from the QEMU git repository - according to
>>>>>>> https://repology.org/project/dtc/versions our supported build 
>>>>>>> platforms
>>>>>>> should now all provide the minimum required version.
> [...]
>> Ok, I'll give my patch another try to see whether all the other 
>> systems have a usable version of libfdt available, too.
> 
> ... and I apparently missed NetBSD in my first research: Looks like 
> NetBSD is still using dtc v1.4.7 which is too old for QEMU. (though 
> https://www.netbsd.org/docs/software/3rdparty/ talks about v1.5.1, I 
> only get dtc 1.4.7 in our NetBSD VM).

The not yet released netbsd-10 and -current have 1.5.1. Perhaps you can 
use netbsd-10 for your VM?

Thanks,
Nick

