Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA4338830
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:04:10 +0100 (CET)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdiL-0001gJ-Jf
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKddb-0007Se-8k
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKddZ-00076o-PC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9ocYQBiHs+j4U1X8NteHop4TbENMdLQEURbl2UU6YA=;
 b=DyH7Xg8ojOZja1884hgIDP5CW8ETCDcuGUElFyOYfl00VAJsgQOjInZOYs1/4YDSQXh/Va
 SL3m6FBsLJUOQUTIXrk6jBsxNk4vBTYQXd6uZNiLvy4XmDCxMmrCbtDLTrcKSqrdh92Mly
 BE6880O+6JVD7wFgxOlTU7PShZvwEww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-gcjZkU8dMweS5hvKNwIbMw-1; Fri, 12 Mar 2021 03:59:06 -0500
X-MC-Unique: gcjZkU8dMweS5hvKNwIbMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C1D18397A0;
 Fri, 12 Mar 2021 08:59:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DFA81001281;
 Fri, 12 Mar 2021 08:58:56 +0000 (UTC)
Date: Fri, 12 Mar 2021 09:58:54 +0100
From: Andrew Jones <drjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/6] tests/qtest: Add qtest_probe_accel() method
Message-ID: <20210312085854.inqpzkcsfichgabm@kamzik.brq.redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-3-philmd@redhat.com>
 <8814a4d5-f26d-3645-4e64-eb5b8f8bf973@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8814a4d5-f26d-3645-4e64-eb5b8f8bf973@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 09:16:01AM +0100, Thomas Huth wrote:
> On 12/03/2021 00.11, Philippe Mathieu-Daudé wrote:
> > Introduce the qtest_probe_accel() method which allows
> > to query at runtime if a QEMU instance has an accelerator
> > built-in.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >   tests/qtest/libqos/libqtest.h |  9 +++++++++
> >   tests/qtest/libqtest.c        | 24 ++++++++++++++++++++++++
> >   2 files changed, 33 insertions(+)
> > 
> > diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> > index a68dcd79d44..ebedb82ec98 100644
> > --- a/tests/qtest/libqos/libqtest.h
> > +++ b/tests/qtest/libqos/libqtest.h
> > @@ -763,6 +763,15 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
> >    */
> >   bool qtest_probe_child(QTestState *s);
> > +/**
> > + * qtest_probe_accel:
> > + * @s: QTestState instance to operate on.
> > + * @name: Accelerator name to check for.
> > + *
> > + * Returns: true if the accelerator is built in.
> > + */
> > +bool qtest_probe_accel(QTestState *s, const char *name);
> 
> Maybe better qtest_has_accel() ? ... that makes it clear right from the
> start what the return type is about.

It looks like qtest_probe_accel() is getting used in contexts in the
following patches that would be better suited with an "enabled" API

 qtest_accel_enabled(s, accel_name)

So, I think we should create that interface. Do we also need a
qtest_has_accel()? Does it matter which ones have been compiled
in when they're not active?

(Hmm, 'active' might be a better verb yet. qtest_accel_active() ?)

Thanks,
drew


