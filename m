Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A8D6481D9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:39:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bgc-0004wJ-5d; Fri, 09 Dec 2022 06:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bgY-0004sl-Mu
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:36:58 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bgX-0002nL-7g
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:36:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so8157028pjb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wp/PmCTAPMKFiOAHzbS0OmRXNjbHo+BwydWFu/Tiouo=;
 b=lbXU+glqCuxW4Oea42nwoe7LWOc63gn64CZTUgJkwaduzlGaCYypbKmHGaM6iRlB2f
 7h5vnpqzR9rqfYxmbQ0fx0cpvAXJ5F+4zX/9vGpeVBZtF8N1S/HdJaUiOdXJ7OS8HYos
 vQdGLhcgD77cfSpkyctK9+JAgA01c8Ax7lKxBjX5+D/QRskv7971Nw+/UL1wyBDIwBFd
 rS4vWFED8RupYYUUuVR8yd8EDrTKSEW0yUeDQbbdADGXMs56yyw7yiWAaK3GLFfJGF1G
 ohOENhNrCsxxObusTZ1Y5FEseX/AyvYwIYA62R3L6QPWufrh+1WpEjfQEQvNBVS+nVDL
 frbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wp/PmCTAPMKFiOAHzbS0OmRXNjbHo+BwydWFu/Tiouo=;
 b=OtxoQYllxWug/lSzOkjEMadDLcC9Wk+JymwjsnOfy/As+gTbv8eAkWUU3uEOb8lwx6
 HgdvXQgNOpNvoHTsYHfiYhhi1HRjivzt367G5LIKnr14++FsrU08Y9i//2XvD7bZEkY6
 KUYNqydoarEq/UIrDl+QtLe6DRIA5pPTvKCj3WYDlE69VFm2UBUwHYv0HVXCsn73E+Zu
 e16fGEIyVBsj0rihUq3YVkPg7/vTd3ou73dQzoen9Uo2sObby7+2gi4u7jvyK0v4gybD
 PvN9jYNiNfnJwiA2eP/DzbxjA+09aQYk9KKHG9hH7SsUEeTPKlCcZOi+uj+nlbXD95Qi
 Yu6Q==
X-Gm-Message-State: ANoB5pndLEjs+wpHIrpJy0J0T9vZfxHNE4W/RlTTm7C0ABnPozKiH/SX
 6VjGfNqRB+CXbB5mZHU0BWne3PErkAh7L08n+9zO56hUFDvcQA==
X-Google-Smtp-Source: AA0mqf60kw0PwcKRP14zoaPby2n85t1T70M+g06vs0YPD/joTE4LY3BWiTGfEa+uUqnEZcbVsN+LOSMB1MP4oBvXz8o=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr35469768plt.60.1670585815755; Fri, 09
 Dec 2022 03:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-3-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:36:44 +0000
Message-ID: <CAFEAcA89--CfbhG61mb0JGyT9V7Giko72QyEx_UNVh1nnUCyGQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] configure: remove dead function
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Fri, 9 Dec 2022 at 11:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/configure b/configure
> index e31d4522ea63..543fd5a48bf0 100755
> --- a/configure
> +++ b/configure
> @@ -210,10 +210,6 @@ version_ge () {
>      done
>  }
>
> -glob() {
> -    eval test -z '"${1#'"$2"'}"'
> -}
> -
>  if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
>  then
>    error_exit "main directory cannot contain spaces nor colons"
> --
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

