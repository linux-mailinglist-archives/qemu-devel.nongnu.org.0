Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8B3075D2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:19:18 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Ga-0006hX-UR
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56DO-0004cs-TS
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:15:58 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56DN-0000Bb-1q
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:15:58 -0500
Received: by mail-ed1-x534.google.com with SMTP id z22so6332446edb.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TKTVapPXOfPu3XoiVF5mO8KC0MphBSO3/bI0aorMu/w=;
 b=FWQTVpsYA5GHyeSTxzHgmnpE7zJnCGOHX8AlgTGfBxpk6LuIBOT63kOI+mS9odbrk3
 2hwj+acnbY5Lb+n1Y/eXQIsUlrDhhTz8n3Qw21Qr4oowZNjTLwAxXiOJUt38mhuVbzUo
 adK20WWpf5PkZqu6BxQRQxAmnUUGqSAcPx57Qps2OYCfY6vzDA3pylSocDon6siBaz9r
 WOvlFjmUJL+GVqZvuxw8G0wY3i3454+MpoCLaptgvhzAGjBTriuEOEKymGwirWwosWYk
 zRO9sywIIdxGBp68CZvarWzH3UJVRkwBBlNfi1/HjLsj5XttYXGvt3RE8OZBioWAjrYp
 A1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TKTVapPXOfPu3XoiVF5mO8KC0MphBSO3/bI0aorMu/w=;
 b=AHnJOefjCEKzxa4dzvQVtti0p2iqsWjusKCf3HpyLzDD2OZDjaLb4fdYBt7DLYmBUi
 jac9tWL+wVBxbB1iRqbuSsio7Ox7PPRwOS3zhvWkrnLMq1mQA+Aap4x1/GZGB7GQOu1+
 UPEv4YInxoUSyPdWxt7qwFXUMAsnf/KnPu4TnvJn7NR/iwnPvxtSrTp455Xg95NAhnLS
 YZuah/QWTe0TGb5JHVot9iDiCGKlcXvvqSURM1F9Rit0jNTAPa5cZ6TuGg7gYEa4VnGP
 EDLW4dHNXewiJv4Vzdv42SwBRnwvLHL31VIOyly4/4a4LkgT8yRV9dGcL1A4E2B6lKwf
 PiCg==
X-Gm-Message-State: AOAM531eGAi8kSKN09kVDy6M1KfMbWlAkb6nWiW+fQ7gfrZYtQ6VgE3j
 mcut8uNrEaaAOaHxXL5+GX4LE2aabBhAOD3QXiHeCnc6oKU=
X-Google-Smtp-Source: ABdhPJw/qbnizhpIdR3uhwudC/fkfYYA9xvqtRAQpLLbZRdyJB6riM06QoqsySlTx/jLBdk81gUgCYWMfl0O1iGvAH4=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr13426042edu.251.1611836155537; 
 Thu, 28 Jan 2021 04:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20210126155846.17109-1-peter.maydell@linaro.org>
 <b61b0309-e5b5-0fb7-ab23-85da66518692@redhat.com>
In-Reply-To: <b61b0309-e5b5-0fb7-ab23-85da66518692@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:15:44 +0000
Message-ID: <CAFEAcA_5_LSQsCEVqP5Be65KRE2PQE9DVczmC888aMJU7JRViA@mail.gmail.com>
Subject: Re: [PATCH] configure: Move preadv check to meson.build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 21:49, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/26/21 4:58 PM, Peter Maydell wrote:
> > Move the preadv availability check to meson.build.  This is what we
> > want to be doing for host-OS-feature-checks anyway, but it also fixes
> > a problem with building for macOS with the most recent XCode SDK on a
> > Catalina host.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks; I'll take this via target-arm.next just for convenience's sake.

-- PMM

