Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770001EE684
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 16:21:40 +0200 (CEST)
Received: from localhost ([::1]:38140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgqkV-000607-BZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 10:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgqjl-0005Z3-BJ
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:20:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33885
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgqjj-0006Un-PN
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591280449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWwxtoDxsWyfMnOAoxMaltgrCfi4eRLL7Y8KVNIOw/I=;
 b=RqysOS1NFEQcooXKpT8RvqIKIFhRoQ1079GMuWAj1N29o0WfzoL/mi46EOJfYNAklcPTB7
 FeszXTWfIvBy/EZ+9tR9wFgNfERrPSz04XIqs3C5sPt1So+7QnACFxItuklMkiyT+ifTyl
 sC6XLFWZZQaXMsDtnVUMD7TDcy6NTTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-FgkUDjQ_O5emukfHTzZ-2g-1; Thu, 04 Jun 2020 10:20:47 -0400
X-MC-Unique: FgkUDjQ_O5emukfHTzZ-2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36D41800D42;
 Thu,  4 Jun 2020 14:20:46 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07899100164C;
 Thu,  4 Jun 2020 14:20:44 +0000 (UTC)
Date: Thu, 4 Jun 2020 16:20:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 10/16] python/machine.py: Handle None events in
 event_wait
Message-ID: <20200604142043.GH4512@linux.fritz.box>
References: <20200602214528.12107-1-jsnow@redhat.com>
 <20200602214528.12107-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602214528.12107-11-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.06.2020 um 23:45 hat John Snow geschrieben:
> If the timeout is 0, we can get None back. Handle this explicitly.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Subject line: This is events_wait(), not event_wait(). Both functions
exist.

> @@ -562,6 +564,8 @@ def _match(event):
>          # Poll for new events
>          while True:
>              event = self._qmp.pull_event(wait=timeout)
> +            if event is None:
> +                break
>              if _match(event):
>                  return event
>              self._events.append(event)

Hm... How could this ever work? I guess we just never really tested
whether timeouts actually time out?

(It's still somewhat unintuitive that receiving an unrelated event
resets the timeout, but not the problem of this series...)

Kevin


