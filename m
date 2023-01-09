Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019F6628FA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:50:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtLh-0001ct-Tt; Mon, 09 Jan 2023 09:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pEtLg-0001cb-1f; Mon, 09 Jan 2023 09:42:04 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pEtLe-0004sk-HJ; Mon, 09 Jan 2023 09:42:03 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6763EF62;
 Mon,  9 Jan 2023 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673275319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHFlgpkGpYic5RNI5UT+NVGDLtt0LXFu+Yz4SP+WGu4=;
 b=N6CUBhvRe1EONzsKoVw5j6ASc581na+ZPU2WVF4aqp8pJAPkzkTVPOBbwa12ZaM/AJUwt9
 Dm6vto2v8xZeegelCpLVlsBrT4eSDXKL4D9Rnj2uNb2GhyWJB5vCmltBOG+rVpyo65PRyr
 FiVqiwIXrBCJ7qgHF6xwU81zvGXwaYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673275319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHFlgpkGpYic5RNI5UT+NVGDLtt0LXFu+Yz4SP+WGu4=;
 b=2T3oSKLuVPe0kunXbyaAwdjrinGLVuq/hAmEsqng8bHAjvfY0Dorb1H1m1tsWUxXehZiha
 WOQzcupeMx/JgVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A961213583;
 Mon,  9 Jan 2023 14:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X6S/GrYnvGO1NAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 14:41:58 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
In-Reply-To: <20221215224725.3236-1-farosas@suse.de>
References: <20221215224725.3236-1-farosas@suse.de>
Date: Mon, 09 Jan 2023 11:41:56 -0300
Message-ID: <87358jzs5n.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fabiano Rosas <farosas@suse.de> writes:

> This test currently fails when run on a host for which the QEMU target
> has no default machine set:
>
> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
> no default
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/avocado/version.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..dd775955eb 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>  class Version(QemuSystemTest):
>      """
>      :avocado: tags=quick
> +    :avocado: tags=machine:none
>      """
>      def test_qmp_human_info_version(self):
>          self.vm.add_args('-nodefaults')

Ping

