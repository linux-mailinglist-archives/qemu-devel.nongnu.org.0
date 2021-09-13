Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541E4096A2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:57:36 +0200 (CEST)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnOp-0002xT-Fc
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPn8Z-0006ge-6A
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPn8W-0001bc-Hv
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iXEUU9BQCywRrx88DdqBD1V/vbkIqgCb5LwErbiXY6Y=;
 b=Vxu53vrwRtwV8WBtPNZOwOeHORem8QH6bSw5ywypwvI7dkAfVlzXj1633K/15VPqhicUR8
 bi/vy6e3/OQm3sHIAV/RtPZSZ3u0jksQiLOajD8La2yU0p+TWwbti+PTOU2FX3mhYUtMJK
 dhg11mwGqWIOP9yqjudKZEj7BEJiLBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-FMjvLYA1PK6Unag-yLIG6Q-1; Mon, 13 Sep 2021 10:40:40 -0400
X-MC-Unique: FMjvLYA1PK6Unag-yLIG6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A469436254
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 14:40:39 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E68210013C1;
 Mon, 13 Sep 2021 14:40:35 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:40:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/22] qapi: Stop enforcing "type name should not end in
 'Kind'
Message-ID: <20210913144033.dtwtnh7moyfqixdf@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-3-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:12PM +0200, Markus Armbruster wrote:
> I'm about to convert simple unions to flat unions, then drop simple
> union support.  The conversion involves making the implict enum types
> explicit.  To reduce churn, I'd like to name them exactly like the
> implicit types they replace.  However, these names are reserved for
> the generator's use.  They won't be once simple unions are gone.  Stop
> enforcing this naming rule now rather than then.

Sounds like a good plan!

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py                      | 6 +++---
>  tests/qapi-schema/meson.build             | 1 -
>  tests/qapi-schema/reserved-type-kind.err  | 2 --
>  tests/qapi-schema/reserved-type-kind.json | 2 --
>  tests/qapi-schema/reserved-type-kind.out  | 0
>  5 files changed, 3 insertions(+), 8 deletions(-)
>  delete mode 100644 tests/qapi-schema/reserved-type-kind.err
>  delete mode 100644 tests/qapi-schema/reserved-type-kind.json
>  delete mode 100644 tests/qapi-schema/reserved-type-kind.out

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


