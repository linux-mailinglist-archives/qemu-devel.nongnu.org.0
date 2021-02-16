Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786631CC03
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:35:02 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1RN-00021H-Jr
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lC1NB-0007bT-RJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lC1NA-0002at-5P
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613485839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daHCBPHAMcAhIS4g+K0dvPUAvZiM0Q5MFRDnccFRnY8=;
 b=LmT+f/guYXSO9JL7l+vcDKUgBS5Bw+O4AYK6bPl5AQyk8v25Bgwet58/3aBp7R6jRgMMaE
 +iOAQl+YCDIWjlciUrgt/hD/udfKu8VGHx9zzf11vHm3q+NVor4/+ryLONgmKxQKUKSPPP
 CY/7l5upw0dzLymDoIxgtD4vjsFIgOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-SJJDrMIqNoCcMUIYTvxyNA-1; Tue, 16 Feb 2021 09:30:36 -0500
X-MC-Unique: SJJDrMIqNoCcMUIYTvxyNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D2C100961D;
 Tue, 16 Feb 2021 14:30:35 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AFE4722CD;
 Tue, 16 Feb 2021 14:30:30 +0000 (UTC)
Date: Tue, 16 Feb 2021 15:30:27 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] qga: return a more explicit error on why a command is
 disabled
Message-ID: <20210216143027.GL2875719@angien.pipo.sk>
References: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 17:38:37 +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qmp_disable_command() now takes an optional error string to return a
> more explicit error message.
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=1928806
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h | 3 ++-
>  qapi/qmp-dispatch.c         | 2 +-
>  qapi/qmp-registry.c         | 9 +++++----
>  qga/main.c                  | 4 ++--
>  4 files changed, 10 insertions(+), 8 deletions(-)

[...]

> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 0a2b20a4e4..ce4bf56b2c 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -157,7 +157,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>      }
>      if (!cmd->enabled) {
>          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> -                  "The command %s has been disabled for this instance",
> +                  cmd->err_msg ?: "The command %s has been disabled for this instance",

Passing in the formatting string from a variable looks shady and it's
hard to ensure that callers pass in the appropriate format modifier ...

>                    command);
>          goto out;
>      }

[...]

> diff --git a/qga/main.c b/qga/main.c
> index e7f8f3b161..c59b610691 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
>      }
>      if (!whitelisted) {
>          g_debug("disabling command: %s", name);
> -        qmp_disable_command(&ga_commands, name);
> +        qmp_disable_command(&ga_commands, name, "The command was disabled after fsfreeze.");

... such as here where '%s' is missing. Luckily that is not a problem
compared to when there would be more than one format modifier.

But the error message looks definitely better.

>      }
>  }

My suggestion would be to store a boolean flag that the command was
disabled due to an ongoing fsfreeze and then choose the appropriate
error message directly at the point where it's reported.


