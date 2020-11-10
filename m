Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742D2AD87E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:18:40 +0100 (CET)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUTl-00011l-Dn
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kcURr-0000F4-IX
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:16:39 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kcURn-0000X3-Jq
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:16:39 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5faaa0c00000>; Tue, 10 Nov 2020 06:16:32 -0800
Received: from [10.40.102.53] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Nov
 2020 14:16:23 +0000
Subject: Re: [RFC PATCH for-QEMU-5.2] vfio: Make migration support experimental
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>
References: <160494787833.1473.10514376876696596117.stgit@gimli.home>
 <20201109194417.GR3024@work-vm> <20201109132950.6c2dfe02@w520.home>
 <20201110091037.GA3108@work-vm>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <898ba98f-9967-f3b3-737c-2d18b0281b51@nvidia.com>
Date: Tue, 10 Nov 2020 19:46:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201110091037.GA3108@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605017792; bh=GkuWZxcmr2BriiVH3h2VNcl1ygQzv4WkQ3oonQd0z9g=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=NV/rxXaA9s1dEsPUqZbiHpwI+EUc1PnCLVFsLnH/IW9AXshOr0dF0p+qpfcPokS2a
 hLJ8FM/ZrQMWp2A1fwaZ2YOGEo524tjZW0iM7fODYIXl5FX6IwKT/rwgp8yfTVUPuv
 2lJyI8NNM1ldO/GqGB5Y0OxSiYljOhSIEPC/QncxCKcmK3nqEDC2U+ghRXbrsVA8NC
 uFrTy9q2jprzvHkvNJTmXpUQ+ycyoMBgI52H7DL9Dc8qBEFsu79JigpM4vIWBu1nWb
 IHrwZ75gLZll8ILy2WmhbxfjFhlElDW2d32LthMjsOg2rzmEglFte/JgAdhKRXAM6q
 y0C95WZ/wGvwQ==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 09:16:29
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Malcolm Crossley <mcrossley@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Dheeraj Nigam <dnigam@nvidia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/10/2020 2:40 PM, Dr. David Alan Gilbert wrote:
> * Alex Williamson (alex.williamson@redhat.com) wrote:
>> On Mon, 9 Nov 2020 19:44:17 +0000
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>
>>> * Alex Williamson (alex.williamson@redhat.com) wrote:
>>>> Per the proposed documentation for vfio device migration:
>>>>
>>>>    Dirty pages are tracked when device is in stop-and-copy phase
>>>>    because if pages are marked dirty during pre-copy phase and
>>>>    content is transfered from source to destination, there is no
>>>>    way to know newly dirtied pages from the point they were copied
>>>>    earlier until device stops. To avoid repeated copy of same
>>>>    content, pinned pages are marked dirty only during
>>>>    stop-and-copy phase.
>>>>
>>>> Essentially, since we don't have hardware dirty page tracking for
>>>> assigned devices at this point, we consider any page that is pinned
>>>> by an mdev vendor driver or pinned and mapped through the IOMMU to
>>>> be perpetually dirty.  In the worst case, this may result in all of
>>>> guest memory being considered dirty during every iteration of live
>>>> migration.  The current vfio implementation of migration has chosen
>>>> to mask device dirtied pages until the final stages of migration in
>>>> order to avoid this worst case scenario.
>>>>
>>>> Allowing the device to implement a policy decision to prioritize
>>>> reduced migration data like this jeopardizes QEMU's overall ability
>>>> to implement any degree of service level guarantees during migration.
>>>> For example, any estimates towards achieving acceptable downtime
>>>> margins cannot be trusted when such a device is present.  The vfio
>>>> device should participate in dirty page tracking to the best of its
>>>> ability throughout migration, even if that means the dirty footprint
>>>> of the device impedes migration progress, allowing both QEMU and
>>>> higher level management tools to decide whether to continue the
>>>> migration or abort due to failure to achieve the desired behavior.
>>>
>>> I don't feel particularly badly about the decision to squash it in
>>> during the stop-and-copy phase; for devices where the pinned memory
>>> is large, I don't think doing it during the main phase makes much sense=
;
>>> especially if you then have to deal with tracking changes in pinning.
>>
>>
>> AFAIK the kernel support for tracking changes in page pinning already
>> exists, this is largely the vfio device in QEMU that decides when to
>> start exposing the device dirty footprint to QEMU.  I'm a bit surprised
>> by this answer though, we don't really know what the device memory
>> footprint is.  It might be large, it might be nothing, but by not
>> participating in dirty page tracking until the VM is stopped, we can't
>> know what the footprint is and how it will affect downtime.  Is it
>> really the place of a QEMU device driver to impose this sort of policy?
>=20
> If it could actually track changes then I'd agree we shouldn't impose
> any policy; but if it's just marking the whole area as dirty we're going
> to need a bodge somewhere; this bodge doesn't look any worse than the
> others to me.
>=20
>>
>>> Having said that, I agree with marking it as experimental, because
>>> I'm dubious how useful it will be for the same reason, I worry
>>> about whether the downtime will be so large to make it pointless.
>>

