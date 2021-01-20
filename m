Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B02FD548
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:18:43 +0100 (CET)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GBu-0007lL-6G
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2G8s-0005zw-39
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:15:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2G8g-00020v-Mq
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611159314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geYpy4x7gFT4+IcM3C9wrAhtv4W4z9zZVSWXdZskMDw=;
 b=fU7JN9U+nNvT49PFhHHRt6/6k2+vL1+UEPa+6nYbxpoLpf77i//r7dMrY7wiZSQj11uh+9
 3LhhsdOPSiCHzhB1lBn4tdvwec0DJ4tlHjUXvt/VnodKlk+2FuA6bMrK6uAXv3YQNObgTD
 G+J7VrfvpZ1gv/TdvhTO/IdwkS7Dqrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-60LBRsWPNsKGvqrsXIRqkA-1; Wed, 20 Jan 2021 11:15:12 -0500
X-MC-Unique: 60LBRsWPNsKGvqrsXIRqkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B09F01005D52;
 Wed, 20 Jan 2021 16:15:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 421FE19C81;
 Wed, 20 Jan 2021 16:15:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCF851800600; Wed, 20 Jan 2021 17:15:06 +0100 (CET)
Date: Wed, 20 Jan 2021 17:15:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/3] scsi/utils: Rename 'illegal request' -> 'invalid
 request'
Message-ID: <20210120161506.2nuufcbiibgczpzu@sirius.home.kraxel.org>
References: <20210120153522.1173897-1-philmd@redhat.com>
 <20210120153522.1173897-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120153522.1173897-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 04:35:20PM +0100, Philippe Mathieu-Daudé wrote:
> While these requests are invalid, they are not breaking any laws :)
> Rename 'illegal request' as 'invalid request'.

Given the scsi spec calls this "illegal request" I think it makes sense
to *not* change this and stay consistent with the spec for better
grep-ability.  Note the variables are already renamed, I expect the
comments have been left as-is intentionally ...

take care,
  Gerd


