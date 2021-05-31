Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3DE3954DE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 06:58:01 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lna00-0004Ln-6Y
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 00:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lnZxv-0001nz-An
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lnZxt-00025D-MV
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622436948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CxsBTgPHhsfbfAvMnJvOa//FTVqaX8yVSuEfW2nE2gg=;
 b=jMyUNA5XhX1d7X5bYmJ77fS7MZE/A+BgHk1AG+VcXTdNtGIr4Kro3i12PiH6rxfEplaAjx
 5SFjAC/F3tEvLLnzjkKl+Gu3pK4/qTGPLtfOirFwJbFXjQu2knjVa3v+1OFWd4qGGTjeTz
 Urh2mr2VHtUPs7qd7h7QhCADqFitHNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-s0_xPG8YOmOrbE61Safg-w-1; Mon, 31 May 2021 00:55:44 -0400
X-MC-Unique: s0_xPG8YOmOrbE61Safg-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D2B7106BAE7;
 Mon, 31 May 2021 04:55:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE6167898;
 Mon, 31 May 2021 04:55:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 874B718000A0; Mon, 31 May 2021 06:55:41 +0200 (CEST)
Date: Mon, 31 May 2021 06:55:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.9
Message-ID: <20210531045541.aut6wbga7x4tn6p3@sirius.home.kraxel.org>
References: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
MIME-Version: 1.0
In-Reply-To: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 30, 2021 at 10:01:28PM -0400, Brad Smith wrote:
> tests/vm: update openbsd to release 6.9
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>

Tested-by: Gerd Hoffmann <kraxel@redhat.com>


