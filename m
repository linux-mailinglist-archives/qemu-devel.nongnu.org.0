Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93F39DE93
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:20:11 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqG6s-0002MT-HO
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqG5b-0000qy-Mt
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqG5a-00083n-54
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623075529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71ZWee4xlvH3EI1mAkPDMvsnfVWXs+51hFr+CZszpIA=;
 b=KkKF5RnXmkAUVy02GjxJxfn6CYTBgA9th3IjcA/LcxGaZ9Qx/KG4fUaeU59LnMO4JRqvSs
 Ojrx58/6V/WORmpeDB4nCMl/XCJkgI4UuZHwQu32sE5AmUA2VHB+A1WTwFlSSRJBcTCxwI
 GpGTLezNJB1PSBcoPhivSXKkCybxS4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-ky9ZG7WcOkaRjhf3xnyPXw-1; Mon, 07 Jun 2021 10:18:44 -0400
X-MC-Unique: ky9ZG7WcOkaRjhf3xnyPXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0AFA187DCEC
 for <qemu-devel@nongnu.org>; Mon,  7 Jun 2021 14:18:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 131FB19714;
 Mon,  7 Jun 2021 14:18:36 +0000 (UTC)
Date: Mon, 7 Jun 2021 09:18:35 -0500
From: Eric Blake <eblake@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v4 1/9] qapi: replace List[str] by QAPISchemaIfCond
Message-ID: <20210607141835.jh3vevk6oqgyd5vx@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517163040.2308926-2-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 08:30:32PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Wrap the 'if' condition in a higher-level object. Not only this allows
> more type safety but also further refactoring without too much churn.

Grammar suggestion:

Not only does this provide more type safety, but it also enables
further refactoring without too much churn.

> 
> The following patches will change the syntax of the schema 'if'
> conditions to be predicate expressions, and will generate code for
> different target languages (C, and Rust in another series).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


