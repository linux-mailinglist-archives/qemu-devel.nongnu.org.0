Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AA4B8661
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:03:35 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI5u-0000MV-Av
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKI1I-0006Cg-3d
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKI10-0002ug-JZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDZmHyVlBY6FD5AdT7VXJPWd8ML0bOfHnRYm3D9PhNE=;
 b=HsOISpvFe8YqLiEpFAUpbI1/+ZjCaYgSo7BekS9XJxw1qnXJS15mez5JfY3nthM3ea2N7T
 Gb5oLKr+bnIb+SPTzZaY7qUAS716PE186KfEzIjJBahQbN+0f2gK/NysSuK/idd4cxYc5P
 1awIuY4SlHAFYvF1Gfm9sLIrnOgUIZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-7C_ZvQA_P9uoW86NdewIXA-1; Wed, 16 Feb 2022 05:58:26 -0500
X-MC-Unique: 7C_ZvQA_P9uoW86NdewIXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69941344B0;
 Wed, 16 Feb 2022 10:58:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 464CF1084182;
 Wed, 16 Feb 2022 10:58:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C32DC1800617; Wed, 16 Feb 2022 11:58:08 +0100 (CET)
Date: Wed, 16 Feb 2022 11:58:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgvtLmoJcv+ZSW1S@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, thuth@redhat.com, mst@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,
 
> Given the semantic differences from 'i440fx', changing the default
> machine type has effects that are equivalent to breaking command
> line syntax compatibility, which is something we've always tried
> to avoid.

And if we are fine breaking backward compatibility I'd rather *not* pick
a default, effectively making -M $something mandatory, similar to arm.

take care,
  Gerd


