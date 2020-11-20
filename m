Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6372BA75B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:16 +0100 (CET)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3cN-0001o8-MJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg3aI-0000wb-4K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg3aG-0001ao-AO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605867843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2q1hAh23bmwcMvGGHsnTcWga6Oe2a3hBQdGMUVfh2ZE=;
 b=ikqP8YC1/jI7/WAWfQtbOJ4rYLqBJ1puikvVvbBcpHVmMCsjT1lZf3Q2UnRGKzwh61sggP
 vk9YAhZo6zyXcujX6IuwXBI5EsIKEG6Klv8RzwgiWBHggwHfgTjDTdW3mn8Qy1ZREaQWuM
 FX5rAyvi4B1POODf6Hz6QRjqaxizqHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-iQSFNbqJNSunslq7y_Mt8g-1; Fri, 20 Nov 2020 05:24:01 -0500
X-MC-Unique: iQSFNbqJNSunslq7y_Mt8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77501801B17
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 10:24:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A264F60853;
 Fri, 20 Nov 2020 10:23:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF4EB17535; Fri, 20 Nov 2020 11:23:55 +0100 (CET)
Date: Fri, 20 Nov 2020 11:23:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201119115514.GA838600@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

  Hi,

> > Nope.  Tried s/module_ss/kraxel_ss/, still not working.
> > 
> > I get tons of "undefined reference to `_TRACE_something'"
> > errors (*not* qxl).  Seems trace_ss is not updated as intended.
> 
> Okay. There is a workaround available:
> [PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibility
> 
> We can take time to figure out how to extend the build system to handle
> modules.

IMHO it isn't 5.2 material anyway.

> Would you like me to try to debug this?

Guess I'll go dig into the meson documentation, this looks more like a
build system than a tracing problem to me.

Nevertheless any ideas/hints are welcome of course.

take care,
  Gerd


