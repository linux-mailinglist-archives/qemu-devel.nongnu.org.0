Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5F4D8C07
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:04:16 +0100 (CET)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpzL-0007mp-Js
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:04:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTpxn-0006O5-Fg
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTpxl-0004g9-Um
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647284556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=05QEhzcNZBs0qVmJtujjBWsIq9B7j8vdOOjg+9QbHX0=;
 b=SG7s60/7EtAHt4uAXHQnAiBBLwS/zcizrS5IUEJ+Zxmj5Vw6eeE0Ui9zyAplCZCLqxeauf
 rTpp/HAhp2jOSzq8NZD4D+RXPASvMvetsJQ8A5ngD+880AOJXVdEgN7EeKDMIsViGQrBaJ
 oNT9J0OQ2fij583c7g/iqVrMUnj3rvE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-XNoz7wUpNb-iI6s9OiUyeA-1; Mon, 14 Mar 2022 15:02:33 -0400
X-MC-Unique: XNoz7wUpNb-iI6s9OiUyeA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DEA5380390E;
 Mon, 14 Mar 2022 19:02:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABE37BA720;
 Mon, 14 Mar 2022 19:02:30 +0000 (UTC)
Date: Mon, 14 Mar 2022 19:02:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] ppc: Include asm/ptrace.h for pt_regs struct definition
Message-ID: <Yi+RROpNYGqbwdyp@redhat.com>
References: <20220314172508.816110-1-raj.khem@gmail.com>
 <edb07e42-fbe0-2eed-48cb-adeade84d416@gmail.com>
 <CAFEAcA8bKnYQ4KroudyEowv-7A+ru6A6RTrRVgjqbtEafrPJnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8bKnYQ4KroudyEowv-7A+ru6A6RTrRVgjqbtEafrPJnQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 06:06:40PM +0000, Peter Maydell wrote:
> On Mon, 14 Mar 2022 at 17:59, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
> > I am intrigued about why we didn't hit this before, especially considering that ppc64 header is just a
> > pointer to this file.
> 
> It's specific to musl, which does different things with its
> system includes than glibc does.

And while we have CI testing for QEMU with Alpine that uses musl, this
is only x86_64 host. IOW we don't have CI coverage of ppc64 host
with musl, only glibc

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


