Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0E20B28C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 15:34:53 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jooVI-0006iE-6d
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jooUK-0006HU-GF
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:33:52 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44312
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jooUI-0006iv-9Z
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593178428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtUVAqIxIupxJnwhfNB1fGCULR4yN3fTIoyIX58ndc4=;
 b=Q/XYeiaO/aZmmN3mmHiVqSNFEwIDb3vaQ9YSMe+CBssIYKZaUSPv9GE1WuzjmbDTguB7wL
 A4u8GiF4kSyO4PlZH18hcpu9/SWv/a4xVorS/yf93zzCKCA4WT9ePXcLQeRMQv2onT9gkc
 qIDhWnTM8k/NDL5GPBgSDa178yKf5F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-KIITxVngNxGWLzk5W3dAbg-1; Fri, 26 Jun 2020 09:33:44 -0400
X-MC-Unique: KIITxVngNxGWLzk5W3dAbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C77805EE2;
 Fri, 26 Jun 2020 13:33:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B3B470915;
 Fri, 26 Jun 2020 13:33:42 +0000 (UTC)
Subject: Re: [PATCH 5/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqwft10MnY5nOc7L+q59kOY3BAejjrOS09R5QD2H7AH-Cg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <609f7eda-9036-9b39-8380-e126d0f7d81e@redhat.com>
Date: Fri, 26 Jun 2020 15:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqwft10MnY5nOc7L+q59kOY3BAejjrOS09R5QD2H7AH-Cg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 02:19:36
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

On 26/06/2020 12.07, David CARLIER wrote:
>  From 68d4d4312eccd212b4d2484e09425816ebd2346a Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 11:01:54 +0000
> Subject: [PATCH 5/5] Last chunk of build fix
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>   include/qemu/bswap.h | 2 ++
>   util/Makefile.objs   | 2 +-
>   util/compatfd.c      | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

  Hi David,

not directly related to this patch, but: do you know whether Haiku can 
also be installed non-interactively? We've got a set of VM-based 
compilation tests for FreeBSD, NetBSD and OpenBSD, see tests/vm/ in the 
QEMU sources (or run "make vm-help" for more information about the make 
targets) ... if something similar would be possible for Haiku, that 
would certainly help to prevent that the Haiku port bitrots so easily 
again...

  Thomas


