Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581633C1955
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:42:49 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Yz2-0006hj-Az
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1YAy-0007JB-H9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:51:04 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1YAw-0004wX-Qv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:51:04 -0400
Received: by mail-ej1-x636.google.com with SMTP id he13so11072874ejc.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUdkyYrlg8/a/xLJok45F2pvWT3yq67JYhRZAWR4e60=;
 b=VfQcEZ5EDc8L2kQtWKgIznNE4CewZ5Oo5PvT/5QO4MEJvgVxOjYIdR30J9K8GxPdA0
 zm9DHpjPZdPZi2KdP7fASPU06kyGi+7t6BhryeAggSI94X4ikA+bKxQghoGd+iIZZtks
 7CCsd6Z28x6MG14ekjIVAwPEQz+0oBhyjyWV4LpXnF0abrRKY9cfnd8OqyACiGM1Bs1I
 6cF8xsDJ33OsKKB9ntk+ZRE5ANEb9aYJsY5Rae2OAEosgseBuN7xIErIOGQQSzieQofZ
 tsbKzyUeNqq1VgQqSnfHOwLWvEtFkVVG8unHXFKYaWIHGr7YhKaLr3YrX9zurJSiuG1T
 1qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUdkyYrlg8/a/xLJok45F2pvWT3yq67JYhRZAWR4e60=;
 b=UYHbfYVPRNf9ewTgIDPM6myAVxzzCr1TvX81OOY5iVDRdLgc6wkSgvxf/+MCY+wu5e
 F/6tE3/j09+gjBb8BHONjGkoiyV10Sy0ogpVkg7tAxx0iD53VYGnOl/pwspHnVEc3HoB
 YTSKJdvIv5R3izDhhg8pQVt8d/z2AAVX3KgepRXERPv0n6ibXc78BqMrY6HF2cZLiXze
 cD1ypDrNF3DhFaula5LOTTEe4bY2hEyb73UaeRpjS/7QWB60Ba+pApRAFRY0E9gdVBSK
 oVqv8AmWHDqrHXTEELjeOiCuF/HawvDailbuD74k+rKhuN5d8OcFwDdKUGJgNsK9HblF
 urBg==
X-Gm-Message-State: AOAM5326Wk+VXxen+3dFOrDiKMhxhIquuf+7m5FSnmLZaEcPz7w5UKfh
 aOzFz9upFndwFth8I1axEMleD+rNnwYeHFbGds6aYA==
X-Google-Smtp-Source: ABdhPJwD0kl6vxXhFVZRcOUc0g0C1xE/T17hK9hGQaXjP7KKzQRHHUoGpkOa3d1ijQzIK/iDDS3wcIxDy61hNFWvkf0=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr31875197ejc.4.1625766660311; 
 Thu, 08 Jul 2021 10:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
In-Reply-To: <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 18:50:21 +0100
Message-ID: <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 17:28, Programmingkid <programmingkidx@gmail.com> wrote:
> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it requires a
> picture file to be found in a certain path. My original code used QEMU's
> icon to obtain a picture. The reason why the picture in the About dialog
> stopped appearing was because of the move to the meson build system.
> A new patch has just been committed that fixes the missing icon issue.
> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes the
> missing picture issue in the About dialog.

If the icon is the same (same resolution, etc) then just using it
does seem better than loading it off the filesystem. But we should
also sort out why get_relocated_path() isn't working, because if QEMU.
can't load files that way then other things will also be broken I think.

-- PMM

