Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98649CC21
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:18:02 +0100 (CET)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCj7Z-0006Mn-47
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCiun-0005EB-PK
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:04:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCiuk-0003oy-Ra
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643205886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6awlG9ZtuhVYK5S2uxTdtgOh3NvXjwsG5EGhHg70k8=;
 b=IjIwIpgKajGqogg8WRxys+YPo9W+UWWUO1g5ImD8KwY2HGfrt8c8/iBSlzu0YZg/8DRDM1
 28gF8MZoGdbYg/V6w5fpkk6+/zKq8abkau9i2/mOuispYhMfyxqllwSw/t2IMZDxaLt/ED
 uOuGSI/Sp4mDmu0AU2V36SgeSvqTygg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-NOOfaRN5N0euQitcybL-zw-1; Wed, 26 Jan 2022 09:04:40 -0500
X-MC-Unique: NOOfaRN5N0euQitcybL-zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D84D824F83;
 Wed, 26 Jan 2022 14:04:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4767798A4;
 Wed, 26 Jan 2022 14:04:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FE2B113864A; Wed, 26 Jan 2022 15:04:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-7-vsementsov@virtuozzo.com>
Date: Wed, 26 Jan 2022 15:04:17 +0100
In-Reply-To: <20220125215655.3111881-7-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 22:56:54 +0100")
Message-ID: <87mtjitwym.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Making trace generation work for tests/ and qga/ would involve some
> Meson hackery to ensure we generate the trace-events files before
> trace-tool uses them. Since we don't actually support tracing there
> anyway, we bypass that problem.
>
> Let's add corresponding comments.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qga/meson.build   | 8 ++++++++
>  tests/meson.build | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/qga/meson.build b/qga/meson.build
> index cfb1fbc085..79fcf91751 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -15,6 +15,14 @@ qga_qapi_outputs = [
>    'qga-qapi-visit.h',
>  ]
>  
> +# We don't generate trace-events, just because it's not simple. For do it,
> +# we also should add .trace-events file into qga_qapi_outputs, and than
> +# add corresponding element of qga_qapi_files into qapi_trace_events
> +# global list, which is processed than in trace/meson.build.
> +# This means, that we'll have to move subdir('qga') above subdir('trace')
> +# in root meson.build. But that in turn will break the dependency of
> +# qga on qemuutil (which depends on trace_ss).
> +# So, resolving these dependencies and drop --no-trace-events is a TODO.

The option is still called --gen-trace at this point.  Easy fix: squash
into the next commit.

Suggest

   # Problem: to generate trace events, we'd have to add the .trace-events
   # file to qapi_trace_events like we do in qapi/meson.build.  Since
   # qapi_trace_events is used by trace/meson.build, we'd have to move
   # subdir('qga') above subdir('trace') in the top-level meson.build.
   # Can't, because it would break the dependency of qga on qemuutil (which
   # depends on trace_ss).  Not worth solving now; simply suppress trace
   # event generation instead.

>  qga_qapi_files = custom_target('QGA QAPI files',
>                                 output: qga_qapi_outputs,
>                                 input: 'qapi-schema.json',
> diff --git a/tests/meson.build b/tests/meson.build
> index 3f3882748a..21857d8b01 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -31,6 +31,14 @@ test_qapi_outputs = [
>    'test-qapi-visit.h',
>  ]
>  
> +# We don't generate trace-events, just because it's not simple. For do it,
> +# we also should add .trace-events file into test_qapi_outputs, and than
> +# add corresponding element of test_qapi_files into qapi_trace_events
> +# global list, which is processed than in trace/meson.build.
> +# This means, that we'll have to move subdir('tests') above subdir('trace')
> +# in root meson.build. But that in turn will break the dependency of
> +# tests on qemuutil (which depends on trace_ss).
> +# So, resolving these dependencies and drop --no-trace-events is a TODO.
>  test_qapi_files = custom_target('Test QAPI files',
>                                  output: test_qapi_outputs,
>                                  input: files('qapi-schema/qapi-schema-test.json',

Likewise.


