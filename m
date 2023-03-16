Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2126BD061
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcnG0-00042W-DG; Thu, 16 Mar 2023 09:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcnFy-000420-6U
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcnFw-0003gl-Mv
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678971775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rv/7weyITGIgh9XHuzq9wGpH0QjJJjSvb5kXrWfqWHo=;
 b=X/XYHCH8YfBcnxNkE7s6jApB8tRbtoDsWIV5MMn/lhpnRU30iS2Upt2iDbrt5E5g6uKyab
 UolSq4w57GkEg29QiKXTL85pojurMpKmh8ILtM+wGfJM15hEdCawt8WpeayJiovpzASvqg
 IGznQ2txU3arUqVV1bgTgboT3m6euSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-97jO7ZR6NzerANANhGO_zA-1; Thu, 16 Mar 2023 09:02:46 -0400
X-MC-Unique: 97jO7ZR6NzerANANhGO_zA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22625101A553;
 Thu, 16 Mar 2023 13:02:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DADAE40C6E68;
 Thu, 16 Mar 2023 13:02:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 384031801CF6; Thu, 16 Mar 2023 14:02:33 +0100 (CET)
Date: Thu, 16 Mar 2023 14:02:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>, xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: seabios 1.16.2 release tagged (was: Re: [SeaBIOS] Re: [SeaBIOS
 PATCH] xen: require Xen info structure at). 0x1000 to detect Xen
Message-ID: <20230316130233.shp5i6mto4gvvvqc@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
 <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
 <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
 <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> Ok, we have as of today two changes:
> 
>   kraxel@sirius ~/projects/seabios (master)# git log --oneline rel-1.16.1..
>   ea1b7a073390 xen: require Xen info structure at 0x1000 to detect Xen
>   645a64b4911d usb: fix wrong init of keyboard/mouse's if first interface is not boot protocol
> 
> With no changes since January and no known issues.
> I think we can safely tag the current state as 1.16.2.
> 
> I'll do that next monday (plus qemu pull request) unless
> there are objections until then.

Oops, totally forgot it.  Three days after the deadline, still no
objections raised, so I tagged the release today and uploaded the
source tarball.  qemu pull request for the update is out of the
door too.

take care,
  Gerd


