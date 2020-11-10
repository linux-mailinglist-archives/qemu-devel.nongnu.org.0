Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A052AD726
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:11:49 +0100 (CET)
Received: from localhost ([::1]:59016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTR6-00033l-4O
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcTQ3-0002VE-5J
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:10:43 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcTQ0-0003Th-OU
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:10:42 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CVpBT2vJrzhgmy;
 Tue, 10 Nov 2020 21:10:25 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 21:10:24 +0800
Subject: Re: [Virtio-fs] [PATCH v2 0/2] virtiofsd: fix some accessing NULL
 pointer problem
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
 <20201110114548.GA1084668@stefanha-x1.localdomain>
From: Haotian Li <lihaotian9@huawei.com>
Message-ID: <78a36bd0-4091-31bc-f8a3-b62bbe52b595@huawei.com>
Date: Tue, 10 Nov 2020 21:10:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20201110114548.GA1084668@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lihaotian9@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:10:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your suggestion. New patches will be resent.

> On Tue, Nov 10, 2020 at 02:32:17PM +0800, Haotian Li wrote:
>> Haotian Li (2):
>>   tools/virtiofsd/buffer.c: check whether buf is NULL in
>>     fuse_bufvec_advance func
>>   virtiofsd/passthrough_ll.c: check whether lo_map_reserve returns NULL
>>     in main func
>>
>>  tools/virtiofsd/buffer.c         |  4 ++++
>>  tools/virtiofsd/passthrough_ll.c | 10 +++++++++-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> Please consider printing an error message in Patch 2 so that users can
> easily tell why the program refused to start.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

