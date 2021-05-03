Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77073713B4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:38:19 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVxy-0000JL-GS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVwC-0008Hb-9c
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVw9-0006On-QA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcoTUYSx9gtPMuI9U3o9RnrhGuvYTH+JJqToqce24Cw=;
 b=i7rCKr1pnkHI6zCm24FyGpI8tTy/YjktZQcWqTurTj31HDoha/+PvFRHsZXbn21M23fnJd
 Ha+X8ov1wbDQ+Sj1k5ysGFziPtuybjS1WjBUo2P5pSEcItRz4zddQNBtepM1gECH5fTcPN
 T7Gf6beUi87VlbpiQ2drBjv0ORPe37E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-aj4T5pLxMz6utthcvneOqQ-1; Mon, 03 May 2021 06:36:20 -0400
X-MC-Unique: aj4T5pLxMz6utthcvneOqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A007B107ACC7;
 Mon,  3 May 2021 10:36:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBAF60C4A;
 Mon,  3 May 2021 10:36:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B77A7113525D; Mon,  3 May 2021 12:36:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/2] Drop deprecated lm32 and unicore32
References: <20210503084034.3804963-1-armbru@redhat.com>
Date: Mon, 03 May 2021 12:36:17 +0200
In-Reply-To: <20210503084034.3804963-1-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 3 May 2021 10:40:32 +0200")
Message-ID: <87a6pcayu6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to mention it's based on Thomas's "[PATCH] Remove the deprecated
moxie target".

Based-on: <20210430160355.698194-1-thuth@redhat.com>


