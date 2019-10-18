Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75EDC600
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 15:27:34 +0200 (CEST)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLSI1-0003Ry-MJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 09:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iLSHF-0002xK-KX
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iLSHA-0002Zh-Qq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:26:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51508)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iLSHA-0002ZG-Kq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:26:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6199C307D986;
 Fri, 18 Oct 2019 13:26:39 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A09360BF1;
 Fri, 18 Oct 2019 13:26:38 +0000 (UTC)
Subject: Re: [PATCH v5 4/5] tests/qapi-schema: Cover feature documentation
 comments
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191018081454.21369-1-armbru@redhat.com>
 <20191018081454.21369-5-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <52709eb2-9dfb-3310-4cb2-a1cc47ea9825@redhat.com>
Date: Fri, 18 Oct 2019 08:26:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191018081454.21369-5-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 18 Oct 2019 13:26:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: kwolf@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/19 3:14 AM, Markus Armbruster wrote:
> Commit 8aa3a33e44 "tests/qapi-schema: Test for good feature lists in
> structs" neglected to cover documentation comments, and the previous
> commit followed its example.  Make up for them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> @@ -227,6 +241,14 @@ If you're bored enough to read this, go see a video of boxed cats

Meow.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

