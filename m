Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F652367B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:59:58 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonoj-0004nW-U8
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@foxmail.com>)
 id 1nonAu-0006KT-7Z
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:18:49 -0400
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205]:55427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@foxmail.com>)
 id 1nonAL-0004yi-Lo
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1652278652;
 bh=3dGbCjRMMBQ8WLUNgpRIiVU3kth7lEoIoVt35TYKqTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aO3sW0jBZ0GS+ziW5ZrowvghB/VpIjCncMnrg4NBfrBB/M28V5zTMjesI+cC1PZ8v
 Q6n3zm0a6yX2ObNANDDA330HXJONRSQxfwGvew5fq1nHkgMhEnZ/kmaqrgAKbT2zBG
 nr880/e3pg5p5hpRROFZgOFTc/xo7nChcbSYgg50=
Received: from [192.168.0.110] ([36.57.146.152])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id 45A84473; Wed, 11 May 2022 22:17:26 +0800
X-QQ-mid: xmsmtpt1652278646tlzr6o12x
Message-ID: <tencent_5823CCB7CFD4C49A90D3CC1A183AB406EB09@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NovK/3PTYxdH/8J3wzLu+3W6hr/G58qBaisv0jWL7fhMZ8qauMHf
 rVRC3FPwBRm2s4pLpE5zj6huIUsPRSP5V6deupIeIetreA3RR/mAC/2vveLnFsEWWQAZXhc3e9LI
 5Qg3mPoIiy2xNh1Ar/T4hFiydT5faLN+WZJHi0pCfee3IV6USjCs6WGeLaV8U6Qun95oKpHOe3dq
 f2KZw7ftMLpa948hkyt+vMJE6KbAUhHuZj+fqP2vfegW7KvTjZye6ucR0cvI7b+bg44UX3NhaO5E
 Bx1VBVmZ4gCejpkv4l1s5zSOtW+W56m90CxjdrEeCciusxKyMKZZyY1zIPN3P0+FbPb5AXUI8U/2
 zdd6wPZ5e0ijQZH6C2PCKEKcyPzk0WJvRIvOe+9eMsk3L2u0yk6E5W1gLroASYNOR+OARJyfWIpQ
 f1tdsZzmmH7E28CiiODCg2c8lFLPqbdDHLpWPzF4w+xfVABCPJ+wOwu0PPcrWqB98VUz8geXeqUK
 jtkjFCUuqzWRModPW4LEuJBG68zAi7BOhDSoT5oZ4e9gFR9pNhXNoawntxEAjBftp3lfbXoLCWxu
 b7PMnGojlzQC8LVG6QmJAo5cjxngNIezbwPOF8BBPTOISx05iP+6sLXxMD879/p7+Pag+eI9udqK
 c1tkb9bF5+mQllAJZqUZZa8EpixiywGBip7/Cf3JgqbFBVMU5Qh3RCMnfPhhCxCI3E9dcpDLQyn5
 zUlYk+yztVicEsY0PIdv//13W4hY8v3YS3Zpd7t+9cwg2dvs8PQPt1SG1qcOUDFLmk25QWiHEhez
 DBYRbXEUf8hsydSSjVXVuZ1fJ0/fmKGCMUEXKjUWPs7AvXIEQzdZJt55sTvaPq25RLifXqDzIqn0
 dtTwM1Urtfz+3jlb2J8YAF1wcINPLhQogH8M4Cu0UIJWy9mFsOZbARVne4Clyfq5O/fjaMvrtEFy
 zAEc7yTmM=
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Yi Liu <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: eric.auger@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>,
 "yi.y.sun@intel.com" <yi.y.sun@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
 <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
 <4ac4956cfe344326a805966535c1dc43@huawei.com>
 <20220426103507.5693a0ca.alex.williamson@redhat.com>
 <66f4af24-b76e-9f9a-a86d-565c0453053d@linaro.org>
 <0d9bd05e-d82b-e390-5763-52995bfb0b16@intel.com>
 <720d56c8-da84-5e4d-f1f8-0e1878473b93@redhat.com>
 <29475423-33ad-bdd2-2d6a-dcd484d257a7@linaro.org>
 <20220510124554.GY49344@nvidia.com>
 <637b3992-45d9-f472-b160-208849d3d27a@intel.com>
From: "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>
X-OQ-MSGID: <9b1c5e94-ddbe-e36d-0aa1-1ab6c7bab418@foxmail.com>
Date: Wed, 11 May 2022 22:17:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <637b3992-45d9-f472-b160-208849d3d27a@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=203.205.221.205;
 envelope-from=zhangfei.gao@foxmail.com; helo=out203-205-221-205.mail.qq.com
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 10:56:47 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/5/10 下午10:08, Yi Liu wrote:
> On 2022/5/10 20:45, Jason Gunthorpe wrote:
>> On Tue, May 10, 2022 at 08:35:00PM +0800, Zhangfei Gao wrote:
>>> Thanks Yi and Eric,
>>> Then will wait for the updated iommufd kernel for the PCI MMIO region.
>>>
>>> Another question,
>>> How to get the iommu_domain in the ioctl.
>>
>> The ID of the iommu_domain (called the hwpt) it should be returned by
>> the vfio attach ioctl.
>
> yes, hwpt_id is returned by the vfio attach ioctl and recorded in
> qemu. You can query page table related capabilities with this id.
>
> https://lore.kernel.org/kvm/20220414104710.28534-16-yi.l.liu@intel.com/
>
Thanks Yi,

Do we use iommufd_hw_pagetable_from_id in kernel?

The qemu send hwpt_id via ioctl.
Currently VFIOIOMMUFDContainer has hwpt_list,
Which member is good to save hwpt_id, IOMMUTLBEntry?

In kernel ioctl: iommufd_vfio_ioctl
@dev: Device to get an iommu_domain for
iommufd_hw_pagetable_from_id(struct iommufd_ctx *ictx, u32 pt_id, struct 
device *dev)
But iommufd_vfio_ioctl seems no para dev?

Thanks





