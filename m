Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5F3DD780
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:44:48 +0200 (CEST)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAYFL-0002QB-Ff
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mAYEZ-0001k4-AY
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mAYEX-0006X6-6E
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627911835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=du19ifu5ag1dZ9c3hLySuDOIY+AVt6SzwUqQreq5B2o=;
 b=PIubQvqVcG1Q7wfrfDTS/Sq+Spj/UAz7eD3iawKuiOkD11Bp7HBp5fEUIRmCm212UILL+g
 kCJ6sv8QxmXWonPwkmCSWvIXigom8nqot3s9pk5JkaxViYb5B3OzbEZ1FO6ZEyJ7rlafac
 V/RXhedS58IAqMWZTwDZSIBi5RYi/6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-zFuW8RelO32N5yUp-1vLdw-1; Mon, 02 Aug 2021 09:43:54 -0400
X-MC-Unique: zFuW8RelO32N5yUp-1vLdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC1287D541;
 Mon,  2 Aug 2021 13:43:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D7160862;
 Mon,  2 Aug 2021 13:43:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 498C4180039F; Mon,  2 Aug 2021 15:43:49 +0200 (CEST)
Date: Mon, 2 Aug 2021 15:43:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <20210802134349.shmjoxqlhfjq5lpi@sirius.home.kraxel.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <878s1kgg2f.fsf@linaro.org>
 <YQfsb4MQY+EL6LMl@redhat.com>
 <d9600d53-7532-761e-9dfb-44c13967f162@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d9600d53-7532-761e-9dfb-44c13967f162@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Ok, so that would require a bootloader build too, which is likely going
> > to be arch specific, so probably the most tedious part.
> 
> Maybe we could use buildroot for this. I've used buildroot for my images in
> the QEMU Advent Calendar, and it was really a great help. See also:
> 
>  http://people.redhat.com/~thuth/blog/general/2019/01/28/buildroot.html

/me played with buildroot too: https://gitlab.com/kraxel/br-kraxel

userspace systemd does take much time indeed, but buildroot allows to
build with busybox.  You can also easily include more stuff like
pciutils to run tests.

bootloader support in buildroot varies much depending on architecture.
Modern standard platforms (x86, arm) are no problem, but for
older/exotic platforms (sparc for example) you can't easily generate
bootable disk images.

take care,
  Gerd


