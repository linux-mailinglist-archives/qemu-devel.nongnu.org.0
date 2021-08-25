Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF85E3F6EB9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:14:37 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlF9-0001Au-Cf
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mIlEN-0000Td-1u
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 01:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mIlEK-0000jq-Cp
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 01:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629868418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNguj6XmFtxOuY5mIc2DVA1NChUWcgGHAShhgbRA+3I=;
 b=h+V5yjxCXFQya7WmXt+9gDXrDy4QNBkL5C9b8zPvNYl7VLpgww4Hs1rG1dL3gqlmO+PKDi
 SlhhfW7j+nKNfGuREmVb5b/JYyOrzaKRnl2LKEekmoWeo3tFUd8w4RGYR0fWD9cQpcMvAb
 1K/aPXWrv25pGo0n0g0/lC/fl0zNOzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-FObuqL9fMaOjtJK0PAHcCg-1; Wed, 25 Aug 2021 01:13:36 -0400
X-MC-Unique: FObuqL9fMaOjtJK0PAHcCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF6A48015C7;
 Wed, 25 Aug 2021 05:13:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 849C43AC1;
 Wed, 25 Aug 2021 05:13:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8AA181800843; Wed, 25 Aug 2021 07:13:33 +0200 (CEST)
Date: Wed, 25 Aug 2021 07:13:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: edid support for a Mac OS 10.8 guest
Message-ID: <20210825051333.w22ph4gvfjtonbif@sirius.home.kraxel.org>
References: <871C519B-A3B6-4DF2-840C-15FE09D69372@gmail.com>
MIME-Version: 1.0
In-Reply-To: <871C519B-A3B6-4DF2-840C-15FE09D69372@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 05:46:43PM -0400, Programmingkid wrote:
> Hi, I recently tried using the edid feature in QEMU for my Mac OS 10.8 guest like this: -device VGA,edid=on,xres=1280,yres=800. When the guest operating system loaded there were no additional options available in the Display settings. Would you know what is wrong?

Probably macos just doesn't read the edid block ...

take care,
  Gerd


