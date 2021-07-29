Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4993DA112
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:31:54 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93KT-00041O-Bm
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m93Ih-0003ES-W7
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m93Ig-0001v2-GO
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627554601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+GGHwR+ZOVEe2XKf8DT/r+TZgBQ8Hqru1a0T7KG9AU=;
 b=JM+w81hShhBpssI3vs8k8oRRjGXtzHaoou0j9LUvozD+zBNWOY8y03Z/wU5D5KglGDwIQS
 Qh4FLiIFT3rEljN9rjoAAxPirPqvUYco996yRdh4TLWy+j27/AnfSsPK0FT4rmTrkyuv0x
 slzb1V3AWtoG91f+iktueE1sR5XTyl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265--Ml1vuoWNRigf9naIc_kog-1; Thu, 29 Jul 2021 06:29:58 -0400
X-MC-Unique: -Ml1vuoWNRigf9naIc_kog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6173E1006C81;
 Thu, 29 Jul 2021 10:29:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 246E610023B0;
 Thu, 29 Jul 2021 10:29:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B91E1800382; Thu, 29 Jul 2021 12:29:55 +0200 (CEST)
Date: Thu, 29 Jul 2021 12:29:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: modular tcg
Message-ID: <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
MIME-Version: 1.0
In-Reply-To: <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: "Jose R. Ziviani" <jziviani@suse.de>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, pbonzini@redhat.com,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> And another comment: I think we should have some progress on ARM with
> the kvm/tcg split and with the KConfig of boards, before we continue
> here.

Why?  This can easily be tacked in parallel.  We can flip the switch
for modular tcg per target in meson.build.

take care,
  Gerd


