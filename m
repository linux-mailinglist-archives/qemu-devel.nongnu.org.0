Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8A51BFAF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:44:29 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmaqJ-00017p-W8
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmalj-0007HB-Ju
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:39:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:41140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmalg-0005lJ-AL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651754378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ongEbF86KN0RDZSQOqBAD3iOj/p/XGbVbYGJkJeYtKw=;
 b=ZuLoNhZMgczS5rcss6AGAmJ9IJqcDLaVFcu9275lBUQoRSRIdJogBEfLuZ9QZ64+uaDNFW
 iNkTLSZkrFF8RNHZFr5r3SJS/46sBgvwOl9x0cCQkuWme9/i0MprbGSrul2ybpgZ488Uys
 ghz9g2orHjYQG9M2+2rIk76eQ9hgAtY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-pZW95oSJOPetWbJRkot5bQ-1; Thu, 05 May 2022 08:39:35 -0400
X-MC-Unique: pZW95oSJOPetWbJRkot5bQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D9BC1C05EA6;
 Thu,  5 May 2022 12:39:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A2A40C1247;
 Thu,  5 May 2022 12:39:34 +0000 (UTC)
Date: Thu, 5 May 2022 14:39:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnPFhVqpCIg70MPC@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
 <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
 <YnOt+Q6p0fbJzWzy@redhat.com>
 <a592403d-6a89-6686-1aeb-e04a884657f6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a592403d-6a89-6686-1aeb-e04a884657f6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.74; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.05.2022 um 14:24 hat Paolo Bonzini geschrieben:
> On 5/5/22 12:59, Kevin Wolf wrote:
> > Am 05.05.2022 um 11:28 hat Paolo Bonzini geschrieben:
> > > > Or actually, it could just unconditionally run 'make check-venv' by
> > > > itself, which is probably easier to implement than checking the
> > > > dependencies and more convenient for the user, too.
> > > 
> > > One small complication is that on BSD systems the binary is actually
> > > called "gmake", so you'd have to pass the variable somehow
> > 
> > I guess we could just export $MAKE as an environment variable?
> 
> That would work when invoked by "make", but then that's the case in which
> the venv would be there anyway.
> 
> For the other case, it would have to parse config-host.mak and/or
> reintroduce something like tests/qemu-iotests/common.env.  All in all it
> seems like an unnecessary complication over just printing a clear and polite
> error message.

Or try 'make' and print the error message only if that fails.

Kevin


