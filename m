Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B15A1D0A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:21:39 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMAM-0005DH-Sv
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM9A-0003eg-6h; Thu, 25 Aug 2022 19:20:24 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM98-0004rl-9S; Thu, 25 Aug 2022 19:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=coxUvJgYvb5DHASWOXqmsJjGXFF8Y8wNhH2q4MbPKD8=; b=FXAyuthukzGBlG0cLn60
 Cjii8rIfzIGfs73DBU3KvbcWHUyutGhac+ZgVRsc4SJrkp40EITq7YAVw8ySFbAisSgJWRqU7iY8B
 Y6w8xY00ziAAV+F+3f+AWkkXoO43zOe9dwnfN/vTF65LMXVUeTe3im+4d5IyXF7pPkDTUkFI/iIvS
 WGmvEH9ODBomnxZQE0usETukEYjzj/qnSc3cqae62J/k1aACqYG4J3ltlRtNED/DZK4lZ0ECWgurh
 7MyF030rPUak1dJAHpugSLHrcUvZiYrizecNtcParEJE5bIPX8Z/yYM6h4rSV5FKdpjMUCbSeBDcF
 xi0ZUgHTFKWygg==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=42954 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM92-00038x-Jz; Thu, 25 Aug 2022 19:20:21 -0400
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@gnu.org>) id 1oRM8z-0030cS-2h;
 Fri, 26 Aug 2022 01:20:13 +0200
Date: Fri, 26 Aug 2022 01:20:13 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 garnermic@fb.com, patrick@stwcx.xyz, zhdaniel@fb.com
Subject: Re: slirp: Can I get IPv6-only DHCP working?
Message-ID: <20220825232013.43g4iieyqxrckkna@begin>
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
 <20220825225610.oio5h5bflp4gmaph@begin>
 <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Delevoryas, le jeu. 25 août 2022 16:15:26 -0700, a ecrit:
> On Fri, Aug 26, 2022 at 12:56:10AM +0200, Samuel Thibault wrote:
> > Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
> > > It seems like there's support for an IPv6 dns proxy, and there's literally a
> > > file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
> > > whatever is necessary for TFTP network boot I guess.
> > 
> > For which DNS support is welcome :)
> > 
> > > Maybe there's no support then?
> > 
> > It seems there is:
> > 
> >     if (ri.want_dns) {
> >         *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
> >         *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
> >         *resp++ = 0; /* option-len high byte */
> >         *resp++ = 16; /* option-len low byte */
> >         memcpy(resp, &slirp->vnameserver_addr6, 16);
> >         resp += 16;
> >     }
> 
> Well, that's great, but actually I just care about whether slirp supports DHCPv6
> address requests. Sorry if I didn't explain that properly.

Ah. It doesn't seem to indeed.

> since the DHCPv6 hook "dhcpv6_input" is already there, maybe I can
> just get something going through there?

Probably.

Samuel

