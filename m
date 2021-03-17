Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688A33EF60
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:19:28 +0100 (CET)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUD1-0003I4-1E
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMUAJ-0001zA-U4
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:16:39 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMUAF-0005gF-TH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:16:39 -0400
Received: by mail-ej1-x62f.google.com with SMTP id si25so1963079ejb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=es7tqjAjc3yy1fQgNHIUVIxC/kg/B7buB6so44ylVHc=;
 b=TZuAL8uU+/Vx0iFCL7NysKVupw+vipvSTDT/ktNyzv8a22dJ5T8MDaqGbsqhpTOxBy
 Vu9U3rVYNA6hdKbJKftiyIjO4Efn/6ac8eIcvj5N6ZAdNhVEXFcrYdtbD768P5MN+3Oo
 opKtoMKZBLK1/fZN5PMocCbnO0R9/tSoY9uK8ge7Fp5NHuvdtRACywLVD7mGE75GLT1r
 Lg8HN3jd0JzPvYi6DkIJhy6vigt0lr5eM0nOSp5QreFBccs1DxGmNMyH1GHrvz6hiGUR
 boMgSsspU/BzgvfE4SxV2zHWGjvEG+7b+nw/LLW5JiOxSGDhffna5aT9daCKZP6sFNxE
 D5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=es7tqjAjc3yy1fQgNHIUVIxC/kg/B7buB6so44ylVHc=;
 b=FH3KjyfXjv76BA/712StN9L7LbW4PkplIN2b3DdGwUQuuANCpDIFTppIDyBR9l3b9R
 86ik017MscKQgVXZ2FWarzS3Uwhltmz5hip8O/UD9Zv0t1B9qsviT+mcqFFcznaYzUAE
 wUznkeAIyYEm0gq9BQD794Nm1d3dOL4sESRr+WqbSbY45JXp4WPTFhL9Gt73lmY8apev
 p5v78ai9QKWl3ILnyNfTS6dyOP4oLmfRZeJpluJ5noiWRnvVpCZ+kLDW4nRvXDr4JTnu
 VKm2Z0LwkU3ZjC5UewSNjV/0/0trIHdCdIVE0IWjMSvgpCMTy5abvdvRobL7dOs/RuG8
 DR+Q==
X-Gm-Message-State: AOAM531Tfw9afxx/T2ETnUXdi0tSuTrj0yRSv8JkCRTl1ahMG4qGWXuI
 ffekoFdMu2Zc/g4OpEr9+FYSoughSHHT1NpMQmANbQ==
X-Google-Smtp-Source: ABdhPJy0eKIfQnaFA8Gamqw9EXn8p+RqlIZmdj7vvprhIj/+LHs/4mQbI1sFNV1l9Xb9Yd7McTtk1SD1QMcy/SpqxGY=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr24552749ejc.407.1615979793236; 
 Wed, 17 Mar 2021 04:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
In-Reply-To: <20210317110512.583747-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 11:16:22 +0000
Message-ID: <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 11:09, Thomas Huth <thuth@redhat.com> wrote:
>
> FreeBSD version 12.1 is out of service now, and the task in the
> Cirrus-CI is failing. Update to 12.2 to get it working again.
> Unfortunately, there is a bug in libtasn1 that triggers with the
> new version of Clang that is used there (see this thread for details:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
> so we have to disable gnutls for now to make it work again. We can
> enable it later again once libtasn1 has been fixed in FreeBSD.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Is it feasible to make configure check for "is libtasn1 broken"?
I guess since it only shows up as "when you try to use it
it fails" that would be a runtime check rather than compile
time, which isn't really possible :-(

thanks
-- PMM

