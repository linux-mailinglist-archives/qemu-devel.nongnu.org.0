Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDC2FF7F6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:32:55 +0100 (CET)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iVa-00060Y-Bk
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2iT6-0005Qf-Hv
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2iT5-0007ee-1J
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611268218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2nTk8udkbfy3Jjb+vo/GbiX25TP5Hx9wANeyJeeieA=;
 b=ffFLhmzoKIu8RTxPxK//F87c+aIkVSk45UrCVx3k5ByXDV2OcTPYW15JvpZ1e02V/XjeHh
 bINrXTsKUI0gL4zp3p2oeJua2N4TMsBo9rlj7yMK9ny0PnCbhRZqDL3puCQYYICjQ/GbXd
 TAWYnZLB5lqix0K2qTCIwBBrF/PR2vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-PWI9GedrO2WWXqDHL84s1g-1; Thu, 21 Jan 2021 17:30:14 -0500
X-MC-Unique: PWI9GedrO2WWXqDHL84s1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB50A1087D68;
 Thu, 21 Jan 2021 22:30:12 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8A219486;
 Thu, 21 Jan 2021 22:30:12 +0000 (UTC)
Subject: Re: [PATCH 2/2] net: Add ipv6_hostfwd option
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210121082314.458600-1-dje@google.com>
 <20210121082314.458600-3-dje@google.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bb027c55-c54c-cc10-23d2-637fbef9632f@redhat.com>
Date: Thu, 21 Jan 2021 16:30:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121082314.458600-3-dje@google.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 2:23 AM, dje--- via wrote:
> Signed-off-by: Doug Evans <dje@google.com>
> ---

Rather light on the commit message description.  The one-line summary
does a good job of saying "what" the commit does, but the rest of the
commit body should say "why" the commit is worthwhile, rather than being
silent.

>  hmp-commands.hx     |  29 ++++-
>  include/net/slirp.h |   2 +
>  net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
>  qapi/net.json       |   1 +
>  slirp               |   2 +-
>  5 files changed, 279 insertions(+), 66 deletions(-)
> 

> +++ b/qapi/net.json
> @@ -189,6 +189,7 @@
>      '*smb':       'str',
>      '*smbserver': 'str',
>      '*hostfwd':   ['String'],
> +    '*ipv6-hostfwd': ['String'],

Missing documentation, including a 'since 6.0' tag on the new member.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