Not all device state is large, for example NIC might only report=20
currently mapped RX buffers which usually not more than a 1GB and could=20
be as low as 10's of MB. GPU might or might not have large data, that=20
depends on its use cases.

>>
>> TBH I think that's the wrong reason to mark it experimental.  There's
>> clearly demand for vfio device migration and even if the practical use
>> cases are initially small, they will expand over time and hardware will
>> get better.  My objection is that the current behavior masks the
>> hardware and device limitations, leading to unrealistic expectations.
>> If the user expects minimal downtime, configures convergence to account
>> for that, QEMU thinks it can achieve it, and then the device marks
>> everything dirty, that's not supportable.
>=20
> Yes, agreed.

Yes, there is demand for vfio device migration and many devices owners=20
started scoping and development for migration support.
Instead of making whole migration support as experimental, we can have=20
opt-in option to decide to mark sys mem pages dirty during iterative=20
phase (pre-copy phase) of migration.

Thanks,
Kirti

>=20
>> OTOH if the vfio device
>> participates in dirty tracking through pre-copy, then the practical use
>> cases will find themselves as migrations will either be aborted because
>> downtime tolerances cannot be achieved or downtimes will be configured
>> to match reality.  Thanks,
>=20
> Without a way to prioritise the unpinned memory during that period,
> we're going to be repeatedly sending the pinned memory which is going to
> lead to a much larger bandwidth usage that required; so that's going in
> completely the wrong direction and also wrong from the point of view of
> the user.
>=20
> Dave
>=20
>>
>> Alex
>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>
>>>> Link: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00807.h=
tml
>>>> Cc: Kirti Wankhede <kwankhede@nvidia.com>
>>>> Cc: Neo Jia <cjia@nvidia.com>
>>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Cc: Juan Quintela <quintela@redhat.com>
>>>> Cc: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>>>> ---
>>>>
>>>> Given that our discussion in the link above seems to be going in
>>>> circles, I'm afraid it seems necessary to both have a contigency
>>>> plan and to raise the visibility of the current behavior to
>>>> determine whether others agree that this is a sufficiently
>>>> troubling behavior to consider migration support experimental
>>>> at this stage.  Please voice your opinion or contribute patches
>>>> to resolve this before QEMU 5.2.  Thanks,
>>>>
>>>> Alex
>>>>
>>>>   hw/vfio/migration.c           |    2 +-
>>>>   hw/vfio/pci.c                 |    2 ++
>>>>   include/hw/vfio/vfio-common.h |    1 +
>>>>   3 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>>> index 3ce285ea395d..cd44d465a50b 100644
>>>> --- a/hw/vfio/migration.c
>>>> +++ b/hw/vfio/migration.c
>>>> @@ -882,7 +882,7 @@ int vfio_migration_probe(VFIODevice *vbasedev, Err=
or **errp)
>>>>       Error *local_err =3D NULL;
>>>>       int ret =3D -ENOTSUP;
>>>>  =20
>>>> -    if (!container->dirty_pages_supported) {
>>>> +    if (!vbasedev->enable_migration || !container->dirty_pages_suppor=
ted) {
>>>>           goto add_blocker;
>>>>       }
>>>>  =20
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 58c0ce8971e3..1349b900e513 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -3194,6 +3194,8 @@ static Property vfio_pci_dev_properties[] =3D {
>>>>                       VFIO_FEATURE_ENABLE_REQ_BIT, true),
>>>>       DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>>>>                       VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>>>> +    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
>>>> +                     vbasedev.enable_migration, false),
>>>>       DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, f=
alse),
>>>>       DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>>>>                        vbasedev.ram_block_discard_allowed, false),
>>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-comm=
on.h
>>>> index baeb4dcff102..2119872c8af1 100644
>>>> --- a/include/hw/vfio/vfio-common.h
>>>> +++ b/include/hw/vfio/vfio-common.h
>>>> @@ -123,6 +123,7 @@ typedef struct VFIODevice {
>>>>       bool needs_reset;
>>>>       bool no_mmap;
>>>>       bool ram_block_discard_allowed;
>>>> +    bool enable_migration;
>>>>       VFIODeviceOps *ops;
>>>>       unsigned int num_irqs;
>>>>       unsigned int num_regions;
>>>>   =20
>>

