Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32AC4B521B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:49:37 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbjU-0006o6-0g
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJb5G-0005Ee-4O
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:08:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJb5A-00011x-En
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644844075;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+27eXGxFLSX5MMilG0EVgTZRdmi9WD7wZ/C0BaCmTY0=;
 b=AusjFyFwgNV57vKsGeoL+rgnf9OXU/3iU0GqrcjIQrL3Y+rz5ewooBkg3tV58ob34EdI7G
 5QcroATAaVyLlVHGLbCvR1YvAuYpzJso4tDMV7OsLZgBkhdScD2/yLGqdYqGNgmCyCyAuV
 SKvEiftSx7t7g2LYOIiF1FHTMEU6ZzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-q0q15N7LMvadMChWZmK31A-1; Mon, 14 Feb 2022 08:07:43 -0500
X-MC-Unique: q0q15N7LMvadMChWZmK31A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E001091DA0;
 Mon, 14 Feb 2022 13:07:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D58FA70F55;
 Mon, 14 Feb 2022 13:07:40 +0000 (UTC)
Date: Mon, 14 Feb 2022 13:07:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
Message-ID: <YgpUGOX9iJC40Sy6@redhat.com>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
 <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
 <08631A61-4E68-4A3A-99DC-56C3FDD5A780@livius.net>
 <YgpLAAztd6qNTwmm@redhat.com>
 <B37774A8-1751-4449-B84E-86FF31504B8C@livius.net>
MIME-Version: 1.0
In-Reply-To: <B37774A8-1751-4449-B84E-86FF31504B8C@livius.net>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 03:05:58PM +0200, Liviu Ionescu wrote:
> 
> 
> > On 14 Feb 2022, at 14:28, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > In a .git checkout, pkgversion defaults to "git describe --match 'v*' --dirty"
> > See scripts/qemu-version.sh
> 
> I see. I would say that this is a different use case.

That's only a default, you can set it to whatever value you want it to
be with the configure arg, if you don't like that info.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


