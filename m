Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA9475D45
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:22:33 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxX32-0007Pw-G4
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mxX1n-0005cM-Nl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:21:15 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mxX1m-0000vv-5Z
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:21:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E0D6212BC;
 Wed, 15 Dec 2021 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639585271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZpgtOgyW6Yn2OqGwxkQLQ6bvipzUH0k0kBHYRFheQE=;
 b=BP+fUWRpI+x6KAvveTPIpaXmTIdEuZenpjRghntSE5vPfxz9ZxsaGLKdfjF7tuXWhHDJkz
 XZPtKWGDQHRKjfc9S0VAeIc8RBDbDZWrSgyCWuCUHJs65ncAmVbfX7XOwI5DSGc+VenfAh
 wP5OvyJGWGq0NcPq2fAcC1U/wS9Huso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639585271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZpgtOgyW6Yn2OqGwxkQLQ6bvipzUH0k0kBHYRFheQE=;
 b=6g8VnAqLJOW0QS/K4al35iw9KH/jR2m4fmbx6WxNDjFhBoXc5eodXx+40/Abr94o1FcPkB
 I1+fmyvx8onoccAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06B0D13B75;
 Wed, 15 Dec 2021 16:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IARcO/YVumHoHQAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 15 Dec 2021 16:21:10 +0000
Subject: Re: [PATCH v4 03/18] meson: require liburing >= 0.3
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-4-berrange@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <b98691fa-4c61-a6db-9caf-368317b66b48@suse.de>
Date: Wed, 15 Dec 2021 17:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211124130150.268230-4-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 2:01 PM, Daniel P. Berrangé wrote:
> openSUSE Leap 15.2 ships with liburing == 0.2 against which QEMU fails
> to build.
> 
> ../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
> ../util/fdmon-io_uring.c:305:9: error: implicit declaration of function ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? [-Werror=implicit-function-declaration]
>       if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
>           ^~~~~~~~~~~~~~~~~
>           io_uring_cq_ready
> 
> This method was introduced in liburing 0.3, so set that as a minimum
> requirement.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index e2d38a43e6..04d36bf47e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -427,7 +427,8 @@ if not get_option('linux_aio').auto() or have_block
>   endif
>   linux_io_uring = not_found
>   if not get_option('linux_io_uring').auto() or have_block
> -  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
> +  linux_io_uring = dependency('liburing', version: '>=0.3',
> +                              required: get_option('linux_io_uring'),
>                                 method: 'pkg-config', kwargs: static_kwargs)
>   endif
>   libxml2 = not_found
> 

Thanks for fixing this. I didn't notice it on openSUSE SLE 15.2. I just 
checked my system openSUSE SLE 15.3, the version is 0.6 which is much 
newer.

Thanks
Li

