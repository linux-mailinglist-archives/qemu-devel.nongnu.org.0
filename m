Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C4ADA69
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 15:50:11 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7K3W-0004qh-QZ
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 09:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1i7K23-0004Lh-7Q
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1i7K21-0002Bq-UN
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:48:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1i7K21-0002AI-Mo
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:48:37 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05614C00A175
 for <qemu-devel@nongnu.org>; Mon,  9 Sep 2019 13:48:36 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id d10so3965619wmb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2019 06:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6qfqRmvZ7OtYu0yZPCAPZo4Ij9ur2cZtVEcVo27BAZg=;
 b=U3h3fM1EOBHgaIHH5q/yZ9yrw0ayu2I3ZmrHSl6bIWSLBWXpIyG5NViNKeVttlRGWN
 VCgCFjOroXCtaAtpcRCx4agkCdz9rNXNhhHhUP3nFp6qAnuu4D3A+cK7LYq1WijzHBTH
 CJFatD0NzHB3JpRWYv7X5QPt0mQTzshTAfNfq7/nloDLLYwB/6tECqYmHwI5fTeTKK2y
 jehhfEMcRnUk2FAb1YRzH2OVUPfLTbsRQ9j58mZZ/8a8XOFkfCKS6YP+7MCKkymgs3TH
 9cfr/Ijle3eZ4zTuLXSVp7q6yiFoT9RI8xdwMgNCjeSOkpPpmnxck2nGbkZbOJRW2Yjv
 OV6A==
X-Gm-Message-State: APjAAAXStvZ+Gfc0bkbwT1q5nYc6xk4vEr3xvlC99iYdTTtuCZdRE+BO
 uROD71kabL9S6SeIdg0N+pc+IqTa066U8fWQDWj5BOf/bU9nMIsrhonvt/zUCevjXeyly4Qg3cS
 5yPsqQaKhrsLN6Xc=
X-Received: by 2002:adf:ec48:: with SMTP id w8mr18256296wrn.198.1568036914748; 
 Mon, 09 Sep 2019 06:48:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRx/KapporNuKs1BnZvDRgMiUp7wGskIj9F0Ug3GCcP86ni1gYlK6JYhL6Ia52izX89Ll0Cw==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr18256276wrn.198.1568036914556; 
 Mon, 09 Sep 2019 06:48:34 -0700 (PDT)
Received: from redhat.com ([80.74.107.118])
 by smtp.gmail.com with ESMTPSA id h5sm10916863wrr.10.2019.09.09.06.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 06:48:33 -0700 (PDT)
Date: Mon, 9 Sep 2019 09:48:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20190909094609-mutt-send-email-mst@kernel.org>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190906121350.29202-1-johannes@sipsolutions.net>
 <20190906102217-mutt-send-email-mst@kernel.org>
 <be405c3ba658cdac7f68c91213c3b714ac24c1e3.camel@sipsolutions.net>
 <20190906110340-mutt-send-email-mst@kernel.org>
 <fe0f3f7bfa730088454790dc2d863285c4461134.camel@sipsolutions.net>
 <20190908091207-mutt-send-email-mst@kernel.org>
 <8a9cf8a1726afce7fed8992a4f19fc808004ef88.camel@sipsolutions.net>
 <20190909083902-mutt-send-email-mst@kernel.org>
 <89f25546ffa71c799c533e50658a3a58e066f436.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f25546ffa71c799c533e50658a3a58e066f436.camel@sipsolutions.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] libvhost-user: implement
 VHOST_USER_PROTOCOL_F_KICK_CALL_MSGS
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

On Mon, Sep 09, 2019 at 03:05:08PM +0200, Johannes Berg wrote:
> On Mon, 2019-09-09 at 08:41 -0400, Michael S. Tsirkin wrote:
> 
> > > The only thing we could do is crash if it wants to use this feature
> > > without the others, but would that really be helpful?
> > 
> > We can return failure from SET_PROTOCOL_FEATURES.
> > We can also fail all following messages.
> 
> Only if we have F_REPLY_ACK, I think?
> 
> I suppose we could fail a later command that already needs a reply
> without REPLY_ACK, but that seems difficult to debug?


Next command is GET_FEATURES. Return an error response from that
and device init will fail.

> Anyway, if you feel that we should have this as some sort of safeguard I
> can try to do that; to me it feels rather pointless as libvhost-user is
> more of a sample implementation than anything else.


Exactly for this reason :)

> Unless you also wanted to write into the spec that F_KICK_CALL_MSGS
> absolutely *requires* F_REPLY_ACK,

yep

> and add some text that tells a device
> how to behave when F_KICK_CALL_MSGS is negotiated without F_REPLY_ACK?
> 
> johannes

We can document how to behave in case of inconsistent protocol features,
yes.

