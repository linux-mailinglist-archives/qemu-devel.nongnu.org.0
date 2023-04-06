Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1016D9CAD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:50:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRrI-0007iy-0D; Thu, 06 Apr 2023 11:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRrG-0007iq-Ft
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:49:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRrD-00020D-69
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:49:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id jw24so2459074ejc.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680796141; x=1683388141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ngvf5yC3nCdxHuFNsPtmjmW6ttozbMQ5/A67H39MTJ4=;
 b=aXNipzfukJjQEwsa8+OoKEht2BXMMNlOjogJ91vCfUM10f++CWaHlDPvXEwHURQu2F
 ZQtCYHKbe3P73p2VpcZfkjMItFpmTYXkxlTZzsvgcBNHLsia52P8s7TnGeL8whN6e5Ul
 jieoaeBCb7+INrmIy1ZxEzkOaY5j29YlSY7pTKOyg1tnhUmZDAz+of1QaYEAdLzP/LwN
 eiYPoVIvjlz8W7zjPIaj9ipL58UY8rVF96dZ6jZGSCsAwfAItKNn73satta7Kpkufl2m
 3ZrrMtpDNZnA0s4HFRlJ5yaMLA943Pmx5J2AET9E8Ina7al9KMWicTtJjpZersRqSIiH
 fRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796141; x=1683388141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ngvf5yC3nCdxHuFNsPtmjmW6ttozbMQ5/A67H39MTJ4=;
 b=I+Jw7yS6fiweDDhIU233n4lVJtfu+60jII+FRLLHP3H9v/yawSpvyugFXEpCBMAlQX
 0tOgJfuPKMTrpl8DsI+ZfIZfuNm7jqZELFvcrPpjvRJJE7KVzk4Sa5zuYwknLCZR0TdH
 5XC21ENmYiKtjxhJLTV11Wxz8XayKJHZgaNxsl0vPELfg9rCLdLpiHTZoxgTE0BEz1dQ
 CysRQaGqSnt0dyuJm4ZXuR+X2wWlJUITrSyR7M2hsHH8qLRM8z4+MeH4vasXQEWACZvn
 sSdWsfBVkU4dc6uhbLkDU8NhX9+3gSyvICXbF30itqbqNsrW/62mIVV4Kc1U2UmHzVkf
 UgHA==
X-Gm-Message-State: AAQBX9d9JMrcRwCrOhCMgRVlDajObfsmITCwG/JzPcEO0re/mnzACmRT
 5T70wn08WTWAfECzFLADZBRZUoZiwLbqTc8JaXRY4Q==
X-Google-Smtp-Source: AKy350bZ6rbiEL9kvZCRqVn5UVt5DcbRDGEq2TW8ZlNPyPl6W6+AinaOB3rjD9YruDAwd70YZ/p4TYLaaVZ5MxKYH1M=
X-Received: by 2002:a17:906:b6cd:b0:8b1:cd2e:177a with SMTP id
 ec13-20020a170906b6cd00b008b1cd2e177amr3585598ejb.6.1680796141075; Thu, 06
 Apr 2023 08:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230302123029.153265-1-pbonzini@redhat.com>
 <20230302123029.153265-58-pbonzini@redhat.com>
In-Reply-To: <20230302123029.153265-58-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 16:48:50 +0100
Message-ID: <CAFEAcA9j2cnRVtfxyn=hspgoe0FrAVk7hj1Y=jPiosziz=CD9g@mail.gmail.com>
Subject: Re: [PULL 57/62] hw/xen: Support MSI mapping to PIRQ
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw@amazon.co.uk>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Thu, 2 Mar 2023 at 12:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The way that Xen handles MSI PIRQs is kind of awful.

> Now that this is working we can finally enable XENFEAT_hvm_pirqs and
> let the guest use it all.
>

Hi; Coverity points out a logic error in this code (CID 1507603):

> @@ -1638,6 +1877,7 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
>
>      /* We can only unmap GSI PIRQs */
>      if (gsi < 0) {
> +        qemu_mutex_unlock(&s->port_lock);
>          return -EINVAL;
>      }

One of the things xen_physdev_unmap_pirq() does early is return
if gsi is a negative value...

> @@ -1646,6 +1886,12 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
>      pirq_inuse_word(s, pirq) &= ~pirq_inuse_bit(pirq);
>
>      trace_kvm_xen_unmap_pirq(pirq, gsi);
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    if (gsi == IRQ_MSI_EMU) {

...but then later we try to test to see if it is IRQ_MSI_EMU.
IRQ_MSI_EMU is -3, so this condition can never be true.

> +        kvm_update_msi_routes_all(NULL, true, 0, 0);
> +    }

What was the intention here ?

> +
>      return 0;
>  }

thanks
-- PMM

