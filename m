Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5845D685
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:55:42 +0100 (CET)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqAXd-00057J-Ah
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:55:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqAVy-0004MU-Qe
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:53:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqAVv-0006Yc-5I
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637830433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNzhcDr/TUOc+AnUPMigVrjJCMEuO7axwbbBq+JTA7U=;
 b=hTwqS00a7vGQAmQ1jEGlwzzhSesfJ9Lhfw2iIoME4ERHSvC/jXV9KxHEAcCG9nv9PVnzpM
 dMX4gCR08FHALy3nZpcX6QXQylXLDdjW+uvOEPe1DT1gW7UkIpx3acpKMOpTIVg4/h3qDA
 HNt3o8SX0qlrFhTsK0Y7T4NQrbkTo+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-QODMWiXkOY-qHbFVH2Vc7g-1; Thu, 25 Nov 2021 03:53:50 -0500
X-MC-Unique: QODMWiXkOY-qHbFVH2Vc7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73CA21006AB7;
 Thu, 25 Nov 2021 08:53:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B0C5D6CF;
 Thu, 25 Nov 2021 08:53:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9276F11380A7; Thu, 25 Nov 2021 09:53:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <871r34r9pz.fsf@dusky.pond.sub.org> <YZ89sF2J2oujHeyQ@myrica>
Date: Thu, 25 Nov 2021 09:53:47 +0100
In-Reply-To: <YZ89sF2J2oujHeyQ@myrica> (Jean-Philippe Brucker's message of
 "Thu, 25 Nov 2021 07:39:28 +0000")
Message-ID: <875ysgpqec.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> Hi Markus,
>
> On Thu, Nov 25, 2021 at 08:11:04AM +0100, Markus Armbruster wrote:
>> Peter, this patch fixes a bug that became a regression when the fix
>> missed 6.1.  It's been stuck on the list since August.  Please have a
>> look, and if it's good, get it merged.  I'll ask the i386/pc maintainers
>> to do the same for PATCH 2.
>
> Both fixes have been merged in v6.2 (9dad363a223d and 739b38630c45)

I'm cross-eyed this morning.  Thanks!


