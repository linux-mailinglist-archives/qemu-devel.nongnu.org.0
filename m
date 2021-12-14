Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DB47454A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:38:51 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8x8-00010j-Ob
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx8un-0007eU-A9
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx8ul-0006OX-Bn
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639492582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m9SODp33dBpzgwK28WHEqBjB6ng3RhRkB5Rz3LVvFgE=;
 b=BYowd1WOP3VwGdFVV4s1D+kvnYdPYd+lttdLZLtGffXtFhKw8xHmkEMKuoPE9lI4a/IAfi
 QYBAghROrt8tpbm5L3YJ5bbkrPVQPDA5G3frC548NiYdzGnIxOkw0xA7TCnJRw7qxutpj7
 66grZdTSG9L6P/khVlqebrgnAb0C020=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-QZ5Cd4_qNNK901h0BP_I4g-1; Tue, 14 Dec 2021 09:36:18 -0500
X-MC-Unique: QZ5Cd4_qNNK901h0BP_I4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87808190A7C8;
 Tue, 14 Dec 2021 14:36:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36CA21036B4D;
 Tue, 14 Dec 2021 14:35:30 +0000 (UTC)
Date: Tue, 14 Dec 2021 15:35:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 3/4] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
Message-ID: <YbirseSGF6nFiGlp@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.11.2021 um 10:46 hat Emanuele Giuseppe Esposito geschrieben:
> drive_add is only used in softmmu/vl.c, so it can be a static
> function there, and drive_def is only a particular use case of
> qemu_opts_parse_noisily, so it can be inlined.
> 
> Also remove drive_mark_claimed_by_board, as it is only defined
> but not implemented (nor used) anywhere.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I don't think moving drive_add() actually improves anything. Yes, you
can make it static, but in order to do that you had to introduce
block_if_name() as a new public function and you're moving an obviously
block related function to common code in vl.c.

So this part doesn't look like a net win to me. The rest of the series
looks good to me.

Kevin


