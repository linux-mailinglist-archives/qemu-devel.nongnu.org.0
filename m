Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9283A3E00
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 10:30:39 +0200 (CEST)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrcYj-0004Jz-FM
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 04:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrcXu-0003et-3n
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 04:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrcXq-0002S5-Hl
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 04:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623400176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1GOzCmgSQcG4EUtKMLCs3U0N4R3mg64PRXEkCOfSzr0=;
 b=Nu9qesFnXrGS5HLPXx4wvcBtkqHl5uSqi2+7JSnm9HVR22CVhccnfBefEJhmm8T94EMC2r
 RGadu9lSdj+P78hMgBwgzH5aRkcIhZ2wBcPxLG+jQBd4aq6JDE6m0rg0Y0qqj5R2hiV9oL
 JNKmM2zzthbMOJsmY1G105QZYA+/sSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-FjVuOAYzO1K7oc-vHiywOg-1; Fri, 11 Jun 2021 04:29:33 -0400
X-MC-Unique: FjVuOAYzO1K7oc-vHiywOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2AB80DDFA;
 Fri, 11 Jun 2021 08:29:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59B86136F5;
 Fri, 11 Jun 2021 08:29:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E248E18000B2; Fri, 11 Jun 2021 10:29:25 +0200 (CEST)
Date: Fri, 11 Jun 2021 10:29:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
 <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
 <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 09:35:42AM +0200, Paolo Bonzini wrote:
> On 10/06/21 15:12, Claudio Fontana wrote:
> > The difficulty is that accelerator code is going to be split across a
> > large number of directories.

We basically have to define the source sets at the toplevel meson.build
file, then go fill the source sets in the subdir meson.build files.

The extra indirection needed in the Makefiles (build one temporary
module per subdirectory, then go link them into the final module) is not
needed with meson.

> It should be possible to use a sourceset per target; just like there is
> target_arch, target_softmmu_arch, target_user_arch we can add
> target_softmmu_accel_arch['i386']['tcg'].

I think you can even use a single source set, then go use 

	tcg_module_ss.add(when: 'TARGET_I386', ...)

for arch-specific stuff like the files in target/i386/tcg/


Are there any pending patches to handle the remaining tcg dependencies
in qemu?  When trying to build tcg modular (more than only
tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
referenced directly (in cpu.c, gdbstub.c, monitor, ...).

The CONFIG_TCG=n case is handled either with stubs or with #ifdef
CONFIG_TCG, which doesn't fly for modular tcg ...

take care,
  Gerd


