Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE51533C2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 16:22:13 +0100 (CET)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izMVH-0003Rl-Ui
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 10:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izMTk-0002aU-NQ
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izMTi-0007yP-FS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:20:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46131
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izMTi-0007tH-BS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 10:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580916033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlcW5MVWTEq1dUCxmA3tA0IUQ9gbnD+7acrBaSq0XYA=;
 b=Z7HYStnCgeZgZYvovKrfCSmRa+2aIRkUQ6MwnjO1o2IflVn97RNy7StK5gvgEKAzN21ezQ
 dJ3RHJeZzSkIFGQ0CLAr4keA5Gqsd9fI4Kf0+UI2Mbje9Kb1SULm24lVuECfNwPX8G0qdr
 PdWm4RgLDcj7y0mIJT5zaJsTEICWU0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-E2aBk0y5Naiu4I4rqvJBVA-1; Wed, 05 Feb 2020 10:20:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D821137842;
 Wed,  5 Feb 2020 15:20:28 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3BAB86CCC;
 Wed,  5 Feb 2020 15:20:27 +0000 (UTC)
Subject: Re: [PATCH v2 02/33] block: Rename BdrvChildRole to BdrvChildClass
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-3-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <940680f8-82fd-d07c-5a9d-0e04d01e786a@redhat.com>
Date: Wed, 5 Feb 2020 09:20:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204170848.614480-3-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: E2aBk0y5Naiu4I4rqvJBVA-1
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/20 11:08 AM, Max Reitz wrote:
> This structure nearly only contains parent callbacks for child state
> changes.  It cannot really reflect a child's role, because different
> roles may overlap (as we will see when real roles are introduced), and
> because parents can have custom callbacks even when the child fulfills a
> standard role.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

Looks mechanical, and the new name makes sense for the upcoming patches.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


