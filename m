Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D735E9343
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:01:37 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRGK-0004gl-6p
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ocQwk-0002Kk-RO
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 08:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ocQwh-0007uK-0m
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 08:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664109676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKZGPTb3mNrjrTsiDqKM6bYHgtcHqoXWaqZBgNtPP7A=;
 b=IcVKtvJq95FwtSYvNorlJXkZDnAYN3QbyhPh4hr9/pfj/PxyN2/bT1WEJfuyU7qgqVT7It
 TP46sBVJvYn7lTrYRcW2uXJfW5XPH8qDGzkfnXiXZP2fSfo+CBVoUjP9yCvd3w1TlYoZK4
 +h7smoNu39yEcB6OfhwtCJSfFwxEfq4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-9PGlQJ7ePt2oHOBbMVA_pQ-1; Sun, 25 Sep 2022 08:41:15 -0400
X-MC-Unique: 9PGlQJ7ePt2oHOBbMVA_pQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c2-20020a1c3502000000b003b535aacc0bso701569wma.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 05:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KKZGPTb3mNrjrTsiDqKM6bYHgtcHqoXWaqZBgNtPP7A=;
 b=mGk857oqZnhBlKEXt6RY7ChZ4yeb1qpgRgIX5HcpayPMyAClp7mHWfsR9mQgWq7g3Y
 Wd1EHrsF3FX3AKmLlk/7wcKyLQlTRvLaFIdEIarLAGwJRjfUk8B/CI8WmKM6dyssZsBr
 V89pwf9Jmz/tk6S5SPMz1ILFjE7O8TdzwdBZvYa+1+EvrlD509AW6tceI/yUPR/zx8EL
 YD+0bXguKcjzJXPZHhZb+taJOjfdZ2Zmh8eY9bw3ke9oQglieBT33v6VGfuyJPHNOtPE
 JRjecqg7oIqqgNHEWBD65YJvgnu+rDvhsCMn97I+TInyJvFDu5SmEsfy1Xrc/dV0Z4nG
 OLvg==
X-Gm-Message-State: ACrzQf2SBkwtyAofuNCg/YqSp69Mq02E1u5yIIDgdcuJCENB8mRL+0Qn
 rwjy27BsKAMXfDx+YdQ1iO5IMHRiwyvPh3TUyv8/LM/Al8XYJudaQjRKmxbiD/LBV9vygmLbz9h
 Q+BhEOXVbeIW1HbM=
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id
 o20-20020a05600c059400b003b476379444mr19198719wmd.52.1664109673947; 
 Sun, 25 Sep 2022 05:41:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ACbaecZeqeov8+rY6stvExh0phRvW6NF6vPIiUvM90d2ptdrF36ePYp3KjEM8e4w015jX7g==
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id
 o20-20020a05600c059400b003b476379444mr19198704wmd.52.1664109673659; 
 Sun, 25 Sep 2022 05:41:13 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c068a00b003b483000583sm7534749wmn.48.2022.09.25.05.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 05:41:13 -0700 (PDT)
Date: Sun, 25 Sep 2022 08:41:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 38/54] tests/qtest: bios-tables-test: Adapt the case
 for win32
Message-ID: <20220925084052-mutt-send-email-mst@kernel.org>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-39-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220925113032.1949844-39-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 07:30:16PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Single quotes in the arguments (oem_id='CRASH ') are not removed in
> the Windows environment before it is passed to the QEMU executable.
> The space in the argument causes the "-acpitable" option parser to
> think that all of its parameters are done, hence it complains:
> 
>   '-acpitable' requires one of 'data' or 'file'
> 
> Change to use double quotes which works fine on all platforms.
> 
> Also /dev/null does not work on win32, and nul should be used.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge with rest of the patchset.

> ---
> 
> (no changes since v1)
> 
>  tests/qtest/bios-tables-test.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 46a46fe0aa..2ebeb530b2 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
>      free_test_data(&data);
>  }
>  
> +#ifndef _WIN32
> +# define DEV_NULL "/dev/null"
> +#else
> +# define DEV_NULL "nul"
> +#endif
> +
>  static void test_acpi_q35_slic(void)
>  {
>      test_data data = {
> @@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
>          .variant = ".slic",
>      };
>  
> -    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
> -                  "oem_rev=00002210,asl_compiler_id='qemu',"
> -                  "asl_compiler_rev=00000000,data=/dev/null",
> +    test_acpi_one("-acpitable sig=SLIC,oem_id=\"CRASH \",oem_table_id=ME,"
> +                  "oem_rev=00002210,asl_compiler_id=qemu,"
> +                  "asl_compiler_rev=00000000,data=" DEV_NULL,
>                    &data);
>      free_test_data(&data);
>  }
> -- 
> 2.34.1


