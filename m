Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED833086D2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:11:19 +0100 (CET)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OsA-0004FZ-D6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5Oqc-0003mv-2A
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5OqZ-0008Td-4V
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611907778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY5ShEnZbvJmNvZVCDrrMPSlCfhq1kQqjeN3jXSxkqw=;
 b=KnYEgrdR950qCrLGO4lbcO9EQjiXbN4khMmXlRAt5z62fcswI4riPh7Fj5i7cZejuV1+Fb
 y/mhLXg5t6/8oHxdh1V2Aa6ncBKn61y00Hc/+BPoCLaY2RYxxgqB694TpynIt9kyxrr0g8
 H2oLTPVm88hIKnvUKMjVbg71ctIhwG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-I7JKP5tDORiF1MnmZ079iQ-1; Fri, 29 Jan 2021 03:09:36 -0500
X-MC-Unique: I7JKP5tDORiF1MnmZ079iQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DE0B106F8F7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 08:09:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FD91045D02;
 Fri, 29 Jan 2021 08:09:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A115E18000A2; Fri, 29 Jan 2021 09:09:33 +0100 (CET)
Date: Fri, 29 Jan 2021 09:09:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129080933.i6gsmcv33ppkhrnq@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <e5231182-aee5-a706-a261-1a5bab072402@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5231182-aee5-a706-a261-1a5bab072402@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Just a random thought: the guest should not be able to sniff, steal, or
> overwrite host-side clipboard (selection) content, without the host user
> explicitly requesting a clipboard operation.

Sure.  vncviewer has command line options for that, and you can also
change it at runtime (F8 -> Options -> Input).

Additionally I'd make that optional at qemu level, i.e. something along
the lines of "-vnc $display,clipboard={on,off}" (details depending on
the actual implementation of course).

take care,
  Gerd


