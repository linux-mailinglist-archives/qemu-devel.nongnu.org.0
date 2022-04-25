Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC050EA1B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:24:22 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5Fs-0005rh-VC
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj5Eq-0005Bm-SB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nj5En-0003sE-81
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650918192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReceZit4jM7lU67Zk++Iig/sz0gzGrt/dvrPPSUwbfo=;
 b=cj7TqJNHlaQjBSJHhqUwNiCauELg1kcg9XcXlt70QP8+o2rP48d7k5pOhK4FKXTBlhVLFM
 xGvMWYIyRRr3DBmu0SYVqULIzNNFqD6H8OA6yrysSnlEiz7TFx6rPGpEslYw5OJ/2oEdbh
 1/jwHimWD/0mjwFqMQNPVzVDcC0Wovs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-vF-aHBVEO0iWeCZwJSCYZg-1; Mon, 25 Apr 2022 16:23:10 -0400
X-MC-Unique: vF-aHBVEO0iWeCZwJSCYZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso86027wmc.9
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ReceZit4jM7lU67Zk++Iig/sz0gzGrt/dvrPPSUwbfo=;
 b=mlsDO10NrNKAreTITVSxtKKLBW2vg05qo9uH5gDTkwy5DU+m/EdnrUnw2lE5Djskxt
 w5sPnVSYLKFz2ZIy8S7i7B7DB/AMMrWCzFiebV8W9r7lbSaR582Q0CZPzvKAhuvfSVJk
 Jx2Zi1OmOO26wwOMXyaGceWZWq1F84Wl7ApszNLLqR54iNGrbfg7ys+KhUY2f/UDmF+n
 BX/8yBALZLpe/Vjj61kgSCGaftB2grTHQG569awAk7HQgm1X4NmbNz8GKfPgS7bmMw7J
 xQ9IZ9WXw910Jo4BeRgkNrWM59a7NWzusUw6TR+RLpMom1b6SLSOboFmsel/6wfI0WcS
 HK7g==
X-Gm-Message-State: AOAM532RnlbxCtJkUCvKkjdf0xaGNBbMjxUmJOMPckMM5bkJxAU+d3Zl
 pinK/7PnOlEfb1yjK2EyxMuKi7UbjHprlW0k2+ct4vdZFh/rDxJYP737fySHTZ6hY7w5d4q9cWG
 aFRJgCG8mS8TKI58=
X-Received: by 2002:a05:6000:1888:b0:20a:9644:ab9d with SMTP id
 a8-20020a056000188800b0020a9644ab9dmr15214715wri.197.1650918189617; 
 Mon, 25 Apr 2022 13:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+oUGJbhE5dxQ/jaLvwrka1WaE2Z7/8fYK+rizX4C5pG42StYXZu0GpJHU48lo7wfyol3YzQ==
X-Received: by 2002:a05:6000:1888:b0:20a:9644:ab9d with SMTP id
 a8-20020a056000188800b0020a9644ab9dmr15214694wri.197.1650918189342; 
 Mon, 25 Apr 2022 13:23:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm14303931wmn.2.2022.04.25.13.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:23:08 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Alex Williamson <alex.williamson@redhat.com>, Yi Liu <yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <fbe4728a-da58-e7de-aa36-97af48cbca0a@redhat.com>
Date: Mon, 25 Apr 2022 22:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220422160943.6ff4f330.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 chao.p.peng@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 Laine Stump <laine@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, jasowang@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, yi.y.sun@intel.com, nicolinc@nvidia.com,
 kevin.tian@intel.com, jgg@nvidia.com, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/23/22 12:09 AM, Alex Williamson wrote:
