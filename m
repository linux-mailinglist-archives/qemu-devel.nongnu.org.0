Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BB19D229
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 10:28:53 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKHh6-0005rt-Dn
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 04:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jKHgG-0005LP-4s
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jKHgF-0002p1-3R
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:28:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55361)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jKHgC-0002ma-Gk; Fri, 03 Apr 2020 04:27:56 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M89P3-1jOO9I2cR1-005Klb; Fri, 03 Apr 2020 10:27:47 +0200
Subject: Re: [PATCH v5 0/3] redundant code: Fix warnings reported by Clang
 static code analyzer
From: Laurent Vivier <laurent@vivier.eu>
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83B6D495C@dggemm511-mbx.china.huawei.com>
 <b273c5c9-18cc-691f-bd1f-df056f448ade@vivier.eu>
 <7412CDE03601674DA8197E2EBD8937E83B6D4A27@dggemm511-mbx.china.huawei.com>
 <f2601173-f46d-ac93-c012-f715a52400ba@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d002a05d-d028-92e6-80e7-4f2ae91a67a6@vivier.eu>
Date: Fri, 3 Apr 2020 10:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f2601173-f46d-ac93-c012-f715a52400ba@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ma4ZC2Pgw7mPkYlD8GVh4EroLZmapZPTin6N7afVQjmR826lqKJ
 ssvfD/KQDNSZkEfz/6+dVN15axqtcrBGg7h1r+gA6CoRpWLvpIr2kbyfahig2sTbAngaymw
 ZUD11ijVm90y3i3M8NxzpSk1jGwqROiGig8+Mwv1fS8fdMOI+oTN2drO8PVmmXJtVIAkyyO
 BhK2JX/StxBAK/tks5p1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7hK4hXecxec=:bVN9qj73/seY2HoSa41kof
 9S2C7x8CZ5t1iIjBdtWVEph0cbJZRpWuIdTWeXie6MD5RMqv68dfAZ1PgEh5vmvH/sDEGIX8b
 Ljop+i2Sv8+Y3wcfF+XhWCr+Z2kNcjg/bt9zY+H4LTNvrz2LORtT/OVnFunYv4CtqkZ87EtE9
 oDb35BqTB9i+lPRNLPXAEJxFIYTskEcJi20c7ciNXDuKTLGjNDqEL6pNadjkeAbDEhk4YMlw7
 TaA9bnS1rSH4YNSBXnveDA5cw33Q/8c9APMKkzlwbfq/ZZ56gH3Rpph5ociQLh+C/GbmTMetS
 jf+OYz+BYWDJwn0qiTKLItP1TYSRmXA0xcnIIbZ63Gdfse/apvg/wN9H7K7IIjQh5jqNMBmqF
 wAyIiPhVg27M7fdSXlZzGMEwzGczfdfPfWks+eLnCO/unks1gh5dl0WADvgrORp1Wn6ZmDlc4
 Yehwa1DnChy8J0BtH8ovhc2WSfJuev1FjE3aOLrkg2Ov410nlqPUPnka8J2Jzc4NCaIzXB7G9
 5cPrl7B7Df4UoXg7xvOReWTc6kcuQT+KuZPjXubk2bRM0ZB1WWha+W/qObRqB5eSH9QrwkLO2
 BhTEXmVX1yvUD4aqMdCcW33zYso5meOtunLJE0ZAdescDrkXPNl37PqQDIozQVDJoJrIWosHB
 JObE1zcBtC7iAlDRSaPNMppKDb3eYXQRCKjDCEFhU1wi9zDVao/z+QK8SmHdOwy4q8r6PT2Vc
 RwkpZpToJ5RwZOfpvBgYPLETVVIrRIwHchsIbPIfM0/v9KqaZb3aFp+FK2h5XbPmRPyh0rxJk
 YYzBaUmiJvsB1EPTutC5p0t5RptQ1Bg4eKEOqgGLUEatxrMbZB3GrSbTUtg05vnM/zwiv2Z
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
Cc: "philmd@redhat.com" <philmd@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/04/2020 à 10:22, Laurent Vivier a écrit :
> Le 03/04/2020 à 10:10, Chenqun (kuhn) a écrit :
>>> -----Original Message-----
>>> From: Laurent Vivier [mailto:laurent@vivier.eu]
>>> Sent: Friday, April 3, 2020 4:04 PM
>>> To: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; qemu-devel@nongnu.org;
>>> qemu-trivial@nongnu.org
>>> Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>; philmd@redhat.com
>>> Subject: Re: [PATCH v5 0/3] redundant code: Fix warnings reported by Clang
>>> static code analyzer
>>>
>>> Le 03/04/2020 à 09:51, Chenqun (kuhn) a écrit :
>>>> Ping!
>>>>
>>>> This series has been reviewed.  Could someone please pick this up (e.g. qemu-
>>> trivial?)?
>>>
>>> As we are in hard feature freeze now and this is not critical bug fixes I'm going
>>> to queue them for 5.1 except if you have good arguments to have them in 5.0.
>>>
>> OK,  I get it. 
>> It is important to ensure a stable version!
> 
> Queued to my linux-user-for-5.1 queue.

I meant trivial-patches-for-5.1

Thanks,
Laurent

