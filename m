Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CD2DC83
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 14:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVxTI-0000Nf-2M
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 08:14:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hVxRx-0008Lo-Uv
	for qemu-devel@nongnu.org; Wed, 29 May 2019 08:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hVxRv-0003FB-GJ
	for qemu-devel@nongnu.org; Wed, 29 May 2019 08:12:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47802 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wangjie88@huawei.com>)
	id 1hVxRv-0002vR-64
	for qemu-devel@nongnu.org; Wed, 29 May 2019 08:12:55 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A692E640C0EF8F1E85A9
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 20:12:30 +0800 (CST)
Received: from [127.0.0.1] (10.177.25.93) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 29 May 2019
	20:12:28 +0800
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1556604614-32081-1-git-send-email-wangjie88@huawei.com>
	<20190501163818.GG21155@stefanha-x1.localdomain>
From: Jie Wang <wangjie88@huawei.com>
Message-ID: <7b545c42-c2b4-9bc9-a8ef-445c99cf1b0f@huawei.com>
Date: Wed, 29 May 2019 20:12:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190501163818.GG21155@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.177.25.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] Ping Re:  [PATCH] vhost: remove the dead code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/5/2 0:38, Stefan Hajnoczi wrote:
> On Tue, Apr 30, 2019 at 02:10:14PM +0800, Jie Wang wrote:
>> remove the dead code
>>
>> Signed-off-by: Jie Wang <wangjie88@huawei.com>
>> ---
>>  hw/virtio/vhost.c | 1 -
>>  1 file changed, 1 deletion(-)
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


