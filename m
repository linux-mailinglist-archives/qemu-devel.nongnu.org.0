Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BB20B383
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:25:32 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jopIJ-0008Ap-1n
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jopGm-0006k6-Jh
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:23:56 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56893
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jopGk-00009x-UP
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593181433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImguQWNduFBjj+jIU8BPe58ZnlvyjcVO8neGDoaC1H4=;
 b=FxBCntuMu9COHZ1qpKObsIgBT/rtfIgf61c+rvn2b1MSRwGyiVgFQaFDyv/vugROWc9AGJ
 l4GkTCJMkH5e6OOtDThY+Ybef4sZ8C1Hf6b3LB7uSbZtyk/nGhG9l9B4Ma/5XUiuH/p1iz
 JAWmTHPdGXoifq5AIVSzKLge4gNONe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-hhT_GzldMGSPSuM95syOfw-1; Fri, 26 Jun 2020 10:23:48 -0400
X-MC-Unique: hhT_GzldMGSPSuM95syOfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137D7107ACCA;
 Fri, 26 Jun 2020 14:23:47 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C65F45C557;
 Fri, 26 Jun 2020 14:23:46 +0000 (UTC)
Subject: Re: [PATCH 1/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqyDzenX2BiR7CnvZc-J91wWCX8ra==T_=WCe3xq3-n2hQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <41b51d53-f196-be76-ee7e-ca943f6a3764@redhat.com>
Date: Fri, 26 Jun 2020 09:23:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqyDzenX2BiR7CnvZc-J91wWCX8ra==T_=WCe3xq3-n2hQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/20 5:07 AM, David CARLIER wrote:
>>From 4d0933384d2bfcd0fc8c4c06eed2d07f3f1b7f8b Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 10:35:40 +0000
> Subject: [PATCH 1/5] Haiku build fix enabling BSD symbols.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

meta-comment: when sending a series, it's best to send a 0/5 cover 
letter with the rest of the messages in-reply-to the cover.  This way, 
it's easier to track the related messages when viewing in a mail reader 
that groups by threads.

More patch submission hints, including how to make 'git send-email' 
automatically create a cover letter when needed, at:
https://wiki.qemu.org/Contribute/SubmitAPatch

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


