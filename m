Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCC313CF3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:15:43 +0100 (CET)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B4Y-0000BL-MF
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l94o9-0003gg-Kn
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l94o5-0003pG-K3
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612784056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGL20/XApOzyNW6bXzRJK7s2Zwuq0ng7REh76DiXbvk=;
 b=MvIk6afnzTeZwOkP+glEcj70H0ad+HEmHOWyJG2h1gniXPOObUFSJhj89EQcrg67rQskDV
 ZBHPLUpgSxzZsHkxKO+o5SsNkl2kM2STIulu7RZunrpvFEyG2ulgDwPgGSFugZRM0dNCjy
 tyJB/FxaAeLvKsDYhjjDJAbPn1xuyhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-_DtHIfTLM827lCZEAqqZUA-1; Mon, 08 Feb 2021 06:34:13 -0500
X-MC-Unique: _DtHIfTLM827lCZEAqqZUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD140801965;
 Mon,  8 Feb 2021 11:34:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9285919C71;
 Mon,  8 Feb 2021 11:34:10 +0000 (UTC)
Subject: Re: getting the console output for s390 cdrom-test?
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
Date: Mon, 8 Feb 2021 12:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2021 11.27, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 16:08, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 22/01/2021 21.32, Peter Maydell wrote:
>>> Hi; I've been looking at why the s390 cdrom test has an intermittent
>>> failure on my aarch64 box. Looking at some TCG debug log output
>>> I think what is happening is that sometimes execution diverges from
>>> a successful run inside virtio_scsi_setup() and we end up failing
>>> a vs_assert(), which triggers a "Guest crashed on cpu 0: disabled-wait"
>>> which then makes the qtest hang until its timeout.
>>>
>>> I think that vs_assert() ought to be printing some information
>>> to the console about which assert fails when it happens, but
>>> how do I need to tweak the qtest to get it to capture this
>>> console log somewhere?
>>
>>    Hi!
>>
>> Sorry for the late reply ... did you get any further with this already?
> 
> No, I've been mostly working on other stuff. Thanks for the instructions
> on how to capture stdio. This is what a success looks like:
> 
> LOADPARM=[        ]
> Using virtio-scsi.
> Warning: Could not locate a usable virtio-scsi device
> Using virtio-blk.
> Using guessed DASD geometry.
> Using ECKD scheme (block size  4096), CDL
> No zIPL section in IPL2 record.
> zIPL load failed.
> Using virtio-blk.
> ISO boot image size verified
> 
> And this is a failure:
> 
> LOADPARM=[        ]
> Using virtio-scsi.
> target: 0x0000000000000094
> 
> ! SCSI cannot report LUNs: response VS RESP=09 !

Looks like the SCSI controller returned VIRTIO_SCSI_S_FAILURE instead of the 
expected VIRTIO_SCSI_S_BAD_TARGET here (see virtio_scsi_locate_device() in 
pc-bios/s390-ccw/virtio-scsi.c).

The question is: How could that happen? If I get hw/scsi/virtio-scsi.c 
right, this is only set by virtio_scsi_fail_cmd_req(), i.e. it only happens 
if virtio_scsi_parse_req() returned -ENOTSUP ... which indicates that there 
was something wrong with the VirtIOSCSIReq request?

Could you maybe try to add some debug printfs to virtio_scsi_parse_req() in 
hw/scsi/virtio-scsi.c and/or to scsi_report_luns() / vs_run() in 
pc-bios/s390-ccw/virtio-scsi.c to see whether there is something obviously 
wrong in the request?

  Thomas


