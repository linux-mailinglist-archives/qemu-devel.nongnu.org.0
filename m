Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1313A42B2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:06:36 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrgrr-0007c7-EQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrgqm-0006KB-7e
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrgqj-0001fV-4X
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623416724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2p/0EpdoxrFJhTSNaksyqf1xo/UK3bKfSWtaCy9TBU=;
 b=Id8fYQn5BzSrSttRfbHhDBJZfdsf+hU00EZ2DXNIhFjPnbnIJ/yU49FWikXaFVRdxNllTm
 eZZfQNfLSmk98rtJDgtKv2dwvh3Qm5JdCdJd00JckXUA13XiA7bs5gvoU5nKNw79yr2ZwP
 2oHtU8a3AIgLIJY1GxVl+eAQXJIIjKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-AywjeVoPOXCzOItm1ui70w-1; Fri, 11 Jun 2021 09:05:20 -0400
X-MC-Unique: AywjeVoPOXCzOItm1ui70w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07ADAD8B1;
 Fri, 11 Jun 2021 13:04:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE3E5D9D7;
 Fri, 11 Jun 2021 13:04:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79E7118000B2; Fri, 11 Jun 2021 15:03:21 +0200 (CEST)
Date: Fri, 11 Jun 2021 15:03:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
 <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
 <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
 <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Are there any pending patches to handle the remaining tcg dependencies
> in qemu?  When trying to build tcg modular (more than only
> tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
> referenced directly (in cpu.c, gdbstub.c, monitor, ...).
> 
> The CONFIG_TCG=n case is handled either with stubs or with #ifdef
> CONFIG_TCG, which doesn't fly for modular tcg ...

So, enough for today, to be continued next week.
Work branch pushed to
    https://git.kraxel.org/cgit/qemu/log/?h=sirius/modinfo-playground

Topmost patch doesn't compile but shows the build changes.

take care,
  Gerd


