Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251941D9A49
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 16:45:15 +0200 (CEST)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3UX-0005da-Ly
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 10:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jb3To-00050C-AJ
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:44:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28242
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jb3Tl-0000SO-T9
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589899463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZySHGnbVvzEHCk5ISHhgxjXFNcSdmEUirnFtI0Ejz94=;
 b=aUgdBlo7oYgk6gMOoMo3sgYvYQr/r2+kx3Ov9JjaDQgFVk1KIRoeBkdMrOzth0YKhY6l2m
 xqmXvHNviALRufN24tmiJfCqj8/MthuB+/5LFgKogOAl5WSSVr7rzvz3PIL/piarPv4HCq
 V6dC9FoZdgur4J4jAYGUSCM+RB2AAOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-C8Mqgk3kMNy02mYdJjD7Uw-1; Tue, 19 May 2020 10:44:21 -0400
X-MC-Unique: C8Mqgk3kMNy02mYdJjD7Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32A6E8018A5
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:44:19 +0000 (UTC)
Received: from localhost (unknown [10.40.208.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2821A5C1C5;
 Tue, 19 May 2020 14:44:17 +0000 (UTC)
Date: Tue, 19 May 2020 16:44:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] make -M memory-backend and -numa memdev mutually
 exclusive
Message-ID: <20200519164413.42797c56@redhat.com>
In-Reply-To: <20200511141103.43768-1-imammedo@redhat.com>
References: <20200511141103.43768-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 May 2020 10:11:01 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> The options can't be used together (1st provides RAM for non-numa and fake-numa,
> while 2nd provides RAM for each numa node).
> If used together it might lead to crashes, so add a check to prevent simultaneous
> usage.
> 
> Igor Mammedov (2):
>   vl.c: run preconfig loop before creating default RAM backend
>   numa: prevent usage of -M memory-backend and -numa memdev at the same
>     time
> 
>  hw/core/numa.c | 5 +++++
>  softmmu/vl.c   | 5 +++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

gentle ping


