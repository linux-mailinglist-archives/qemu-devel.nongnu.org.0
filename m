Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF45630FD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:07:15 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DYQ-00062H-OG
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DTL-0001U2-LN
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DTG-0006OY-Lk
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656669713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OZSDNKjy3dYPHp3O/AZXf7/wKitX/Yd8A9wYka8YA8=;
 b=TuzAbbQ5gJobVs7vgwxYWwLtSRx0JBaoO6YTRZdjbb/ILiqIoJM0xxQKHNySiphxr5u34g
 zChsKRa4aoGPJgi3jn+Y7hUYUiXO4jNfe+qu1/j0KJ3SJLPkZ7/S5O5OwSdFb6fdeVN8Ox
 36LFAcB8PFeIUEcBt+bNGfF83otexpA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-sDklCW1pPp64t5r0RWutFA-1; Fri, 01 Jul 2022 06:01:51 -0400
X-MC-Unique: sDklCW1pPp64t5r0RWutFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E6581C14483;
 Fri,  1 Jul 2022 10:01:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6487F40D282E;
 Fri,  1 Jul 2022 10:01:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D9296180091D; Fri,  1 Jul 2022 12:01:49 +0200 (CEST)
Date: Fri, 1 Jul 2022 12:01:49 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Felix xq =?utf-8?B?UXVlacOfbmVy?= <xq@random-projects.net>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "thuth@redhat.com" <thuth@redhat.com>
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Message-ID: <20220701100149.egztilyre6ebp6zx@sirius.home.kraxel.org>
References: <20220627164404.12137-1-xq@random-projects.net>
 <MWHPR11MB0031F97918270C5D101F5D709BBD9@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB0031F97918270C5D101F5D709BBD9@MWHPR11MB0031.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 01, 2022 at 09:14:02AM +0000, Zhang, Chen wrote:
> 
> 
> > Signed-off-by: Felix "xq" Queiﬂner <xq@random-projects.net>
> 
> Thanks your patch, but please use your real name to sign a patch.
> For the details:
> docs/devel/submitting-a-patch.rst

Hmm?  Felix Queiﬂner looks like a real name to me ...

take care,
  Gerd


