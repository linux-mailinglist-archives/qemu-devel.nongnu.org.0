Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F03510C98
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:23:06 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUWP-0004gr-Cd
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUMY-0004L0-MI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:12:56 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUMY-0000vo-4B; Tue, 26 Apr 2022 19:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=0NHdvdXOiXkZBiyaBydcYjoxT/VIFkdV4ZBedpUFVoI=; b=S0rignzWzoNWKxUo/dx6
 eQUA+yc0NO4HRviyZ3yPFlt4IZwaRU7RV4XbexxK13v4iRo5pk4mDYRE45r54xiWNPEQoRrf4r/av
 ryTpZehdC4+5u3hHs6pduGdLQyCAfmDIKB2ZYZG7zoOQcCtsOb85ArdHmg9zFUrygW0FODyWQdG2D
 hpDcunfzb2D4lDacw+I4uWjvfcY6KSsjFmnc/o4ZiT1P6DoV4qmudkp5MA9y0V8FjDRj6ooX9oHeZ
 bACbvJmJf+eHu8VkfPZdkLkxT2nRnQJ3wV1yj9UFHSYEgM1k31QUsMmCcwXX+cJk90in5pUtH3xaW
 zCTk94pzb7c+yQ==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=47978 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUMX-0006vx-7R; Tue, 26 Apr 2022 19:12:53 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1njUMW-002Any-3d;
 Wed, 27 Apr 2022 01:12:52 +0200
Date: Wed, 27 Apr 2022 01:12:52 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>, h@begin
Subject: Re: [RFC PATCH 2/4] net: slirp: switch to slirp_new
Message-ID: <20220426231252.q544fnhj2ctnikpu@begin>
References: <20220412121337.207203-1-pbonzini@redhat.com>
 <20220412121337.207203-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412121337.207203-3-pbonzini@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini, le mar. 12 avril 2022 14:13:35 +0200, a ecrit:
> Replace slirp_init with slirp_new, so that a more recent cfg.version
> can be specified.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  net/slirp.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index f1e25d741f..b3a92d6e38 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -389,6 +389,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>  #if defined(CONFIG_SMBD_COMMAND)
>      struct in_addr smbsrv = { .s_addr = 0 };
>  #endif
> +    SlirpConfig cfg = { 0 };
>      NetClientState *nc;
>      SlirpState *s;
>      char buf[20];
> @@ -577,12 +578,26 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>  
>      s = DO_UPCAST(SlirpState, nc, nc);
>  
> -    s->slirp = slirp_init(restricted, ipv4, net, mask, host,
> -                          ipv6, ip6_prefix, vprefix6_len, ip6_host,
> -                          vhostname, tftp_server_name,
> -                          tftp_export, bootfile, dhcp,
> -                          dns, ip6_dns, dnssearch, vdomainname,
> -                          &slirp_cb, s);
> +    cfg.version = 3;
> +    cfg.restricted = restricted;
> +    cfg.in_enabled = ipv4;
> +    cfg.vnetwork = net;
> +    cfg.vnetmask = mask;
> +    cfg.vhost = host;
> +    cfg.in6_enabled = ipv6;
> +    cfg.vprefix_addr6 = ip6_prefix;
> +    cfg.vprefix_len = vprefix6_len;
> +    cfg.vhost6 = ip6_host;
> +    cfg.vhostname = vhostname;
> +    cfg.tftp_server_name = tftp_server_name;
> +    cfg.tftp_path = tftp_export;
> +    cfg.bootfile = bootfile;
> +    cfg.vdhcp_start = dhcp;
> +    cfg.vnameserver = dns;
> +    cfg.vnameserver6 = ip6_dns;
> +    cfg.vdnssearch = dnssearch;
> +    cfg.vdomainname = vdomainname;
> +    s->slirp = slirp_new(&cfg, &slirp_cb, s);
>      QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
>  
>      /*
> -- 
> 2.35.1
> 
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

