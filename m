Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAE67E8AB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 15:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQ5X-0000EA-Oi; Fri, 27 Jan 2023 09:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pLKyj-0001nw-2W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pLKyh-0004dv-6D
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674811497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3BaXnZwSRYami6lWXFihpFr1wdXWA1/2+waWSKM4oA=;
 b=KI6NYEJRo7IBirM+UEWwV8dXHRjAIk9CyR2wYX3gPMQioIFADlljzx1+f+ql4MMDBO6/81
 VDTMJAaL35+DYI4NZgwqZ9s4XDfCaUBL+VrVZrsV2wzpC0yLFq39KNJHjPusZG4WN+vsuH
 Tcm5ahTJQQcbZXcLT4iaPZjDe2dzQoY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-6CGmkCfvP0-kTUelhvn7qQ-1; Fri, 27 Jan 2023 04:24:54 -0500
X-MC-Unique: 6CGmkCfvP0-kTUelhvn7qQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 y3-20020a05620a44c300b00709109448a3so2662021qkp.19
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3BaXnZwSRYami6lWXFihpFr1wdXWA1/2+waWSKM4oA=;
 b=7xqEv+nBUFczejmTnGfWO1UQF+rbDwCTlAqSheBugNBJ3vrRVkGzE4e6PPrBJT+PUn
 9SIw4BvDD14WKGJ4j8SO+JJmB5VB9nZh6Yg9MuymTLGcKhsh7FX12oExq03hPT/0E2jl
 mBSV21ovzj+sKrHQj903n8P30vvMCkfTrumFnA6+6aBiGQXFgo7A4DQJXP5rlx17fWEv
 56JisbggBZDRP5WCIkwRF21H/dT2Rpr53VDPaWg8Aq26oZaSm9ESe0XLkuhWCdOZ2BsD
 ccSRW7aCJMLpwQ6Th4ohJvG3BV2aHS53oVesm5THMyER/5kS9QbJ7/KvIJFN6qPYt4Ot
 I6pQ==
X-Gm-Message-State: AFqh2kpnie7mX53rZ4xd4gYs2pZtqIlHsj35Z2bOUYxfNDEMlMNhLy+n
 SGAsVDOz/VHCpZUwPE8aP+rwMIHlnuEJ0YSpNbWZPxbAOo2j5f+mJKYFudjO8NZ7jBIMvfmy92V
 SkI0kQnHDV3eTk/o=
X-Received: by 2002:a05:622a:22a6:b0:39c:da20:f7af with SMTP id
 ay38-20020a05622a22a600b0039cda20f7afmr57708479qtb.12.1674811494058; 
 Fri, 27 Jan 2023 01:24:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSQ88y1d32wqprPAjGmYZH4lrRJbdO3L6AlhQgTbMwKY0juVJqlaoA6fHzmGJ7e+iC/iPgtQ==
X-Received: by 2002:a05:622a:22a6:b0:39c:da20:f7af with SMTP id
 ay38-20020a05622a22a600b0039cda20f7afmr57708462qtb.12.1674811493755; 
 Fri, 27 Jan 2023 01:24:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05620a22b900b00706c1f7a608sm274094qkh.89.2023.01.27.01.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 01:24:53 -0800 (PST)
Message-ID: <7fdfe6af-cb74-a29c-67bd-bfa0480397c0@redhat.com>
Date: Fri, 27 Jan 2023 10:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
Content-Language: en-US
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, cohuck@redhat.com, qemu-trivial@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230127084604.53175-1-smitterl@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230127084604.53175-1-smitterl@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Jan 2023 09:52:18 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 09:46, Sebastian Mitterle wrote:
> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.
> 
> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> 
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
> v2: move section below 'Device support'
> ---
>   docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
>   docs/system/target-s390x.rst     |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 docs/system/s390x/pcidevices.rst
> 
> diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> new file mode 100644
> index 0000000000..fec905d6e6
> --- /dev/null
> +++ b/docs/system/s390x/pcidevices.rst
> @@ -0,0 +1,34 @@
> +PCI devices on s390x
> +====================
> +
> +PCI devices on s390x work differently than on other architectures.
> +
> +To start with, using a PCI device requires the additional ``zpci`` device. For example,
> +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> +
> +Here, the zpci device is joined with the PCI device via the ``target`` property.
> +
> +Note that we don't set bus, slot or function here for the guest as is common in other
> +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
> +and ``fid`` determine how the device is presented to the guest operating system.
> +
> +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> +``fid`` identifies the physical slot, i.e.::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> +                   ...
> +
> +will be presented in the guest as::
> +
> + # lspci -v
> + 0007:00:00.0 ...
> + Physical Slot: 00000008
> + ...
> +
> +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
> +it.
> diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
> index c636f64113..f6f11433c7 100644
> --- a/docs/system/target-s390x.rst
> +++ b/docs/system/target-s390x.rst
> @@ -26,6 +26,7 @@ or vfio-ap is also available.
>      s390x/css
>      s390x/3270
>      s390x/vfio-ccw
> +   s390x/pcidevices
>   
>   Architectural features
>   ======================


