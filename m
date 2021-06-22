Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C523B0732
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:16:56 +0200 (CEST)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhCx-0002Cz-Or
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvhC2-0001Hf-0x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:15:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvhC0-0004tb-BG
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:15:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id i5so6457476eds.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BBDAQ95PzCigF/6scozDwCGoyusjEsB8XZAQ8m0yhYs=;
 b=hvkshuIw2uch4Qh8deIWknWAWkFWTyMY8JgL9io731VD7cAbnP060wgMP1Rh4ETPim
 pFuKOu3KqXGcWkXgifxYW2DTXvXUSVyhQgcVqlA91Z/GrDEMRy97DVOwqo/ChGzQqed8
 QyNP4WcHhncdX6wCrSJMeG3JXxj3hpfqXDMJtsXjk+YwSXhS832Q9Bwvwdcmqh704t4p
 iDMiUXNdckhjT2Ql00HWIL/dzpRhgJydF/uAtp3yl6mPOMPFqsrnO8DGwFoS5rNId+gu
 gtiDDSI/ma9ODZC8s4BNBduAQGzawtOxmgRs8IXKTLVSsruN6taoza6IqZXq++erzJz9
 WtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BBDAQ95PzCigF/6scozDwCGoyusjEsB8XZAQ8m0yhYs=;
 b=qBm965H92AOzu8iOwzihLd8yZW36mIRPGjahfYTSCuWN2C0q7n72IuYZtMJhs8qHuu
 2VjUO2QTzBphcr8GyNkP2nJ6pQ6+bHiH86+7OUI4N6h5Tf/XaIwvdCB2dicXka3cLv+4
 2obkESLozrXQBsFU6tTh2uf2JIXWmLDog7PEVjqXLsLhob6uJRigMiWiGahmiYcrvxSK
 Mbz5FB1lfZxytotA3Y/mOb3NEY5z7INEUgKd+jE91nfFEuIQHjpgsgFxqIFQ8VsaiAUm
 uQE0k8mSjNS1p1XxLu4SpJkSF8EEZRPJh7XW6BcLrU5ERvss3xigVMrzOpXDLnYrNZAI
 8JZw==
X-Gm-Message-State: AOAM531t1nnNTW2XOz8bxELVgJ6Xis4jW55sSM+OB8hTDQj9fQiUK2ro
 dPN+wewnkpMGwt7hqgdzpNpd1HKdHW/sluEa55jNsA==
X-Google-Smtp-Source: ABdhPJxerPgcSWhv5ILrXiC64rv/fYOJVwU+kuflb9SOD6JRJK83dhIsGzD4Us/W28KVQnaSIIwnefq4UM6qrx3Ihxk=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr5366536edy.146.1624371354481; 
 Tue, 22 Jun 2021 07:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com> <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
In-Reply-To: <YNHvcQAMLSpVcxaE@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jun 2021 15:15:18 +0100
Message-ID: <CAFEAcA9X9fYAFAux4h2n00kYpTgxkNcJg6Ako7s6ndU4KWTJyQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>, yangyicong@huawei.com,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 at 15:11, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> The QEMU man page says this explicitly
>
>                  For the PC target, the number of cores per die, the
>     number of threads per cores, the number of dies per packages and the
>     total number of sockets can be specified. Missing values will be
>     computed. If any on the three values is given, the total number of
>     CPUs n can be omitted.

Anybody feel like submitting a patch to fix the typo? Should read
"If any of"...

-- PMM

