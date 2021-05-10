Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA523780C3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:01:25 +0200 (CEST)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2j6-0006Mo-Gd
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2h4-0004dT-Oy
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2h3-00084H-76
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620640756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=djTYc2STNxG+qT78jm2NmFVHyIVZnFmwu/O4UKqzMHI=;
 b=E/7gDM/XYLCKno306umOL2AXpp5p6PScjpgPRO8hRFjnEogTYvAuLVkIKQ5vjYcCcjzVrG
 htsja+fdZ6RpJst50pzi/nUh4YzcxX7M9hnh8kZX9g0URG3GxLb9F/S7mRpyzEPO22ccfO
 EK620c3PByPrvPG8coooCPiaXIsODjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-JfsztCwyOG-ehP4_gCZ3rA-1; Mon, 10 May 2021 05:59:14 -0400
X-MC-Unique: JfsztCwyOG-ehP4_gCZ3rA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65ACE1854E24;
 Mon, 10 May 2021 09:59:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29C8D10016FD;
 Mon, 10 May 2021 09:59:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 94FFD18000B9; Mon, 10 May 2021 11:59:11 +0200 (CEST)
Date: Mon, 10 May 2021 11:59:11 +0200
From: 'Gerd Hoffmann ' <kraxel@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH v3 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
Message-ID: <20210510095911.dzfamsz6kkwpnxhk@sirius.home.kraxel.org>
References: <20210504233232.28423-1-gustavo@noronha.eti.br>
 <20210504233232.28423-3-gustavo@noronha.eti.br>
MIME-Version: 1.0
In-Reply-To: <20210504233232.28423-3-gustavo@noronha.eti.br>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 08:32:32PM -0300, gustavo@noronha.eti.br wrote:
> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> 
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> swaps them around so that Alt is the key closer to the space bar and Meta/Super
> is between Control and Alt, like on non-Mac keyboards.
> 
> It is a cocoa display option, disabled by default.

This contradicts $subject (pleae fix in case v4 is needed for other
reasons, otherwise I can fix subject on merge).

take care,
  Gerd


