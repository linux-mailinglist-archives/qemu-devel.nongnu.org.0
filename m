Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEB36E934
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:58:13 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4N2-0000u4-Gc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc4L7-0008AE-6o
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc4L4-0002Og-8z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619693768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2b8iMJVngDXgVWnu22HhGTnQIY6cET1kTjzmXI1uC/w=;
 b=irM3q5b6tvmtNLdxeQojsuwPZdihb45s6l7Lq30X5MzszxHS7PyHosBPeCMLZzLONG6eL7
 490XTVldhqiYR6+asQVzwOkWeEdbFDAxHatSxDv/KJ7srJt1L6zJG5A6PR5HOfu5cvLPAt
 3/hy55AF8+TCt6IizBiFZSYP44GW1jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-s9_Xtqm1PG-c3w4uszOpNw-1; Thu, 29 Apr 2021 06:56:07 -0400
X-MC-Unique: s9_Xtqm1PG-c3w4uszOpNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93BD10054F6;
 Thu, 29 Apr 2021 10:56:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A24AD5DDAD;
 Thu, 29 Apr 2021 10:55:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE2E11800604; Thu, 29 Apr 2021 12:55:55 +0200 (CEST)
Date: Thu, 29 Apr 2021 12:55:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <20210429105555.kmw4is3qq72zwnvs@sirius.home.kraxel.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
 <YIqJY1Z4jqruCu17@redhat.com>
 <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
 <YIqL7dSxR/C6URkX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YIqL7dSxR/C6URkX@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> IOW, if QEMU was to be conservative, you can drop all env vars except
> the main QEMU_AUDIODRIVER.

As already mentioned above I want drop all legacy audio bits at once.

Leaving in the compatibility bits in for one or two more releases is
IMHO better than removing it partly now and the remaining bits in a
year.

take care,
  Gerd


