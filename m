Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577E3B14ED
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 09:37:54 +0200 (CEST)
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvxSK-0006MR-Oi
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 03:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvxR4-0005WB-V7
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvxR0-0005tm-Vb
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624433789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+Qc+eqfI5mB+jEgR9j1RiRcBQU3P0P6FHD7BdXoMbw=;
 b=IXJmhJleGPlOAoHOD5UX02wzdDP5VEnD3A/i6OxRfaqK/3jOyZXzfLg9LX3YC77bnSUL4M
 ncK83e2FohjCfB7+qJjpT7jMhzPBVlcfLEVcq5wpeiR4q0DkziBWscr8ajJ348KW0SXj8B
 Nb9YzWDo0fbXc3TvUPaLFY+oyQrlHNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-55MBo-A9PVycVvbJQ-RuQA-1; Wed, 23 Jun 2021 03:36:27 -0400
X-MC-Unique: 55MBo-A9PVycVvbJQ-RuQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363D85721D;
 Wed, 23 Jun 2021 07:36:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E321C5D9C6;
 Wed, 23 Jun 2021 07:36:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4539918007AD; Wed, 23 Jun 2021 09:36:12 +0200 (CEST)
Date: Wed, 23 Jun 2021 09:36:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 02/24] modules: collect module meta-data
Message-ID: <20210623073612.ysrtxtpag4wm7k7e@sirius.home.kraxel.org>
References: <eeadb47b-d35c-2608-7970-8f754a34258c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eeadb47b-d35c-2608-7970-8f754a34258c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Peter Lieven <pl@kamp.de>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Halil Pasic <pasic@linux.vnet.ibm.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 06:03:45PM +0200, Paolo Bonzini wrote:
> On 21/06/21 14:52, Gerd Hoffmann wrote:
> > ninja: error: 'libui-curses.a.p/meson-generated_.._config-host.h.o', needed by 'ui-curses.modinfo.test', missing and no known rule to make it
> > 
> > Hmm, not sure where this comes from.  meson doesn't try to link
> > config-host.h.o into libui-curses.a, so why does extract_all_objects()
> > return it?
> > 
> > Test patch (incremental to this series) below.
> 
> Bug in Meson, fix at https://github.com/mesonbuild/meson/pull/8900.  You can
> just ignore missing files.

Well, it's ninja throwing the error not the modinfo script, the script
doesn't even run ...

take care,
  Gerd


