Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED135F64A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:38:25 +0200 (CEST)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWgeu-0003VI-7q
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWgdf-0002vZ-TD
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWgdR-0000cb-Dd
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618411011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0N9eeUsfLkG0VboZYaRgYaJrl8D6EqQnNckjuKpzUw=;
 b=Nq0bqzggLKERg0Nb+88DDyRtPp7WTruRv7foDOzdd3nBSoB2LoeuCvbHT+Blsc1YtIkGPy
 KlrVfZOMdOvLhMCnwQxszSCSzb6CQO6JofVZNbf0uDwy20Z/JOXMIMNU+R0mCPyaC2Pod/
 x3oqGyZ2rOr5xPMWh6D0VfLR2014i1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-2IvoR3CfP_mWyAGMkbFhxw-1; Wed, 14 Apr 2021 10:36:48 -0400
X-MC-Unique: 2IvoR3CfP_mWyAGMkbFhxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2110B107ACED;
 Wed, 14 Apr 2021 14:36:47 +0000 (UTC)
Received: from gondolin (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2895960C5D;
 Wed, 14 Apr 2021 14:36:44 +0000 (UTC)
Date: Wed, 14 Apr 2021 16:36:42 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: any remaining for-6.0 issues?
Message-ID: <20210414163642.54bccd52.cohuck@redhat.com>
In-Reply-To: <7760731b-ae34-89aa-a5de-65828ec9ae79@ilande.co.uk>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
 <7760731b-ae34-89aa-a5de-65828ec9ae79@ilande.co.uk>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 15:15:04 +0100
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 14/04/2021 14:57, Mark Cave-Ayland wrote:
> 
> > I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP 
> > security fixes (first version of which appeared just before rc0). The user builds 
> > always fail on "run-tcg-tests-s390x-linux-user" for me.  
> 
> Commit 23fff7a17f lies within that range and certainly feels like it could be 
> relevant to the above failure:
> 
> 
> commit 23fff7a17f47420797ac6480147941612152a9ad
> Author: Andreas Krebbel <krebbel@linux.ibm.com>
> Date:   Wed Mar 24 19:51:28 2021 +0100
> 
>      linux-user/s390x: Use the guest pointer for the sigreturn stub
> 
>      When setting up the pointer for the sigreturn stub in the return
>      address register (r14) we currently use the host frame address instead
>      of the guest frame address.
> 
>      Note: This only caused problems if Qemu has been built with
>      --disable-pie (as it is in distros nowadays). Otherwise guest_base
>      defaults to 0 hiding the actual problem.
> 
>      Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>      Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>      Message-Id: <20210324185128.63971-1-krebbel@linux.ibm.com>
>      Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
> 
> I'll try pushing a test build to Gitlab CI with a revert for that patch on top and 
> see if it succeeds for me...

Hm. I'm actually seeing it sometimes succeeding, and sometimes failing.
I'm wondering if there's something else at play here...


