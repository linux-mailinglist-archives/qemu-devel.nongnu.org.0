Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB154458F8F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:38:04 +0100 (CET)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9WF-0006wg-N0
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mp9S4-0004yh-Sd
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mp9Rw-0001C1-L1
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637588016;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+fySEIHzm0+oJNRS6ztrxLVol4O2DLU3h9CnSOeyUC0=;
 b=BGxki6PqMnUYfYzKRMu2zWAEcae+ls3i6NUvRA0JkGPQ1Q04NkTNpinZxS5g2oqeanqkvK
 HxXQNRta/QI13XZxFVekO1nO0B8FGwQ47103g/VsisEz4mbQo/6nwOyBrg4szziiWTda67
 OZRvw5OwJbnn1LRA1JqQ+oEk6DYTdcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-kZLcYYwkPjqQNnPARB8whQ-1; Mon, 22 Nov 2021 08:33:33 -0500
X-MC-Unique: kZLcYYwkPjqQNnPARB8whQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8466100D841;
 Mon, 22 Nov 2021 13:33:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 025185DF5F;
 Mon, 22 Nov 2021 13:33:26 +0000 (UTC)
Date: Mon, 22 Nov 2021 13:33:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
Message-ID: <YZucJGIZFKM7v3xa@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
 <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com>
 <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
 <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 02:30:10PM +0100, Thomas Huth wrote:
> On 22/11/2021 14.25, Peter Maydell wrote:
> > On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
> > > What about simply replacing it with a new sentence below the bullet list,
> > > saying:
> > > 
> > > "Please also use a spell checker like `codespell
> > > https://github.com/codespell-project/codespell` with your patches"
> > 
> > How many regular contributors actually do that?
> 
> Considering the typos that we have in the code, not enough ;-)
> 
> Anyway, it's just a polite recommendation here, not a must-do, so mentioning
> codespell here doesn't really hurt, does it?

Well if you run 'codespell' with no args on qemu.git right now, you
get over 5000 possible mistakes reported. Many (perhaps even most)
will be false positives, but with that amount of existing report,
I don't think its credible to request contributors to run this
and wade through its results to see if they made things worse or
not.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


