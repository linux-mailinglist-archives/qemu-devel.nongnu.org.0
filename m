Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8404A631C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:02:28 +0100 (CET)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExU1-0003ti-O1
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEv63-0000gj-7A
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:29:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEv60-0005JB-Pp
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643729367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/INbp1HhSaqlr0+RSM2Wxr0vKomlmiubepZJHLR2ido=;
 b=HlPrYwzPsyVqtLfeiadycX6udYHc00rmDOfqNvuUlGG+/IrRsyJ+lOQJAhvD6xdMb0UsER
 S2c47pQ/dpJwKvblEvFTKy4M/T6rBZvvYaYcHS7vFmfRrxLXbGFxwLwHBzG0vGZGR8oP4h
 HEiu1GxxopTcKo8kOPYcQDJc88m6fQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-pI2gaI_IMjGKiqOY26BZgg-1; Tue, 01 Feb 2022 08:28:12 -0500
X-MC-Unique: pI2gaI_IMjGKiqOY26BZgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2C91937FC3;
 Tue,  1 Feb 2022 13:28:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 467CA10A48AC;
 Tue,  1 Feb 2022 13:28:08 +0000 (UTC)
Date: Tue, 1 Feb 2022 14:28:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 0/4] Python: Improvements for iotest 040,041
Message-ID: <Yfk1ZhkhFIcx7fZY@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201041134.1237016-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-fixes
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/455146881
> 
> Fixes and improvements all relating to "iotest 040,041, intermittent
> failure in netbsd VM"
> https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01975.html
> 
> See each patch for details.

Thanks, the new output when QEMU fails to start looks really useful!

The only thing we could probably still improve is detecting that the
QEMU process has exited instead of waiting for the socket connection to
time out. But since it only happens in case of failure, the additional
seconds of waiting are probably only a bit annoying for debugging, but
not a big problem.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


