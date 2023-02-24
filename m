Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD406A1798
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSwz-0007bo-Qh; Fri, 24 Feb 2023 02:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVSwt-0007bZ-Qb
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:57:00 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVSws-0005KV-8g
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:56:59 -0500
Received: by mail-pf1-x430.google.com with SMTP id fd25so6600222pfb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9NDcGiSm43RpVtstkaRPw1FKhXv/w+37/iNiOvuVpIc=;
 b=maf5+Ot6Xk/w6jgHB0keeUW5Jo+Vn29xmUOsj7nSn9AO0P8/GC8isR1MhgfsGO4JPW
 Kz/fTByGco9enCV+RFaPPMnJBPeJxffwdlVo5db3Om09BIzkjTvNgCHN3SJyUftOLEHb
 hTYABPa/qezt89zLY3mMvlOl5ngfEFOL+cHgljgmjAubcCSkJUDhUohg5tVf8ulfuiFU
 ZiT25Al5ZwHujRed5CFmLVNj7Lstb+p/FzGnKXXI/y8qCFm3s2zEEwnpSfKMXKTwWMti
 bjPLIbXptBfyEGDGyiFWLLoALgXhSkvupQTcXWempqbsTLWiHTz6y8DRFnw3fjggeJB+
 XkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NDcGiSm43RpVtstkaRPw1FKhXv/w+37/iNiOvuVpIc=;
 b=lOvowL25/m44v6LM+TH+rM7tJnxwreiswhjITY6p8xm76B9e9Jc+87mnmp8WwkQb1v
 PUyvM5M90ieHLPnd/usHCnqOxWpaPikp2JzQrfAwqK+W/Y+0Oohz05WjdzpHjA06flfe
 9d+h8Llla9xI2ca5ti/rZKcdazKDgc234C8KqyzqdDtrJ0fh2nDrYQeBvTZYPdgHG/wj
 eBMR6FpVJX2DZM9ZuFl6BDDns2x7deQ23ds92m22ufNTBiyqN2rw3BqY8RVBtROZHsif
 t77E7Vf6NLycviyxVcWVu4fDlHbuNbDjLj3JDJCpsWIM2UgbIQtBpFooOLTIyNScmd3y
 PDvw==
X-Gm-Message-State: AO0yUKUW+Ghr4CsYZyTCDFfvHCiNjGqs6gM2/rHOKRj72lUmgIUL4XW1
 ocmYFOhTG4mtpJItqLdQ4Ug96Q==
X-Google-Smtp-Source: AK7set8HH2y45CAsb8hrlx8gysEwqhC2J0mE1w9AIzURxH/bCupoqhvtjnbRCsiTkdhJqd53iV6LWA==
X-Received: by 2002:a05:6a00:1817:b0:5a8:445d:d352 with SMTP id
 y23-20020a056a00181700b005a8445dd352mr14563359pfa.11.1677225415864; 
 Thu, 23 Feb 2023 23:56:55 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 j23-20020aa79297000000b005892ea4f092sm7218744pfa.95.2023.02.23.23.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 23:56:55 -0800 (PST)
Date: Fri, 24 Feb 2023 13:26:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH] Deprecate the "-no-acpi" command line switch
Message-ID: <Y/htv0jY8CjMJ2Rw@sunil-laptop>
References: <20230224073441.1105921-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224073441.1105921-1-thuth@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x430.google.com
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

On Fri, Feb 24, 2023 at 08:34:41AM +0100, Thomas Huth wrote:
> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 6 ++++++
>  softmmu/vl.c              | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ee95bcb1a6..15084f7bea 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -99,6 +99,12 @@ form is preferred.
>  The HPET setting has been turned into a machine property.
>  Use ``-machine hpet=off`` instead.
>  
> +``-no-acpi`` (since 8.0)
> +''''''''''''''''''''''''
> +
> +The ``-no-acpi`` setting has been turned into a machine property.
> +Use ``-machine acpi=off`` instead.
> +
>  ``-accel hax`` (since 8.0)
>  ''''''''''''''''''''''''''
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 459588aa7d..07d5215325 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
>                  vnc_parse(optarg);
>                  break;
>              case QEMU_OPTION_no_acpi:
> +                warn_report("-no-hpet is deprecated, use '-machine acpi=off' instead");

"no-acpi" is deprecated? 

Is my understanding correct that there is no need to update qemu-options.hx ?

Thanks,
Sunil

