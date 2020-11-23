Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372A2C04AF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:39:58 +0100 (CET)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khACK-00029W-6b
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khABE-0001dn-Nb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:38:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khABC-0000w8-4i
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606131524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceXHnpMFAIEfnICYznU0YFkRpzZs9/e26jExtOOGnBM=;
 b=XDBeHku4JR/lV2TeXHm/Jt/DtL+Z0CN2gQCr6N6oi6JewJOTOwSba9JQgcT9BseihbZzmS
 Vlxg3wJ7iBJ/v8NulcDvF6nQ+bhg4pbyPFouLMOYMlxycEwnJkO22MXnCy+UCw274Fu9bs
 sJVWbuIR/eHxP4ZlxcgeMTrGD1PNtdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-FbPZUam6O_OQCxRlO3piHQ-1; Mon, 23 Nov 2020 06:38:42 -0500
X-MC-Unique: FbPZUam6O_OQCxRlO3piHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B3B7800050
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 11:38:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4095D6D3;
 Mon, 23 Nov 2020 11:38:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 670B717532; Mon, 23 Nov 2020 12:38:37 +0100 (CET)
Date: Mon, 23 Nov 2020 12:38:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201123113837.mru62xhprlgoyi6u@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
 <389b0932-794c-536f-4e8d-3f91ef7fb3ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <389b0932-794c-536f-4e8d-3f91ef7fb3ba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> You could build a separate dictionary in trace/meson.build.  Instead of
> using the 'hw_display_qxl' group, you use the module name i.e.
> 'hw-display-qxl'.  trace/meson.build does:
> 
>   module_trace = {}
> 
> and in trace/meson.build
> 
>   module_trace_src = []
>   foreach c : ...
>     ...
>     group = '--group=' + c['name'].underscorify()
>     module_trace_src += [trace_h, trace_c]
>     ...
>     module_trace += { c['name']: module_trace_src }
>   endforeach
> 
> Then when building the shared_module you add the trace files to the sources,
> like
> 
>    module_trace_src = module_trace.get(d + '-' + m, [])
>    sl = static_library(d + '-' + m,
>                        [genh, module_ss.sources(), module_trace_src],
>                        dependencies: ...)

So basically keep track of the objects separately.  Got that working
for the modular builds.  Progress!!!

Non-modular builds fail due to missing qxl tracepoints.  Tried to fix
that with a simple 'softmmu_ss.add(module_trace_src)'.  Now I get:

../../meson.build:1802:2: ERROR: Object extraction arguments must be strings or Files.

/me looks surprised.  Doing trace_ss.add(module_trace_src) in
trace/meson.buikd works just fine ...

Branch available at git://git.kraxel.org/qemu sirius/trace-modules


Running "qemu -device qxl" segfaults.  Not investigated yet, but I guess
this is just modular tracepoint not being properly initialized.  Will
check later, have to run pick up my daughter now.

take care,
  Gerd


