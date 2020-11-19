Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FF52B8EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:35:12 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgLP-0004DS-9V
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfgJh-0003T9-RZ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfgJf-0002t0-Mr
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605778403;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WtkzL7owD0MYjbqGz41fWl/6ICmPvrqmMdYh2frLr/U=;
 b=DoVgNh5NjrwGwT+S10wzcD+fxO6CKcIyKkiBjqE8GjUR/JNUDJ5yLxz5bjzJTO9k6J2V55
 b+LyvDp68Bq9FjVGxX6R4WVY/t4rlnLwzDxFfIvhwiK969ph6nSAiW0fytYxx2yDsoHEEI
 JmEGJXXVxNRYTLAtNdEzldljXKdhm/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-BYddQj5KPK61mCWQOOcdcw-1; Thu, 19 Nov 2020 04:33:21 -0500
X-MC-Unique: BYddQj5KPK61mCWQOOcdcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB5718957EC
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:33:20 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.ams2.redhat.com [10.36.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36D935D6AB;
 Thu, 19 Nov 2020 09:33:09 +0000 (UTC)
Date: Thu, 19 Nov 2020 09:33:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] meson: move qxl trace events to separate file
Message-ID: <20201119093307.GC579364@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119084448.24397-4-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 09:44:47AM +0100, Gerd Hoffmann wrote:
> Move qxl trace events to separate trace-events-qxl file.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl-render.c     |  1 +
>  hw/display/qxl.c            |  1 +
>  hw/display/meson.build      |  4 +++
>  hw/display/trace-events     | 67 -------------------------------------
>  hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++

FWIW, I think we should name the files to match the source prefix,
such as  'qxl.trace-events', so that a simple glob  hw/display/qxl*
will match everything for the MAINTAINERS file assignments.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


