Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A461A30B220
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:33:12 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6gop-0005IZ-6m
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6gn7-0003xE-76
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:31:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6gn3-00060g-Tp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612215080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6a7owyi7kE7vggh++r5MmpR+z5K4iTujsROfQBdO74=;
 b=OFajsyIG9qCrOfk+AZQv9dcVRTEl6i0tfWl2nQ6CN0ZI5A2ug0FSFoZnZ4szdsZuYehnZN
 hzXjHl7p0G4EpTfuF6ZxeZUK5wKCLCCufDorAnAUO5WXDzMii42FiT6f5yAVLb1kDS3TP5
 +sn6+bmpaeufH0p0Wv1UdeYIp8AaKxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-Wa4X6_oxN6ybw5GTL734-A-1; Mon, 01 Feb 2021 16:31:17 -0500
X-MC-Unique: Wa4X6_oxN6ybw5GTL734-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E3A8049D0;
 Mon,  1 Feb 2021 21:31:15 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 448535D9DC;
 Mon,  1 Feb 2021 21:31:05 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:31:04 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
Message-ID: <20210201213104.GG3872207@habkost.net>
References: <20210129081519.3848145-1-armbru@redhat.com>
 <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
 <20210129121752.GJ4001740@redhat.com>
 <bacb8bab-2719-ae96-f1de-91e598b98abd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bacb8bab-2719-ae96-f1de-91e598b98abd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 02:25:56PM +0100, Paolo Bonzini wrote:
> On 29/01/21 13:17, Daniel P. Berrangé wrote:
> > > On this one, my vote would be "no". "Versioned machine names
> > > include the QEMU version number" is pretty well entrenched,
> > > and requiring users to remember that when they want version 4.2
> > > they need to remember some other way of writing it than "4.2"
> > > seems rather unfriendly. And 550 uses of '.' is a lot.
> > We can't make  keyval_parse() accept "/" instead of ".", but can
> > we make it accept "/" in addition to ".", and then encourage "/"  ?
> > 
> > People simply wouldnt be able to use "." as keyval separator if
> > they're using typenames containing "." (or would have to escape
> > the typename.
> 
> '.' is much more common than '/', and is shared by about all programming
> languages that have JSON-ish data structures natively.  So using '/' seems
> decidedly worse to me.

Worse than what, exactly?

Accepting "/" when "." is ambiguous seems decidedly better than
the following alternatives:
- renaming machine types to names like "q35-5-0"; or
- having to escape "." in the command line.

-- 
Eduardo


