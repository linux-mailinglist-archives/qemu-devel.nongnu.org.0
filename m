Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548DF57C462
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 08:27:53 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEPf6-0006p0-9L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 02:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oEPcD-0004sU-DA
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 02:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oEPc9-0004Pw-TL
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 02:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658384688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMcCOMRIVUP+sp8EqEfUilefZzKeSO24oR05e5f7WQM=;
 b=GFyT+PqHzfXEjefeHNlcHJC+o8ooADStntew54yqW5bMFdTHBr+AKmjZciWIwFotXnixQs
 N4kOiFVCDqkPYi0jfclTTop58mitnV9C8WP7e1ROeskJMTRowwOahq5mbTAxEboaLn6fX2
 qnt9TPP235zKRM25/rTU/Yh/HHBhARs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-6Y5IR36YMd-9SL8JrsI2Ow-1; Thu, 21 Jul 2022 02:24:44 -0400
X-MC-Unique: 6Y5IR36YMd-9SL8JrsI2Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 949AE185A7BA;
 Thu, 21 Jul 2022 06:24:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71EB2C28129;
 Thu, 21 Jul 2022 06:24:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CBA921E690D; Thu, 21 Jul 2022 08:24:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/5] configure: Add braces to clarify intent of
 $emu[[:space:]]
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-3-peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 08:24:43 +0200
In-Reply-To: <20220720152631.450903-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Wed, 20 Jul 2022 16:26:28 +0100")
Message-ID: <87a693kmok.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Peter Maydell <peter.maydell@linaro.org> writes:

> In shell script syntax, $var[something] is not special for variable
> expansion: $emu is expanded.  However, as it can look as if it were

Do you mean "$var is expanded"?

> intended to be an array element access (the correct syntax for which
> is ${var[something]}), shellcheck recommends using explicit braces
> around ${var} to clarify the intended expansion.
>
> This fixes the warning:
>
> In ./configure line 2346:
>         if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
>                                                               ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is our only 'error' level shellcheck warning, so it seems
> worth suppressing even though it's not wrong as written.
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index dec6f030346..a56c3d921be 100755
> --- a/configure
> +++ b/configure
> @@ -2343,7 +2343,7 @@ if test -n "$target_cc" &&
>      # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
>      # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
>      for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
> -        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
> +        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
>              ld_i386_emulation="$emu"
>              break
>          fi


