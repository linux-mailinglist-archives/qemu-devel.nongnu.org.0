Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D31165FC5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 15:35:22 +0100 (CET)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4mvB-0002kV-Hz
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 09:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j4mtz-0002CA-Fd
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j4mty-00050A-01
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:34:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30979
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j4mtx-0004zK-SW
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582209245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgGN5ietvGg6gQm01uFkWo2pGnU8FZyJJRZHG43wmdA=;
 b=by+DcOBIWjMh/5hFAB/ZTB+wsN0u8QSf6fy2E26rV/0Eb0PAU0Sjlwu6Be5dzs+DCe/VHS
 OPf6az4V4ENFyjYfrijUycrQzSpmMPf9YUldzIUpzeZFc9AtIaZujRhTHGzbSMozopLH4c
 0Ounu8lpbY7mMVTpmYZ3TaAOjlls12g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-jKQK2t90Pt6Vr87bnqV60g-1; Thu, 20 Feb 2020 09:34:00 -0500
X-MC-Unique: jKQK2t90Pt6Vr87bnqV60g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C694107ACCC;
 Thu, 20 Feb 2020 14:33:58 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2E75C553;
 Thu, 20 Feb 2020 14:33:57 +0000 (UTC)
Subject: Re: [RFC PATCH v3 05/27] qcow2: Document the Extended L2 Entries
 feature
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <0b884ddcd0ac3a3c0b8cdd9d09c74566ac107c9a.1577014346.git.berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e559107b-b0c1-a2be-4fc2-29f050cced34@redhat.com>
Date: Thu, 20 Feb 2020 08:33:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0b884ddcd0ac3a3c0b8cdd9d09c74566ac107c9a.1577014346.git.berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/19 5:36 AM, Alberto Garcia wrote:
> Subcluster allocation in qcow2 is implemented by extending the
> existing L2 table entries and adding additional information to
> indicate the allocation status of each subcluster.
> 
> This patch documents the changes to the qcow2 format and how they
> affect the calculation of the L2 cache size.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---

> @@ -437,7 +445,7 @@ cannot be relaxed without an incompatible layout change).
>   Given an offset into the virtual disk, the offset into the image file can be
>   obtained as follows:
>   
> -    l2_entries = (cluster_size / sizeof(uint64_t))
> +    l2_entries = (cluster_size / sizeof(uint64_t))        [*]
>   
>       l2_index = (offset / cluster_size) % l2_entries
>       l1_index = (offset / cluster_size) / l2_entries
> @@ -447,6 +455,8 @@ obtained as follows:
>   
>       return cluster_offset + (offset % cluster_size)
>   
> +    [*] this changes if Extended L2 Entries are enabled, see next section

> +The size of an extended L2 entry is 128 bits so the number of entries per table
> +is calculated using this formula:
> +
> +    l2_entries = (cluster_size / (2 * sizeof(uint64_t)))

Is it worth unifying these statements by writing:

l2_entries = (cluster_size / ((1 + extended_l2) * sizeof(uint64_t)))

or is that too confusing?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


