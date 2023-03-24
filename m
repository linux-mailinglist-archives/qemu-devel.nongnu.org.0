Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C96C8175
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:39:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfbfC-0000e5-Vz; Fri, 24 Mar 2023 03:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfbf9-0000dx-P8
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfbe8-0003Km-Le
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679642106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2TaGmSGoxtndvn1gD+ILU9O+Tk/K7k27XGcfUcl06I=;
 b=SodGt3I2/31VmkLZ2uPyRy9B/btpxmXaCDnL/fYkbOnEmehNQ2v2EBsPjdo1GkJIlZqdVa
 aTMME1o1Gei84ivAEJOx+eIPfwtSl5DfIeBOqs2KKfEL2hxSoR6JZ9UpEtMsU3HoLw0xPF
 Q7CZiChf5vg7fKA29RSyjvqSaS7wNck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-aloQcw7rMairEeZTEPZ5BQ-1; Fri, 24 Mar 2023 03:07:59 -0400
X-MC-Unique: aloQcw7rMairEeZTEPZ5BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA05385A588;
 Fri, 24 Mar 2023 07:07:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ABFA140EBF4;
 Fri, 24 Mar 2023 07:07:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A259421E6926; Fri, 24 Mar 2023 08:07:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  David Alan
 Gilbert <dgilbert@redhat.com>
Subject: Re: Example output for query-vcpu-dirty-limit
References: <87mt43zr6j.fsf@pond.sub.org>
 <3ccd31fb-f3e2-5b9e-11a1-43e422389592@chinatelecom.cn>
Date: Fri, 24 Mar 2023 08:07:51 +0100
In-Reply-To: <3ccd31fb-f3e2-5b9e-11a1-43e422389592@chinatelecom.cn> (Hyman
 Huang's message of "Fri, 24 Mar 2023 09:36:12 +0800")
Message-ID: <87edper5iw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This will do nicely, thanks!


