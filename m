Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2804A582D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:00:54 +0100 (CET)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEo5t-00035c-2i
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nEnvB-0000ai-Re
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nEnv8-00080d-N7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643701785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wM6s2TfKOMJaTxAljJuhufk4v0bFflDYzhSXJ7ehgiA=;
 b=EQ7XnewBuNUu3hsaiscOrCvBb+OdmabHdqaeZGF9/gLLMWlXXgSDN7yXH6WwJqz63HWscB
 zGBCZx8b+LitweQnEHsJckCinjJ2NWgv0kG2ffpvxFallRxlIdq69DZ5FHYPS6RyoUtGSo
 lDakSgMHTdnktgz/XWFM3ArdZfyh9uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-dHc2wbJYNBaFQizxZfeNgQ-1; Tue, 01 Feb 2022 02:49:44 -0500
X-MC-Unique: dHc2wbJYNBaFQizxZfeNgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB5E5343CB;
 Tue,  1 Feb 2022 07:49:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28FED105C88B;
 Tue,  1 Feb 2022 07:49:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 714E71800632; Tue,  1 Feb 2022 08:49:11 +0100 (CET)
Date: Tue, 1 Feb 2022 08:49:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <20220201074911.cu6phs45gh7kpqel@sirius.home.kraxel.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth>
MIME-Version: 1.0
In-Reply-To: <20220201073139.7896e10b@elisabeth>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I'm not sure you can recycle something from it, but my (ugly) approach
> to make this fast (for a different purpose -- I'm using qemu to run
> tests in guests, not testing qemu) is to build an initramfs by copying
> the host binaries I need (a shell, ip, jq) and recursively sourcing
> libraries using ldd (I guess I mentioned it's ugly).

By design limited to the host architecture, but might be good enough
depending on what you want test ...

> No downloads, systemd, dracut, etc., guest boots in half a second
> (x86_64 on x86_64, KVM -- no idea with TCG). Host kernel with a few
> modules packed and loaded by a custom init script.

I've simply used dracut for that in the past.  Recursively sourcing
libraries is one of the things it does which I didn't have to code up
myself that way. Used to work pretty well.

But these days dracut doesn't want give you a shell prompt without
asking for a password beforehand, which is annoying if all you want
do is run some simple tests, and there was to easy way to turn that
off last time I checked ...

take care,
  Gerd


