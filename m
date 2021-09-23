Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809E4166DE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:44:46 +0200 (CEST)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVaH-0004gW-GH
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTVTd-0005rG-Ex
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:37:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTVTY-0005dI-Gm
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632429467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dihimi41Fps2rXZm9CPz5cXoKBrbVrACPQvWCiQmCVI=;
 b=gHB8Atod2dJh6a/K7OsDH3XOHyD3re2YMupMa8QC6tsCYcnS8FAtK5M+BgoOcI73PIG7x8
 BCHGQsE2xMK+1BRz4RUUQEMf6+3aU0tkSNdnEAzic9fQ2VXwoyfD3yArdBOCVDuxwVPhHF
 JCEzsFYtpcjDOiRUB6QNmvkibqGNA7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-UsfqmyttOHGQEbuCQJuryw-1; Thu, 23 Sep 2021 16:37:45 -0400
X-MC-Unique: UsfqmyttOHGQEbuCQJuryw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F114189BBA8;
 Thu, 23 Sep 2021 20:37:15 +0000 (UTC)
Received: from localhost (unknown [10.22.8.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F21B5D9DC;
 Thu, 23 Sep 2021 20:37:15 +0000 (UTC)
Date: Thu, 23 Sep 2021 16:37:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] docs: remove non-reference uses of single backticks
Message-ID: <20210923203714.ad6ydchgrgb6kozv@habkost.net>
References: <20210923191323.59726-1-jsnow@redhat.com>
 <20210923191323.59726-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923191323.59726-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 03:13:22PM -0400, John Snow wrote:
> The single backtick markup in ReST is the "default role". Currently,
> Sphinx's default role is called "content". Sphinx suggests you can use
> the "Any" role instead to turn any single-backtick enclosed item into a
> cross-reference.
> 
> This is useful for things like autodoc for Python docstrings, where it's
> often nicer to reference other types with `foo` instead of the more
> laborious :py:meth:`foo`. It's also useful in multi-domain cases to
> easily reference definitions from other Sphinx domains, such as
> referencing C code definitions from outside of kerneldoc comments.
> 
> Before we do that, though, we'll need to turn all existing usages of the
> "content" role to inline verbatim markup wherever it does not correctly
> resolve into a cross-refernece by using double backticks instead.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/fuzzing.rst                 | 9 +++++----
>  docs/devel/tcg-plugins.rst             | 2 +-
>  docs/interop/live-block-operations.rst | 2 +-
>  docs/system/guest-loader.rst           | 2 +-
>  qapi/block-core.json                   | 4 ++--
>  include/qemu/module.h                  | 6 +++---
>  qemu-options.hx                        | 4 ++--
>  7 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 2749bb9bed3..784ecb99e66 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -182,10 +182,11 @@ The output should contain a complete list of matched MemoryRegions.
>  
>  OSS-Fuzz
>  --------
> -QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
> -By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
> -generic-fuzz target requires additional information provided in environment
> -variables, we pre-define some generic-fuzz configs in
> +QEMU is continuously fuzzed on `OSS-Fuzz
> +<https://github.com/google/oss-fuzz>`_.  By default, the OSS-Fuzz build

Gosh, I think I'll never understand the syntax for links in
reStructuredText.

> +will try to fuzz every fuzz-target. Since the generic-fuzz target
> +requires additional information provided in environment variables, we
> +pre-define some generic-fuzz configs in
>  ``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
[...]


Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


