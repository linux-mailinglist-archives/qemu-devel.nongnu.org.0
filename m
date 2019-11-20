Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D31045C5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 22:29:03 +0100 (CET)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXXX4-0000Lk-He
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 16:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iXXVg-0008IC-2B
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 16:27:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iXXVb-0003YJ-Ra
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 16:27:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55972
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iXXVb-0003XN-FR
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 16:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574285249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSGVMZwwNGXJ0CnAMdhs89Qq+mKQd2ctHGZQIgMdRDo=;
 b=QCkS1tsOdaa2rmhe8E7kn+cHWA+x3vWbDQ83Fiiu6j0FwEh9WQsDPXDag6b688ai+lL8cW
 HkTMzmz+oyDMfE+8cSAsA510CfRYnImJQm/wbEP0w06bdhqKmmdmXU00YVwDiE75YDMu9d
 PMi2TFSpz12gRDbE5/jHg70/Kno7T1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-uQo6BPtzOmajPHxHjPlu0w-1; Wed, 20 Nov 2019 16:27:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9731005509;
 Wed, 20 Nov 2019 21:27:24 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B94BD1C955;
 Wed, 20 Nov 2019 21:27:21 +0000 (UTC)
Subject: Re: [PATCH v2 6/6] iotests: Test committing to short backing file
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20191120184501.28159-1-kwolf@redhat.com>
 <20191120184501.28159-7-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <879ef61a-97fc-24b6-00e8-94145d946af5@redhat.com>
Date: Wed, 20 Nov 2019 15:27:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120184501.28159-7-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: uQo6BPtzOmajPHxHjPlu0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/19 12:45 PM, Kevin Wolf wrote:
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/qemu-iotests/274        | 141 +++++++++++++++++++++
>   tests/qemu-iotests/274.out    | 227 ++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/group      |   1 +
>   tests/qemu-iotests/iotests.py |   2 +-
>   4 files changed, 370 insertions(+), 1 deletion(-)
>   create mode 100755 tests/qemu-iotests/274
>   create mode 100644 tests/qemu-iotests/274.out
>=20


> +    iotests.log('=3D=3D=3D Testing QMP active commit (top -> mid) =3D=3D=
=3D')
> +
> +    create_chain()
> +    with create_vm() as vm:
> +        vm.launch()
> +        vm.qmp_log('block-commit', device=3D'top', base_node=3D'mid',
> +                   job_id=3D'job0', auto_dismiss=3DFalse)
> +        vm.run_job('job0', wait=3D5)
> +
> +    iotests.img_info_log(mid)
> +    iotests.qemu_io_log('-c', 'read -P 1 0 %d' % size_short, mid)
> +    iotests.qemu_io_log('-c', 'read -P 0 %d %d' % (size_short, size_diff=
), mid)
> +

Would it also be worth testing a commit of mid -> base, and showing that=20
top still sees the same contents afterwards?

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


