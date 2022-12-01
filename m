Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530E63F101
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0j8v-00011J-Sl; Thu, 01 Dec 2022 07:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p0j8u-00010v-8T; Thu, 01 Dec 2022 07:58:20 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p0j8r-0006Kj-FG; Thu, 01 Dec 2022 07:58:18 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95ED021B86;
 Thu,  1 Dec 2022 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669899495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBye06pip7Z3ifWiBpPbj1FafVMlGKfkqQfCEWILN8o=;
 b=TBSdOJyQEqCdQ7u+FD2diWNOWPBEDgX7S6I1/shnPvyZXAajH79qgbC6Hd4Dsp1a94jkfC
 IggAY0vijXbZj6d/2XYDG5a9BGo9RVqFwIn8NCrr7iNwx0DcUYwjUItJKye2/nmLwVcOfg
 3LoV94Ryit50TTYLm2g+DR/ncGNlO3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669899495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBye06pip7Z3ifWiBpPbj1FafVMlGKfkqQfCEWILN8o=;
 b=/NIT/4nQuc05juJPddaWChLMjaNCW3bUBRjCcKlbCo+ExfiqdlAWOopGcuJGlOfvyNULN0
 0bHx1wiEzRQ3YKCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 16D7413503;
 Thu,  1 Dec 2022 12:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Rl+YMuakiGMnfwAAGKfGzw
 (envelope-from <farosas@suse.de>); Thu, 01 Dec 2022 12:58:14 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 libvir-list@redhat.com, Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, qemu-block@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/3] block: mention 'password-secret' option for -iscsi
In-Reply-To: <20221201101959.419545-2-berrange@redhat.com>
References: <20221201101959.419545-1-berrange@redhat.com>
 <20221201101959.419545-2-berrange@redhat.com>
Date: Thu, 01 Dec 2022 09:58:12 -0300
Message-ID: <87fsdz5li3.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The 'password-secret' option was added
>
>   commit b189346eb1784df95ed6fed610411dbf23d19e1f
>   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>   Date:   Thu Jan 21 14:19:21 2016 +0000
>
>     iscsi: add support for getting CHAP password via QCryptoSecret API
>
> but was not mentioned in the command line docs
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b23..055df73306 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1889,7 +1889,7 @@ SRST
>  ERST
>=20=20
>  DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
> -    "-iscsi [user=3Duser][,password=3Dpassword]\n"
> +    "-iscsi [user=3Duser][,password=3Dpassword],password-secret=3Dsecret=
-id]\n"

Loos like you're missing a bracket before the comma.

The line below also lacks one at the end.

>      "       [,header-digest=3DCRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
>      "       [,initiator-name=3Dinitiator-iqn][,id=3Dtarget-iqn]\n"
>      "       [,timeout=3Dtimeout]\n"

