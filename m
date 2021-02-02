Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F244430C194
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:28:19 +0100 (CET)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wfD-0007vJ-0J
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wdT-0006DN-9V
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wdR-0002ZV-KF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nz1AHwjucO+44OER5CPS10byVA2GsstgeF5fA/2ib94=;
 b=Hzjp5gGwa2GH22Pd4sdKU96FGGcNHx8M/U29Ayh2SADIBOjCaU8MJTJ8+saaLKsHArRb+3
 VhjrIGoyk/5QmxfmUxBWhYJTUvqUIjISbl1ck/sXyYqoZ932iQHkjeD2WxmbW+eu9/VL4v
 /kYe5zFjbmSxFK4MrfFo3AlMwrY/AhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-i_ZUW0uyPbKV9fpihGPpzQ-1; Tue, 02 Feb 2021 09:26:24 -0500
X-MC-Unique: i_ZUW0uyPbKV9fpihGPpzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9814D107ACE3;
 Tue,  2 Feb 2021 14:26:22 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54A49722C8;
 Tue,  2 Feb 2021 14:26:15 +0000 (UTC)
Subject: Re: [RFC PATCH v3 21/31] hw/cxl/device: Add a memory device (8.2.8.5)
To: Ben Widawsky <ben.widawsky@intel.com>, qemu-devel@nongnu.org
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-22-ben.widawsky@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ec610f0d-4719-43fd-9293-e5a18e00a7d3@redhat.com>
Date: Tue, 2 Feb 2021 08:26:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202005948.241655-22-ben.widawsky@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 6:59 PM, Ben Widawsky wrote:
> A CXL memory device (AKA Type 3) is a CXL component that contains some
> combination of volatile and persistent memory. It also implements the
> previously defined mailbox interface as well as the memory device
> firmware interface.
> 
> Although the memory device is configured like a normal PCIe device, the
> memory traffic is on an entirely separate bus conceptually (using the
> same physical wires as PCIe, but different protocol).
> 
> The guest physical address for the memory device is part of a larger
> window which is owned by the platform. Currently, this is hardcoded as
> an object property on host bridge (PXB) creation, but that will need to
> change for interleaving.
> 
> The following example will create a 256M device in a 512M window:
> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---

> +++ b/qapi/machine.json
> @@ -1394,6 +1394,7 @@
>  { 'union': 'MemoryDeviceInfo',
>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>              'nvdimm': 'PCDIMMDeviceInfo',
> +            'cxl': 'PCDIMMDeviceInfo',
>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
>              'virtio-mem': 'VirtioMEMDeviceInfo'
>            }

Missing documentation that 'cxl' was introduced in 6.0.  Also, is it
worth keeping the branches of this union in lexicographic order?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


