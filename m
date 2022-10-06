Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E675F670C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 14:59:35 +0200 (CEST)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQTN-0001WN-TZ
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogPox-0006u9-95
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogPov-0007Tt-30
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665058663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6B9w1S5snhILA8lOC7wqyJ5nPkoIGqnubMSP1Y6ka/Q=;
 b=caVw5ZA+tYQZpILcHbKmJZmbTJ+imBKBTxSiYEbN6vJ2iH8cfdIB0kWpKiq+G6uz3S8+lW
 M7HE8xsho+mGf2TsyAV/ukLq9ivJ9KBlnqOJ6+BexVIe4zhfftw6RA6GFpGRzy6PTdFZuD
 Na/rAA3SBI2248ElbMoTr3IS1TlTdJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-ufExEfQvMACzLSe5N0HhMw-1; Thu, 06 Oct 2022 08:17:39 -0400
X-MC-Unique: ufExEfQvMACzLSe5N0HhMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 900B31C0BC69;
 Thu,  6 Oct 2022 12:17:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2C814583FB;
 Thu,  6 Oct 2022 12:17:38 +0000 (UTC)
Date: Thu, 6 Oct 2022 14:17:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com
Subject: Re: [PATCH v3 00/26] block: fix coroutine_fn annotations
Message-ID: <Yz7HYWO1O7iiVCI5@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 22.09.2022 um 10:48 hat Paolo Bonzini geschrieben:
> As discussed at KVM Forum 2022, I am reposting this series to
> add more coroutine_fn annotations.  Fixing the annotations
> enables static analysis of which functions are coroutine-only
> and which are mixed (coroutine/non-coroutine).
> 
> A lot of the patches are similar to the ones that Marc-André Lureau
> wrote back in 2017 (posted at [1]) but due to the changes in the code
> it was easier to redo them.

Thanks, dropped patch 6, fixed up the coding style in several patches
(long lines, tab, wrong number of spaces for indentation), and applied
to the block branch.

Kevin


