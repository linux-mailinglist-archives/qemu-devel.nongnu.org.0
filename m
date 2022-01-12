Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498448C222
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:18:29 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ai4-0000Je-1K
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7agT-00084Q-2t
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:16:49 -0500
Received: from [2a00:1450:4864:20::334] (port=54855
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7agP-0001N3-V0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:16:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id p18so1202164wmg.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 02:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4iCcQxUvkKc0Th706LAXAGEnCzWvs7mTFkyCTsRWHqs=;
 b=S7Y+0/acU7HbZ+doJOh2XgEw+NvahNc3ntnKOAOzjzm/TaBSJKvFNkomQZJ7Gzq1LG
 jlmSleKOqtqXRtIMZ5jL1OxxL/I1W6ur+qDW3GFUoKcobj00LbBOpOajTwZgyuKBhzV3
 piDg9Zzrxj6gxvBVXmrGGO7n1XqpeK7lkYs2jS27YsRnbrVe+c8QZsw0KgsSzNVJpsCO
 2RXOE9FgsVj4PVFzG3DAAXubLRhbNqMpNXQ7qb6DVLtyBok62OglW2XCjovLWUMNITKS
 /yWC++p+iGPChX5rXeilpwRqWbQ9mtbulvBHpA7bc1JNaEZZM9b2g+6Olt6hc0dO7NYJ
 NrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4iCcQxUvkKc0Th706LAXAGEnCzWvs7mTFkyCTsRWHqs=;
 b=Qs9K9xtMMkDPLVrYGMmAQr8lnrCf6mY22twI6xQZmLH6cWR5LRgGCZ2z1qurGQr9YQ
 zomoRZp5v9gvfvsYOVH+GjrITmmRKe1JrzAIhrtnuopSYwgnuPnddmq1hLKEnoEN1N0d
 MjyxdmVLzgJUkz+0OkPser/hV7OvpNktyDwaPQXqnY61GLlV85QIS1Ogs8yJ/lGtGvbv
 sIMSSYuZljfkMa2RqCHu1JIWVOZ6RR2QaLuVQkY+dtCmqZcyPKyjW0ZxdUtYQ/hKaEvI
 RtEP/k17I1+RadYEKrlyd1J3cdg++Pd+euu2CeTKUDLpvJtX0twpGSvCGu9E3QxKM3Ju
 Kf8g==
X-Gm-Message-State: AOAM533VHW05SvN0xmHIuBr18h84dsAqiBJU/GD7kz74xxtLo9QKyMQt
 TOtgbOY5i2fQDASJaw8aZ8eLtx6z0hRJ1kZy1OPoFw==
X-Google-Smtp-Source: ABdhPJwx2FsireXjXCVZtgXQ58DBtIYSza37cRvAqZ8Usr7vEPT7UPyqJnBQ8jqVS63Tl4JrFHGRM53CAK0Vj4V5kK0=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr1958419wmg.126.1641982604157; 
 Wed, 12 Jan 2022 02:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20220112165517.4140482-1-yang.zhong@intel.com>
 <Yd6pV+6kdfLNQRnA@redhat.com>
In-Reply-To: <Yd6pV+6kdfLNQRnA@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 10:16:33 +0000
Message-ID: <CAFEAcA-K2uVc2NpfHBQokBZBRSeTGm0dnr7UCLE+sN+Ro-Lj8w@mail.gmail.com>
Subject: Re: [PATCH] sgx: Move sgx object from /machine/unattached to /machine
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, eduardo@habkost.net,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 10:14, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Jan 12, 2022 at 11:55:17AM -0500, Yang Zhong wrote:
> > When Libvirt start, it get the vcpu's unavailable-features from
> > /machine/unattached/device[0] path by qom-get command, but in SGX
> > guest, since the sgx-epc virtual device is initialized before VCPU
> > creation(virtual sgx need set the virtual EPC info in the cpuid). This
> > /machine/unattached/device[0] is occupied by sgx-epc device, which
> > fail to get the unvailable-features from /machine/unattached/device[0].
>
> If libvirt decides to enable SGX in a VM, then surely it knows
> that it should just query /machine/unattached/device[1] to get
> the CPU features instead. Why do we need to do anything in QEMU ?

libvirt having to know it needs to look at /machine/unattached/device[n]
for anything is a bit fragile, really... it's effectively encoding
knowledge about what order things happen to get created inside QEMU.

-- PMM

