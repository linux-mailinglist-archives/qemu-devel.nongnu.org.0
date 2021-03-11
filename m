Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DC336F2C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:48:37 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHvo-0002Xm-9N
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKHsW-00082E-3i
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKHsU-0008EB-9K
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615455909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFhLBPJSfMrqNdquCOQC04glOq2wezAHsw30+J4FjUI=;
 b=h6blvvc3EzkDo31TZ2dEhhc51LbFq0sY1E18mYmz334nJW5spyWH9M+tq9NfI4qwaSsJ4+
 CydV89W6onfmKXyL9i2vBTSqmPlRlKODlR4RE9nEDs5LmgdhNmpC4BP/pc3NVpm9cl+xjg
 hPjYZd2l1O34IKctWR35a/4jJa4bEZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-uZERIcfzPReHKp811WxnLQ-1; Thu, 11 Mar 2021 04:45:06 -0500
X-MC-Unique: uZERIcfzPReHKp811WxnLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63711940929;
 Thu, 11 Mar 2021 09:45:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3477F3CC7;
 Thu, 11 Mar 2021 09:44:59 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:44:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 4/4] blockdev: Drop deprecated bogus -drive interface
 type
Message-ID: <YEnmmT35/MYBI1qQ@redhat.com>
References: <20210311075221.1795266-1-armbru@redhat.com>
 <20210311075221.1795266-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311075221.1795266-5-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 08:52:21AM +0100, Markus Armbruster wrote:
> Drop the crap deprecated in commit a1b40bda08 "blockdev: Deprecate
> -drive with bogus interface type" (v5.1.0).
> 
> drive_check_orphaned() no longer depends on qemu_create_cli_devices().
> Call it right after board initialization for clarity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst       |  7 ------
>  docs/system/removed-features.rst |  7 ++++++
>  include/sysemu/blockdev.h        |  1 -
>  blockdev.c                       | 37 +++++++++++++-------------------
>  softmmu/vl.c                     | 11 +---------
>  5 files changed, 23 insertions(+), 40 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


