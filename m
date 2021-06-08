Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F439F9E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:04:26 +0200 (CEST)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdHE-0005om-IP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdEe-0003ha-1w
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqdEa-000744-Dk
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623164498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHn1nNEpA7tmHseNu9AIPjZ980gusX4Tnq2u3o4whuI=;
 b=DIKVApfpi1igbe+cjjOarKuCquZcr+N0627vs2kYgwkHoRmxgXxcu6zTJrIZ92w8dIGHDE
 7H9KDw9ogu2NSPRO6YD9Ix6y7s8pEBulX8sx9p6QuMmTlGDWyVUhYsO1lsRgwLARF2HyjM
 Z8DFM59FVOaDY4Wdh7gpdHVZUawwAY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-e2ud_cAGNrm0WgeK2mdong-1; Tue, 08 Jun 2021 11:01:37 -0400
X-MC-Unique: e2ud_cAGNrm0WgeK2mdong-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503FF1936B60;
 Tue,  8 Jun 2021 15:01:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B78620DE;
 Tue,  8 Jun 2021 15:01:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A48D113865F; Tue,  8 Jun 2021 17:01:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: GSoC Intro - TUI interface for QMP
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
Date: Tue, 08 Jun 2021 17:01:28 +0200
In-Reply-To: <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com> (John Snow's
 message of "Tue, 1 Jun 2021 19:47:08 -0400")
Message-ID: <87czswxuwn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, armbru@redhat.com, "Niteesh G. S." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

[...]

> A challenge will be where to pull the help text from. The QEMU server
> is not capable (today) of sending help information over the QMP socket
> itself.
>
> We will need to implement a QMP command inside of QEMU directly that
> is capable of delivering this information to the client so that it can 
> render it.
>
> Since not all versions of QEMU will have this feature, the qmp-shell
> will need to be able to gracefully deal with the lack of help text, 
> displaying an error indicating that this version of QEMU does not have
> help information compiled into it.

The doc text is bulky: my bld/docs/manual/interop/qemu-qmp-ref.html is
1.7 MiB and growing.  Less lavish markup results in smaller data.  We
may want to store it compressed, or load it on demand.  We might even
have to make it compile-time optional for some use cases.


