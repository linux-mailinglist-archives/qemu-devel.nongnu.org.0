Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B6332CED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:11:47 +0100 (CET)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfta-0001z2-Lv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJf0l-0003i8-VF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJf0e-0000Yr-LA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306499;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3FKtfpjKTV1FW0+lJnyvENyYGjBU+HifjdyBhGoH2w=;
 b=X7j8xkPQo58JGZYmYrwXol8ZgabEx1XqUADrbfFRlVJ2Y7FevO4i8NQuI6if/3GdaZoVSE
 auCYkkOqs5VPETA2SMMLVuMTex6FnXlaoauaAbz6UWpWAGGe/Co+O3BmB3YeN8y5ZNfSjQ
 XrmLgC8m1H5HW4/rogxgV28Lr6W8/Cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-O_Zt5whONraadAXQr7wBgA-1; Tue, 09 Mar 2021 11:14:58 -0500
X-MC-Unique: O_Zt5whONraadAXQr7wBgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBB19804330;
 Tue,  9 Mar 2021 16:14:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6356A034;
 Tue,  9 Mar 2021 16:14:51 +0000 (UTC)
Date: Tue, 9 Mar 2021 16:14:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 2/4] fdc: Drop deprecated floppy configuration
Message-ID: <YEee+WKxbVhwmljZ@redhat.com>
References: <20210309161214.1402527-1-armbru@redhat.com>
 <20210309161214.1402527-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309161214.1402527-3-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 05:12:11PM +0100, Markus Armbruster wrote:
> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> configuring floppies with -global isa-fdc" (v5.1.0).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst       |  49 ---
>  docs/system/removed-features.rst |  49 +++
>  hw/block/fdc.c                   |  54 +--
>  tests/qemu-iotests/172           |  31 +-
>  tests/qemu-iotests/172.out       | 562 +------------------------------
>  5 files changed, 53 insertions(+), 692 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


