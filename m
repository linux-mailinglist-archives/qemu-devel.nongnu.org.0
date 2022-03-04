Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B074CD2DC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:57:19 +0100 (CET)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5cc-0000Ib-97
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ5Wv-0003FX-B1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ5Wt-0003Pf-S5
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3QpOlFpjUuaicU/sCctj7fmWvoPoRF/AMY6812wxWc=;
 b=VaXFJdC7BEZ19o+Hx/YETtQfgE47QSoe4yPjLrhU148IivTDRcHWLahbSGwlbV5mJp5E97
 S9t/M+zKxExSAGMnwrAUx2aiG4FragVd0LVw7cl+92WpALIidwWdG1xW5Twi5nvd0wR8KV
 h/JRFEReKWeKxxQLtCS4/lZIpvy4nqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-pBeiXYqgOi6B-J1YAxp5Rg-1; Fri, 04 Mar 2022 05:51:22 -0500
X-MC-Unique: pBeiXYqgOi6B-J1YAxp5Rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B8F11091DA2;
 Fri,  4 Mar 2022 10:51:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 096626FB02;
 Fri,  4 Mar 2022 10:51:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 45EC818000B4; Fri,  4 Mar 2022 11:51:19 +0100 (CET)
Date: Fri, 4 Mar 2022 11:51:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: Re: [PATCH v4 0/6] Introduce CanoKey QEMU
Message-ID: <20220304105119.wcmgrlefsawnqmc2@sirius.home.kraxel.org>
References: <YfJozy5qjVYh24Xp@Sun>
 <Yge2Sy2sA6JpUvcj@Sun>
MIME-Version: 1.0
In-Reply-To: <Yge2Sy2sA6JpUvcj@Sun>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 12, 2022 at 09:29:47PM +0800, Hongren (Zenithal) Zheng wrote:
> Hi,
> 
> Is there any further feedback on this patch set.

Sorry for the looong delay, I'm rather busy with edk2.

Tried to queue up this, noticed it breaks the build in case the
canokey library is not installed.

I'd suggest to run the patch series through the qemu gitlab CI
before sending out v5.

take care,
  Gerd


