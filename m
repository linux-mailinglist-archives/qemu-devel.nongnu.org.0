Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47845FDD55
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:42:53 +0200 (CEST)
Received: from localhost ([::1]:40114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0MG-0002IZ-Tz
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oj0KR-0007uk-QN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oj0KO-0005id-Fc
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665675655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vPQO/SA5gPUnyW0Yau866Twd/gJ727tsXkLwGEu0YFg=;
 b=Oe0G1bcCWYKnn1JTOWjVpdrjXR0Dw3x69qCUixzSIwjdhLhM3cOv+FgEvpHBW2tGzDXbp2
 Mo4H1qkl6/mpuY159lfXHYpdSjKqe0RdI/h6kh/dEKmX430336ETVjaqr9yo+Z+YQ3Zwl+
 yG/PydHEdBzP8m7fXJI79gpeUSRfwXc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-t4RAPu8PNOGdOmPCYjwlkw-1; Thu, 13 Oct 2022 11:40:51 -0400
X-MC-Unique: t4RAPu8PNOGdOmPCYjwlkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5840A857D1B;
 Thu, 13 Oct 2022 15:40:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DF740C2088;
 Thu, 13 Oct 2022 15:40:49 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:40:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, michael.roth@amd.com,
 vsementsov@yandex-team.ru, marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
Message-ID: <Y0gxfqMXi3gLH/3H@redhat.com>
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tu47vkdx.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
> 
> > Add "start" & "end" time values to qmp command responses.
> 
> Please spell it QMP.  More of the same below.
> 
> >
> > These time values are added to let the qemu management layer get the exact
> > command execution time without any other time variance which might be brought by
> > other parts of management layer or qemu internals. This is particulary useful
> > for the management layer logging for later problems resolving.
> 
> I'm still having difficulties seeing the value add over existing
> tracepoints and logging.
> 
> Can you tell me about a problem you cracked (or could have cracked) with
> the help of this?

Consider your QMP client is logging all commands and replies in its
own logfile (libvirt can do this). Having this start/end timestamps
included means the QMP client log is self contained.

Relying on tracing means that when a user attaches the QMP client log
to a bug report, the timing info is missing. You have to ask the user
to try to reproduce again with QEMU tracing enabled, which may be
impossible, and then correlate the tracing output with the QMP client
log.

QEMU side tracing & logging is fine, but not a substitute for having
this info included by default IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


