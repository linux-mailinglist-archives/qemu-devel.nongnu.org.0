Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB951D2C29
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 12:07:37 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZAm7-0006Bc-N6
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 06:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZAlC-00051w-S3
 for qemu-devel@nongnu.org; Thu, 14 May 2020 06:06:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31651
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZAlB-0005YG-9R
 for qemu-devel@nongnu.org; Thu, 14 May 2020 06:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589450795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zh1eourHcSUlN1PgQxstmLVVfQd5CfUjGEOn8Z+2gBc=;
 b=LxzWLW0maCUWXdZVGWM9ClWASLvXxgVxMQn1zZanEpB0pfrfYlwhI4MEfF2rJ5izhnWdzX
 E2fOP+72/e4/9RZXbA+GZEpOVeh4nlHOTrjMXV/VIBnprT6ihBobI57+7qC0TZ3Z3kYMW1
 YCG2CEFw5TXOgJdHzHLz+ehrEMjvgZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-WKDVwSHwOpWgbZ_sqvj6Og-1; Thu, 14 May 2020 06:06:32 -0400
X-MC-Unique: WKDVwSHwOpWgbZ_sqvj6Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9AE835B7B;
 Thu, 14 May 2020 10:06:31 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6757D96D;
 Thu, 14 May 2020 10:06:25 +0000 (UTC)
Date: Thu, 14 May 2020 12:06:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v10 14/14] iotests: use python logging for iotests.log()
Message-ID: <20200514100623.GB5518@linux.fritz.box>
References: <20200331000014.11581-1-jsnow@redhat.com>
 <20200331000014.11581-15-jsnow@redhat.com>
 <20200331134446.GF7030@linux.fritz.box>
 <1a38728b-aa4b-f3e4-c3ad-1a2b8d2e9269@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1a38728b-aa4b-f3e4-c3ad-1a2b8d2e9269@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: ehabkost@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.05.2020 um 08:24 hat John Snow geschrieben:
> On 3/31/20 9:44 AM, Kevin Wolf wrote:
> > Am 31.03.2020 um 02:00 hat John Snow geschrieben:
> >> We can turn logging on/off globally instead of per-function.
> >>
> >> Remove use_log from run_job, and use python logging to turn on
> >> diffable output when we run through a script entry point.
> >>
> >> iotest 245 changes output order due to buffering reasons.
> >>
> >>
> >> An extended note on python logging:
> >>
> >> A NullHandler is added to `qemu.iotests` to stop output from being
> >> generated if this code is used as a library without configuring logging.
> >> A NullHandler is only needed at the root, so a duplicate handler is not
> >> needed for `qemu.iotests.diff_io`.
> >>
> >> When logging is not configured, messages at the 'WARNING' levels or
> >> above are printed with default settings. The NullHandler stops this from
> >> occurring, which is considered good hygiene for code used as a library.
> >>
> >> See https://docs.python.org/3/howto/logging.html#library-config
> >>
> >> When logging is actually enabled (always at the behest of an explicit
> >> call by a client script), a root logger is implicitly created at the
> >> root, which allows messages to propagate upwards and be handled/emitted
> >> from the root logger with default settings.
> >>
> >> When we want iotest logging, we attach a handler to the
> >> qemu.iotests.diff_io logger and disable propagation to avoid possible
> >> double-printing.
> >>
> >> For more information on python logging infrastructure, I highly
> >> recommend downloading the pip package `logging_tree`, which provides
> >> convenient visualizations of the hierarchical logging configuration
> >> under different circumstances.
> >>
> >> See https://pypi.org/project/logging_tree/ for more information.
> >>
> >> Signed-off-by: John Snow <jsnow@redhat.com>
> >> Reviewed-by: Max Reitz <mreitz@redhat.com>
> > 
> > Should we enable logger if -d is given?
> > 
> > Previously we had:
> > 
> > $ ./check -d -T -raw 281
> > [...]
> > 281 not run: not suitable for this image format: raw
> > 281      not run    [15:39:03] [15:39:04]                    not suitable for this image format: raw
> > Not run: 281
> > 
> > After this series, the first line of output from notrun() is missing.
> > Not that I think it's important to have the line, but as long as we
> > bother to call logger.warning(), I thought that maybe we want to be able
> > to actually see the effect of it somehwere?
> > 
> > Kevin
> > 
> 
> Uh, okay. So this is weirder than I thought it was going to be!
> 
> So, if you move the debug configuration up above the _verify calls,
> you'll see the message printed out to the debug stream:
> 
> DEBUG:qemu.iotests:iotests debugging messages active
> WARNING:qemu.iotests:281 not run: not suitable for this image format: raw
> 
> ...but if you omit the `-d` flag, the message vanishes into a black
> hole. Did it always work like that ...?

Yes, this is how it used to work. It's a result of ./check only printing
the test output with -d, and such log messages are basically just test
output.

And I think it's exactly what we want: Without -d, you want only the
summary, i.e. a single line that says "pass", "fail" or "notrun",
potentially with a small note at the end of the line, but that's it.

Kevin


