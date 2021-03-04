Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E375D32D7F1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:39:15 +0100 (CET)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHr0M-0005jE-86
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHqyx-0005Gy-LK
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHqyu-00007x-SV
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614875863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckOqofLsOIsoeen12z3fXhDeL5yOsqPecXFIqAuZRt4=;
 b=RX503zTkOsoOaiFQ2pvgf2j0cekPV1+AQQq8a7cCK878PumrS03APa52BjJmEz8awMXHr5
 Rihjpr1ub2RO9tIaML3YEFbSfbnKu0JqA9Vtvvohw2u7oixJQ4pN3TrLCcJmSFuhYBqOes
 jcrzYNUAiUAoNJCpwWqeAbU2z3PsTd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-sqSAtrN1MKmr_jnHXwuOOg-1; Thu, 04 Mar 2021 11:37:41 -0500
X-MC-Unique: sqSAtrN1MKmr_jnHXwuOOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3DF78143F1
 for <qemu-devel@nongnu.org>; Thu,  4 Mar 2021 16:37:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6A5216922;
 Thu,  4 Mar 2021 16:37:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2725F1132C12; Thu,  4 Mar 2021 17:37:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] qemu-option: do not suggest using the delay option
References: <20210304111743.118752-1-pbonzini@redhat.com>
Date: Thu, 04 Mar 2021 17:37:39 +0100
In-Reply-To: <20210304111743.118752-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 4 Mar 2021 12:17:43 +0100")
Message-ID: <87eegudgdo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> The "delay" option was a hack that was introduced to allow writing "nodel=
ay".
> We are adding a "nodelay" option to be used as "nodelay=3Don", so recomme=
nd it
> instead of "delay".
>
> This is quite ugly, but a proper deprecation of "delay"
> cannot be done if QEMU starts suggesting it.  Since it's the
> only case I opted for this very much ad-hoc patch.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst | 6 ++++++
>  util/qemu-option.c         | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index fcf0ca4068..cfabe69846 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -134,6 +134,12 @@ Boolean options such as ``share=3Don``/``share=3Doff=
`` could be written
>  in short form as ``share`` and ``noshare``.  This is now deprecated
>  and will cause a warning.
> =20
> +``delay`` option for socket character devices (since 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The replacement for the ``nodelay`` short-form boolean option is ``nodel=
ay=3Don``
> +rather than ``delay=3Doff``.
> +
>  ``--enable-fips`` (since 6.0)
>  '''''''''''''''''''''''''''''
> =20
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index 40564a12eb..9678d5b682 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -785,7 +785,11 @@ static const char *get_opt_name_value(const char *pa=
rams,
>              }
>              if (!is_help && warn_on_flag) {
>                  warn_report("short-form boolean option '%s%s' deprecated=
", prefix, *name);
> -                error_printf("Please use %s=3D%s instead\n", *name, *val=
ue);
> +                if (g_str_equal(*name, "delay")) {
> +                    error_printf("Please use nodelay=3D%s instead\n", pr=
efix[0] ? "on" : "off");
> +                } else {
> +                    error_printf("Please use %s=3D%s instead\n", *name, =
*value);
> +                }
>              }
>          }
>      } else {

I agree it's ugly, but I don't have better ideas, and it'll go away
eventually.

The warning gets emitted for any QemuOpts parameter named "delay" used
without a value, not just socket chardev's parameter.  Could result in
somewhat misleading warnings, but trying to avoid them seems a waste of
our time.

Should we mention this in the commit message?  Or even in a code
comment?  Up do you.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


