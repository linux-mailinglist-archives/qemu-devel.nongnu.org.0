Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACB31CCCF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:21:19 +0100 (CET)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2AA-0005UO-RF
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lC23P-0000Xp-IA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lC23N-0007Nl-F9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsPN0JbVwxehgIiD7+wBGaNwS+/6HN3DC4nQi/m8TEQ=;
 b=HhMKknm/GqYTkqO8gpxr/v+afMXrNRF+cf+0loWpk0g31ek6+einHSrHvZuAc4wIW6sO3t
 GfLSZlhq/CTWmCS2NKRLskkB42SZLuutDoSWzjZvtoMiGnAlwtNgV8qE3PpZQv3/+K//ey
 bmE70SBOQ+gjjDwelWLgp1AduZbGNnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-B7cozJ1jMzCwF4OQqVuDjQ-1; Tue, 16 Feb 2021 10:14:10 -0500
X-MC-Unique: B7cozJ1jMzCwF4OQqVuDjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71876801976;
 Tue, 16 Feb 2021 15:14:09 +0000 (UTC)
Received: from [10.3.112.76] (ovpn-112-76.phx2.redhat.com [10.3.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E612560C15;
 Tue, 16 Feb 2021 15:14:03 +0000 (UTC)
Subject: Re: [PATCH] qga: return a more explicit error on why a command is
 disabled
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ff150e0f-7559-c966-4b1c-ec32305a0286@redhat.com>
Date: Tue, 16 Feb 2021 09:14:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:38 AM, marcandre.lureau@redhat.com wrote:
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

> +++ b/qapi/qmp-dispatch.c
> @@ -157,7 +157,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>      }
>      if (!cmd->enabled) {
>          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> -                  "The command %s has been disabled for this instance",
> +                  cmd->err_msg ?: "The command %s has been disabled for this instance",

No trailing dot (good),...

> +++ b/qga/main.c
> @@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
>      }
>      if (!whitelisted) {
>          g_debug("disabling command: %s", name);
> -        qmp_disable_command(&ga_commands, name);
> +        qmp_disable_command(&ga_commands, name, "The command was disabled after fsfreeze.");

...while this introduces one (not good).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


