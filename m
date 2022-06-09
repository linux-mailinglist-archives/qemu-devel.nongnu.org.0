Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8867545549
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:04:35 +0200 (CEST)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOOQ-00085s-MK
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nzOMR-00060u-RP
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:02:31 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nzOMQ-00044p-9K
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:02:31 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id B9428C60912;
 Thu,  9 Jun 2022 22:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1654804948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJVTmDEZnKpZRoNZvo8NLmxUNzjXaQTDEJQb9kK9V4k=;
 b=cuo7kSw0JVNddHkZdA7Ic+4Z94462FZwxOwPBXlzW+l0W5RKh7a93CJKrspnjFdOSKmOqd
 Fuf3FugmcBy9ZCXbocHN5juYu18OQ12ip8oJd+TzUMTQq5KRUiwZO3tRRhsfBsYGUgctkB
 8JmuAnbEyI0CouT1R3/R8/hH4Q7rOdB/Y5i2y5qP7sLi9EMbFY16AuDF0roeRFiuopa5Qh
 O8KsH3Df76KhEHtBUt1zWMekAJQNq0EDIPxiIG0Wmi+jep2/KzDYp67OQRWJH23g37eMga
 /v90jpC37JTKo3GLOOKsZWQX5tfF+eKsJ3QfwCB7eVi9iuGq9XBv+w1MN1EMZQ==
Date: Thu, 9 Jun 2022 22:02:28 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 2/2] semihosting/config: Merge --semihosting-config
 option groups
Message-ID: <YqJR1FFnRZy6U9Fd@sekoia-pc.home.lmichel.fr>
References: <20220526190053.521505-1-peter.maydell@linaro.org>
 <20220526190053.521505-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526190053.521505-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20:00 Thu 26 May     , Peter Maydell wrote:
> Currently we mishandle the --semihosting-config option if the
> user specifies it on the command line more than once. For
> example with:
>  --semihosting-config target=gdb --semihosting-config arg=foo,arg=bar
> 
> the function qemu_semihosting_config_options() is called twice, once
> for each argument.  But that function expects to be called only once,
> and it always unconditionally sets the semihosting.enabled,
> semihost_chardev and semihosting.target variables.  This means that
> if any of those options were set anywhere except the last
> --semihosting-config option on the command line, those settings are
> ignored.  In the example above, 'target=gdb' in the first option is
> overridden by an implied default 'target=auto' in the second.
> 
> The QemuOptsList machinery has a flag for handling this kind of
> "option group is setting global state": by setting
>  .merge_lists = true;
> we make the machinery merge all the --semihosting-config arguments
> the user passes into a single set of options and call our
> qemu_semihosting_config_options() just once.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  semihosting/config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 50d82108e6e..3afacf54ab2 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -27,6 +27,7 @@
>  
>  QemuOptsList qemu_semihosting_config_opts = {
>      .name = "semihosting-config",
> +    .merge_lists = true,
>      .implied_opt_name = "enable",
>      .head = QTAILQ_HEAD_INITIALIZER(qemu_semihosting_config_opts.head),
>      .desc = {
> -- 
> 2.25.1
> 
> 

-- 

