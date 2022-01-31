Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448094A4ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:38:48 +0100 (CET)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYlT-0007js-2b
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:38:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEYi3-0004LX-L9
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEYhz-00080C-Po
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXD2rqxwYsbi15UUhB/Qb9w6X6qOm+JWLkdSJB7v3ZM=;
 b=bp2nUX5i9WfJ80t3FLIzDQiQQ0NIpjyMLHI/rZxui+YAbv5P1EOPf7ihdjkEyczFLvjN6h
 OqFhtC6KMNoZCcQ36g/I+INbSu6XKOTQIqQR60E28U/tVwR7lT1FBlxUu4/atJnJFfLIBq
 4UDS0HO34OIac4UQZAI555SKE2YhYTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-anfrxg2WNY-uEKdpYK9U7A-1; Mon, 31 Jan 2022 10:35:07 -0500
X-MC-Unique: anfrxg2WNY-uEKdpYK9U7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB3E48144E4;
 Mon, 31 Jan 2022 15:35:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DA7984A2A;
 Mon, 31 Jan 2022 15:35:05 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:35:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <YfgBpsEKl5ArM+64@redhat.com>
References: <20220131125509.170307-1-berrange@redhat.com>
 <YffrgRRVCEWVLS41@paraplu> <Yffz/v/7b6jJOBwi@redhat.com>
 <Yff+gCndUlijqMsz@paraplu>
MIME-Version: 1.0
In-Reply-To: <Yff+gCndUlijqMsz@paraplu>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 04:21:36PM +0100, Kashyap Chamarthy wrote:
> On Mon, Jan 31, 2022 at 02:36:46PM +0000, Daniel P. Berrangé wrote:
> > On Mon, Jan 31, 2022 at 03:00:33PM +0100, Kashyap Chamarthy wrote:
> > > On Mon, Jan 31, 2022 at 12:55:09PM +0000, Daniel P. Berrangé wrote:
> 
> [...]
> 
> > > I briefly wondered if in this "combined" mode whether the no. of
> > > duplicate copies can ever fill up the storage.  I doubt that, as the
> > > combined size of _VARS + _CODE is just about 2MB.  So it only starts
> > > mattering if you're running tens of thousands of guests.
> > 
> > When guest root / data disk sizes are measured in 100's of MB, or
> > GBs, I struggle to get worried about even a 16 MB OVMF  blob being
> > copied per guest.
> 
> Heh, fair enough.
> 
> > The firmware can be provided in qcow2 format too, so if really
> > concerned, just create a qcow2 file with a backing store pointing
> > to the readonly master, so you're only paying the price of the
> > delta for any guest VARs writes. That's more efficient than what
> > we do today with copying the separate raw format VARS.fd file.
> 
> That's nice, I didn't know the qcow2 possibility in this context.  For
> some reason I assumed the file format always has to be raw here.  Your
> qcow2 point above should  be documented, if it isn't already.  Although
> I don't know the right place for it.

There's already a format field in the descriptor, but even if the
firmware is distributed as raw, libvirt can choose to put qcow2
overlay on it, as its all configured with -blockdev

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


