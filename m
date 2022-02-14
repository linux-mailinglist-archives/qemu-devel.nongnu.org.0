Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD014B4916
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:31:16 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYdR-0005dO-PS
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYZh-00038p-9P
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYZe-0007EA-1A
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644834432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LfPxi5HF+9aOBp0eM78chZaOdTyOPHFu5W8f950TX9Q=;
 b=MiPITogj1Y6bL9nChQe6UbnmR/GCu3802mRFhcPfOP5nCATFmAwh3dIwVr8ASWAbzzbrf3
 c7b7p8UtgepDxEfnR04gACiBsjqEB3zlKvg+PTnQbiN9MZbo8PxzRXaXy9g+19NsP4USJP
 EI/s2He9oFLNmwqYW218422nRPxetmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-E83rzNTuNsyAThYlkF8qRA-1; Mon, 14 Feb 2022 05:27:09 -0500
X-MC-Unique: E83rzNTuNsyAThYlkF8qRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E664A2F44;
 Mon, 14 Feb 2022 10:27:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 899425E4A1;
 Mon, 14 Feb 2022 10:27:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C8761800091; Mon, 14 Feb 2022 11:27:04 +0100 (CET)
Date: Mon, 14 Feb 2022 11:27:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui/cocoa: Set UI information
Message-ID: <20220214102704.fjnb4v55l6tcjajk@sirius.home.kraxel.org>
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
 <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> (2) A question for Gerd:
> Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?

No.

take care,
  Gerd


