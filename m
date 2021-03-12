Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE69338A88
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:48:29 +0100 (CET)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfLI-0007jK-S4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKevI-0001db-UV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKevG-0005sH-2Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615544493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Huw4omX7Su0ChubCHVEnmCf7aOFN3RVv0cGp16YphY=;
 b=PSxC5HtX0MLRzIggXDYd4Y+H/xq0ySym3mjm8C3R/1bJ2QypvwZUTD0Ytd0uA6th6VQ+43
 ND7W8AFLCFTnUKK6m1QHCP3ZNw9/12TUApDSek00QRHThH9qouMRF/sUt+mBnWfnRs17Dl
 OJzTDHwMqpMjDUKtIJMLTA6bNvqUjWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-UpOge2NQNlid8u-UmKdSjQ-1; Fri, 12 Mar 2021 05:21:31 -0500
X-MC-Unique: UpOge2NQNlid8u-UmKdSjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E178189CD
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:21:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E57731002388;
 Fri, 12 Mar 2021 10:21:29 +0000 (UTC)
Date: Fri, 12 Mar 2021 11:21:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] tests: convert check-qom-proplist to keyval
Message-ID: <YEtAp6HKpiTeH1HB@merkur.fritz.box>
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311172459.990281-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.03.2021 um 18:24 hat Paolo Bonzini geschrieben:
> The command-line creation test is using QemuOpts.  Switch it to keyval,
> since the emulator has some special needs and thus the last user of
> user_creatable_add_opts will go away with the next patch.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


