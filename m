Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97C3E30E4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:19:46 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7Fp-000113-4B
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC79o-0003aY-FA
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC79m-0005KC-Sl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjoK1s4/L+/CDe+bttSMFdNcjl1Hn22u0yDqq6HEkGQ=;
 b=fHShWeF4G2203eHUkFA/uP6eTFUCTt7endsc3vo4HuNQ4/mo5uwe7x0ZPKwCCHIx/0R4EX
 cJkkRgDM77zxvbeZ0vxUIo0QWnC/0HRlCf6S4M81mRdOX5b1Xdgxp3f6Fuk6kyY87u0/kE
 qWdLDwNyy1wmF2XdlztluSIao+eJbr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-5nqiateiMVurqOMdxAA48A-1; Fri, 06 Aug 2021 17:13:29 -0400
X-MC-Unique: 5nqiateiMVurqOMdxAA48A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E279760C0;
 Fri,  6 Aug 2021 21:13:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFF185D6A1;
 Fri,  6 Aug 2021 21:13:27 +0000 (UTC)
Date: Fri, 6 Aug 2021 16:13:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH 1/7] net/vmnet: dependencies setup, initial preparations
Message-ID: <20210806211326.7ns526yb3ywk44zp@redhat.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
 <20210617143246.55336-2-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210617143246.55336-2-yaroshchuk2000@gmail.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:32:40PM +0300, Vladislav Yaroshchuk wrote:
> Add 'vmnet' customizable option and 'vmnet.framework' probe into
> configure;

I'm sorry no one else has taken time to review this yet; thanks for
your ping.  I'm not the network maintainer, and I don't develop on
Mac, so I'm uncomfortable doing a full review myself, but I can at
least point out:

> 
> Create source files for network client driver, update meson.build;
> 
> Add 'vmnet' into qapi::net::NetClientDriver options list.
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---

> +++ b/qapi/net.json
> @@ -460,10 +460,11 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#        @vmnet since 6.1

Sadly, since no one reviewed, it has missed the 6.1 boat, and you'll
have to respin this to call out 6.2 (no need to do that until you have
other review comments to address).

>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet' ] }

Long line; please wrap to keep under 80 columns.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


