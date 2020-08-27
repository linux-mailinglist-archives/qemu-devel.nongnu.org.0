Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB0253BEB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 04:41:58 +0200 (CEST)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB7rS-0006Y2-1R
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 22:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kB7qU-0005hp-Oc
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 22:40:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42680 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kB7qS-0006xx-FC
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 22:40:58 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CAD3C3DFAD5E0EC46301;
 Thu, 27 Aug 2020 10:40:47 +0800 (CST)
Received: from [127.0.0.1] (10.174.187.160) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 27 Aug 2020 10:40:40 +0800
Message-ID: <5F471D27.8040608@huawei.com>
Date: Thu, 27 Aug 2020 10:40:39 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
Subject: Re: =?UTF-8?B?b3NsaWItcG9zaXjvvJpGaXggaGFuZGxlIGZkIGxlYWsgaW4gcWU=?=
 =?UTF-8?B?bXVfd3JpdGVfcGlkZmlsZSgp?=
References: <5F463618.10000@huawei.com> <20200826101835.GM168515@redhat.com>
In-Reply-To: <20200826101835.GM168515@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 22:40:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.239,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/8/26 18:18, Daniel P. Berrangé wrote:
> On Wed, Aug 26, 2020 at 06:14:48PM +0800, AlexChen wrote:
>> > From: alexchen <alex.chen@huawei.com>
>> > 
>> > The fd will leak when (a.st_ino == b.st_ino) is true, fix it.
> That is *INTENTIONAL*.  We're holding a lock on the file and the
> lock exists only while the FD is open.  When QEMU exists, the FD
> is closed and the lock is released. There is no leak.
> 
OK, I got it, thanks.

Thanks
Alex


