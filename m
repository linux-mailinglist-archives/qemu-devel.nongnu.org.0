Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4848B249
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:34:58 +0100 (CET)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7K6r-0003KH-52
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7K1W-0000zI-N9
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:29:26 -0500
Received: from [2a00:1450:4864:20::32f] (port=46684
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7K1R-0000ea-KD
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:29:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso2140589wmd.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgHdfdcND3eIQVPsrXk/imNCIizk2DEWnyKFNotA3tU=;
 b=CAhVyTBTWRzBH2+AZOfO6E+I4TDLCekZmNxKVMf1VgmxQMNMtGmFVI5WrvSDv3J/WI
 GLbS1wAB23pZ0g/wLHPFUbe1SOgfnGZhPRL686EIFkb43KwsKJsJOZCOMIOdyy0RalAU
 2UFpubDIEIfKMOIfUmDEYeu2BtDINpd7FaT3gxjABjSajdRAal8fqPfuFG0pLY9/M0VO
 8PsynBjMuS00l/I47ACeffKYwQdLHvqZR51Siw2/TSbtO/tIYrO+Z3eI89IaFalrlzC0
 aleGtVwdkrXlneGIwdRZ1DSO6xN25+e+MCMRGoh1XdksV2r5n1zA0ULNNdnET4NUp3WZ
 bOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgHdfdcND3eIQVPsrXk/imNCIizk2DEWnyKFNotA3tU=;
 b=0Sk3v0Q/f4c8oYyiYm6tg5k8h+OuvgDgwRuOS91E7cajq7n3Z4Q3KFh+kTn4J66tzP
 l2y04alaGjQPI70PevoYf3OPlq518p8xImeayB1QVvMXNItYqGQqXYk2HVYNVTM+XIhS
 FYhZKyAw0bzjZ7Ah/RoeL+oMBhvwjRCfmVlFj+qNwtaKPSDAvohkXmMiQVHOdBjYqmrH
 jma1b/ZQJXb2XcTPh+CQinrHoGUTBVWeVAMJel9dNFcVJ17rlL44dnE2xLWFAGyWLuMX
 hUk+xWFnIY8NVNYn/rR0swaONRdERBVZx3JYf1avbDOoWIXgfd8fJfNzMpzzk327ygU2
 cZDQ==
X-Gm-Message-State: AOAM530dSilV4nU8xjKttkIGv/xY4LnSa6y1k3Je4Qnz5BHYQmUOkeWq
 Rj3M5dgjg8xEdHBKpilGopOEgSzkwMO6ceVWaS6Dww==
X-Google-Smtp-Source: ABdhPJw7BeJcxTf63VdxTGCxY5zvx3XATnxbt0EE48rhmt6lrQo95Peti0I0JTuBLBmHCoqzalKUJeRi/RxMxBm6UYU=
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr3319211wmg.126.1641918559933; 
 Tue, 11 Jan 2022 08:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20220107083232.16256-1-wangyanan55@huawei.com>
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 16:29:08 +0000
Message-ID: <CAFEAcA8hyN0Dyav8jSkjuV7oZa9gN=db4-9-JfyHBxxMLitA0A@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] ARM virt: Support CPU cluster topology
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 wanghaibin.wang@huawei.com, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 08:32, Yanan Wang <wangyanan55@huawei.com> wrote:
>
> This v7 series enables the support for CPU cluster topology on
> ARM virt machines. The generic infrastructure for CPU cluster
> parameter has been in upstream.

> The patches in this series do:
> - Enable CPU cluster support on ARM virt machines, so that users
>   can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
>   And the 4-level topology will be described to guest kernel through
>   ACPI PPTT and DT cpu-map.
>
> Changelog:
> v6->v7:
> - dropped the introduced ARM specific build_pptt() and extend the generic one
> - added A-bs/R-bs from Andrew and Ani, thanks.
> - v6: https://patchew.org/QEMU/20220103084636.2496-1-wangyanan55@huawei.com/

Applied to target-arm.next, thanks.

(People who've been reviewing this series -- let me know if you
wanted more time for it.)

-- PMM

