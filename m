Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48FD569A92
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:35:45 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9L72-0003pd-E0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9Kxr-0008Eq-3p
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9Kxo-0004cA-3G
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657175171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfaWV0ZU2uyt1d0NsuFfndWEZvMagnbCE7eYgpxEITI=;
 b=PCPt9nN7wTzC/qAj13kjZ0BwZXrOlLwflDVm0DPqKog+SmHjRM1sC1zbZGTLk3ISoW3Zqy
 +flYmrSc5LtsY+UkIcZHFliO7DYoAxlOH1AVi51eXcEAQY9bmJCUPcpaeIWk12oUH4uVrH
 /KHVCdyMnkxCz5A4JSOVz3SNMeT8394=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-S4IRQAKqN8Sz51KYZf0uGQ-1; Thu, 07 Jul 2022 02:26:09 -0400
X-MC-Unique: S4IRQAKqN8Sz51KYZf0uGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB8A38041C7;
 Thu,  7 Jul 2022 06:26:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45D9D1415117;
 Thu,  7 Jul 2022 06:26:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FDEA21E690D; Thu,  7 Jul 2022 08:26:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: michael.roth@amd.com,  kkostiuk@redhat.com,
 marcandre.lureau@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/2] qapi: Avoid generating C identifier 'linux'
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
 <20220707005602.696557-2-pizhenwei@bytedance.com>
Date: Thu, 07 Jul 2022 08:26:08 +0200
In-Reply-To: <20220707005602.696557-2-pizhenwei@bytedance.com> (zhenwei pi's
 message of "Thu, 7 Jul 2022 08:56:01 +0800")
Message-ID: <87edyxiglb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zhenwei pi <pizhenwei@bytedance.com> writes:

> 'linux' is not usable as identifier, because C compilers targeting
> Linux predefine it as a macro expanding to 1.  Add it to
> @polluted_words. 'unix' is already there.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  scripts/qapi/common.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 489273574a..737b059e62 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -> str:
>                       'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
>                       'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>      # namespace pollution:
> -    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386'])
> +    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386', 'l=
inux'])

If this list gets any longer, we better keep it in alphabetical order.

>      name =3D re.sub(r'[^A-Za-z0-9_]', '_', name)
>      if protect and (name in (c89_words | c99_words | c11_words | gcc_wor=
ds
>                               | cpp_words | polluted_words)

Reviewed-by: Markus Armbruster <armbru@redhat.com>


