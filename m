Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D226D4EED
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:27:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNxk-0000ea-0L; Mon, 03 Apr 2023 13:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjNxh-0000eK-Rs
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjNxg-0003jF-F8
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680542839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjQGC0LUKgjdqpb+MtHaLfA9/sHLY7DuBlHtBS/E1wo=;
 b=Y7Xr7UCJAHuwAC7vSnbnSNW8clt/M4jGZKqrOcbKBZKnqXpHcHGwzYNDnb9X3heRBGUHjU
 RNXgEmzGRc3Jokx7QngRq1V5T/0OuwlVZcrMpBkyqhHfAXTRmg8mc2KgNYT8ru4YkgQbQz
 kPQIjKozi9o7+w+0Q477IvVePJVsPCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-HSVt2_xlPQe4XntkVA7ktQ-1; Mon, 03 Apr 2023 13:27:16 -0400
X-MC-Unique: HSVt2_xlPQe4XntkVA7ktQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6510185A5B1;
 Mon,  3 Apr 2023 17:27:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30A20C15BA0;
 Mon,  3 Apr 2023 17:27:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2BBE121E6926; Mon,  3 Apr 2023 19:27:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  quintela@redhat.com,
 dave@treblig.org,  peter.maydell@linaro.org,  alex.bennee@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
References: <20230330095524.37691-1-dgilbert@redhat.com>
Date: Mon, 03 Apr 2023 19:27:15 +0200
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Thu, 30 Mar 2023 10:55:24 +0100")
Message-ID: <87edp07u6k.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> I'm leaving Red Hat next week, so clean up the maintainer entries.
>
> 'virtiofs' is just the device code now, so is pretty small, and
> Stefan is still a maintainer there.
>
> 'migration' still has Juan.
>
> For 'HMP' I'll swing that over to my personal email.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thank you for you distinguished service, and thank you some more for
staying on as HMP maintainer.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


