Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149981A2FA4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 08:55:07 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMR5e-0008Q1-66
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 02:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1jMR4u-00080E-O3
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 02:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1jMR4t-0007L4-Ir
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 02:54:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3667 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1jMR4t-0007K2-7w
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 02:54:19 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 83B4467E35FA17AA3AB1;
 Thu,  9 Apr 2020 14:54:12 +0800 (CST)
Received: from [10.133.205.53] (10.133.205.53) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 9 Apr 2020
 14:54:03 +0800
Subject: Re: [RFC PATCH 0/4] async: fix hangs on weakly-ordered architectures
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <20200407140746.8041-1-pbonzini@redhat.com>
 <047d4327-8a79-ffc1-94fe-47355ed955c5@huawei.com>
 <13f3affe-0c08-476d-e85c-2a3826b5dc1c@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <ec667015-2d4c-6b8a-b6c1-acdd50db8f59@huawei.com>
Date: Thu, 9 Apr 2020 14:54:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <13f3affe-0c08-476d-e85c-2a3826b5dc1c@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/4/8 23:05, Paolo Bonzini wrote:
> On 08/04/20 11:12, Ying Fang wrote:
>> On 2020/4/7 22:07, Paolo Bonzini wrote:
>>> ARM machines and other weakly-ordered architectures have been sufferi=
ng
>>> for a long time from hangs in qemu-img and qemu-io.=C2=A0 For QEMU bi=
naries
>>> these are mitigated by the timers that sooner or later fire in the ma=
in
>>> loop, but these will not happen for the tools and probably not with I=
/O
>>> threads either.
>>
>> yes, we occasionally see qemu main thread hangs and VM stuck in in-shu=
tdown
>> state on aarch64 platform. So this could happen with I/O threads.
>=20
> Thanks for confirming!  Have you managed to test the final version of
> the patches?  It would be great to include test results.

Yes, I did the test with your latest patches on both aarch64 and
x86 platform.Test results show that the hang has been fixed. Thanks.

>=20
> Paolo
>=20
>=20
>=20

