Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37E207EFD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 23:55:37 +0200 (CEST)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joDMm-0000L5-M9
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 17:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joDLB-0007pN-4c
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:53:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40989
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joDL9-00005x-K5
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593035635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmoFGWvo1ayeg3CFSoZbieqa/Lr5BKpvts8u2tU8Wm4=;
 b=dQKmhZxI85PZbgHPUaBQe2In6oLNwp/ge+Qc1mFBGZxhYG9Rs/9YhoAqdAfYJsnj2kiyaN
 jXE2+/zTwhCdaxRRWGcfLkRx70m7wO3brqefiNK0OyBXhGYhOqlXxzD7e1QGiAKF2RyeyD
 skblc13ZUTLfd20i2GUyWvazYAKtTNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-LObuLlDkMIGtFu3QmASpzA-1; Wed, 24 Jun 2020 17:53:53 -0400
X-MC-Unique: LObuLlDkMIGtFu3QmASpzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A001005512;
 Wed, 24 Jun 2020 21:53:52 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB5AF5D9E7;
 Wed, 24 Jun 2020 21:53:51 +0000 (UTC)
Subject: Re: Building in Solaris 11.4
From: Eric Blake <eblake@redhat.com>
To: Michele Denber <mdenber@gmx.com>, qemu-devel@nongnu.org
References: <5EF3C648.4060506@gmx.com>
 <ae7652b5-86f7-fc52-af01-69096dd3b163@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <53b07288-3b25-c592-a51d-8d91e53628e9@redhat.com>
Date: Wed, 24 Jun 2020 16:53:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ae7652b5-86f7-fc52-af01-69096dd3b163@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
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

On 6/24/20 4:48 PM, Eric Blake wrote:

> grep -e is also a non-portable construct; it might be possible to change 
> that line to call egrep instead, or to rewrite the regex to not need 
> extended regex.
> 
> As a short-term workaround, you can always do:
> 
> /path/to/bash ./configure
> 
> to run it under a shell that won't choke on our use of non-posix 
> constructs.
> 

that will avoid the problems with local, but not necessarily the problem 
with a missing 'grep -e'.  A common approach there is to set $GREP up 
front to something capable, but then you have to scrub for uses of grep 
in configure to be replaced with $GREP.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


