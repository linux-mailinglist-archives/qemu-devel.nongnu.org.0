Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198502FD3F9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:30:35 +0100 (CET)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FRJ-0006zC-Vc
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FLw-0000Al-Gt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FLt-0001KH-NZ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYymX9uRxfLc67WJ8GjmdyWTSVgOfL27M1NAgTINCpQ=;
 b=Zeid4PeqwCb3s8V2A/VvWqB74gK/6Nk/A+tyZ/kCg7Kn5WBdg9w1uzJ1nvDBxG6NbvUCw7
 pJlUmk3gZRBWxrIDn2mu4+waqk6MWHeTbJ8VIFS5DeSzrYDnAR6/+2JAfWVcRHWSsnVlqh
 Zx6FjTtQKY8k1QLpWJDGv/W4CxdnmUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-pTaZKoUPPJuyLEQfv-0MVA-1; Wed, 20 Jan 2021 10:24:53 -0500
X-MC-Unique: pTaZKoUPPJuyLEQfv-0MVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707CF8799F8
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 15:24:52 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7EA6BF6B;
 Wed, 20 Jan 2021 15:24:48 +0000 (UTC)
Subject: Re: [PATCH 1/3] hmp: remove "change vnc TARGET" command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120144235.345983-1-pbonzini@redhat.com>
 <20210120144235.345983-2-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a5e89876-998f-40c5-0f8a-81aeb8614712@redhat.com>
Date: Wed, 20 Jan 2021 09:24:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120144235.345983-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> The HMP command \"change vnc TARGET\" is messy:
> 
> - it takes an ugly shortcut to determine if the option has an "id",
> with incorrect results if "id=" is not preceded by an unescaped
> comma.
> 
> - it deletes the existing QemuOpts and does not try to rollback
> if the parsing fails (which is not causing problems, but only due to
> how VNC options are parsed)
> 
> - because it uses the same parsing function as "-vnc", it forces
> the latter to not support "-vnc help".
> 
> On top of this, it uses a deprecated QMP command, thus getting in
> the way of removing the QMP command.  Since the usecase for the
> command is not clear, just remove it and send "change vnc password"
> directly to the QMP "change-vnc-password" command.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/removed-features.rst | 6 ++++++
>  hmp-commands.hx                  | 6 ------
>  monitor/hmp-cmds.c               | 7 +++++--
>  3 files changed, 11 insertions(+), 8 deletions(-)

HMP is not promised to be stable, so no deprecation period required.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


