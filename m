Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A699424190D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 11:45:00 +0200 (CEST)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Qq3-0006Rh-P4
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 05:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k5Qox-0005ld-Qd
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 05:43:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33122
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k5Qow-0002Kp-BF
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 05:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597139029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BP9UaSVyrdFBoHQKY7Bpo4B0ovDhAKr1NHJAic+1as=;
 b=iF3+MUmV02P7lhjJJNOUS9foD8VuPxe3oKv3YM6p5YWthJ4SyLZOCNi0PNtdiVxTzXWA31
 S9ug1RFXIrJEaucFz/VOfDyt0+xVheVys8N8CCVdzsJGSqNiAYgDV7qlRmdIWkBu08t1Xb
 Me87jxnmadXYakXTUhR+kTGJfjVky6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-Wrr9v-b_MQebapiNAeQr3Q-1; Tue, 11 Aug 2020 05:43:47 -0400
X-MC-Unique: Wrr9v-b_MQebapiNAeQr3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBFBF19057A1
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 09:43:46 +0000 (UTC)
Received: from gondolin (ovpn-113-33.ams2.redhat.com [10.36.113.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09B804AC;
 Tue, 11 Aug 2020 09:43:45 +0000 (UTC)
Date: Tue, 11 Aug 2020 11:43:43 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 003/147] pc-bios/s390-ccw: do not use rules.mak
Message-ID: <20200811114343.06ae7af4.cohuck@redhat.com>
In-Reply-To: <1597079345-42801-4-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <1597079345-42801-4-git-send-email-pbonzini@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:41:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Aug 2020 19:06:41 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Thomas Huth <thuth@redhat.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

...this one probably needs signoffs from both of you?

> ---
>  pc-bios/s390-ccw/Makefile | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Anyway, with this I get a working bios.

Acked-by: Cornelia Huck <cohuck@redhat.com>


