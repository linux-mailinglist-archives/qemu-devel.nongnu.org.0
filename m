Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648341B9641
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 06:44:38 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSvdE-0003Q5-UI
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 00:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1jSvcG-0002q5-QI
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 00:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1jSvcF-0000gF-Ny
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 00:43:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37613
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1jSvcF-0000Wl-61
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 00:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587962613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuqbfNzzuFYPtRo2D1K84beOlS3+1pDZDBN11Rrg/mc=;
 b=ViaaBEFo1YNaJjn2rt8QlH1J5U+sqXdmXfs1VNPrxDPxHeU0KRB16Cbg/nKAKUnrbgJoy7
 XgfkDat2EbT+dt+azENy9eLFYBZeW4DACeIbpibI/B6axPhUBe0cK225gOyqtRia2Voy8w
 atd2gck4GXnKygSrTDbSZh40zf3zKZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-tPlNIghoN0qwCxkiM89Qdw-1; Mon, 27 Apr 2020 00:43:31 -0400
X-MC-Unique: tPlNIghoN0qwCxkiM89Qdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F201005510;
 Mon, 27 Apr 2020 04:43:30 +0000 (UTC)
Received: from localhost (ovpn-112-178.rdu2.redhat.com [10.10.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A5F6062A;
 Mon, 27 Apr 2020 04:43:23 +0000 (UTC)
Date: Mon, 27 Apr 2020 00:43:15 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] QEMU Gating CI
Message-ID: <20200427003614.7c86a217@redhat.com>
In-Reply-To: <CAFEAcA_mytLVYUNSOJMUZfSwWXER_x=EPvT0vd3txdTpMhwjPA@mail.gmail.com>
References: <20200312193616.438922-1-crosa@redhat.com>
 <CAFEAcA-zRw7kzwzXxPmLaUqwOrQLwW9BymOJ34iJOOTCUAf=xg@mail.gmail.com>
 <20200317141257.GA5724@localhost.localdomain>
 <CAFEAcA9W4KXN6dcT0CNyD_mQ3xY5wDmJ7i0wowhaG2XPmyMYng@mail.gmail.com>
 <87sgi49uf6.fsf@dusky.pond.sub.org>
 <CAFEAcA_dcVneQ4Hj61GAkYRCUSMrA=QjwnAXccoBwjUjOE-wSQ@mail.gmail.com>
 <529508877.9650370.1587661453005.JavaMail.zimbra@redhat.com>
 <20200423171322.GJ1077680@redhat.com>
 <348064782.9653447.1587663408130.JavaMail.zimbra@redhat.com>
 <CAFEAcA_mytLVYUNSOJMUZfSwWXER_x=EPvT0vd3txdTpMhwjPA@mail.gmail.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:33:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Wainer Moschetta <wmoschet@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Apr 2020 18:50:47 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 23 Apr 2020 at 18:37, Cleber Rosa <crosa@redhat.com> wrote:
> > We're already using the shared x86 runners, but with a different
> > goal.  The goal of the "Gating CI" is indeed to expand on non-x86
> > environments.  We're in a "chicken and egg" kind of situation,
> > because we'd like to prove that GitLab CI will allow QEMU to expand
> > to very different runners and jobs, while not really having all
> > that hardware setup and publicly available at this time.
> 
> We do have the S390 machine that IBM kindly made available to
> the project -- that is not a personal or Linaro machine, so
> there are no issues with giving you a login on that so you
> can set it up as a CI runner. Drop me an email if you want
> access to it.
> 

I sure do.  I'll shoot you an email off-list.

> thanks
> -- PMM
> 

Thanks,
- Cleber.


