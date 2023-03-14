Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463A6BA08B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 21:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcB4F-00083H-6i; Tue, 14 Mar 2023 16:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pcB4A-00082F-90
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pcB48-0004fz-0n
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678824970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2A4HfOBN2yJRiPg2DdniEka/6MV1S/tQtrLcdY45s0=;
 b=RNIeW9UtTu/wMzobOyYSd8YD5KadDQ8SUiGNQtJttgi9mjG+Q4Jky4WRaUa++OYjloLkt0
 Hf5122LNXRMJoHd8Cf41zGIdndotiYW1ufsElx/JKeMgLdh+ZlqOzOlK6QA4CGtbArHDJd
 jyXGgGY4er9fePNhAn6/1yWEXXFerLA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-n6WKfG3kPCKol9JtGHU2jg-1; Tue, 14 Mar 2023 16:16:07 -0400
X-MC-Unique: n6WKfG3kPCKol9JtGHU2jg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84BE6299E746;
 Tue, 14 Mar 2023 20:16:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 330ED400F4F;
 Tue, 14 Mar 2023 20:16:05 +0000 (UTC)
Date: Tue, 14 Mar 2023 21:16:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: stefanha@redhat.com, fam@euphon.net, hreitz@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v2] include/block: fixup typos
Message-ID: <ZBDWA27LZcdWuwtl@redhat.com>
References: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 13.03.2023 um 01:37 hat Wilfred Mallawa geschrieben:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Fixup a few minor typos
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Thanks, applied to the block-next branch.

Kevin


