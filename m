Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965374BA577
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:12:38 +0100 (CET)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjOX-0001RG-9B
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKjLX-0008T3-5m
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKjLT-0008EE-E6
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645114165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SzsIICnJywRwDGtCimtdQ57/2TMMRpaCW8tMVXcExCo=;
 b=S67ktMEL/23OXs8EKd4fhHpItrGLLru3JwTJnRp/Enq2TH9vn+4LIuLnvviszhHDtbTxNe
 Q6xulHg59NakTibL+DbrBaKck+kWjyyDTqUPF0mx2e3tSXtaz6zy7JS2U1GuOhzy6BYDM0
 tydSpBfLJT6iHJVNkK5b63rj81PU3/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-ppNmokpTNwOqEowRjqlAyw-1; Thu, 17 Feb 2022 11:09:22 -0500
X-MC-Unique: ppNmokpTNwOqEowRjqlAyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5A01091DA2;
 Thu, 17 Feb 2022 16:09:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AFB70F55;
 Thu, 17 Feb 2022 16:08:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 880AA21A4A18; Thu, 17 Feb 2022 17:08:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v17] qapi: introduce 'x-query-x86-cpuid' QMP command.
References: <20220121163943.2720015-1-vsementsov@virtuozzo.com>
 <8cfa9b17-e420-0ca6-4e50-ccf2dfd538bb@virtuozzo.com>
Date: Thu, 17 Feb 2022 17:08:54 +0100
In-Reply-To: <8cfa9b17-e420-0ca6-4e50-ccf2dfd538bb@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 17 Feb 2022 18:39:21 +0300")
Message-ID: <87mtipscfd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 kvm@vger.kernel.org, valery.vdovin.s@gmail.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 wangyanan55@huawei.com, Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>,
 den@openvz.org, pbonzini@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Ping :) Any hope that we will merge it one day?)

Up to the x86 CPU maintainers: Paolo & Marcelo.


