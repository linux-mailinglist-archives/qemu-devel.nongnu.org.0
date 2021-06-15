Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D534F3A7EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:09:23 +0200 (CEST)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt8ok-0007hk-Dx
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt8n1-0006Lt-Bj
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt8mq-00004w-1Q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623762442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hz3TLQzMBpaz8kz8+jSfkj1xQJEN8A2KNd61U+sR5ss=;
 b=UafcgE79qUgrnumDDlIIDnqKqZnJ+0Kje1QLbPW441MJf12OvpjCEfA7/lMXzP7LqKTNNX
 0XEKg7jqFJlez7I6Y7+ZcqQH7EWLq5v+UlR4lDiBKWggxKHrA8HDw3q03GgL1cq4XpODZ+
 w6b0rEy1Rkk09QadgX48TF0sEDoJQew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Woi_QbYjN8yB7Ar5v1iPFg-1; Tue, 15 Jun 2021 09:07:19 -0400
X-MC-Unique: Woi_QbYjN8yB7Ar5v1iPFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90EF31084F40
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 13:07:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0844360BD9;
 Tue, 15 Jun 2021 13:07:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 762EF18000B2; Tue, 15 Jun 2021 15:07:15 +0200 (CEST)
Date: Tue, 15 Jun 2021 15:07:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210615130715.lye3spkpa24x3pyj@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
 <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
 <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > A Python script could parse compile_commands.json, add -E -DQEMU_MODINFO to
> > > the command-line option, and look in the output for the metadata.
> > 
> > Hmm, worth trying, although I guess it would be easier to code this up
> > straight in meson.build and pull the information you need out of the
> > source set, especially as you'll know then which source files are
> > compiled into which module.
> 
> Hmm, looks like I actually need both.  Seems there is no easy way to get
> the cflags out of a source_set to construct a cpp command line.  Pulling
> this out of compile_commands.json with jq works though.

Well, easy until I look at target-specific modules where the
"source file" -> "command" mapping isn't unique any more.  Which makes
this route less attractive ...

Any idea on getting the cflags in meson.build  Or maybe I can somehow
ask meson to run the cpp pass only for a given source set?

thanks,
  Gerd


