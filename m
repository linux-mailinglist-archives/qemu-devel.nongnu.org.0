Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A93A2C73
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:05:37 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKNM-0001mk-Is
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrKML-0000Kw-97
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrKMH-0001kT-75
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kHok0zVcFaULJVmERUXLF8x/VT5RzBu3yHjD+0DtsBM=;
 b=d048q9pV5xV39zhG8UrYUmtG/VVdLAJT3S/Xtr6zN/M31mCfe5ybLm7xY667Rk4pvIMJTQ
 cBOC6dvas+McK+ftfa9DHqabZKrn5IO3OD9gSX1r9Wdm4xImGm0r6bC6WUaUJYXV6L3xs3
 GITaA13fwzhSdgNEx8wadkgnXmOU6Kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-0TW715mVPEqF0RH-eRFSvQ-1; Thu, 10 Jun 2021 09:04:27 -0400
X-MC-Unique: 0TW715mVPEqF0RH-eRFSvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66DCA100C619
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:04:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3218819C46;
 Thu, 10 Jun 2021 13:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C81C18000B2; Thu, 10 Jun 2021 15:04:24 +0200 (CEST)
Date: Thu, 10 Jun 2021 15:04:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610055755.538119-4-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi Paolo,

> +if config_host.has_key('CONFIG_MODULES')
> +   qemu_modinfo = executable('qemu-modinfo', files('qemu-modinfo.c') + genh,
> +                             dependencies: [glib, qemuutil], install: have_tools)
> +   custom_target('modinfo.json',
> +                 input: [ softmmu_mods, block_mods ],
> +                 output: 'modinfo.json',
> +                 install: true,
> +                 install_dir: qemu_moddir,
> +                 command: [ qemu_modinfo, '.' ])
> +endif

I have trouble with this one.  Tried to declaring the modules as "input"
to make sure meson will only run qemu-modinfo when it is done building
the module.  But now and then I get build errors because qemu-modinfo
runs in parallel to a module build and qemu-modinfo throws an read error
because of that.

Any clue what is going on here?

thanks,
  Gerd


