Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52F146B84
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:41:54 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudg8-0006FN-Jr
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iubcl-0007Fa-IO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iubck-0000MI-0G
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:30:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27565
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iubcj-0000LZ-TE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579782613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yrraR8C7IeHS3I7NQKMgH6g3S12t8aTAComhJ72ZTw=;
 b=N3gbl1vq05BuAB25UZuZZa1eYMlBWcda1flcwIBKYmAdr5X6XcBCnuWeRKSuBTskGDU4/b
 av1RE5pFzRrRBgAN7iJSyBAjopN63/dRG0MzjdO2VRk6Ay3dcIsjCF35oqZVBVX29GnPBs
 j866uP9J+91hnelsHITndakDKCP0NAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-qsNE_EVlNCyMd6E1lTkYYw-1; Thu, 23 Jan 2020 07:30:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6721902EA8;
 Thu, 23 Jan 2020 12:30:08 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3CAA8575F;
 Thu, 23 Jan 2020 12:30:05 +0000 (UTC)
Subject: Re: [PATCH] qemu-nbd: Removed deprecated --partition option
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20200122214328.1413664-1-eblake@redhat.com>
 <bcf38c8e-c207-73bd-8707-44b500ef3fa2@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7084da4a-fa6a-e4ab-868d-2ad397dd5cb3@redhat.com>
Date: Thu, 23 Jan 2020 06:30:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bcf38c8e-c207-73bd-8707-44b500ef3fa2@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: qsNE_EVlNCyMd6E1lTkYYw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/20 6:10 AM, Max Reitz wrote:
> On 22.01.20 22:43, Eric Blake wrote:
>> The option was deprecated in 4.0.0 (commit 0ae2d546); it's now been
>> long enough with no complaints to follow through with that process.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---

>> -@code{qemu-nbd -t -P 1 -f qcow2 file.qcow2}
>> -
>> -can be rewritten as:
>> -
>> -@code{qemu-nbd -t --image-opts driver=3Draw,offset=3D1M,size=3D100M,fil=
e.driver=3Dqcow2,file.backing.driver=3Dfile,file.backing.filename=3Dfile.qc=
ow2}
>> -

>> +can be rewritten as:
>> +
>> +@code{qemu-nbd -t --image-opts driver=3Draw,offset=3D1M,size=3D100M,fil=
e.driver=3Dqcow2,file.backing.driver=3Dfile,file.backing.filename=3Dfile.qc=
ow2}
>=20
> I know you just moved it from above, but isn=E2=80=99t this wrong?  Shoul=
dn=E2=80=99t it
> be s/backing/file/g?

Indeed; file.file.driver=3Dfile,file.file.filename=3Dfile.qcow2 is required=
=20
for it to work, rather than fail with
qemu-nbd: Failed to blk_new_open=20
'driver=3Draw,offset=3D1m,size=3D100m,file.driver=3Dqcow2,file.backing.driv=
er=3Dfile,file.backing.filename=3Dfile4':=20
A block device must be specified for "file"

I'll repost with the bug-fix as a separate commit (and it's a shame that=20
we've gone nearly a year with no one noticing the typo in the original).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


