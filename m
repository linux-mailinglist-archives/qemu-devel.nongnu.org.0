Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9139DD96
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:29:32 +0200 (CEST)
Received: from localhost ([::1]:51344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFJr-00044e-PB
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFIk-00035d-LA
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFIf-0001sA-Pz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623072496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnOFIgJ8ql3FFLMO+TnZR5CSTO/o8h4V9DXMaf4EYn8=;
 b=NwxP3v6H6OuuHOnw1KExsX92tzdA6/C8pQF6EtfKdJXt6Hlc6Agh0fSiof0Vms6NtJa7PW
 qk3IX92fMZ2hLDoq0ArQuluI+134Z65a580OP/lwsLmzwEf+aY5bEQYaXyOQe8qF7W2r8z
 oRrNEY6MyJeheQ12L/HLlEeSnHpnaz8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-P8cvcX1kP_6a6INhLURzwQ-1; Mon, 07 Jun 2021 09:28:15 -0400
X-MC-Unique: P8cvcX1kP_6a6INhLURzwQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n14-20020a5d484e0000b029011993ecb409so5996190wrs.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnOFIgJ8ql3FFLMO+TnZR5CSTO/o8h4V9DXMaf4EYn8=;
 b=Q430rd046hsFJXTNWIPcuYULxBqV7GN4NQMK/rT9Btr6khR6Kebjq3+TTjxzW0ZEuU
 krCI6VePy6jzMp4qS+8sKmqTyP2CxgtmuNUKIeWws8Tkc4F5S6WHnPQxOLjVzKYg+xdM
 cdvlCHQaj92oyL81ifrQ73G9uJUMU0vQJgCXU7fBQAUUU9n+vVnswtKm9WeZh9dTt+U6
 PjZhpXBuwWMO+RKY2li3/iJQjZF4QjsYm6FYjcSQzUe4lHqp9ZpXeG8Hh+X2lpUOQ8tP
 eRM008oBPnrJh18gAu6+zEMbz+2v/3dH+icMslkTEZlvEepVKldOphX7XBblbf413kX1
 tCGw==
X-Gm-Message-State: AOAM531DLneZ/MypHe0GbwimuMx6LzMpejxGFLld5BraEL3nj8t5YHCz
 kzTsNw6iIN+fJK/jeT5WqwgyaLOsLOw2dsAjAQmh4ERyVTsGBcH1Nq3PzL9jvEC9JrKCasdYAgD
 c1wBh3wr1wwCXmfc=
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr17075919wrr.358.1623072494600; 
 Mon, 07 Jun 2021 06:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaTtC89CyDOf7YZg6jA858ISAaDzrC5F+yPLudqOiDhx6hFjsfTHUQOxE/OnUVcuByS8Q9yA==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr17075894wrr.358.1623072494382; 
 Mon, 07 Jun 2021 06:28:14 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id k8sm13473462wrp.3.2021.06.07.06.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:28:13 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
Date: Mon, 7 Jun 2021 15:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-7-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
> tests are now only being run if KVM is available. Drop the TCG
> fallback.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 66300c3bc2..b1d406542f 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -21,7 +21,7 @@
>   #define SVE_MAX_VQ 16
>   
>   #define MACHINE     "-machine virt,gic-version=max -accel tcg "
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "

Same comment as with patch 04/99: I think this is wrong. You're mixing up 
whether an accelerator has been built into the binary with the fact whether 
an accelerator is available and usable. There are plenty of cases where e.g. 
kvm is built into the binary but not usable during runtime, e.g. because:
1) The kernel does not support it
2) The current host CPU does not support it
3) There are problems with the permission to /dev/kvm
etc.

I think we either need the fallback mechanism to tcg or you need to properly 
check whether KVM is usable, too.

  Thomas


