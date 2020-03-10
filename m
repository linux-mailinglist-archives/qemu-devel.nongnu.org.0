Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78717F742
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 13:18:42 +0100 (CET)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBdqL-0002Nz-QZ
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 08:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jBdp5-0001fX-4r
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:17:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jBdp4-00085I-35
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:17:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37006
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jBdp3-00082x-VP
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583842641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qbG4EQogvlHtWuSYo87UF41tspiGLjwws+yPlc51Lk=;
 b=BNJHs5ULNk4/78VmdsKxKbeim7DTJUnqEY6d1/duxAGOR6Wdi4yMBkB77HcXleCXZ3ELMa
 /PPRLcwQi6+iRrPaaZNZhDkDMiA7+lmTrg48ta+g5e9pE2Y0K2BmrYu0AYopBeBJxqnYRi
 vUXDJJrC0o4L5nd57fExpUw2xAEV3Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ovJkEFmCOpWCxdPU4b3OwA-1; Tue, 10 Mar 2020 08:17:19 -0400
X-MC-Unique: ovJkEFmCOpWCxdPU4b3OwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E1A109ADF6;
 Tue, 10 Mar 2020 12:17:18 +0000 (UTC)
Received: from [10.3.116.177] (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919D91001DDE;
 Tue, 10 Mar 2020 12:17:15 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] qemu-img: Deprecate use of -b without -F
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20200306225121.3199279-1-eblake@redhat.com>
 <20200306225121.3199279-5-eblake@redhat.com> <20200309153119.GA20640@paraplu>
 <11ba06c9-fa1e-3168-0322-1859040b655e@redhat.com>
 <20200310105746.GD22884@paraplu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ddfa07b4-d56a-d99d-1d29-ccb5926cf21c@redhat.com>
Date: Tue, 10 Mar 2020 07:17:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310105746.GD22884@paraplu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/20 5:57 AM, Kashyap Chamarthy wrote:
> On Mon, Mar 09, 2020 at 10:42:25AM -0500, Eric Blake wrote:
> 
> [...]
> 
>>>> +qemu-img backing file without format (since 5.0.0)
>>>> +''''''''''''''''''''''''''''''''''''''''''''''''''
>>>> +
>>>> +The use of ``qemu-img create``, ``qemu-img rebase``, ``qemu-img
>>>> +convert``, or ``qemu-img amend`` to create or modify an image that
>>>> +depends on a backing file now recommends that an explicit backing
>>>> +format be provided.
> 
> Also for the `qemu-img amend` case, I'm not clear if the following scenario
> ought to throw the warning:
> 
>      $> ~/build/qemu/qemu-img info --backing-chain overlay1.qcow2
>      image: overlay1.qcow2
>      file format: qcow2
>      virtual size: 4 GiB (4294967296 bytes)
>      disk size: 196 KiB
>      cluster_size: 65536
>      backing file: base.raw
>      Format specific information:
>          compat: 1.1
>          lazy refcounts: false
>          refcount bits: 16
>          corrupt: false
>      
>      image: base.raw
>      file format: raw
>      virtual size: 4 GiB (4294967296 bytes)
>      disk size: 778 MiB
> 
>      $> ~/build/qemu/qemu-img amend -o compat=v3 overlay1.qcow2

This particular amend is not changing the backing file, and since I did 
not add warnings on the opening of an existing unsafe image, it is 
silent.  Instead, you need to test a case where amend provokes a path 
that would change the backing file (perhaps as simple as '-o 
backing_file=./base.raw'), while omitting a format for the new backing 
file string.

> 
>      $> echo $?
>      0
> 
> I'm just trying to work out the scenarios where the warnings ought to
> show up (for all the four cases: create, rebase, convert, amend).
> 
> [...]
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


