Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB426AAE9E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 09:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYk3l-0001qs-BI; Sun, 05 Mar 2023 03:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYk3k-0001qa-51; Sun, 05 Mar 2023 03:49:36 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYk3i-00021i-NO; Sun, 05 Mar 2023 03:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oEISQ1BfHwYx1j9chjZWF4H3DuFNS9Lk8DZW+8tnHuc=; b=pOidGulYgK0F9MPMnQzs/zhWrF
 7tWNwxT0duS6zOLKmHLlYiTvzVHBXkSNYfdz9DhU9GmW0dBLKLKOdcZbhg3u7mV6ErSvR5j/kw+Wl
 07Jd8h7cyFRT1aby2eucCp2JybNB9iIvw9td+hCCTrUxakakQf2mmh4AWYzwnrQML549JmWrgAaXv
 43hTKmqj/FpwB1Emfbf8dPi44FGsnvsGd7cuV0YzbNqfZuNPL5bpjlIhGX0rZcnqj+XZ9fz1/gbWU
 52g8xXL034LO7kUdu6KxsMimHkVaGChyhv8Rt1XeU+UkPscvjt2Y9TaAo0jD2KzgLyp/GAGmvhwRf
 Hnh75GLA==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pYk3c-00071F-MW; Sun, 05 Mar 2023 09:49:28 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pYk3V-000Scs-1S;
 Sun, 05 Mar 2023 10:49:21 +0200
Date: Sun, 5 Mar 2023 10:49:21 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <ZARXkaG3cq9bi4XF@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-4-eblake@redhat.com>
 <Y/XlHhLWwm2pZ4RL@pc220518.home.grep.be>
 <20230303223641.utbls7mggek7quqx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303223641.utbls7mggek7quqx@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=2a01:4f8:200:91e8::2; envelope-from=w@uter.be;
 helo=lounge.grep.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, Mar 03, 2023 at 04:36:41PM -0600, Eric Blake wrote:
> On Wed, Feb 22, 2023 at 11:49:18AM +0200, Wouter Verhelst wrote:
> > On Mon, Nov 14, 2022 at 04:46:52PM -0600, Eric Blake wrote:
[...]
> > > +  Note that even when extended headers are in use, the client MUST be
> > > +  prepared for the server to use either the compact or extended chunk
> > > +  type, regardless of whether the client's hinted effect length was
> > > +  more or less than 32 bits; but the server MUST use exactly one of
> > > +  the two chunk types per negotiated metacontext ID.
> > 
> > Is this last paragraph really a good idea? I would think it makes more
> > sense to require the new format if we're already required to support it
> > on both sides anyway.
> 
> My proof of implementation was easier to code when I didn't have to
> resize the block status reply sizing in the same patch as adding the
> 64-bit headers.  But if you think requiring the 64-bit reply type
> always (and forbidding the 32-bit reply) when extended headers are in
> force, that's also possible.

Intuitively, this sounds off. It would seem to me that it's easier to do
if you don't have to have a conditional on each received data packet.
But maybe I'm missing something -- I haven't done an implementation yet,
anyway.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

