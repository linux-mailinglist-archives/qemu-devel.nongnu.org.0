Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2C3C863D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:36:56 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3g0N-0002UG-UA
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3fyx-00018t-Tj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3fyu-0006eL-Ku
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626273322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rK918pt3JUZ2nUdjdAd9Ut4ZbB9Q6Oq5VO7j6Q7o6BM=;
 b=PuxnFktl/AcDf/85KYTuFEst5qoH2RPAnslWvAW0A73yDkciZlUTKzBG3VwA0O6/Vc6d2U
 D5g/ovR6cj+Gh+5xAfIz2OP351q27LK3IYVe+N2dR2G18//p2npKzY3Wz+QvTc1z9jt+4x
 TglR0Sf+CteSt7PpLexxW1zuV0aQ4lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-dz1fslhzPTy_t6DL-dyFcQ-1; Wed, 14 Jul 2021 10:35:20 -0400
X-MC-Unique: dz1fslhzPTy_t6DL-dyFcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D79802C80
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:35:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A860260871;
 Wed, 14 Jul 2021 14:35:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE6AC113865F; Wed, 14 Jul 2021 16:35:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: License advice for Async QMP
References: <CAFn=p-Y_j0fQJCGHrwryk9=7qjPPU6VHYiOSqiAuz==Mn2s4jw@mail.gmail.com>
Date: Wed, 14 Jul 2021 16:35:17 +0200
In-Reply-To: <CAFn=p-Y_j0fQJCGHrwryk9=7qjPPU6VHYiOSqiAuz==Mn2s4jw@mail.gmail.com>
 (John Snow's message of "Tue, 13 Jul 2021 14:26:28 -0400")
Message-ID: <87eec1ezfe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eric Blake <eblake@redhat.com>, Luiz Capitulino <lcapitul@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Hi,
>
> I'm deep into writing a new Async QMP library for QEMU, one that I intend
> to ship outside of our castle walls and host on PyPI.
>
> I need to choose a license for it. I slapped GPLv2 on it in keeping with
> the license on the original library by Luiz Capitulino (And it is generally
> my preference), but I was debating loosening the license to MIT so that it
> plays nicer with Apache-licensed projects. ...Maybe.
>
> I don't know if that's really necessary, though, and I do generally prefer
> a "copyleft" to "permissive" these days.

In addition to what Daniel wrote: I'd recommend GPLv2+ over GPLv2.

[...]


