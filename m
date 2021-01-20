Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFE2FD446
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:41:55 +0100 (CET)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FcI-0002Fq-Ut
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FSg-00011a-W9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FSa-0003ir-Hr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xat5P+s9V14fTaLNV/hUrsmsnbnWz3bbP2Kd92nPp8w=;
 b=TwgOxDPUaCXqLCdogmko8MGFLV1UACemk96etNi2Nr4zGCogTwjVX1/t1A3IzunVvE0RUi
 zV5sOeN1G9XetvNq59RVb1blPvnU3EWZIMFgLRb0/CJBHqsvzikM40Nwxjemauuy5lXtFD
 xaVh/IOfAh/uCsd5ki5IR6hkYkoc0CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ri9FZNKYOy2O-nGcqqGC_w-1; Wed, 20 Jan 2021 10:31:46 -0500
X-MC-Unique: ri9FZNKYOy2O-nGcqqGC_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7013806662
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 15:31:44 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78AD01002C10;
 Wed, 20 Jan 2021 15:31:40 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210120144235.345983-3-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/3] qmp: remove deprecated "change" command
Message-ID: <a5e9ca14-1667-09ec-a47a-ced4e569f08f@redhat.com>
Date: Wed, 20 Jan 2021 09:31:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120144235.345983-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 8:42 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst       |  5 ----
>  docs/system/removed-features.rst |  5 ++++
>  monitor/qmp-cmds.c               | 51 --------------------------------
>  qapi/misc.json                   | 49 ------------------------------
>  4 files changed, 5 insertions(+), 105 deletions(-)

>  
> -``change`` (since 2.5.0)
> -''''''''''''''''''''''''
> -
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.

We didn't document a fallback for changing the vnc listener...


> +++ b/docs/system/removed-features.rst
> @@ -53,6 +53,11 @@ are automatically loaded from qcow2 images.
>  Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
>  documentation of ``query-hotpluggable-cpus`` for additional details.
>  
> +``change`` (removed in 6.0)
> +'''''''''''''''''''''''''''
> +
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.

...and still don't,...


> -static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
> -                           Error **errp)
> -{
> -    if (strcmp(target, "passwd") == 0 || strcmp(target, "password") == 0) {
> -        if (!has_arg) {
> -            error_setg(errp, QERR_MISSING_PARAMETER, "password");
> -        } else {
> -            qmp_change_vnc_password(arg, errp);
> -        }
> -    } else {
> -        qmp_change_vnc_listen(target, errp);

...and now we're entirely removing that QMP ability, without
deprecation.  Is that intended?

> +++ b/qapi/misc.json
> @@ -238,55 +238,6 @@
>    'returns': 'str',
>    'features': [ 'savevm-monitor-nodes' ] }
>  
> -##
> -# @change:
> -#
> -# This command is multiple commands multiplexed together.
> -#
> -# @device: This is normally the name of a block device but it may also be 'vnc'.
> -#          when it's 'vnc', then sub command depends on @target
> -#
> -# @target: If @device is a block device, then this is the new filename.
> -#          If @device is 'vnc', then if the value 'password' selects the vnc
> -#          change password command.   Otherwise, this specifies a new server URI
> -#          address to listen to for VNC connections.

That is, I'm wondering if we should be adding a change-vnc-listener QMP
command, and extending the deprecation for 2 more releases to allow this
final use of 'change vnc' to still work.  Or are we really at the point
where we have no known users?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


