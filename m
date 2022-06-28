Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B573B55C030
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:29:53 +0200 (CEST)
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Tg-0004Ru-Rl
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68Lw-0000Ms-CQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68Lu-0000MW-Km
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYR1HbSlcRb/ZBk6fVMzewFqp3fN04s3ilzk6XCdtQA=;
 b=OFtXcKtSeQeBntXpM/xuPSmTnZ8+vc3b0HtywHBcrtnFy+CoAZlA/uR4W5C5eNNtOk1q22
 u8HZlCd2sShdwqPrMpkjTiyHTRjUjStU2jo+vQnS9sq2ydtDAlU8VCYBpiUPCpittSJzPr
 FIGg18wDYjXqFcO9tPJVDlBo/ZEpj6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-QjuFFDdVNoi82AJ78khB1w-1; Tue, 28 Jun 2022 06:21:48 -0400
X-MC-Unique: QjuFFDdVNoi82AJ78khB1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 852CD85A582;
 Tue, 28 Jun 2022 10:21:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 929182166B26;
 Tue, 28 Jun 2022 10:21:47 +0000 (UTC)
Date: Tue, 28 Jun 2022 11:21:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Message-ID: <YrrWOAqLCvtoeu1v@redhat.com>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <Yrq3HUEghZ7IFh//@redhat.com>
 <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
 <YrrSk+HPXqCc/Jz3@redhat.com>
 <20220628061307-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628061307-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 06:16:06AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 11:06:11AM +0100, Daniel P. Berrangé wrote:
> > Ok, with that kind of size, it is definitely not something we want to
> > be committing to git either,
> 
> Not to qemu git I think.
> 
> > nor consuming via a submodule since the
> > latter would bloat the release tarballs too.
> 
> Hmm - why? We don't have to put the submodule in the tarball if we don't
> want to. People consuming tarballs probably do not need these tests
> anyway - just a basic smoketest is all that is needed.

That feels very dubious. Upstream doesnt test every scenario that users
build & run in. Especially with Fedora rawhide we've often found problems
which upstream QEMU missed, particularly where new GCC releases have bugs
causing subtle mis-compilation of code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


