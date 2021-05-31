Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384EE3968A7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 22:11:15 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnoFm-0001QU-53
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 16:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lnoEA-00005w-AJ
 for qemu-devel@nongnu.org; Mon, 31 May 2021 16:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lnoE8-0001WF-Cu
 for qemu-devel@nongnu.org; Mon, 31 May 2021 16:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622491771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=judihjaI0wU5SUL21noSU4VhEhduqv4xKoabvNhXfec=;
 b=ewZgi5D5DeJBi4kJHcUhuwe/QmNPJ/AYzNNAApDzijtrl0wt3JOjLANKxW3tICaXpymXTg
 0m6YQiwiOaZGVOux2mikZ8PE8UiRcNF4US/uQn5spe88cjj3yomh4jRBpRnuAVHEZtzO1M
 5I6rNCOvwof+4SRp40XmwQSdr8/RWcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-oy4PNQjKMVWHhgBlDNWNkQ-1; Mon, 31 May 2021 16:09:28 -0400
X-MC-Unique: oy4PNQjKMVWHhgBlDNWNkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC12193578B;
 Mon, 31 May 2021 20:09:26 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9643A19C71;
 Mon, 31 May 2021 20:09:26 +0000 (UTC)
Date: Mon, 31 May 2021 16:09:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
Message-ID: <20210531200925.elhfpfcwamib3pc4@habkost.net>
References: <20210430134830.254741-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210430134830.254741-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 08:48:28AM -0500, Connor Kuehl wrote:
> Connor Kuehl (2):
>   sev: use explicit indices for mapping firmware error codes to strings
>   sev: add missing firmware error conditions
> 
>  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)

I'm queueing this on x86-next, apologies for the delay.

-- 
Eduardo


