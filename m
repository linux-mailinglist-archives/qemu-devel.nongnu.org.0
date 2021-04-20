Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CB3655D4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:59:05 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYn9s-0002UF-HP
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYn97-000230-Mn
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYn96-0006C2-1O
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618912694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+h3qRz8Y0FyRFGl1OdprZlAZGt4mQ1DpcXLKzlJL/E=;
 b=UB/axd1xZT6BdJVig5jeq9u//8c1MHsJ1d5WwpDiL534NXWC6c8NOaNwno2g2HC4hUa2eh
 ycUXy0yOf6+AASvs1ADbCDHAI1X/qWy/ZyV32BPD1OOPa6lqnQQI+hw/EXhq96gig8oN1s
 OX32aKbYh/Mte8VuDWw9f2DJ0a0+Ccw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-tLegAZseMCSjO7pUGuw0mw-1; Tue, 20 Apr 2021 05:58:12 -0400
X-MC-Unique: tLegAZseMCSjO7pUGuw0mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD5A8030A1;
 Tue, 20 Apr 2021 09:58:11 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-244.ams2.redhat.com
 [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C90B039A73;
 Tue, 20 Apr 2021 09:58:09 +0000 (UTC)
Date: Tue, 20 Apr 2021 11:58:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: any remaining for-6.0 issues?
Message-ID: <20210420115807.5de6564a.cohuck@redhat.com>
In-Reply-To: <666985ba-349f-bbdf-10fd-ec1becb64cd7@ilande.co.uk>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
 <CAFEAcA9Q7q5eoE+qBOY9LYQnnaccSfMux=fOzb3+BtRWjXm6gw@mail.gmail.com>
 <b7912545-96b8-70b7-21b2-578808051f14@ilande.co.uk>
 <20210419090551.4a3ae4eb.cohuck@redhat.com>
 <20210419190224.33408d0e.cohuck@redhat.com>
 <666985ba-349f-bbdf-10fd-ec1becb64cd7@ilande.co.uk>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?UTF-8?B?QmVu?= =?UTF-8?B?bsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 20:38:05 +0100
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 19/04/2021 18:02, Cornelia Huck wrote:
> 
> >> That patch seems to be our best candidate so far, but the intermittent
> >> nature of the failures make it hard to pin down... I don't see anything
> >> obviously wrong with the patch, maybe some linux-user experts have a
> >> better idea?  
> > 
> > FWIW, I tried reproducing the issue on some local systems (no luck),
> > and on code pushed out to gitlab (where it works most of the time, and
> > the user builds where it fails are unpredictable.)
> > 
> > I fear the best we can do right now is stare at the code and try to
> > figure out what might be wrong :(  
> 
> Is there any particular reason why the unsigned long cast was removed from the front? 
> Could that have an effect?

Indeed, that looks strange.

Will give it a try with the cast readded, but I'm still unable to
reproduce the error reliably...


