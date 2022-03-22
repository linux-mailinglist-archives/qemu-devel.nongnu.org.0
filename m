Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBEF4E496F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 23:59:42 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWnTZ-0008VO-7z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 18:59:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWnSN-0007eg-7E
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 18:58:27 -0400
Received: from [2607:f8b0:4864:20::1132] (port=36207
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWnSL-0006NX-4a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 18:58:26 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e64a6b20eeso68855497b3.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Ll+C6V2DtlB0+V4lrHaOvJ3EHxG4z1BntN726QJwNo=;
 b=JvRAmQSNeKSgTgu+R2mJrPbUSSrpL5LTnxk9ZmUfPWCDqBsN2Y4ok4Sg+VSxXb9T34
 He8//derTGVJ9jMkbkmfPU5YGpU5r5Nu99Zc4ZkImao6MgwxrFBguTedOvVMhSDnH6f6
 s14VdDWnTMaRep1wZy6h7geeRzis5lAxd+Pet4EZhGBoTptrL852ozI1cJt2wMI007Ln
 Qc0Aoiqg0XM3909rPoJOecVvAZ5vBpvrqKSfUx3dnR7wbp+05c0SqLy8KMtQxGzXpGyc
 LAzOlLbE0DPV4olG6jCV/Y63e3SzVq9I7S8LCdYEwusm/UWX9ocbUcqm3l8poffDfuT7
 VbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Ll+C6V2DtlB0+V4lrHaOvJ3EHxG4z1BntN726QJwNo=;
 b=QW2L8Iiu16S0O7iFKlhp+J+ObQLz80vzy8ta+/cSWSJOrN9orUj9eiaMVZVah7Lkl6
 Ob/3haAPG+NngDyoPN0Qkd7gDENFhCxVr1pbcun1tUmI+4z0v8nhMVwFHr8JemaSkhVK
 5f2zQYSrWNkqXi4Su6EUzv5h/Atv+V1gbhOX88pQIkMlvL+eF907m0iUWwxUKoXriA6P
 JWg8oJuHFeF+F7Y0zJX/4PnoCIHa2S430bBJEDHTZ5joE1fb+EBF5l3soCk+lrlBh9DN
 AiQpPpNcE30/Rgl9xICvr4zb3uGl8P+wdO62Z/pcOLmH05BxscEk4yXAsizH4rEbdZo9
 BJ3Q==
X-Gm-Message-State: AOAM530+nXbttfwN+7yLq5QtzH5214G6IOKHVX2mRmTWdbPy0oA3JSIU
 1c+TPuzti0yRke5QkOtUzSpDGYSuvi74hpKPfSskrQ==
X-Google-Smtp-Source: ABdhPJw4TewTMHbrwi2W33W8gLvjqn/ri+EsV2+5Knxypp+fNOpDyf1ugx01hkLBCFyhL35dZiLgoM9TdleS2zPLq6E=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr32152712ywf.10.1647989904097; Tue, 22
 Mar 2022 15:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220321170320.282496-1-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 22:58:11 +0000
Message-ID: <CAFEAcA8wSSECrT4eQ2DEbTxUKd64CenoOS3Fp8O0dhLD9HNUKg@mail.gmail.com>
Subject: Re: [PULL 0/8] Fix CVE-2021-3611 and heap overflow in sdhci code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 17:03, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 2058fdbe81e2985c226a026851dd26b146d3395c:
>
>   Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu into staging (2022-03-19 11:28:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-21
>
> for you to fetch changes up to 27801168ecbb34b987d2e92a12369367bf9ac2bf:
>
>   tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz (Issue 29225) (2022-03-21 14:05:42 +0100)
>
> ----------------------------------------------------------------
> * Fix stack-overflow due to recursive DMA in intel-hda (CVE-2021-3611)
> * Fix heap overflow due to recursive DMA in sdhci code
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

