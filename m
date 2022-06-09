Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E537A544B47
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:07:37 +0200 (CEST)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGwq-0006IB-1f
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEXO-0004c7-38
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEXI-0001LI-HI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654767184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TXygZ6v049fNcYFEs1OZ+rqj0NBzc2RqhhQOSheFFuI=;
 b=Nv90QHIUCzd2+537wlv89eFy0fzdWwjM9qNVbsZm/hs/410MSsdaXwPuNLmfvPXx+gPC1U
 42468wy/fx7WQTk1PgVXsl/xYYuBa5/uucFFX2MDFcGtn+UQt0HCWHZqHdELfTjW+BUu8B
 LDToNwomFNuzM/Zr/fLnj1Ba4MrMksI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-aUYL_W-ANyyMAA68Biadaw-1; Thu, 09 Jun 2022 05:33:02 -0400
X-MC-Unique: aUYL_W-ANyyMAA68Biadaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDFFE80159B;
 Thu,  9 Jun 2022 09:33:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69B6C2166B26;
 Thu,  9 Jun 2022 09:33:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1753A1800094; Thu,  9 Jun 2022 11:33:00 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:33:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Gao, Lu" <Lu.Gao@verisilicon.com>
Subject: Re: [PATCH] ui/console: allow display device to be labeled with
 given id
Message-ID: <20220609093300.m7eycyh2suyzvxgf@sirius.home.kraxel.org>
References: <4C23C17B8E87E74E906A25A3254A03F4018FC0021E@SHASXM06.verisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4018FC0021E@SHASXM06.verisilicon.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Thu, May 26, 2022 at 07:08:14AM +0000, Wen, Jianxian wrote:
> The update makes it easier to find and specify devices.
> They can only be found by device type name without the id field,
> for example, devices of the same type have the same label.
> The update also adds a head field,
> which is useful for devices that support multiple heads,
> such as virtio-gpu.

Can we make the head field conditional, so it's only done in case there
are actually multiple heads?  Both qxl and virtio-gpu have a max_outputs
property, so checking if that exists and is greater than 1 should work
for that.

take care,
  Gerd


