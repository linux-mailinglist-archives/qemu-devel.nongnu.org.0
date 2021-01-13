Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9C2F48DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:44:38 +0100 (CET)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzddl-0006me-EQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kzdcQ-00066a-To
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kzdcM-0003TN-6E
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610534588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCOpvoroAZ0SETExcf+E+uMBaSMmQ1BRbF4lKuwEy9s=;
 b=DHtTLpI5pUjs263cKdTzwcvVhZMjNvkqDFsP09Pl3wxQBKC8gJZvDfg49acugOOOrZcBFY
 jlrW9yaFhVWxn9IES7VS0JOr0OJAOjse22tRdT4Nwr30hrhx3NQOiTIUgdKd19Sq9uENTp
 fVM9PLBYT70c6h+BqY18vz3QM8cVewA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-YjWt9Cy3MR2VtUBZKirh6A-1; Wed, 13 Jan 2021 05:43:06 -0500
X-MC-Unique: YjWt9Cy3MR2VtUBZKirh6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25701DDE4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 10:43:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-238.ams2.redhat.com
 [10.36.112.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F4A779D2;
 Wed, 13 Jan 2021 10:42:55 +0000 (UTC)
Subject: Re: [PATCH v2] vhost-user-fs: add the "bootindex" property
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210112131603.12686-1-lersek@redhat.com>
 <20210113103629.GF250553@stefanha-x1.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <11b0f61e-063c-b74b-5e4d-29874e0d7720@redhat.com>
Date: Wed, 13 Jan 2021 11:42:54 +0100
MIME-Version: 1.0
In-Reply-To: <20210113103629.GF250553@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?J=c3=a1n_Tomko?= <jtomko@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/13/21 11:36, Stefan Hajnoczi wrote:
> On Tue, Jan 12, 2021 at 02:16:03PM +0100, Laszlo Ersek wrote:
>> virtio-fs qualifies as a bootable device minimally under OVMF, but
>> currently the necessary "bootindex" property is missing. Add the property.
>>
>> Expose the property only in the PCI device, for now. There is no boot
>> support for virtiofs on s390x (ccw) for the time being [1] [2], so leave
>> the CCW device unchanged. Add the property to the base device still,
>> because adding the alias to the CCW device later will be easier this way
>> [3].
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01745.html
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01870.html
>> [3] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01751.html
>>
>> Example OpenFirmware device path for the "vhost-user-fs-pci" device in the
>> "bootorder" fw_cfg file:
>>
>>   /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0
>>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Ján Tomko <jtomko@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: virtio-fs@redhat.com
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>
>> Notes:
>>     v2:
>>     - drop "hw/s390x/vhost-user-fs-ccw.c" hunk [Christian, Cornelia]
>>     
>>     - document the same in the commit message
>>     
>>     - remove fw_cfg kernel boot reference from the commit message (somewhat
>>       similar use case, but a comparison or even a hint doesn't necessarily
>>       belong in the commit message)
>>     
>>     - pick up Dave's ACK
>>
>>  include/hw/virtio/vhost-user-fs.h |  1 +
>>  hw/virtio/vhost-user-fs-pci.c     |  2 ++
>>  hw/virtio/vhost-user-fs.c         | 10 ++++++++++
>>  3 files changed, 13 insertions(+)
> 
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Thanks!
Laszlo


