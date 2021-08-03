Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D73DF40A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:43:23 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyRm-000465-4d
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAyPS-0001iB-5W
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAyPP-0004HE-Pa
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628012454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R0NI2lKz/7fslopx4ONlYEZefGd3H5jormpNXS7xvFE=;
 b=XViXFuO8DJQuWcmRet+oZECA9SwFwmhD2oyp7fbp/5m17TddeabVe7SculiQ52eoQRlqya
 4fGSKR/HYraGqFnLlA3IE7xRcTGxeYmB/MckoTEtyxIFiyk4mWE6miVloc9pCEaQylTS9M
 NTVotBBcZH4PtoqMF63QZBhqoLmwGo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-XjhynuHsNQex-IBRhfbcgQ-1; Tue, 03 Aug 2021 13:40:53 -0400
X-MC-Unique: XjhynuHsNQex-IBRhfbcgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350AB190D340;
 Tue,  3 Aug 2021 17:40:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-4.phx2.redhat.com [10.3.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC4F19C44;
 Tue,  3 Aug 2021 17:40:44 +0000 (UTC)
Date: Tue, 3 Aug 2021 12:40:43 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 02/24] python/aqmp: add error classes
Message-ID: <20210803174043.cncgw62hfsdckwua@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-3-jsnow@redhat.com>
 <20210803160129.e63u5lylorivgjov@redhat.com>
 <CAFn=p-aeLwTwhUzEMS9RM4jV8udFg4huKXN3v9QEn8gRG+t9vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aeLwTwhUzEMS9RM4jV8udFg4huKXN3v9QEn8gRG+t9vw@mail.gmail.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 01:34:32PM -0400, John Snow wrote:
> Got it. I was *just* about to send a refreshed version of this patchset
> because I found a new bug while on my way to making a sync compatibility
> shim for iotests -- Do you have more feedback cooking, or should I hit the
> send button?

I spotted another typo while browsing the web page (disconnect() "If
there were was an exception"), but I'm fine if you re-send, and I'll
resume looking at the series on the updated v3.  For 1-6, you can add:

Reviewed-by: Eric Blake <eblake@redhat.com>

although my python is weak enough that you may want another set of
eyes as well.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


