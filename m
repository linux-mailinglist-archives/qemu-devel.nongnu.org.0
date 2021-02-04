Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3930F016
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:02:45 +0100 (CET)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bTB-0004cs-O2
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bOW-00022F-Uf
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bOV-00087G-2w
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432666;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sfD0Iy1zkYa7/TyKZv5KGhUHpRh5I3j+5JrumN8Z4Wg=;
 b=JF96q5G5lq/5GpFGUosdqVLd63xGFZX4wyWQSc0YMQcXo0j/AjKa0Kxw4PGFJpArg5pWg/
 jAE9sUmg0H0DWcREdxeb4Yjq0DcrUFXx76khtXnaz2GN1k8lAlRRpWDRPGhGyNQ2QekoPg
 xWDHcVEQonU1jhw1zhiW3GtEMAzT/cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-HSf1OME4MDalSKEdPxYcdA-1; Thu, 04 Feb 2021 04:57:44 -0500
X-MC-Unique: HSf1OME4MDalSKEdPxYcdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82ACC1020C25;
 Thu,  4 Feb 2021 09:57:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0976310016FA;
 Thu,  4 Feb 2021 09:57:41 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:57:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v2 2/2] net: Add -ipv6-hostfwd option,
 ipv6_hostfwd_add/remove commands
Message-ID: <20210204095738.GD549438@redhat.com>
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-3-dje@google.com>
MIME-Version: 1.0
In-Reply-To: <20210203213729.1940893-3-dje@google.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 01:37:29PM -0800, dje--- via wrote:
> These are identical to their ipv4 counterparts, but for ipv6.
> 
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  hmp-commands.hx     |  28 ++++++++++
>  include/net/slirp.h |   2 +
>  net/slirp.c         | 129 +++++++++++++++++++++++++++++++++++++++++++-
>  qapi/net.json       |   4 ++
>  4 files changed, 161 insertions(+), 2 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index d4001f9c5d..bd51173472 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1392,6 +1392,34 @@ SRST
>    Remove host-to-guest TCP or UDP redirection.
>  ERST
>  
> +#ifdef CONFIG_SLIRP
> +    {
> +        .name       = "ipv6_hostfwd_add",
> +        .args_type  = "arg1:s,arg2:s?",
> +        .params     = "[netdev_id] [tcp|udp]:[hostaddr6]:hostport-[guestaddr6]:guestport",
> +        .help       = "redirect TCP6 or UDP6 connections from host to guest (requires -net user)",
> +        .cmd        = hmp_ipv6_hostfwd_add,
> +    },
> +#endif
> +SRST
> +``ipv6_hostfwd_add``
> +  Redirect TCP6 or UDP6 connections from host to guest (requires -net user).
> +ERST
> +
> +#ifdef CONFIG_SLIRP
> +    {
> +        .name       = "ipv6_hostfwd_remove",
> +        .args_type  = "arg1:s,arg2:s?",
> +        .params     = "[netdev_id] [tcp|udp]:[hostaddr6]:hostport",
> +        .help       = "remove host-to-guest TCP6 or UDP6 redirection",
> +        .cmd        = hmp_ipv6_hostfwd_remove,
> +    },
> +#endif
> +SRST
> +``ipv6_hostfwd_remove``
> +  Remove host-to-guest TCP6 or UDP6 redirection.
> +ERST

DO we really need new commands for this ? It seems to me that we
can reliably distinction IPv4 vs v6 from the address format, and
thus existing commands can be adapted to support both.

This is the way other command line options and monitor commands
work for IPv4 vs IPv6 elsewhere in QEMU, so I think consistency
is beneficial.  We already have the helper method inet_parse()
that can do this parsing.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


