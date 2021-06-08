Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8C39FA23
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:16:08 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdSZ-0004IG-Uh
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdRY-0003TO-Kf
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdRX-0006xH-2H
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623165302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DBzZ0giUi0clYylDFixzw8klb95kxm2/f8ftRAoXrk0=;
 b=WETDj9CQNAY7yYOzg7rTCptVNaDNqayIA5xvgJGiyCQ3ft2QRDkdyluOPc6oxDgP7CC46K
 Tnba7HVDnaoRx+JK0AfRz0Qw1eHv0GbwEqDpP3lexLAJmXVkEIpjd2drzKLIZ/PDXRD+AK
 UZmKpPFMZKYCNI33m3PPt0hqyAj7qBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-7F4o8x6gMH-JubwOibInOw-1; Tue, 08 Jun 2021 11:15:00 -0400
X-MC-Unique: 7F4o8x6gMH-JubwOibInOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1520E19611B3;
 Tue,  8 Jun 2021 15:14:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4151001281;
 Tue,  8 Jun 2021 15:14:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 473AD113865F; Tue,  8 Jun 2021 17:14:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v8] qapi: introduce 'query-kvm-cpuid' action
References: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com>
Date: Tue, 08 Jun 2021 17:14:16 +0200
In-Reply-To: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com> (Valeriy
 Vdovin's message of "Mon, 31 May 2021 15:38:06 +0300")
Message-ID: <87y2bkwfqv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Denis Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Double-checking: this supersedes "[PATCH v7 0/1] qapi: introduce
'query-cpu-model-cpuid' action"?


