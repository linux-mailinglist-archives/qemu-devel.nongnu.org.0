Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12A52B331
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:26:05 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrE4J-0001dy-TF
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@foxmail.com>)
 id 1nrE1G-0000qb-9q
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:22:54 -0400
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173]:44291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@foxmail.com>)
 id 1nrE18-0005q3-UB
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1652858554;
 bh=E2bfNbAZPsPeJpae1xBvIxUbRxVgnCUpNs+arIz/lmw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=pgU4nsithjhlTjRshDEn2gouX4M9pA0DvnAv0LIWAEA3UX9E8O/vysj2Bi4WlKoW3
 dXFu4qFfCNmqUtqeX1K6A4baQ/+h3snqrKm58c2RuYv53gXeULeL/DkSSGDlpXpxWk
 oU66WHfolgrPgpqyLCnhdyVKfsdNIcGyD5PU6Uj4=
Received: from [IPv6:240e:362:473:8f00:d54e:7436:a5f7:1d1b]
 ([240e:362:473:8f00:d54e:7436:a5f7:1d1b])
 by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
 id 59C14C43; Wed, 18 May 2022 15:22:28 +0800
X-QQ-mid: xmsmtpt1652858548t2dd6b794
Message-ID: <tencent_C3C342C7F0605284FB368A1A63534B5A4806@qq.com>
X-QQ-XMAILINFO: M1OHdYEWKc2ZdF7zCuC0uBDNPrKvC6yaU9jUJ43ncuRdwXAu+w/jI/oYCebiED
 /GD+OebH8rXM/IZSTQQKK1NyXfMkkvbD39R5X86ip2KyOTQmoG2M9l1Kajb/jPFH9+r0mz4Yb6O2
 Ki/t6DBGJogJ8BYdkpfRnRcwFKx+marCOMHNmmj52p9GYZdDtcdU3xQBEAnCnFLeQpDViLq2b5lB
 BlQ7ufFKKhMB0oZD4gzoR+rrupUiHUY46fN3gtQITpRN54vJ94sBTApfEB58s8YSrzbCSxycluE0
 Oj+EzliHyAEi5as+pobe6jVM5ay9yazVVlLgeAjcGBrhwhDafI3Zy9K/qdPDG59XwRciAn085WHt
 Ndya9ckU9sJhEavdk+Oq2d+Y9q2x6xKSOropnAmM6Bv4R0xRUdrJev+HP2Z13AwPCYwq4y4JI4Cs
 Ot0i6XhgIIoM21Nef+K1A+wdCMXQy/3DErzmHsGh3/61Nk84RvhjtUZM/PgOgCYpnuuOAkw6zkd1
 is64clTxwogOzLys7VV0DtI+iBXQox87QYBcW+jMZ0hxaucl0zfAKZYoMwGCGurKp02ZGh6XruEb
 3sQipNVVH3tbKzNB09N2nYvQ/WKiHYfKYFh/k+U3qbKiS9yTS7C28PdWH3MmDTM1e2Pn+8Jfr+Iv
 P72bH6xWzBblIZqka1M0301tkJ3Rp8epTUH8W+ZvAulP6QoyLjjSzYVL+BsQ8B8bUMWNk0XcH3DH
 23AkHqdeueuWRPKyc48UJHK2IaO1d7d0zAC03LVU+Yw17f3LhC0LZQy6+29pSMb9/5aT/p12pg3X
 9JKHQix+HgjJC8+e35xQUoUtfFmFmmXXJXnvp5GJZDxC/8ENnAFjCOCHRwB6Xcx+LtYOafbORsu7
 xSjLEOuzMb10Xcj/kX5Ko4JAeF8U1DIHyy5wXOCxkkRGML8kbMwzryEDnif0kP4rQyVtE+FKxcuq
 5H2thHDpxEVEdTzn4rXdwVL6xLyePL/CBA2Xt4Q8a20TCDc7IQ7Q==
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
 <tencent_5823CCB7CFD4C49A90D3CC1A183AB406EB09@qq.com>
 <tencent_B5689033C2703B476DA909302DA141A0A305@qq.com>
 <faff3515-896c-a445-ebbe-f7077cb52dd4@intel.com>
