Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67416E1EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 10:59:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnFGY-0001lU-8V; Fri, 14 Apr 2023 04:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFGV-0001kx-T5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:58:43 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFGP-00006e-4o
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:58:41 -0400
Received: by mail-ej1-x62c.google.com with SMTP id kt6so5735309ejb.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681462715; x=1684054715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pIdy3f4aTAgiTGlWqm2BRv4SV4w8CG2bmwQTnc3YL30=;
 b=NCctQiifkVhkP4cNfSKHrv3k0HTpziuE5pxeIKT66xPGNMd+U5CCUX+wBkrCdKvbKI
 h6tEnd1yrgoUmqzbmiXijnKxrkcDBOVoXLuajpzSb0DZ7hYoK+hCJf+I7gzsPdrq4Vc2
 f80GHDRjpxoC5VwtEhrKE1ltAqR056A3gUN8SZaV3lVDRrhmDBDzT8wKedlZQDYaFNE6
 KRDf5AGWKt6ojVX6KaWqrJPK0ifWLNeJEvKi2mZcmXKZAqZ6O96qDtl37Dmxhwxqiwxb
 cZAx4nA1sD0/3orF8B+LsPs/ahS7B/tQQR2bT0WgMAnruru6AOeLmIVu//3Fzs4EJCcn
 pOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681462715; x=1684054715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pIdy3f4aTAgiTGlWqm2BRv4SV4w8CG2bmwQTnc3YL30=;
 b=hRj581IcZZrngIPbRU68E6ZSI2IFiZoqf0pU8Zcq3yaXCBgpfUxcFzRjGzpqFLax3+
 xwMXueqGIJ/gRYsxLLT6wKLlr1OPQ98mZkgg5CagcBCNZm4zKeuOtH9Lk3GW1Vl0aLg2
 VshlHGIXeoS9wtUo2itIV+hOZnGsJElOZN7OflsWnCP2zPYU7NTctDIsIOmCRW/N//3G
 8bs3KPkySgo7wGZD/YY3f1R/ZVFeQp/K+kOT+ZLwtTJk1jyG9DddWr54gOrQzpEj+5N2
 OGudHfg49zZY/jr5P880V71hPDIgZ7TfGrsE9sjdZO102Q7TsXJ4moFMqbT+301H4S+F
 o1vg==
X-Gm-Message-State: AAQBX9dQ185gw8XTSzkX6vclmWwMABa7HQVBr4ZJOyOpkNU+Yuon/ZYp
 lw9KAS05UGKizPwN+AqdR+rLppYqlxNTspdGqNQ9Qg==
X-Google-Smtp-Source: AKy350YaoiYabb/11W8R9Qz0iahehyUySjcip1P8HZlC1+kvNHd3SFMviKQLEwoCxN/5s5DhWLfJRrB5o3ZA+q64WhE=
X-Received: by 2002:a17:906:edcb:b0:94e:c630:564c with SMTP id
 sb11-20020a170906edcb00b0094ec630564cmr1680631ejb.6.1681462714823; Fri, 14
 Apr 2023 01:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230413214327.3971247-1-jsnow@redhat.com>
In-Reply-To: <20230413214327.3971247-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2023 09:58:24 +0100
Message-ID: <CAFEAcA_gQ=kj4UpxAhWPVsVng-3+i9bOjkXyYk8snCKmrFUMyg@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: require netdev 'user' for kvm_xen_guest
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 13 Apr 2023 at 22:43, John Snow <jsnow@redhat.com> wrote:
>
> The tests will fail mysteriously with EOFError otherwise, because the VM
> fails to boot and quickly disconnects from the QMP socket. Skip these
> tests when we didn't compile with slirp.
>
> Fixes: c8cb603293fd (tests/avocado: Test Xen guest support under KVM)
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/avocado/kvm_xen_guest.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
> index 5391283113..171274bc4c 100644
> --- a/tests/avocado/kvm_xen_guest.py
> +++ b/tests/avocado/kvm_xen_guest.py
> @@ -45,6 +45,7 @@ def get_asset(self, name, sha1):
>      def common_vm_setup(self):
>          # We also catch lack of KVM_XEN support if we fail to launch
>          self.require_accelerator("kvm")
> +        self.require_netdev('user')
>
>          self.vm.set_console()
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

