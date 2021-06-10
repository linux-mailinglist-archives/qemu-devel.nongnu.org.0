Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20153A2D87
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:55:45 +0200 (CEST)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrL9t-0008Vh-0r
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrL8x-0007aL-Cs
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrL8v-0000rU-R9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623333285;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NORYwI8WiyHWiaxnDKJ75v1HARGCAy5M+RZIR6oqI8=;
 b=B/XiYBIEF+euOivhHIYYf2u0qppNpyqRQD4sIJ0d9m8hsdAbdzXt7Ni36ZLmZxa3SueIVj
 GiA1UFCXwDK4xxGbyX/M9znAwfMiKQracC96fW3NnNcVQxk/aV34S9iGTdEPtxied0oNF/
 DhMu/8C/UAD0ZVOwEUmsN0CnzxSNJjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-GXPnuoYoO7yW-yvrFjWLGw-1; Thu, 10 Jun 2021 09:54:44 -0400
X-MC-Unique: GXPnuoYoO7yW-yvrFjWLGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48330948
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:54:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5614100238C;
 Thu, 10 Jun 2021 13:54:41 +0000 (UTC)
Date: Thu, 10 Jun 2021 14:54:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/11] qemu-option: remove now-dead code
Message-ID: <YMIZnvndcqC3R/s/@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-6-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610133538.608390-6-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 03:35:32PM +0200, Paolo Bonzini wrote:
> -M was the sole user of qemu_opts_set and qemu_opts_set_defaults,
> remove them and the arguments that they used.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/option.h       |  3 ---
>  tests/unit/test-qemu-opts.c | 35 -------------------------
>  util/qemu-option.c          | 51 ++++++++-----------------------------
>  3 files changed, 10 insertions(+), 79 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


