Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA524F221
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 07:24:48 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA4yN-0003cJ-J6
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 01:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kA4xP-0003BC-3l
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 01:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kA4xM-00008z-Va
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 01:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598246623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BaF8NZECiIkufdHbMrsVKZVMDg4OKC++D7VVshCbCTk=;
 b=JB5LpkNQtTg2v3K7CtFu492pJ1lWfbMBrxsYdTuGgYkJy4wincpnuHEDU8t5Uo1uj09t0/
 MLunpHf4N4uoWrG37s2vZxxBigqxJiEdB0HnFm4dPe6zMx4uhGEpIpKZfY4HGDaUnYe3a9
 MjYPg0F4MOPkHa1hoDD6KF23wC2h++s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-KR37XZI_PzO7RIAnDoxSkg-1; Mon, 24 Aug 2020 01:23:41 -0400
X-MC-Unique: KR37XZI_PzO7RIAnDoxSkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5429B10059A4;
 Mon, 24 Aug 2020 05:23:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29CE07E69B;
 Mon, 24 Aug 2020 05:23:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 311ED17538; Mon, 24 Aug 2020 07:23:36 +0200 (CEST)
Date: Mon, 24 Aug 2020 07:23:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 1/2] meson: convert pc-bios/keymaps/Makefile
Message-ID: <20200824052336.gt7ycmo7wf6q5e2m@sirius.home.kraxel.org>
References: <20200821160752.1254102-1-philmd@redhat.com>
 <20200821160752.1254102-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200821160752.1254102-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 01:23:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -25,3 +25,4 @@ if 'DECOMPRESS_EDK2_BLOBS' in config_host
>  endif
>  
>  subdir('descriptors')
> +subdir('keymaps')

Hmm, this hooks up the keymaps update to the default build.
Not a good plan.  The output is not static, but defaults on
the libxkbcommon version you have installed.  So I end up with
a dirty tree now after each build.

I guess we should either return to the traditional behavior of not
building keymaps by default and have a "make keymaps" or similar for
keymap updates.  Or write the generated maps to the build tree not
the source tree.

take care,
  Gerd


