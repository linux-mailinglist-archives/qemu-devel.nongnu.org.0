Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D634B6DEA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:45:30 +0100 (CET)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJy93-000305-9m
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:45:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJxzP-0007Ko-TM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:35:31 -0500
Received: from [2a00:1450:4864:20::42b] (port=37575
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJxzO-0006q4-8e
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:35:31 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w11so32163837wra.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBYE0WhmKuuFCy8Nin+AtE4ZQZEoz0JVDBea4woFRXY=;
 b=J+XYUmGw9lJFxdpzeBCdVKOZHw94UVzrUyWlpCWSr27ZIXBfRFKdje8T+plduGmLx1
 4RJyrJa4pzll1xlNX6DFoTljIxdA2JrH1FeNNTjQyqqUg3EnMVIvYJLM6WabUhCWvgzX
 r8vvy/ic3jY4gC/LLiBZpm6TJudXH3CYs94Is2zKQOAqSIbcFw+RWri/t+HU/QTTFwLb
 WzskQL6pNim/XIb3lxotZppa/2wqtq+SGsShydwnHU2I4QIKHTZYLh6NKlGjlAsPtO6M
 lV7NewucgDxZpvvX0TyoN4CzjSJr0C04QWyjQqFqeMb23izOzIrd+Ea2lSSCfpHgX8CA
 VsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBYE0WhmKuuFCy8Nin+AtE4ZQZEoz0JVDBea4woFRXY=;
 b=6owIGaOoXkxoFsXwSVkB1QOIicYlZNk5Gx2x3Uo8f7awS904iyFsq3TvcMZswSJSyQ
 s1hEBbDoVEwwDIefQu02hhrSYpd+Ak6FC/JqbV/X1Dsc2joTDzw9J8uBT9Q51uRCNtdW
 1LH2SnwgXGKiiAVVtkxs4hBTk4x6SoOLDyHJsTOZgkPUyK9J8ST6p2zDhO3hfOed3kDw
 tcb7pHXq4czQ8ONE1xVdtlc4o7CxsgXL6cGbDGcJKLs2PxflKPGb2uFjIVvargqLPlEw
 ZDH/k6fgnbnHR3hHCrsf60R/QTXGdahNIB3t4vK9/vWhKl8Rp99Ivgs4rvMFVoawJpn1
 AhrA==
X-Gm-Message-State: AOAM53279Est4uhKtP/B40355UHQEDgyNB+LnKtEvbkKFO4TSw9k+rMG
 fL6fQM/N6Wkhd/Fcxk2UEotCzI9AwkCDcvSXXsc33zn89tc=
X-Google-Smtp-Source: ABdhPJxQJP/4b4BnRjSdZd/zoWu2enZkCcyAhgfnhl6fsCSKBoBL5fT4kJLd5Oqb/F8s6CaIalQz6d4t6kd5bRTdFKs=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr3265244wrv.319.1644932128604; 
 Tue, 15 Feb 2022 05:35:28 -0800 (PST)
MIME-Version: 1.0
References: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
 <CAFEAcA9P7DyYqBCLeTMRSTiw2jYMfQ97vs_u+55nCdov7LDdrw@mail.gmail.com>
 <cfca692c-db64-aeaf-73da-3d36655a44d7@greensocs.com>
In-Reply-To: <cfca692c-db64-aeaf-73da-3d36655a44d7@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 13:35:17 +0000
Message-ID: <CAFEAcA-b=7t3-0Hxam+Sfhmv9AFdZ_=qFZXjOxdnqxFkfqwvcg@mail.gmail.com>
Subject: Re: qdev instance_init vs realize split
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 13:21, Damien Hedde <damien.hedde@greensocs.com> wrote:
> Are you saying that: if an operation like a mmio/irq definition is done
> in realize(), in theory, we should have the unrealize() counterpart ?

I'm saying that at the moment we have two categories of device:
 * ones which are intended to be pluggable and so might be
   destroyed at runtime: these have to support the full
   instance_init->realize->unrealize->finalize cycle
 * ones which are only created in machine models and then exist
   for the lifetime of the QEMU process: these have to support
   instance_init->finalize (for the benefit of monitor introspection
   which can create and delete devices in that way) but otherwise
   only need to support the instance_init->realize and don't
   need to handle the unrealize->finalize part

and maybe we should consider whether it would be better to write
all our devices in the same way to handle the full set of
state transitions.

But if we do decide that then we'd need to have a testing framework
that actually exercised the whole lifecycle for all devices, and
it would probably be a lot of work, so maybe it's not worthwhile.

We'd also want where we can to have APIs that arrange to do
the handling of destruction for you. I think the GPIO line
APIs are like this, for instance. That's much less prone to
"forgot to clean it up" bugs.

-- PMM

