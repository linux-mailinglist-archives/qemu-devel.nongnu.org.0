Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A014F159
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:35:19 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixaCM-00068S-QF
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ixaBX-0005bY-V5
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ixaBX-0002ci-0m
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:34:27 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:36282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ixaBS-0002CB-0I; Fri, 31 Jan 2020 12:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=h0hKCCgwSI9gOf50YJiBz2/g29liQtbm2+LZO/4hSkw=; 
 b=PgWumFFkNqYCxgGsGG+jIdMhYvmPA04wRZUsxA8Pu8aXq0j3gStQbiJDGCyocJ0pFFuVgwJ2O1eGd59IR3KUrKwwDz0+NpEHlLUYTQK5/9lUVfIN7m5xFjU8Ygc18LFP3Sse/2avfoEIAFdY6BkKjSK6NGzOhe58ChZCHyoAewafoP7OlvSEsnkCqxag0+ylCXEgwe66iulPzuG7AzVMIPE+B0ET2J0Wrb2+4/YcpbQeCRFdzDd8s0uIVIYVjAf85hbMRgJ17MdXniO20hqfiQUgDLIziXiNd3eBPTEWKLGntpAosdbbd7dffTArgU+twyShyLInYVaNVjm+UpuE4Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ixaBK-00046l-4x; Fri, 31 Jan 2020 18:34:14 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1ixaBJ-0003eG-Qb; Fri, 31 Jan 2020 18:34:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v11 2/2] docs: qcow2: introduce compression type feature
In-Reply-To: <ee6b018a-be33-ed77-c4b9-4894c685d30a@redhat.com>
References: <20200131142219.3264-1-vsementsov@virtuozzo.com>
 <20200131142219.3264-3-vsementsov@virtuozzo.com>
 <ee6b018a-be33-ed77-c4b9-4894c685d30a@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 31 Jan 2020 18:34:13 +0100
Message-ID: <w51mua3zg16.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 mreitz@redhat.com, dplotnikov@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 31 Jan 2020 03:46:12 PM CET, Eric Blake wrote:
>> +                    If the incompatible bit "Compression type" is set: the field
>> +                    must be present and non-zero (which means non-zlib
>> +                    compression type). Otherwise, this field must not be present
>> +                    or must be zero (which means zlib).
>
>             If the incompatible bit "Compression type" is set: the field
>             must be present. Otherwise, this field must not be present
>             or must be zero (which means zlib).

But "not being present" and "being zero" is equivalent (as described in
the previous commit).

And if the incompatible bit is not present then the field can be safely
ignored (i.e. whether it is zero or not is irrelevant).

Let's try again:

   Defines the compression method used for compressed clusters. All
   compressed clusters in an image use the same type.

   The value of this field should only be used when the incompatible bit
   "Compression type" is set. If that bit is unset then this field is
   not used and the compression method is zlib.

Berto

