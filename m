Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285E4ED708
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:34:34 +0200 (CEST)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrCL-0001K7-H0
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZr1B-0001x8-49
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:23:01 -0400
Received: from smtpbg704.qq.com ([203.205.195.105]:53558
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZr14-0002G3-L0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:23:00 -0400
X-QQ-mid: bizesmtp68t1648718562to5kv4j7
Received: from [10.25.15.160] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 31 Mar 2022 17:22:40 +0800 (CST)
X-QQ-SSF: 01000000000000603000C00A0000000
X-QQ-GoodBg: 0
Message-ID: <8e7cd16a-49c9-636b-3946-83fa08a914d5@archeros.com>+D0C0187E19318D3E
Date: Thu, 31 Mar 2022 17:22:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 08005325@163.com
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648703950-7321-1-git-send-email-08005325@163.com>
 <CACGkMEuGiuQ9DYqpqp9QAWhSgMiRa_aMnYqdDU8vECZxdGRWXg@mail.gmail.com>
 <1354a482-bfb2-1a0e-2c0d-fd6b7446292b@redhat.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <1354a482-bfb2-1a0e-2c0d-fd6b7446292b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
Received-SPF: none client-ip=203.205.195.105;
 envelope-from=qiudayu@archeros.com; helo=smtpproxy21.qq.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all

To avoid tigger the issue of mimecast, I will re-post the V3 patch use 
the mail address "Michael Qiu <qiudayu@archeros.com>" as a workaround.


Thanks,
Michael
On 2022/3/31 17:12, Maxime Coquelin wrote:
> Hi,
> 
> On 3/31/22 10:55, Jason Wang wrote:
>> On Thu, Mar 31, 2022 at 1:20 PM <08005325@163.com> wrote:
>>
>> Hi:
>>
>> For some reason, I see the patch as an attachment.
> 
> We are starting to see this more and more since yesterday on DPDK
> mailing list. It seems like an issue with mimecast, when the From: tag
> is different from the sender.
> 
> Maxime
> 
>> Thanks
>>
>>
> 
> 



