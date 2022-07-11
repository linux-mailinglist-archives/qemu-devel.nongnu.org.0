Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A70570BBC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:28:46 +0200 (CEST)
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB01M-0002lQ-3w
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oAzzq-0001E9-9N
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oAzzn-0006iH-7B
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5jAjtuCki81mycrpYe4J+ixm1jB/ap4W9xHAm6OMEI=;
 b=YX1mjYEGNuAntqvkNkKiDN08lKL0xNsJ/aSQL7YGf47QRm2z9+XWiNWuBM+m0L7iV0akKf
 PrFLSZ4Cjks4NYMX0aOOICokJDjmmBTnOogyxh0vZrPpv+qRSbi2ir54XAoKhG9d3yBr1j
 B/WePWxMVpa/WPDodP6xQad3QEKUw/A=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-EFr10Sh_NsO_is2dU4lQAA-1; Mon, 11 Jul 2022 16:26:59 -0400
X-MC-Unique: EFr10Sh_NsO_is2dU4lQAA-1
Received: by mail-vk1-f199.google.com with SMTP id
 w127-20020a1fad85000000b00374c92bb78eso853074vke.23
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5jAjtuCki81mycrpYe4J+ixm1jB/ap4W9xHAm6OMEI=;
 b=fUCOav44go4C0pWHWv+miV7Ys3yck44OzDvZ4bWlf+mlbILy+lC32f6Mobx443Tedw
 3HBM/IDlCp91/GtU30BTh0q3IzPcnrYPCgVQ5xHqKS+df5mLb8ekLola0J7bZg/IgC0h
 BIvz/2z2HoiiUppgRkI3OHzweE4Us9MYDLOAAGkTs5J0QKOPjXytb1S/qnGn8Q7snEch
 HaGyghCEwABTa3OdDQR5B59w4qrlFGZTr14v8ImApzxV52QHSET1mPAuOybC3T7OQlzB
 tevyYFCPG/ktOfHQkj53Lv7ETVkTZBcRiUYhvT3eKc5xZP9aSGu5/KsdvlaY9ZSoEo8M
 RVCw==
X-Gm-Message-State: AJIora+k+Q0vwPJ7fninkcLLizi76CgsstKxswoqR8n6ZVR0p2y8x2R4
 jbm2KST5gtkQ/GnxIVuPoIhGQ/0Dz5h2Kr6YbpghtKKd8KvEkplHIQmfN1Zgqg7iV7gjhgzU3A6
 LrJbTi3DD06FuU0kj7U//KH3Fto7fGXQ=
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr724961vks.3.1657571218536; 
 Mon, 11 Jul 2022 13:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMCDCYbwn2hn8wFEHgG6WAd2BDmm/uUjqf9dD4ffn6J3km298DHf4fLyxCPRRMnFZPJcIT2SdXrv0YIwXeuH0=
X-Received: by 2002:a1f:2c11:0:b0:374:dd20:2e67 with SMTP id
 s17-20020a1f2c11000000b00374dd202e67mr724949vks.3.1657571218253; Mon, 11 Jul
 2022 13:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095300.60462-1-thuth@redhat.com>
In-Reply-To: <20220711095300.60462-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:26:47 -0400
Message-ID: <CAFn=p-Yro-K_j7DL0NBr7hKbHxZnYtgvUvLED8n0L6+fBaLvBw@mail.gmail.com>
Subject: Re: [PATCH] Replace 'whitelist' with 'allow'
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 11, 2022 at 5:53 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Let's use more inclusive language here and avoid terms
> that are frowned upon nowadays.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  docs/devel/submitting-a-patch.rst | 2 +-
>  docs/tools/qemu-nbd.rst           | 2 +-
>  scripts/vmstate-static-checker.py | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 09a8d12c2c..fec33ce148 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -39,7 +39,7 @@ ideas from other posts. If you do subscribe, be prepared for a high
>  volume of email, often over one thousand messages in a week. The list is
>  moderated; first-time posts from an email address (whether or not you
>  subscribed) may be subject to some delay while waiting for a moderator
> -to whitelist your address.
> +to allow your address.
>
>  The larger your contribution is, or if you plan on becoming a long-term
>  contributor, then the more important the rest of this page becomes.
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 8e08a29e89..faf6349ea5 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -225,7 +225,7 @@ disconnects:
>    qemu-nbd -f qcow2 file.qcow2
>
>  Start a long-running server listening with encryption on port 10810,
> -and whitelist clients with a specific X.509 certificate to connect to
> +and allow clients with a specific X.509 certificate to connect to
>  a 1 megabyte subset of a raw file, using the export name 'subset':
>
>  ::
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
> index 539ead62b4..b369388360 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -40,7 +40,7 @@ def check_fields_match(name, s_field, d_field):
>          return True
>
>      # Some fields changed names between qemu versions.  This list
> -    # is used to whitelist such changes in each section / description.
> +    # is used to allow such changes in each section / description.
>      changed_names = {
>          'apic': ['timer', 'timer_expiry'],
>          'e1000': ['dev', 'parent_obj'],
> --
> 2.31.1
>