> [Cc +libvirt folks]
>
> On Thu, 14 Apr 2022 03:46:52 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>
>> With the introduction of iommufd[1], the linux kernel provides a generic
>> interface for userspace drivers to propagate their DMA mappings to kernel
>> for assigned devices. This series does the porting of the VFIO devices
>> onto the /dev/iommu uapi and let it coexist with the legacy implementation.
>> Other devices like vpda, vfio mdev and etc. are not considered yet.
>>
>> For vfio devices, the new interface is tied with device fd and iommufd
>> as the iommufd solution is device-centric. This is different from legacy
>> vfio which is group-centric. To support both interfaces in QEMU, this
>> series introduces the iommu backend concept in the form of different
>> container classes. The existing vfio container is named legacy container
>> (equivalent with legacy iommu backend in this series), while the new
>> iommufd based container is named as iommufd container (may also be mentioned
>> as iommufd backend in this series). The two backend types have their own
>> way to setup secure context and dma management interface. Below diagram
>> shows how it looks like with both BEs.
>>
>>                     VFIO                           AddressSpace/Memory
>>     +-------+  +----------+  +-----+  +-----+
>>     |  pci  |  | platform |  |  ap |  | ccw |
>>     +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------+
>>         |           |           |        |        |   AddressSpace       |
>>         |           |           |        |        +------------+---------+
>>     +---V-----------V-----------V--------V----+               /
>>     |           VFIOAddressSpace              | <------------+
>>     |                  |                      |  MemoryListener
>>     |          VFIOContainer list             |
>>     +-------+----------------------------+----+
>>             |                            |
>>             |                            |
>>     +-------V------+            +--------V----------+
>>     |   iommufd    |            |    vfio legacy    |
>>     |  container   |            |     container     |
>>     +-------+------+            +--------+----------+
>>             |                            |
>>             | /dev/iommu                 | /dev/vfio/vfio
>>             | /dev/vfio/devices/vfioX    | /dev/vfio/$group_id
>>  Userspace  |                            |
>>  ===========+============================+================================
>>  Kernel     |  device fd                 |
>>             +---------------+            | group/container fd
>>             | (BIND_IOMMUFD |            | (SET_CONTAINER/SET_IOMMU)
>>             |  ATTACH_IOAS) |            | device fd
>>             |               |            |
>>             |       +-------V------------V-----------------+
>>     iommufd |       |                vfio                  |
>> (map/unmap  |       +---------+--------------------+-------+
>>  ioas_copy) |                 |                    | map/unmap
>>             |                 |                    |
>>      +------V------+    +-----V------+      +------V--------+
>>      | iommfd core |    |  device    |      |  vfio iommu   |
>>      +-------------+    +------------+      +---------------+
>>
>> [Secure Context setup]
>> - iommufd BE: uses device fd and iommufd to setup secure context
>>               (bind_iommufd, attach_ioas)
>> - vfio legacy BE: uses group fd and container fd to setup secure context
>>                   (set_container, set_iommu)
>> [Device access]
>> - iommufd BE: device fd is opened through /dev/vfio/devices/vfioX
>> - vfio legacy BE: device fd is retrieved from group fd ioctl
>> [DMA Mapping flow]
>> - VFIOAddressSpace receives MemoryRegion add/del via MemoryListener
>> - VFIO populates DMA map/unmap via the container BEs
>>   *) iommufd BE: uses iommufd
>>   *) vfio legacy BE: uses container fd
>>
>> This series qomifies the VFIOContainer object which acts as a base class
>> for a container. This base class is derived into the legacy VFIO container
>> and the new iommufd based container. The base class implements generic code
>> such as code related to memory_listener and address space management whereas
>> the derived class implements callbacks that depend on the kernel user space
>> being used.
>>
>> The selection of the backend is made on a device basis using the new
>> iommufd option (on/off/auto). By default the iommufd backend is selected
>> if supported by the host and by QEMU (iommufd KConfig). This option is
>> currently available only for the vfio-pci device. For other types of
>> devices, it does not yet exist and the legacy BE is chosen by default.
> I've discussed this a bit with Eric, but let me propose a different
> command line interface.  Libvirt generally likes to pass file
> descriptors to QEMU rather than grant it access to those files
> directly.  This was problematic with vfio-pci because libvirt can't
> easily know when QEMU will want to grab another /dev/vfio/vfio
> container.  Therefore we abandoned this approach and instead libvirt
> grants file permissions.
>
> However, with iommufd there's no reason that QEMU ever needs more than
> a single instance of /dev/iommufd and we're using per device vfio file
> descriptors, so it seems like a good time to revisit this.
>
> The interface I was considering would be to add an iommufd object to
> QEMU, so we might have a:
>
> -device iommufd[,fd=#][,id=foo]
>
> For non-libivrt usage this would have the ability to open /dev/iommufd
> itself if an fd is not provided.  This object could be shared with
> other iommufd users in the VM and maybe we'd allow multiple instances
> for more esoteric use cases.  [NB, maybe this should be a -object rather than
> -device since the iommufd is not a guest visible device?]
>
> The vfio-pci device might then become:
>
> -device vfio-pci[,host=DDDD:BB:DD.f][,sysfsdev=/sys/path/to/device][,fd=#][,iommufd=foo]
>
> So essentially we can specify the device via host, sysfsdev, or passing
> an fd to the vfio device file.  When an iommufd object is specified,
> "foo" in the example above, each of those options would use the
> vfio-device access mechanism, essentially the same as iommufd=on in
> your example.  With the fd passing option, an iommufd object would be
> required and necessarily use device level access.
What is the use case you foresee for the "fd=#" option?
>
> In your example, the iommufd=auto seems especially troublesome for
> libvirt because QEMU is going to have different locked memory
> requirements based on whether we're using type1 or iommufd, where the
> latter resolves the duplicate accounting issues.  libvirt needs to know
> deterministically which backed is being used, which this proposal seems
> to provide, while at the same time bringing us more in line with fd
> passing.  Thoughts?  Thanks,
I like your proposal (based on the -object iommufd). The only thing that
may be missing I think is for a qemu end-user who actually does not care
about the iommu backend being used but just wishes to use the most
recent available one it adds some extra complexity. But this is not the
most important use case ;)

Thanks

Eric
>
> Alex
>


