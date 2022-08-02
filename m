Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4702A587A9D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:24:51 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIp50-0004xy-46
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIojm-0006v5-Se
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIojh-0000dO-CT
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659434568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQMHfjV5GHXKXkdII8XWmZFCgXwJVVCKbAYrHxlfPtg=;
 b=c7+Ou+5YSEiUZ4Z15oa90IH+3NVEOMHRzGtYIpEq334+qHW6Pqn/5Ddzx6AFqrsUreteXM
 8XSAqljP/zK4mzAzn5/kdcyRySicAzZEbeNQQVhFiScMaAtd+xTak535jCFEc7Vjnn8iGj
 Un8Uink4OZs0no6EDR132oy1vGxN5OM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-QfND7quAPUaMIHTxVx6GEg-1; Tue, 02 Aug 2022 06:02:44 -0400
X-MC-Unique: QfND7quAPUaMIHTxVx6GEg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 572FC3C02B82;
 Tue,  2 Aug 2022 10:02:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A57492C3B;
 Tue,  2 Aug 2022 10:02:43 +0000 (UTC)
Date: Tue, 2 Aug 2022 12:02:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] main loop: add missing documentation links to GS/IO macros
Message-ID: <Yuj2QUk59rM50Kio@redhat.com>
References: <20220609122206.1016936-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609122206.1016936-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 09.06.2022 um 14:22 hat Emanuele Giuseppe Esposito geschrieben:
> If we go directly to GLOBAL_STATE_CODE, IO_CODE or IO_OR_GS_CODE
> definition, we just find that they "mark and check that the function
> is part of the {category} API".
> However, ther is no definition on what {category} API is, they are
> in include/block/block-*.h
> Therefore, add a comment that refers to such documentation.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the block branch.

Kevin


