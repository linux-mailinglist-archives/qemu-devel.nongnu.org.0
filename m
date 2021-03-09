Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0C33225D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:53:20 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZ3H-0005Ci-86
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJZ29-0004Ye-No
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJZ27-0000pj-Hq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615283525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I72/5j5tykCWVg95qigBI9N67v+1qGQ4EF1OwizO3hI=;
 b=H6oFkFQA1KhLmWcTNscpfaYsajsv+fjS4Btpjbi5Ll+ruNom7pMp9aJDvf7y23okkLw5rx
 EpGN2Sip6SJM5YuKWdGLhQj6I+bvWt+puNBbSqoBleubSynMBP+ytrG5+dcAGF+5trkbKH
 FM/r+EasronurjdFAVQsBvGknlIpdM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-a862q8aDMHqkeQtbJALW5g-1; Tue, 09 Mar 2021 04:52:02 -0500
X-MC-Unique: a862q8aDMHqkeQtbJALW5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8528A26862;
 Tue,  9 Mar 2021 09:52:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B50519709;
 Tue,  9 Mar 2021 09:52:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84BB918000A2; Tue,  9 Mar 2021 10:51:59 +0100 (CET)
Date: Tue, 9 Mar 2021 10:51:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/gtk: Remove NULL checks in gd_switch
Message-ID: <20210309095159.537padxrysp7umqc@sirius.home.kraxel.org>
References: <20210308140713.17901-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210308140713.17901-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 11:07:13PM +0900, Akihiko Odaki wrote:
> c821a58ee7 ("ui/console: Pass placeholder surface to display")
> eliminated the possibility that NULL is passed as surface to
> dpy_gfx_switch and removed some NULL checks from gd_switch, but the
> removal was not thoroughly. Remaining NULL checks were confusing for
> Coverity and probably also for humans. This change removes those NULL
> checks.
> 
> Reported-by: Coverity (CID 1448421)
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to UI queue.

thanks,
  Gerd


