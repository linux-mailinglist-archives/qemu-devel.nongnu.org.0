Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3292DFB85
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:32:26 +0100 (CET)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJQP-0003W2-Pa
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJPB-0002zj-UL; Mon, 21 Dec 2020 06:31:09 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJP9-0005x0-Oq; Mon, 21 Dec 2020 06:31:09 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Czy1q2PlwzM4Hh;
 Mon, 21 Dec 2020 19:30:07 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0;
 Mon, 21 Dec 2020 19:30:55 +0800
Subject: Re: [PATCH v1 0/2] Add timeout mechanism to qmp actions
To: Stefan Hajnoczi <stefanha@redhat.com>, Glauber Costa
 <glauber.costa@datadoghq.com>
References: <20200918140628.GA2509473@dev>
 <1ba06b0d-3fcf-3676-f9e0-52875851ff19@huawei.com>
 <20200921111435.GA2524022@dev>
 <20201013100033.GB164611@stefanha-x1.localdomain>
 <f70dc6ce-385b-a4f9-04a0-244018f3ddbb@huawei.com>
 <6fd02e2b-50fa-b667-efc6-47d1765bdd8c@redhat.com>
 <4eb92c5e-fa2f-50a5-a0f7-5cabe6e15bb4@huawei.com>
 <ab245c4580cd5aecc8c5d338fd0e2802cac029d5.camel@euphon.net>
 <20201208131057.GB272246@stefanha-x1.localdomain>
 <CAMdqtNWGYu-U5pECzffNvu8Dv_hMfwJ9w5RPoLjF-_NX4cfjdw@mail.gmail.com>
 <20201214163316.GD620320@stefanha-x1.localdomain>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <ee8a240b-a20f-a003-bde8-9d5891783fac@huawei.com>
Date: Mon, 21 Dec 2020 19:30:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20201214163316.GD620320@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yezhenyu2@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin
 Wolf <kwolf@redhat.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com, Glauber Costa <glauber@datadoghq.com>,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/15 0:33, Stefan Hajnoczi wrote:
> On Tue, Dec 08, 2020 at 08:47:42AM -0500, Glauber Costa wrote:
>> The work we did at the time was in fixing those things in the kernel
>> as much as we could.
>> But the API is just like that...
> 

The best way for us is to replace io_submit with io_uring.

Thanks for the discussion!

Zhenyu



