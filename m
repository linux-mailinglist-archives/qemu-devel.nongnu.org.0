Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA9600E26
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:52:32 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOfX-00021O-OS
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okOX0-0000Ik-7a
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okOWy-0008HJ-BG
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666007019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTRB5W2p7YEbDX7lpEu2tQFQqH1EsRbGgC4hyCvO3F8=;
 b=EUbVsudnjIf1xUnp9rnhjgP/nPzTdG2yY0wcWUHDalTSkcbBcWEyiLlfSgT2HPG3GEPA+J
 TDYpiIoijNmikYRFJitsd55bcoDYux+QWFm2vWl0uPNi40hcoWdzp45+DqWkIPTCKALzQT
 KITLht/BTcD5RaOrsUi4ozj8dKCXxwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-Tt2isGIRNsaRaIP2s-9Ucg-1; Mon, 17 Oct 2022 07:43:36 -0400
X-MC-Unique: Tt2isGIRNsaRaIP2s-9Ucg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 053318630C5;
 Mon, 17 Oct 2022 11:43:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99146C15BB9;
 Mon, 17 Oct 2022 11:43:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A3C521E691D; Mon, 17 Oct 2022 13:43:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  bin.meng@windriver.com,
 qemu-trivial@nongnu.org,  Juan Quintela <quintela@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Do not try to print NULL
 pointer string
References: <20221017105506.69149-1-thuth@redhat.com>
Date: Mon, 17 Oct 2022 13:43:34 +0200
In-Reply-To: <20221017105506.69149-1-thuth@redhat.com> (Thomas Huth's message
 of "Mon, 17 Oct 2022 12:55:06 +0200")
Message-ID: <877d0y8yl5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Thomas Huth <thuth@redhat.com> writes:

> If tmpfs is NULL, we should not try to print it as a string.
>
> Reported-by: shengjiangwuqq on github.com
> Fixes: e5553c1b8d ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/migration-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ef4427ff4d..de70611f50 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2481,8 +2481,7 @@ int main(int argc, char **argv)
>  
>      tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
>      if (!tmpfs) {
> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> -                       err->message);
> +        g_test_message("g_dir_make_tmp failed: %s", err->message);
>      }
>      g_assert(tmpfs);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


