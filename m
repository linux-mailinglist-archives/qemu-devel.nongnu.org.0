Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E4455DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:12:21 +0100 (CET)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni9E-0006YI-OO
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhxL-00077Z-Fc
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:00:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhxH-0006mV-Ul
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637243999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZQ8Gw8eq3U8J6I8ehBuiuE4Hj0ga7mrBrqStNwC1p8=;
 b=UegQwtIIUhqjnsFMyuo926Z0bYQRxziszQob9Hoz4ySF0YsnMLGh8vC/PtAyG2+3mOIrhj
 062Ns/qVp4sIGssAHyceT0D9IPNnSaGxmu5iOfL4NApZvkQUKIxpLv8+0O6ECGDbmkxvTV
 cWluvAEkWQkTxTGKgiJHk3/YFsr9BU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-lkn13yJMO2SVnwKlouut1w-1; Thu, 18 Nov 2021 08:59:53 -0500
X-MC-Unique: lkn13yJMO2SVnwKlouut1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8D71B18BC1;
 Thu, 18 Nov 2021 13:59:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AAE019D9B;
 Thu, 18 Nov 2021 13:59:37 +0000 (UTC)
Date: Thu, 18 Nov 2021 13:59:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
Message-ID: <YZZcRjJLSBJfALLQ@redhat.com>
References: <20211118122912.4051779-1-philmd@redhat.com>
 <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
MIME-Version: 1.0
In-Reply-To: <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 01:54:38PM +0100, Thomas Huth wrote:
> On 18/11/2021 13.29, Philippe Mathieu-Daudé wrote:
> > Add a page listing QEMU sponsors.
> > 
> > For now, only mention Fosshost which requested to be listed:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> ...
> > +QEMU has sponsors!
> > +
> > +For continuous integration and testing, hardware is provided by:
> > +- [Fosshost](https://fosshost.org/)
> 
> Are we finally using the server now? ... the last time I asked, it was just
> idle and we talked about returning it?

IMHO, whether we're currently using it or not is tangential.

The sponsor has granted / reserved resources for QEMU, which can have
a direct cost for them, and/or take away from what the can grant other
projects. As such we should be creditting them for giving us this grant,
even if we've not got around to using it.

If we do decide to give up any particular resources, it is a quick patch
to update this page again.

My only suggestion would be that we don't explicitly state /what/ we're
using the resource for, just that we've been granted it

IOW say something more like

    [Fosshost](https://fosshost.org/) has provided QEMU
    access to a dedicated physical compute host.

    [Microsoft](https://microsoft.com) has provided QEMU
    with credits for use on Azure Cloud.

etc

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


