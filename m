Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FB56515E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:53:14 +0200 (CEST)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IlV-0006uc-FZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Ihk-0001L9-5H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Ihh-00071R-77
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656928156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHF6+I3bdNUdgcc6Ld2ZSr8vTZm6lH/GHbLTzmH0uZY=;
 b=GOGHTZdEogHxhC7Ji3qK3LzMpk2JjImQieorMto8aBJwZqpU08jzf2LkOKbzxNewE39kaW
 V5veP0eJsCbT8OXA0VC5s9mLDkgWZ29fIVphJCkRPaxVG32U8RSmGLz7Qp1CbOa7YIjJ8b
 8y4RfPzYkR6LkiWDBKVgvdJU07Tv15s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-JgYG8SKGMZiXhM61Bt0ONA-1; Mon, 04 Jul 2022 05:49:13 -0400
X-MC-Unique: JgYG8SKGMZiXhM61Bt0ONA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFED0185A79C;
 Mon,  4 Jul 2022 09:49:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7791640E7F28;
 Mon,  4 Jul 2022 09:49:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13B2518003AB; Mon,  4 Jul 2022 11:49:11 +0200 (CEST)
Date: Mon, 4 Jul 2022 11:49:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2
 sources in the tarball anymore
Message-ID: <20220704094911.233y7qv2wsiwxyai@sirius.home.kraxel.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
 <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Also it would need more guidance on what to actually do with the
> > tarball, as if you merely unpack it into this dir, it won't work
> > as it will be one level of dirs nesting too deep for QEMU's
> > build scripts to work.
> 
> I could add some wording how to use the edk2-build.sh script with a
> downloaded edk2 tarball if that helps ... not sure whether it is really
> required, though, we also don't provide instruction for building any other
> firmware yet, as far as I know.

The instructions are printed by "make -C roms help".

We could teach roms/Makefile to either automatically fetch the sources
(be that the upstream edk2 tarball or a qemu-firmware-src tarball should
we go with the approach suggested by Daniel elsewhere in this thread),
or throw an error with instructions when they are not present.

take care,
  Gerd


