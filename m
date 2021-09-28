Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CB41B10E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:44:50 +0200 (CEST)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDPd-0000y5-J1
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mVCx4-00066K-Gm
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mVCx2-00062g-IT
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632834899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7saqyYpqK8ert6AsyS5Ik20iRP7/LZfaPRjxXZGQsB8=;
 b=CoU2Er8m3usipa+C/acK5AX5jftf83OzBS9XZ+yytNITfBtqOMwSNkhZzAJaGXaXkgNtv3
 OomkdKaevZ74H7rXM4oP29UBl3scSg8UhlhRev0IL74Jwg4iY+ghlUSbBG4jUL2WlBrlZ0
 isu8WknRJfAE0DF9CQQs1lePkPl2zcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-6-L_sBybOIGkI43aVxGRGA-1; Tue, 28 Sep 2021 09:14:58 -0400
X-MC-Unique: 6-L_sBybOIGkI43aVxGRGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7ABA185FF40
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 13:14:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDD96A904;
 Tue, 28 Sep 2021 13:14:45 +0000 (UTC)
Date: Tue, 28 Sep 2021 15:14:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: QAPI sync meeting
Message-ID: <YVMVQyjU2sFKu0N4@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 18:55 hat John Snow geschrieben:
> Hiya,
> 
> I'd like to propose that at least the three of us arrange a time to have a
> meeting where we discuss our plans and ideas for QAPI going forward,
> including rust, python, and golang extensions to the QAPI generator, what
> we hope to accomplish with those projects, and so on.
> 
> What I am hoping to get out of this for myself is a high-level overview of
> people's plans for QAPI and to produce some notes on those plans so that I
> can have a reference that we've all acknowledged as roughly accurate to be
> able to keep the community's design goals for QAPI in mind as I continue my
> own development. Ultimately, I'd like some kind of rough draft of a "QAPI
> roadmap".
> 
> I know there was a rust meetup during KVM Forum, but I was unable to attend
> due to the timing. I'd like to expand the focus a little more broadly to
> QAPI in general and discuss our "personal" roadmaps, goals, queued work,
> etc so that we can collaboratively formulate a broader vision of our work.
> 
> I'm posting to qemu-devel in case anyone else has an interest in this area
> and would like to eavesdrop or share opinions

Yes, I would definitely be interested to join such a meeting.

My own focus is on CLI QAPIfication (and I guess eventually a QAPI-based
config file?) and integration with QOM, which is a bit different from
the other topics you mentioned, but it still touches the QAPI schema and
generator.

Kevin


