Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01358A5BA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 07:54:30 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJqI0-0005bq-V9
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 01:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJqG8-00043L-As
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 01:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJqFx-0006ns-3L
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 01:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659678739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=do2V4y+D+logwXTA583fZNGbfyxxqtbmn4ueP1LUDuc=;
 b=W+A02AJdrWkmKnJYYAzyWQf5UpRRMr7XypQ8PMEl91gXfEYj87YWBMbyHoRGP5erR3YZnb
 F0NSLgP9Lazr9EJZVO7PRUcNf/0Y88KHZ87fZS1V2O4lpWguJYeTdbHHUewcI9Q6Or/j/K
 S6iz90IXSCbojprRqts7kIotzweujIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-Ds1_eOsHOKmZ7ikmzRowzg-1; Fri, 05 Aug 2022 01:52:15 -0400
X-MC-Unique: Ds1_eOsHOKmZ7ikmzRowzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 074D4185A7B2;
 Fri,  5 Aug 2022 05:52:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E2B1121315;
 Fri,  5 Aug 2022 05:52:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD33D21E6930; Fri,  5 Aug 2022 07:52:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PULL 0/5] Trivial branch for 7.1 patches
References: <20220804192216.1958922-1-laurent@vivier.eu>
Date: Fri, 05 Aug 2022 07:52:13 +0200
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu> (Laurent Vivier's
 message of "Thu, 4 Aug 2022 21:22:11 +0200")
Message-ID: <87r11v9r02.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

I was hoping for "[PATCH] contrib/vhost-user-blk: Clean up deallocation
of VuVirtqElement".

https://patchew.org/QEMU/20220630085219.1305519-1-armbru@redhat.com/

Next time, perhaps?


