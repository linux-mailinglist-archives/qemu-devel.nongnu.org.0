Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8C38F3BD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:32:11 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGJ7-0001Cl-5S
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llGHd-0008GG-ES
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llGHZ-0003Bp-VA
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621884632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4esYnr0r/aINYgIQicOigo9hoIALRs6fYWQMcwgWa0=;
 b=MddDxzT+skEr2/1uq0WtCeQVdKtjkygIFhSoG2ANy8/O4XVPnrdoDENKfyGxZuBaS59R44
 bVz2hY19cIHLXizUEnGM1nZjHzd/Kr+CHgQ9FG8vN8cDOZQp825o6bl7jF4lPEnFlMjpHx
 lh0YM5CNyY90nWnrAAsw3f/tLfApWWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-_7hXIBp8PviFLshgVhoaSg-1; Mon, 24 May 2021 15:30:27 -0400
X-MC-Unique: _7hXIBp8PviFLshgVhoaSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA35108C309;
 Mon, 24 May 2021 19:30:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-196.phx2.redhat.com [10.3.113.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9436B50C0D;
 Mon, 24 May 2021 19:30:25 +0000 (UTC)
Date: Mon, 24 May 2021 14:30:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/1] NBD patches for 2021-05-11
Message-ID: <20210524193023.3ygch5wlfmgpgdla@redhat.com>
References: <20210511192802.552706-1-eblake@redhat.com>
 <af7caaf7-3067-9ebf-96f4-73e4a3dbc8d9@redhat.com>
 <CAFEAcA961ZSimiaQ38z-_UA4K83zC3E3PQ8xcyAwnCToEmtQHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA961ZSimiaQ38z-_UA4K83zC3E3PQ8xcyAwnCToEmtQHQ@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 09:55:38AM +0100, Peter Maydell wrote:
> > Richard suggested to add the following tag to the commit if possible:
> > "Resolves: https://gitlab.com/qemu-project/qemu/-/issues/218"
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03107.html
> 
> I left the pullreq unapplied for a while to give Eric the opportunity
> to add that tag, but it's been 9 days now, so I'm going to go ahead
> and apply it anyway.

Apologies that I did not respond in time; I've been fighting email
battles where I had some downtime with an inability to reply or even
read in a timely manner, but as evidenced by this mail, I should
finally be back online.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


