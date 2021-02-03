Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23630DB53
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:32:57 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IHA-0005Mi-6G
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7ICI-0002BK-6p
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7IBf-00081I-Lt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612358833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skhEDfq/Rjwaj22RNLS6l9KUpq/UlLcjLiK0j/tH1j0=;
 b=Ns0y62QZY74iS3NVfjkZRvQ1u8pUowSC9eUnZgZiRLTAj8Ca5dwqC1I7oRWGoTYbABQDbM
 pM/BB5bAxuhy3HEZrZabj9iIuQPM6AgypWn337Xfwp5HB5uOwSAe/gBOTZh0uvl3iYxJ4Z
 1upwDy16ZI4HkMyKFYNm3pGss5bdE2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-fqcAtl8yPQaPgznR60nsHQ-1; Wed, 03 Feb 2021 08:27:09 -0500
X-MC-Unique: fqcAtl8yPQaPgznR60nsHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D2B1015C80
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 13:27:08 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B443710013D7
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 13:27:08 +0000 (UTC)
Subject: Re: [PULL 00/20] NBD patches for 2021-02-02
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20210202224529.642055-1-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f080422b-0745-4f5b-cb2f-b885cbd6a2d4@redhat.com>
Date: Wed, 3 Feb 2021 07:27:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:45 PM, Eric Blake wrote:
> The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26193f:
> 
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-02 16:47:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-02
> 
> for you to fetch changes up to bb1b0015dfc77bd8b82d8be806f8822d19e749b8:
> 
>   nbd: make nbd_read* return -EIO on error (2021-02-02 16:30:50 -0600)
> 
> ----------------------------------------------------------------
> nbd patches for 2021-02-02
> 
> - more cleanup from iotest python conversion
> - progress towards consistent use of signed 64-bit types through block layer
> - fix some crashes related to NBD reconnect
> 

NACK, v2 coming up due to a rebase flaw in this spin.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


