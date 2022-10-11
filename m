Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549CC5FB6CF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:19:30 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiH2X-0007uw-6k
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiGsZ-0008Eg-80
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiGsS-0008Me-U6
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665500942;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wDAlzFM0v8i+NlLbsvjpgx7gBl5XZ4Rk9YinuQFlaA=;
 b=FFbGL8vqNolD+dAs4/wuKlSR95HtysAAuDBgYYn3KGSdd78zhl5S21Zpyk809g4pIPpG62
 /XJ2Ioqc18hi4x5JyP9eAYwe4KcXDbW5qXiK7dvgJYs5IsarVFhWp2W1sXEDyAnOUBkya7
 7wsVDnxJkcxIbZt5nWd0IIH8+ZPuJsU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-v79kD0uxN7qMVX3hyA_9HA-1; Tue, 11 Oct 2022 11:08:59 -0400
X-MC-Unique: v79kD0uxN7qMVX3hyA_9HA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF302185A78F;
 Tue, 11 Oct 2022 15:08:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6A72083A17;
 Tue, 11 Oct 2022 15:08:57 +0000 (UTC)
Date: Tue, 11 Oct 2022 16:08:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, armbru@redhat.com,
 michael.roth@amd.com, vsementsov@yandex-team.ru
Subject: Re: [PATCH v2] qapi/qmp: Add timestamps to qmp command responses
Message-ID: <Y0WHBjvXJCbUSiAi@redhat.com>
References: <20221011144509.493646-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011144509.493646-1-den-plotnikov@yandex-team.ru>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Tue, Oct 11, 2022 at 05:45:09PM +0300, Denis Plotnikov wrote:
> Add "start" & "end" time values to qmp command responses.
> 
> These time values are added to let the qemu management layer get the exact
> command execution time without any other time variance which might be brought by
> other parts of management layer or qemu internals. This is particulary useful
> for the management layer logging for later problems resolving.
> 
> Example of result:
> 
>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
> 
>     (QEMU) query-status
>     {"end": {"seconds": 1650367305, "microseconds": 831032},
>      "start": {"seconds": 1650367305, "microseconds": 831012},
>      "return": {"status": "running", "singlestep": false, "running": true}}
> 
> The responce of the qmp command contains the start & end time of
> the qmp command processing.
> 
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
> v0->v1:
>  - remove interface to control "start" and "end" time values: return timestamps unconditionally
>  - add description to qmp specification
>  - leave the same timestamp format in "seconds", "microseconds" to be consistent with events
>    timestamp
>  - fix patch description
> 
> v1->v2:
>  - rephrase doc descriptions [Daniel]
>  - add tests for qmp timestamps to qmp test and qga test [Daniel]
>  - adjust asserts in test-qmp-cmds according to the new number of returning keys
> 
>  docs/interop/qmp-spec.txt  | 28 ++++++++++++++++++++++++++--
>  qapi/qmp-dispatch.c        | 18 ++++++++++++++++++
>  tests/qtest/qmp-test.c     | 34 ++++++++++++++++++++++++++++++++++
>  tests/unit/test-qga.c      | 31 +++++++++++++++++++++++++++++++
>  tests/unit/test-qmp-cmds.c |  4 ++--
>  5 files changed, 111 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


