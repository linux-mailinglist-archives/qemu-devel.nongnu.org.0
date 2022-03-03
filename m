Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B74CB69F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 07:00:02 +0100 (CET)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeVN-0001yT-0l
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 01:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPeUN-0001JX-Bg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPeUJ-0003Qv-NS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646287133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkPNwE/U9zETtoZt0fHYLZiB/Uzqr7ZqIxZA6zsS7Jw=;
 b=bMMRVgpheo8UjZD8ieSSk4z8Bn3FMgxDGp2FUmudPSK1SPr+1LrqRHw+rbPxlgPlG1RWfH
 2Pk4fuThyxxDMKoJOWXp2GFTR72BWqRYQzCKbv4/M0k6JFx7vNb/lTVboxcy2RckC0imER
 7ich/SMMs0it40KnE2SYtXNLLyOwizc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-1Q__zNclMF2UTqumet0xOQ-1; Thu, 03 Mar 2022 00:58:50 -0500
X-MC-Unique: 1Q__zNclMF2UTqumet0xOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0F98145F7;
 Thu,  3 Mar 2022 05:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D697A7D5A8;
 Thu,  3 Mar 2022 05:58:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 626BC21E6A00; Thu,  3 Mar 2022 06:58:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v17 8/8] tests/qtest/qmp-cmd-test: Ignore
 query-vcpu-dirty-limit test
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <cover.1646243447.git.huangy81@chinatelecom.cn>
 <324b04870910c6fc489d0b1e4fe4e098737ae8c4.1646243447.git.huangy81@chinatelecom.cn>
Date: Thu, 03 Mar 2022 06:58:34 +0100
In-Reply-To: <324b04870910c6fc489d0b1e4fe4e098737ae8c4.1646243447.git.huangy81@chinatelecom.cn>
 (huangy's message of "Thu, 3 Mar 2022 01:55:14 +0800")
Message-ID: <87o82nefw5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> query-vcpu-dirty-limit success depends on enabling dirty
> page rate limit, so just add it to the list of skipped
> command to ensure qmp-cmd-test run successfully.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/qtest/qmp-cmd-test.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 7f103ea..4b216a0 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
>          "query-sev-capabilities",
>          "query-sgx",
>          "query-sgx-capabilities",
> +        /* Success depends on enabling dirty page rate limit */
> +        "query-vcpu-dirty-limit",
>          NULL
>      };
>      int i;

I think you need to squash this into the patch that adds the command, so
"make check" passes after each commit.

As far as I can tell, there is no other test coverage.  That gap needs
to be plugged.


