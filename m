Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62563ABBC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfZ6-0005K6-VD; Mon, 28 Nov 2022 09:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozfZ5-0005Jy-0W
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozfZ3-0004nO-GH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669647416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSuRlOJXTajkrvNKSPiVVCEWAgMrR7lp0I7cgNejk/4=;
 b=c5OuDJ59qeRZK8s78dzjH1O9l9YIyE/SUskVSyHkPM/Rlk7xJNjGMJAtBRjBY2pWNulNHT
 6xJ9B1CRZUzmBOWq7kjrYf7GHsyTgRvyYCkUeEKPgAURvIDkK0hy6W+5lX0yxdYShfLdMC
 YsDQNzI3NXJbyV7PEhUzXc60eFfRkVg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-OgN8cd67PJWy2eR5UcZ6oQ-1; Mon, 28 Nov 2022 09:56:54 -0500
X-MC-Unique: OgN8cd67PJWy2eR5UcZ6oQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3453C101A5AD;
 Mon, 28 Nov 2022 14:56:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1148E17582;
 Mon, 28 Nov 2022 14:56:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E219E21E6921; Mon, 28 Nov 2022 15:56:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH for-8.0] monitor/misc: Remove superfluous include
 statements
References: <20221128133514.220919-1-thuth@redhat.com>
Date: Mon, 28 Nov 2022 15:56:50 +0100
In-Reply-To: <20221128133514.220919-1-thuth@redhat.com> (Thomas Huth's message
 of "Mon, 28 Nov 2022 14:35:14 +0100")
Message-ID: <87zgcbnn4d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> These #includes are not required anymore (the likely got superfluous
> with commit da76ee76f7 - "hmp-commands-info: move info_cmds content
> out of monitor.c").
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Appreciated!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


