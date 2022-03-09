Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F42B4D2E38
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:37:55 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRude-0004oZ-9h
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:37:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRuM2-0008Q9-0S
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRuLy-0006us-8p
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646824776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uP+Zzl77GQNj1tuVv1MjQEBYR9SZ6cUPwaL6iEUy97o=;
 b=Hn/OMcVCI4htN5yPDlAyuanNph8YS/z6q+57N/gw7GaGjDDnAIdq4+OYcaDELRwVwA5dBX
 Vyr6ZNF1AAfr6j/kkF/UCEA2By2dgS2eYMsSEHdCF3PmVPXzUXs0Z5erXvPO0W3H3N3x8O
 SLp4t4bzdJ97VotRbxqluDvZL9GO1kQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-seapXCPiMnWucMGJwZvvbA-1; Wed, 09 Mar 2022 06:19:34 -0500
X-MC-Unique: seapXCPiMnWucMGJwZvvbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738AA801AEB;
 Wed,  9 Mar 2022 11:19:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AB7322DE9;
 Wed,  9 Mar 2022 11:18:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 002871800098; Wed,  9 Mar 2022 12:18:53 +0100 (CET)
Date: Wed, 9 Mar 2022 12:18:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Message-ID: <20220309111853.ud7tt4nba2vy2xyr@sirius.home.kraxel.org>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-12-kraxel@redhat.com>
 <cd9a9fda-7187-0601-49ca-20c649ba6cfa@gmail.com>
 <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
 <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Joelle van Dyne <j@getutm.app>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Any chance you can take over the macos support bits in return?
> 
> I suppose you mean the "Core Audio framework backend" section?

cocoa too.

> There is indeed a need for macOS host support maintenance, as patches
> hang on the list until Peter finally takes them via the arm tree.
> 
> Not sure what you have in mind. I'm totally new to the macOS/Darwin
> world, and have no choice but to use it as primary workstation and
> for CI builds, so I can help with overall testing / maintenance.

Having test hardware is more than I have ;)

Also it seems you have collected stuff from the mailing list
in your macos host patch series.  If that isn't maintenance,
what is it?

I have only a virtual machine.  Updating that is a major PITA,
it's stuck at macos 10 so increasingly useless for builds and
testing, havn't booted it for months.

So I'm sitting here looking at the patches where I often simply
can't justify whenever they are correct or not because I'm not
familiar with the macos thread model, macos app bundles etc.

My maintenance model for macos bits is basically sit & wait, now
and then scan my mail folder for patches & reviews, then trying
to figure what is ready for merge based on the review comments.
On top of that I'm often busy with ekd2 stuff so patches can sit
for quite a while on the list.

This isn't that great for neither me nor the people submitting
patches ...

take care,
  Gerd


