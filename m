Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9B43C7BF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:33:50 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgFh-0002tI-L9
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgDh-0002CC-GJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgDZ-00011n-Qy
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635330694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x559UwwNukD64wd8UDZKYhxRvO3sOt6RwAdF+g4Puz4=;
 b=QlQBSZzwnbN1zWsSfCjVHmx+2pCbH150F1UylJnL7gbg6bK7veBFfqenJXs/1nWHJQq/C8
 DZ7UGvUUw84qJK73Gotn+V0ToaSqfecy6zTqVGrLj5ax6EkvbD+tjfrr1S+aVFNCnJindM
 7qz+ot7sf2dCrJNjaad9VQhLj7I70fY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Dbmh9NjfOnSNJn7NDUrcag-1; Wed, 27 Oct 2021 06:31:31 -0400
X-MC-Unique: Dbmh9NjfOnSNJn7NDUrcag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D42110A8E10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:31:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B8569214;
 Wed, 27 Oct 2021 10:31:29 +0000 (UTC)
Date: Wed, 27 Oct 2021 12:31:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 0/8] qapi: Add support for aliases
Message-ID: <YXkqf37UWHnmUNUa@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
 <CAFn=p-ahKc+EjkUAPnSODQNY808z-qyc-DQUsseAobmB8A8NwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ahKc+EjkUAPnSODQNY808z-qyc-DQUsseAobmB8A8NwA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 23:23 hat John Snow geschrieben:
> On Fri, Sep 17, 2021 at 12:13 PM Kevin Wolf <kwolf@redhat.com> wrote:
> 
> > This series introduces alias definitions for QAPI object types (structs
> > and unions).
> >
> > This allows using the same QAPI type and visitor even when the syntax
> > has some variations between different external interfaces such as QMP
> > and the command line.
> >
> >
> I'm absurdly late to the party here, and I'm afraid my involvement may only
> stall your progress even further, but ...

I'm not sure if it's worth investing much of your time in this. After a
year of discussing implementation details, Markus decided that he
doesn't like the whole approach, so the series is probably dead in this
shape. Maybe parts of it (possibly even large parts) can be saved and
used in a modified approach, depending on how radically different the
new approach is.

Markus promised that he'll think of alternative approaches to solve the
problem. I'm waiting for that before I waste more time implementing
something else that is also dead from the start.

> can you fill me in on the slightly-less-higher-level details here?
> 
> I'm curious as to the nature of "has some variations" and how the aliases
> help alleviate them. Do you accomplish that compatibility by using
> different names for different fields of the struct?

> so e.g. x.foo can be used as an alias for x.bar, but both map ultimately
> onto 'x.foo'? Or does this series provide for some more fundamental
> mechanical changes to map one type onto another?

I would recommend reading the changes to docs/devel/qapi-code-gen.rst in
patch 7, which explain the implemented mechanism.

For -chardev, most of "some varations" are different names for the same
member of a struct, or nesting in QMP that you don't want to have on the
command line. I went through all cases in one of the last messages in
the v3 thread, but I think these are the two important categories of
cases.

The C types stay the same as they have always been, aliases just provide
an alternative way to specify the same thing in the input.

> > It also provides a new tool for evolving the schema while maintaining
> > backwards compatibility (possibly during a deprecation period).
> >
> > The first user is intended to be a QAPIfied -chardev command line
> > option, for which I'll send a separate series. A git tag is available
> > that contains both this series and the chardev changes that make use of
> > it:
> >
> >     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4

You may also want to have a look at this, and specifically
qapi/char.json, to see how I used aliases in practice.

Kevin


