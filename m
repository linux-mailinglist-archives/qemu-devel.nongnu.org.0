Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04423B4FF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 08:29:21 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2qRr-0003oG-TS
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 02:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k2qQz-0003PD-D0
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 02:28:25 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23716
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k2qQu-0002Yr-S3
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 02:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596522498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/s8PyCi+K1tGx3LOai37LsR9gIsBU+W+n8na/acBVs0=;
 b=FUJ4b8V1/omxmJ6cR7zfr53dcKNXJLmfNjzc9vEoVkZ6OyWQ663Cl2xHbKjE1i3rl870E0
 6UtPmhMkZdpMRWYoecvQlhKpoONh1sxMAPOM2DE5fuyBPj91yaP/cGEVT2jHpCGJgj/x9d
 5Etes5dHZfl/JyjTfURv7MvptvGoyrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-eMWkvfdWMs2h9XycbXzT0w-1; Tue, 04 Aug 2020 02:26:58 -0400
X-MC-Unique: eMWkvfdWMs2h9XycbXzT0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06937100AA21;
 Tue,  4 Aug 2020 06:26:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708AA60BF3;
 Tue,  4 Aug 2020 06:26:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8AFB01750A; Tue,  4 Aug 2020 08:26:47 +0200 (CEST)
Date: Tue, 4 Aug 2020 08:26:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH 4/7] spice: Make spice a module configuration
Message-ID: <20200804062647.qhhuuv7ffhbzkbng@sirius.home.kraxel.org>
References: <20200723174615.2370096-1-dinechin@redhat.com>
 <20200723174615.2370096-5-dinechin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200723174615.2370096-5-dinechin@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 23, 2020 at 07:46:12PM +0200, Christophe de Dinechin wrote:
> This commit changes the spice configuration 'm' by default, and moves
> the spice components to obj-m variables. It is sufficient to build
> without modules enable, but does not link correctly yet, since no
> shims have been created for the missing functions yet.

So it breaks the modular build?  Don't do that, it is bad for bisecting.
I guess this patch should simply come later in the patch series.

I can see that it is useful to have it here for development, so you
easily find all the places which need a fixup, but for merging the
patches should be reordered.

take care,
  Gerd


