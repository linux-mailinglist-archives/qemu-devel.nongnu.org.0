Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42268A9AA
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 12:36:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOGpG-0004Fd-Q2; Sat, 04 Feb 2023 06:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOGox-0004FU-6B
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:35:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pOGou-00046i-7I
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675510499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6stFk6KHz/dx5hLNEBn9ULDeSSl96nSyCnXgYE53LJY=;
 b=gmk3XGFP06K/9jJgPeQiCeFsbSbHu8n/sbU+daub+vr/q8ryCGMSpDW8CYjb/3CMAlhKUM
 bJE7v2aaI9GetVQXMTd9qolQ00pVUwb+Kfe6V0ZIOgTXM/x516VWsYBmb7aporhdX38ZtO
 3/L04+8DSJavVgYeG2hYD2DBVLy0qKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-UiQR5YkoOemSD3MJJgOuSw-1; Sat, 04 Feb 2023 06:34:55 -0500
X-MC-Unique: UiQR5YkoOemSD3MJJgOuSw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87AA91C05AAD;
 Sat,  4 Feb 2023 11:34:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE15492B17;
 Sat,  4 Feb 2023 11:34:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FE3321E6A1F; Sat,  4 Feb 2023 12:34:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,  Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 4/4] qapi: update pylint configuration
References: <20230203184733.523522-1-jsnow@redhat.com>
 <20230203184733.523522-5-jsnow@redhat.com>
Date: Sat, 04 Feb 2023 12:34:54 +0100
In-Reply-To: <20230203184733.523522-5-jsnow@redhat.com> (John Snow's message
 of "Fri, 3 Feb 2023 13:47:33 -0500")
Message-ID: <87o7q97jfl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> Newer versions of pylint disable the "no-self-use" message by
> default. Older versions don't, though. If we leave the suppressions in,
> pylint yelps about useless options. Just tell pylint to shush.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/pylintrc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
> index a7246282030..90546df5345 100644
> --- a/scripts/qapi/pylintrc
> +++ b/scripts/qapi/pylintrc
> @@ -23,6 +23,7 @@ disable=fixme,
>          too-many-statements,
>          too-many-instance-attributes,
>          consider-using-f-string,
> +        useless-option-value,
>  
>  [REPORTS]

Pylint docs[*] explains this is "used when a value for an option that is
now deleted from pylint is encountered."  Switching that off makes sense
when you have to deal with a range of versions.  Occasional garbage
collection of old options is advised :)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


[*] https://pylint.pycqa.org/en/latest/user_guide/messages/refactor/useless-option-value.html


