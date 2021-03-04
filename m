Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B032D139
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:56:12 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHleN-0000Jk-M0
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHldA-0008Go-Q8
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:54:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHld8-0002Ef-SL
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Lm5lCYvLUT9jcJRdMsTLrDGbkt0S4wSJAuCcoi0Agc=;
 b=VxrIDGAJM19FAHP51QKoCX44/jiIhXd6Wwf8q1+AFcuof37BSsonX9+lPtATwvSBY2tpkA
 bh46ppQ5Owof9d0CDI8iXcNwTYj4S9luBDUzVXLi8KovLecQZmn+hF5h4nZg06uRNLHJMa
 XKMYn2XtLyzazBKAl8b6GlVSoUH9aKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-dJYOK2dePIi9ACMuhDBPcA-1; Thu, 04 Mar 2021 05:54:51 -0500
X-MC-Unique: dJYOK2dePIi9ACMuhDBPcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4A8C1932483
 for <qemu-devel@nongnu.org>; Thu,  4 Mar 2021 10:54:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F053B614F5;
 Thu,  4 Mar 2021 10:54:49 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:54:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qemu-option: do not suggest using the delay option
Message-ID: <YEC8dzjw30mokDXl@redhat.com>
References: <20210304102827.106522-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210304102827.106522-1-pbonzini@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Mar 04, 2021 at 11:28:27AM +0100, Paolo Bonzini wrote:
> The "delay" option was a hack that was introduced to allow writing "nodelay".
> We are adding a "nodelay" option to be used as "nodelay=on", so recommend it
> instead of "delay".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         This is quite ugly, so I am posting it as RFC in case others
>         have better idea.  Nevertheless, a proper deprecation of "delay"
>         cannot be done if QEMU starts suggesting it, and since it's the
>         only case I opted for this very much ad-hoc patch.

It is ugly, but this is a rare enough edge case that I think we can live
with it.

> ---
>  docs/system/deprecated.rst | 6 ++++++
>  util/qemu-option.c         | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


