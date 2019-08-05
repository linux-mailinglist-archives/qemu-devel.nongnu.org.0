Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35D81EF1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 16:23:00 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hudt6-0005x5-2J
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 10:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hudsd-0005YN-Ag
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hudsc-0004Nk-6S
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:22:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hudsc-0004Km-0e
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 10:22:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id p17so84607677wrf.11
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 07:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OWI/qebn0Ku8hJKJmnVkeEICNUqcdIUgf3h9Ht8TRzg=;
 b=RNcsJoiZnokknTHuKMDJlhrXYLt/GtCFtfWOqDRmfW1R5oxVVd9LKUfsJfdCPqq7xX
 ilc6n5BPe7W+zCVVdOx9ccozJuMM0deQ3y9V1E0i7tXZg4NzDA777AI83Ps089/V4QtV
 CJ1yIbVn6xqWnwnkjv8VL+eOySKQUm3wwEGOS4c85TzbKHL5jJj9eVUzDu1StDTzXzen
 gGXx9CQGOu3HGmyC5SxkQ0OyCs+qLaP5sR1gpOUQuDqZ4sdRcgAoFsfIrgitP93Ri2Kl
 OdWX2xEtrNHLSqBjipaUduzVQslmw7Gd+BGz4uyBINqAlwskarQj8I204bPBljIw6+1r
 bg4g==
X-Gm-Message-State: APjAAAXBQfytPApwAmp74KMinQ7MNI6SYDlb+gV5om+0gqLd1WoSsE6U
 kO2QSQ+qac8cROAmUVWkLQGvtA==
X-Google-Smtp-Source: APXvYqyfiQ+2dpbt/F7RejSzHaSRSgr0K1bSRYx+7JKs39L4KvQvkC+F5epNPYXMxfklvxn3BXMz2g==
X-Received: by 2002:a05:6000:3:: with SMTP id
 h3mr48519959wrx.114.1565014948352; 
 Mon, 05 Aug 2019 07:22:28 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 q18sm104593251wrw.36.2019.08.05.07.22.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 07:22:27 -0700 (PDT)
Date: Mon, 5 Aug 2019 10:22:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Message-ID: <20190805102148-mutt-send-email-mst@kernel.org>
References: <20190802150605.5880-1-jfreimann@redhat.com>
 <20190802112047-mutt-send-email-mst@kernel.org>
 <20190805131215.c6cl3lgvcpnzfx3x@jenstp.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805131215.c6cl3lgvcpnzfx3x@jenstp.localdomain>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 0/9] add failover feature for assigned
 network devices
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

On Mon, Aug 05, 2019 at 03:12:15PM +0200, Jens Freimann wrote:
> On Fri, Aug 02, 2019 at 11:22:10AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Aug 02, 2019 at 05:05:56PM +0200, Jens Freimann wrote:
> > > This is implementing the host side of the net_failover concept
> > > (https://www.kernel.org/doc/html/latest/networking/net_failover.html)
> > > 
> > > Changes since v1:
> 
> [...]
> 
> > Didn't read this yet, one question: how do migration commands look
> > like?
> 
> You mean the hmp commands I think:
> 
> migrate -d tcp:host:port
> 
> and to cancel
> 
> migrate_cancel
> 
> 
> regards,
> Jens

Sorry, no. I mean the command line on the incoming side.

-- 
MST

