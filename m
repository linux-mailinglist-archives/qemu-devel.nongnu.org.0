Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26E3BF14F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:19:32 +0200 (CEST)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ex9-0007jP-MQ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1EvV-0005eV-LB
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1EvT-0004hd-Rn
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625692666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMY5AebpKqIfvDcAU4yB5w07PjglgqG2Tf5YFF+esdQ=;
 b=Y3kecnjgVNivAVdplRS7HOjtz/GACAM05mJC9uAn+Tx9YuctmOTC34XHBvlv6+FotruSDB
 dZWEMpgjlzwlkx/5ud7IaIJrBd6CW8edC4x1ipIDXM+j34T9gtKtRvCnAO7ODRsurWUPyy
 +BdilqVY7UAcr3rJrPp5QQBs81vlySo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-9JzLXgQCMSO0qzO8Cbw2ig-1; Wed, 07 Jul 2021 17:17:45 -0400
X-MC-Unique: 9JzLXgQCMSO0qzO8Cbw2ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B358042F3;
 Wed,  7 Jul 2021 21:17:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7523B5D6A8;
 Wed,  7 Jul 2021 21:17:40 +0000 (UTC)
Date: Wed, 7 Jul 2021 16:17:38 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Remove deprecated qemu-img backing file without format
Message-ID: <20210707211738.ioegdvuk3wjyohu7@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210503213600.569128-1-eblake@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: libvir-list@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 04:35:58PM -0500, Eric Blake wrote:
> We've gone enough release cycles without noticeable pushback on our
> intentions, so time to make it harder to create images that can form a
> security hole due to a need for format probing rather than an explicit
> format.
> 
> Eric Blake (2):
>   qcow2: Prohibit backing file changes in 'qemu-img amend'
>   qemu-img: Require -F with -b backing image

Ping.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