From: "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>
X-OQ-MSGID: <db2f2541-c085-f026-e079-fef69d3c559a@foxmail.com>
Date: Wed, 18 May 2022 15:22:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <faff3515-896c-a445-ebbe-f7077cb52dd4@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=203.205.221.173;
 envelope-from=zhangfei.gao@foxmail.com; helo=out203-205-221-173.mail.qq.com
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/5/17 下午4:55, Yi Liu wrote:
> Hi Zhangfei,
>
> On 2022/5/12 17:01, zhangfei.gao@foxmail.com wrote:
>>
>> Hi, Yi
>>
>> On 2022/5/11 下午10:17, zhangfei.gao@foxmail.com wrote:
>>>
>>>
>>> On 2022/5/10 下午10:08, Yi Liu wrote:
>>>> On 2022/5/10 20:45, Jason Gunthorpe wrote:
>>>>> On Tue, May 10, 2022 at 08:35:00PM +0800, Zhangfei Gao wrote:
>>>>>> Thanks Yi and Eric,
>>>>>> Then will wait for the updated iommufd kernel for the PCI MMIO 
>>>>>> region.
>>>>>>
>>>>>> Another question,
>>>>>> How to get the iommu_domain in the ioctl.
>>>>>
>>>>> The ID of the iommu_domain (called the hwpt) it should be returned by
>>>>> the vfio attach ioctl.
>>>>
>>>> yes, hwpt_id is returned by the vfio attach ioctl and recorded in
>>>> qemu. You can query page table related capabilities with this id.
>>>>
>>>> https://lore.kernel.org/kvm/20220414104710.28534-16-yi.l.liu@intel.com/ 
>>>>
>>>>
>>> Thanks Yi,
>>>
>>> Do we use iommufd_hw_pagetable_from_id in kernel?
>>>
>>> The qemu send hwpt_id via ioctl.
>>> Currently VFIOIOMMUFDContainer has hwpt_list,
>>> Which member is good to save hwpt_id, IOMMUTLBEntry?
>>
>> Can VFIOIOMMUFDContainer  have multi hwpt?
>
> yes, it is possible
Then how to get hwpt_id in map/unmap_notify(IOMMUNotifier *n, 
IOMMUTLBEntry *iotlb)

>
>> Since VFIOIOMMUFDContainer has hwpt_list now.
>> If so, how to get specific hwpt from map/unmap_notify in 
>> hw/vfio/as.c, where no vbasedev can be used for compare.
>>
>> I am testing with a workaround, adding VFIOIOASHwpt *hwpt in 
>> VFIOIOMMUFDContainer.
>> And save hwpt when vfio_device_attach_container.
>>
>>>
>>> In kernel ioctl: iommufd_vfio_ioctl
>>> @dev: Device to get an iommu_domain for
>>> iommufd_hw_pagetable_from_id(struct iommufd_ctx *ictx, u32 pt_id, 
>>> struct device *dev)
>>> But iommufd_vfio_ioctl seems no para dev?
>>
>> We can set dev=Null since IOMMUFD_OBJ_HW_PAGETABLE does not need dev.
>> iommufd_hw_pagetable_from_id(ictx, hwpt_id, NULL)
>
> this is not good. dev is passed in to this function to allocate domain
> and also check sw_msi things. If you pass in a NULL, it may even unable
> to get a domain for the hwpt. It won't work I guess.

The iommufd_hw_pagetable_from_id can be used for
1, allocate domain, which need para dev
case IOMMUFD_OBJ_IOAS
hwpt = iommufd_hw_pagetable_auto_get(ictx, ioas, dev);

2. Just return allocated domain via hwpt_id, which does not need dev.
case IOMMUFD_OBJ_HW_PAGETABLE:
return container_of(obj, struct iommufd_hw_pagetable, obj);

By the way, any plan of the nested mode?

Thanks

