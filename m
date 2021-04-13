Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480135DDFA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:44:32 +0200 (CEST)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHT5-0002bK-8N
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWHQj-0000jV-2u
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWHQh-0007W2-CL
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618314122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiEJ92VeFsqiMQibPS6Li/FQkMc6zRkpPjI/oMXdrnA=;
 b=MFB8wMsFJPLZTzIRPn+mAvFvjjDETTMghl6asTrtgKtR5zvk3Nba01ZTpjK8R7+Ofx7L1d
 I1CKBj3lLr0+sU7h7o+pYZ7khEHFqtljLO9bQ685aSp45gDgx97O5YjX+fu6rVxq3t1m94
 krLYxcTqmNFi5MK8+0iQZ4FgO97ggOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-61ME-SeSN5iz4NTLZlYFBA-1; Tue, 13 Apr 2021 07:41:58 -0400
X-MC-Unique: 61ME-SeSN5iz4NTLZlYFBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E5B66D241;
 Tue, 13 Apr 2021 11:41:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB825D720;
 Tue, 13 Apr 2021 11:41:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51E36113525D; Tue, 13 Apr 2021 13:41:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
 <YG3SyTLha8a9Itlo@merkur.fritz.box>
 <c388d16d-4230-c828-08e0-d3c684f88106@redhat.com>
 <007fd217-c660-1f7d-835a-07a309d24d8c@suse.de>
 <CAFEAcA-9J79hCm-ROkLH-j2rg3+O64wjRC2-jPK3XAj-z5ap4Q@mail.gmail.com>
Date: Tue, 13 Apr 2021 13:41:51 +0200
In-Reply-To: <CAFEAcA-9J79hCm-ROkLH-j2rg3+O64wjRC2-jPK3XAj-z5ap4Q@mail.gmail.com>
 (Peter Maydell's message of "Tue, 13 Apr 2021 11:24:54 +0100")
Message-ID: <87fszuwgw0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 13 Apr 2021 at 11:23, Andreas F=C3=A4rber <afaerber@suse.de> wrot=
e:
>> Or consider the case you get a bug report not copied to the public
>> mailing lists from someone you don't know. Then I would still expect to
>> be allowed to attribute a commit via Reported-by/CC to that person, as
>> it seems in his/her interest to get the bug fixed and be notified,
>> unless explicitly requested otherwise.
>
> FWIW, in this kind of situation, I generally try to explicitly
> ask the submitter if they're OK with my adding a reported-by
> tag, just as a matter of politeness. Not everybody is OK with
> having their email address publicly recorded on mailing list
> archives and in git history forever.

That's what I'd do, too.

Still, neglecting to ask for permission to publicly credit a bug report
is not anywhere near doxing.  If the public credit turns out to be
unwanted, a sincere apology is obviously called for.  People may exist
who need to be slapped over the head with a code of conduct to figure
that out.  I hope we'll never need to do that.

Anyway.  What I see at work here is one of the unintended consequences
of formal codes of conduct: they read like law, so people read them
lawyerly.  Our CoC attempts to avoid this by explicitly stating its
*purpose*: "a guide to make it easier to be excellent to each other."

This applies to the QEMU leadership committee in spades.  Treating
negligent publication of some technical e-mail's sender address as
malicious doxing wouldn't be excellent to anyone, it would be the
leadership committee shooting themselves into the foot with a machine
gun".

Let's not worry about that, okay?


