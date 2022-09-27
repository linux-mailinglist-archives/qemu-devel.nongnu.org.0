Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E05EC982
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:30:20 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDTM-0002Hm-CH
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odBz8-0002Iv-2l
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:54:58 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odBz6-0005nK-6z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:54:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id a26so21296103ejc.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p5tVGLL36grSyP4MJvz/C34dLKEr2z7PMxdoFexrzHw=;
 b=ZfqfTOIUniwIOCw6KDbtBBnheQr6IkH814AEpax/80avo8RZl9SBnxxbF8IP5hd91P
 F+8HNgSgHnD6C7/OV/gpRKQ+CeTJJB6wMFfrYSJRCR/CtWVJqeQ6C1j8RognjRtqk5Z3
 ruDdZd3aKEBamNQKK/+wXNBByHzXWSr5jqRQHGYtsgtG1Ql0WoCrm2jjVoDwzrFYKX9i
 /lX5ZU6vFAri2lAtptTcITXUEf9VfvCzpb/as+y3kEm+mWPnXt7eCXQ1Mw35o0Uej9P7
 TD1d4f3YV++MkWWmugb6xcy6cKDp4WwnMzor868mOiSTE0s53UWlJa7z5Z/aAO1gsudZ
 mzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p5tVGLL36grSyP4MJvz/C34dLKEr2z7PMxdoFexrzHw=;
 b=YhFzn/XzutIuP8sxW2i+jlVsfGqUYPOiQstrMjoUIc8Y2G9e6LQbrVoKSx7vajmyXz
 ksrWujQc7PtOdPIuvAZ5Hugtu+XAPRAaD7HXKo5uYe6ACH0esT0p0xTxqWrNp+L98jIt
 RDYv7QZWUjn8yoE9wouJSVLCdT78XIIHDf3gI6sjkMR9IMr15m+ZbCXa0al2ctFcAUFT
 7tUizB4h8iXILc6GfaCIFO3tT1ZFX4iMkfF01fEKYXUAUyauj/xk5E9JwWHnZpL2/8aE
 /0Sy86SLsKVI2qKrXAFRVL8nDLesLSeiHWaUO+JTzkr6oxGLwhjjHdibsi6ShrSfpl/v
 om3A==
X-Gm-Message-State: ACrzQf3vO3JqavhMXKiDXbwwbEbLJAR/yOpLRAu0X7E4w3HA34bJ1YKV
 HDhBGKmJdRBtPFpmiZxRu/XK2KXPNRtSo6zLHH3UhQ==
X-Google-Smtp-Source: AMsMyM7ZuskS8nSs6REV5JKeJaHzemjqwpaw6+64BqDl0durw++sjJ50qGliQ6HO6FrDJ2xIOYws5dBImkJXTNMmY6U=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr19027078ejc.659.1664290493950; Tue, 27
 Sep 2022 07:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220927131347.170051-1-pbonzini@redhat.com>
In-Reply-To: <20220927131347.170051-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 15:54:42 +0100
Message-ID: <CAFEAcA8ygLqNYVCurKRyTGqSrbQaPL=jOEm29R7JHf2rj=bAQA@mail.gmail.com>
Subject: Re: [PATCH] update Linux headers to 6.0
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, cohuck@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 15:53, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The big change that comes in here is that several structs have been
> switched to flexible array members.  This is compatible with
> QEMU's use of this structs in constructs such as:
>
>     struct {
>         struct kvm_msrs info;
>         struct kvm_msr_entry entries[1];
>     } msr_data = {
>         .info.nmsrs = 1,
>         .entries[0].index = index,
>     };

This won't build on clang -- see the patchset
https://patchew.org/QEMU/20220915091035.3897-1-chenyi.qiang@intel.com/
which includes an initial patch to disable that warning first.

-- PMM

