Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548231B83A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:44:37 +0100 (CET)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcIu-0000kX-KS
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcHH-0008Mk-Io
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:42:55 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcHF-0007qO-Ul
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:42:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id v14so8462445wro.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3uIPkatFD3XePONAms5GCTHTsd2h7/wLC2Y7JClCD0=;
 b=QY8/9dh9qZAQ0CxpmNESQpdxrzdSS1WRkPGtfwSdIWWiMEo52T8k5Vat2ipYBKpMDN
 ArZTjN9OoisrS9dDIOKEHesX6oNtFIsOkH6fVtlr34TYTTsOEKjml2RgcdVlCRmUixSR
 ANUhcS2G9mI758VqIkUl3O/8kqE3i1jn2OxdlRcxb/fWjZkrt99Ctm0NI4XyXtpKR1vG
 TiERSsS2mvKzUjbkBBNS4yuKvACoFtIJZVWvlrbUfeRLTe02+YqUKZKiN+ppQc6jXSni
 sDruJM8+siG+eNMe0CatLQMOInSgDyJj+v0QqS1doExmk9r6q1fEOd4l24nAvNNESfgD
 wM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3uIPkatFD3XePONAms5GCTHTsd2h7/wLC2Y7JClCD0=;
 b=N6mZRCcqbUdlFROIgPvHgKdpzSlFQ8RbhqH+XhnERawOVfrbWMgylRAvsMXb8rt7sX
 5lrz0LD5lKb7PWyUqTHtwcVg91fpe2RcUMJUrdgmsdIecKTsMrGdiqlj6B1WOagKYizb
 VRwGWn+9Rv20l0Re/xf1ZqSjXW/wbP3lGTYQ8Jfi9UdRxYlNJE2vaEIzV7gWdkraouRE
 fkQKujDisMiUUzZrLIGICbCSJpNeyroOly+i1ouztuS2g9JCL4tK1W9+m9XHDswjaiT9
 PtNQvDgp3scxGPwvcrVDrv3Jts4r0xTim9S8PX6QAZQqp3wb7g7sRcTduVDJbxRK+sB8
 mujw==
X-Gm-Message-State: AOAM533+UT88mpuOGV19tjUPw8rt48oLDhrkLRILEYZ6Mt8HLGXcedn4
 jNqvwzbrF6PFgLdu2gvhn1Q=
X-Google-Smtp-Source: ABdhPJxokynZnK1FCnE2nSISW7Jbal1QZMCSAtdA0IvDireCMgupc2MW7TcIGTY4mfPGbthCuU1OOg==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr18220337wrv.182.1613389372242; 
 Mon, 15 Feb 2021 03:42:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 2sm25110880wre.24.2021.02.15.03.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:42:51 -0800 (PST)
Subject: Re: [RFC PATCH 34/42] gitlab-ci: Build MIPS R5900 cross-toolchain
 (Gentoo based)
To: qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-35-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9ad5a4e-a6cf-d8ec-01df-2e2b33851296@amsat.org>
Date: Mon, 15 Feb 2021 12:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-35-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 6:59 PM, Philippe Mathieu-Daudé wrote:
> Add a job to build the Gentoo based MIPS R5900 cross-toolchain image.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/containers.yml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 587bd4ba2e3..f441e608446 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -152,6 +152,13 @@ mipsel-debian-cross-container:
>    variables:
>      NAME: debian-mipsel-cross
>  
> +mipsr5900el-gentoo-cross-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: gentoo-mipsr5900el-cross
> +    EXTRA_FILES: tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
> +  timeout: 1h 30m

Well, depending of the runner hardware / load, this is not
enough:

Duration: 132 minutes 17 seconds
https://gitlab.com/philmd/qemu/-/jobs/1029975495

I'll use "2h 30" instead. I'm still looking how to make this job
optional (or manual).

