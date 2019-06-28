Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6C59E35
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 16:50:11 +0200 (CEST)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgsCZ-0000a0-4i
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 10:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hgs7P-0007Ha-Ne
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hgs7J-0001m0-IO
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:44:47 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:53729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hgs7D-0001L1-6M; Fri, 28 Jun 2019 10:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=NcUbM9984pbjJlVasx6XD0wguXm8y4bqum3ErVZ6oPw=; 
 b=REUPQCrMcAsBzIhE12xyYYI2yklM1Za/vWfHsq8lO5jSgeQjG9mHuO9K8K1BK3wyRnDMsf2INc3ccM+Wcmni3yfvOmkwTfrLwuXI4ZxgZFsUahVoAY3Wc3qvAUigPrUPsZtiaKIaEAJn/62QMBwwq+yQgM0o3fxxX3OOA3G4t5jGdI8yBCNh7Ky1NrK9k5soyCrW+75UvFLBJrhM6BuLFpvv1D0nBVP8ZbVSl6QI1932wKNtaOydOR/hLBvabkaNM9Xi6kBNzlUFk8k5QwvgBJyiGQ2x50GqTUYXfbRRS+Sz0XBU21LOAfjTZEoOFa1xuEDykedbHMkhqWU4Z9RfnQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hgs6T-00059A-4P; Fri, 28 Jun 2019 16:43:53 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hgs6T-0002Za-1s; Fri, 28 Jun 2019 16:43:53 +0200
From: Alberto Garcia <berto@igalia.com>
To: Denis Lunev <den@virtuozzo.com>,
 "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <434b102d-9d8e-ccc2-cb53-7f49a3fbd6fb@virtuozzo.com>
References: <20190627135914.xlzohrdwr6mz2aq3@perseus.local>
 <4453cfc4-cff7-c004-1f4c-7cab462e4661@virtuozzo.com>
 <w51a7e3domn.fsf@maestria.local.igalia.com>
 <434b102d-9d8e-ccc2-cb53-7f49a3fbd6fb@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 28 Jun 2019 16:43:53 +0200
Message-ID: <w51r27dixcm.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [RFC] Re-evaluating subcluster allocation for
 qcow2 images
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 27 Jun 2019 06:05:55 PM CEST, Denis Lunev wrote:
>>> Thus in respect to this patterns subclusters could give us benefits
>>> of fast random IO and good reclaim rate.
>> Exactly, but that fast random I/O would only happen when allocating
>> new clusters. Once the clusters are allocated it doesn't provide any
>> additional performance benefit.
>
> No, I am talking about the situation after the allocation. That is the
> main point why I have a feeling that sub-cluster could provide a
> benefit.
>
> OK. The situation (1) is the following:
> - the disk is completely allocated
> - QCOW2 image size is 8 Tb
> - we have image with 1 Mb cluster/64k sub-cluster (for simplicity)
> - L2 metadata cache size is 128 Mb (64 Mb L2 tables, 64 Mb other data)
> - holes are made on a sub-cluster bases, i.e. with 64 Kb granularity
>
> In this case random IO test will give near native IOPS
> result. Metadata is in memory, no additional reads are
> required. Wasted host filesystem space (due to cluster size) is kept
> at minimum, i.e. on the level of the "pre-subcluster" QCOW2.
>
> Situation (2):
> - 8 Tb QCOW2 image is completely allocated
> - 1 Mb cluster size, 128 Mb L2 cache size
>
> Near same performance as (1), but much less disk space savings for
> holes.
>
> Situation (3):
> - 8 Tb QCOW2 image, completely allocated
> - 64 Kb cluster size, 128 MB L2 cache
>
> Random IO performance halved from (1) and (2) due to metadata re-read
> for each subsequent operation. Same disk space savings as in case (1).

If I understood correctly what you are trying to say, subclusters allow
us to use larger cluster sizes in order to reduce the amount of L2
metadata (and therefore the cache size) while keeping the same space
benefits as smaller clusters.

> Please note, I am not talking now about your case with COW. Here the
> allocation is performed on the sub-cluster basis, i.e. the abscence of
> the sub-cluster in the image means hole on that offset. This is
> important difference.

I mentioned the possibility that if you have a case like 2MB / 64KB and
you write to an empty cluster then you could allocate the necessary
subclusters, and additionally fallocate() the space of the whole cluster
(2MB) in order to try to keep it contiguous.

With this we would lose the space saving advantage of having
subclusters. But perhaps that would work for smaller cluster sizes (it
would mitigate the fragmentation problem).

Berto

