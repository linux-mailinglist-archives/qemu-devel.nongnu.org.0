Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B688A53C7FC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 11:58:23 +0200 (CEST)
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx44U-00076N-DL
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 05:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx42T-0006Dh-G6
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 05:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx42F-0000Zh-3z
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 05:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654250158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=br8BPF6nmcnTCRWyW/DjTNMx6+wBDJzATfvDHHwOfQU=;
 b=hZ6uDiMBvzneqpLH+UPlSLBmwmY65w5G+xlLPI6HXzmxlRKUeTK3n0WJTAxSgpLSnHoFNh
 ToRuxlzrS+7mTwLbcIYkw5/cdu2bMA1jaVO76BIEICBdfYY9x37Lw9iPQSZuWjqyg1qEn7
 gBXPzCXCNg9aHmPdsQlGbYHpYzJ9/fI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-iswyWW_vPuScXtWdsq9Zig-1; Fri, 03 Jun 2022 05:55:56 -0400
X-MC-Unique: iswyWW_vPuScXtWdsq9Zig-1
Received: by mail-ed1-f70.google.com with SMTP id
 m6-20020aa7c2c6000000b0042dc237d9e7so5173870edp.15
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=br8BPF6nmcnTCRWyW/DjTNMx6+wBDJzATfvDHHwOfQU=;
 b=Y36uoqAfeCVt2s0z04I9o8J0U7I38b9eLao5N0Pf0wAVgu+/MQM5VCjIhpxQJYROFs
 mOpuqtSZEMHn96L2JRBp226zLewZ+4LphzE03DgpY9tZcl+DLWnu/mSU1pwg7uOmYeg6
 tJUcSxvJOUBbxvtLQcpcIfUrxE+mwWFbnPyVGtWFZJrdGABpNU1O0cSQPKPdsX/qlmVS
 kSIZx29dg2NSQ2rgrW2d40PX2lgomjcEx14CaLLA1NK90ztHBXiC9dY3iBUxUZRH0B4a
 cidNWenyFNUlcRNcTXgUtoHkz3SQPLG3twIodAMKVLcN7gmjZXGBJmaxmLWexlKgwS6r
 jIzw==
X-Gm-Message-State: AOAM533qowMqe8a/RhDYttDc+LSmb4yTrpzGeSat6IkLWikLjD0DSsK9
 qIfW7ptzKEJEqJ92CBUiyWi0JoIgzw46cjS95ZT1QKA/5d8E4mp0afIMVI9lf12yx+NnTTL5+nj
 uia79MozGQdt25xNQ0wpHKmyKJBF5lZmRSEtRYvGEeWly+6A0H+l8ozdE9K5NstY6sA==
X-Received: by 2002:a17:907:9615:b0:708:a422:c9c2 with SMTP id
 gb21-20020a170907961500b00708a422c9c2mr8011810ejc.217.1654250155731; 
 Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9TABa22uUovdTlJnP52sudrWtQERST3y5sYZEITn92B0MN7crN2FJbVAVpSJlSvktYxAYAw==
X-Received: by 2002:a17:907:9615:b0:708:a422:c9c2 with SMTP id
 gb21-20020a170907961500b00708a422c9c2mr8011785ejc.217.1654250155343; 
 Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170906494800b0070c4abe4706sm1172269ejt.158.2022.06.03.02.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 02:55:55 -0700 (PDT)
Date: Fri, 3 Jun 2022 11:55:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603095553.2fa53p6f246giyik@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603092505.1450350-1-drjones@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 03, 2022 at 11:25:05AM +0200, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.

Hmm, looking at tests in tests/qtest and tests/vm I see cortex-a57
is still used for a default choice. I should probably post another
patch changing those to max as well.

Thanks,
drew

> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/avocado/replay_kernel.py     | 2 +-
>  tests/avocado/reverse_debugging.py | 2 +-
>  tests/avocado/tcg_plugins.py       | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 0b2b0dc692b1..c19022ea977d 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>          """
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
> index d2921e70c3b4..d6a6d7277235 100644
> --- a/tests/avocado/reverse_debugging.py
> +++ b/tests/avocado/reverse_debugging.py
> @@ -198,7 +198,7 @@ def test_aarch64_virt(self):
>          """
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
> index 642d2e49e305..2bbf62f5036e 100644
> --- a/tests/avocado/tcg_plugins.py
> +++ b/tests/avocado/tcg_plugins.py
> @@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
>          :avocado: tags=accel:tcg
>          :avocado: tags=arch:aarch64
>          :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>          """
>          kernel_path = self._grab_aarch64_kernel()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> -- 
> 2.34.3
> 


