Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977540005D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:21:00 +0200 (CEST)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM97r-0003CU-AY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w4-0007XX-Hy
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vx-0001R6-Mt
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKnj1Xtzki9ktI7ZsOYqk7Yqt3c/j+RB/kNiQmdTrto=;
 b=JTSrU/cv/vzYgp2/hK4/YCE6fOWzw0CJ5+RamO0oxKH7foL16eRhrhhQ1l6A+6MecV0Bri
 twIrkCIFvOxJmibw2Zw390TZsZ4YSNC/oHRrBDIr1OTbjdi3F/gpNLNtxYsXboEbwuZDSj
 LeXnPqzlgOgKfQ/eRmoBH1KzSBDxRm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-2vzY0VpWMMKhe3pUtrzmgA-1; Fri, 03 Sep 2021 09:08:38 -0400
X-MC-Unique: 2vzY0VpWMMKhe3pUtrzmgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FC8C6D5C1;
 Fri,  3 Sep 2021 13:08:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 347FE5D9FC;
 Fri,  3 Sep 2021 13:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19FB511380C3; Wed,  1 Sep 2021 15:25:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Axel Heider <axelheider@gmx.de>
Subject: Re: [PATCH 1/2] doc: Clarify serial parameters
References: <277c4838-aef4-97aa-e92b-8eb7c0056686@gmx.de>
Date: Wed, 01 Sep 2021 15:25:48 +0200
In-Reply-To: <277c4838-aef4-97aa-e92b-8eb7c0056686@gmx.de> (Axel Heider's
 message of "Tue, 3 Aug 2021 16:12:24 +0200")
Message-ID: <87lf4ga0mb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 or Paolo?

Axel Heider <axelheider@gmx.de> writes:

> There is a difference between 'null' and 'none'. Add a sentence to
> highlight this, so this does not get mixed up.
>
> Signed-off-by: Axel Heider <axelheider@gmx.de>
> ---
>  qemu-options.hx | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..e3f256fa72 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3702,7 +3702,8 @@ SRST
>          [Linux only] Pseudo TTY (a new PTY is automatically allocated)
>
>      ``none``
> -        No device is allocated.
> +        No serial devices are allocated at all. Use ``null`` to disable =
a
> +        specific serial device.
>
>      ``null``
>          void device
> --
> 2.17.1


