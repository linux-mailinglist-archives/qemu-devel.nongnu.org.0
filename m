Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C55B17D5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:56:43 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDKz-00063b-Ma
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWDIL-00037J-Tp
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:53:57 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWDIK-0004lT-AU
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:53:57 -0400
Received: by mail-yb1-xb32.google.com with SMTP id 11so25440627ybu.0
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zw9YfciU9kPV8hvTKOSMNoAl5ckUpltQaD9aldaP76k=;
 b=qIc+529QWFlojHkInnhTXoNw6g1b8qwi9RpDYHfmRDnOZafPx1qQap/yZX9wiTUCcT
 InwXh8xo7OG9WmEsKTiex/15M9o2BN9mJtqw2icCXmIkxyrTefnu3Xn+fHgB5Gp1kn7V
 jFtkXu1Z+79oIez3MsGh3jDZUONtb3q75R36oBWHDKbDXlOHomTqnOqLCSj68tU6esFI
 m0ERARbb005Zf+1XwSDloZ8z0yjjrb2i1ws6cvkd4uAAhBis9preXRY3rUPmzzkhYoF+
 +lt6/h74xEMzUNPgfyOUdpQBCmLGJ7Xvw5IBroXkEE0dEqWYkJOFDfoweBa4h1cki6nZ
 qMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zw9YfciU9kPV8hvTKOSMNoAl5ckUpltQaD9aldaP76k=;
 b=n/BQ4CevbN/u89vaWlKbidXwJgH4Bf6RVecnBD9d73z/jluagiS7KoRYkO5JkISBoJ
 yQBqPRrp0KNdrmmRWJMNPynV+Cd67vKKG4zxABdbkx2uHESyuSBZiQejD+ao8K14uwNn
 6SPrv2NKZn9tg4Je3VHYBnHGnna1qmHSNeolstaA31YgQTKC7rvN+HVk8sL36KI1ItRm
 jvXO47VDquqLGIqJYGUZ9LxYAM9/k4/+HpcV9zeQ7slj76QH4pSUg4rtLhbVKfK9xAH4
 8dZJeeFGXqrJeNmx5zpxDvECh78V8KxS+vdX07lPKDgXtvO6tNclHTug0TRLjpwQKVDc
 teAw==
X-Gm-Message-State: ACgBeo2Sp4I3N1qwxXJnEGhFICccaGCkA4kk3fpeMgXqERmo3S1PwCYG
 jddEEOOfNGUYWQ4mMnalY99aOeN4hByLh/7/UctKjQ==
X-Google-Smtp-Source: AA6agR4KlPcFKvsJnpzQTqKAr+eHrqam1aQ3B0KgxvXhlxOHK9plobGvqWcFIAe+tLUzethVb9/UTxSxoGiv95QDqt8=
X-Received: by 2002:a25:9986:0:b0:6a7:29ef:133c with SMTP id
 p6-20020a259986000000b006a729ef133cmr6373902ybo.479.1662627235201; Thu, 08
 Sep 2022 01:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
In-Reply-To: <20220908080749.32211-3-chenyi.qiang@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Sep 2022 09:53:44 +0100
Message-ID: <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 8 Sept 2022 at 09:08, Chenyi Qiang <chenyi.qiang@intel.com> wrote:
>
> After updating linux headers to v6.0-rc, clang build on x86 target would
> generate warnings like:
>
> target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct kvm_msrs info;
>                         ^
> target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
> type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct kvm_cpuid2 cpuid;
>                           ^
> target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct kvm_msrs info;
>                         ^
>
> Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
> it is acceptable to turn off this warning, which is only relevant to people
> striving for fully portable C code.

Can we get the kernel folks to fix their headers not to
use GCC extensions like this ? It's not a big deal for us
I guess, but in general it doesn't seem great that the
kernel headers rely on userspace to silence warnings...

-- PMM

