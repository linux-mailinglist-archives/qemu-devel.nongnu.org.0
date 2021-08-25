Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAC3F7CF9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:01:17 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIz5I-0006SE-CS
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIz4L-0005n1-2R
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:00:17 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIz4J-0003df-El
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:00:16 -0400
Received: by mail-ed1-x52a.google.com with SMTP id n11so826880edv.11
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yI/M9OJP66kwM/76V/8IBPuIU6jXvg6NVufD6YgB6kw=;
 b=W1parS4ztJaAzU6vaNo0N/VO5v0bPE8105iz3y9P/447RTVtJcmoyYw13W5voxL9T5
 IpdcO7DnS7Ik+jh8/e6PYqm/Kb7xdAldoBrH3MtUaHPZplwVmqY4waAlN4CRvpbvT/1G
 rVAN9rOaLJicjhj71LJhvMvJCkTN/+FLLcYPh3HK92sTxQ3rG/nf9SM+SHRIGOiyjddF
 X8PeTfaLXHjiKDmIHWzUE7Lyr7EUBmmtPw9YYxitXOtWM1lv4PfaOAkkfIRWqPu9WS3j
 5LzrQI79i2LmIiWHQVMNdZYfp0fow++MHYxWDzmBtSY1HbPfUZgzxYEh6NsZgzheKKQs
 AvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yI/M9OJP66kwM/76V/8IBPuIU6jXvg6NVufD6YgB6kw=;
 b=QHGmNY/rqpbu/zQuIj6svSDDbjy2ZtP7f+QmNzqgw2cbW9HXB1ediaUEHS2P1kQvmy
 qsHhMzMsO6c5g4vkSE22KOEA9FdXodRf6sq22Cbr/SkVJgwvOuVKC/GCP9tSVEUPSiDL
 YM7SRpLNloa6rvtgklp2HTqmOvWveMo+7QeVXKXgRbcSaY87A36uHtLcgcDR26yv7H4O
 L4EMXK3tq6vULSRhePnF8q9c8NlUOZOYk/QdKNMCyiJ32FEml9Dp2/n28V82fnQv7PnG
 0DuhquM54q8TQCGZQUYoSpUat0i9aYVCdm+XCWpr9wgtHh2BAkEYYpHV36AdXhu4CdBp
 ZTVA==
X-Gm-Message-State: AOAM532s1BKLOlJgBOmIl/QyEUVjTlp8CXu02LA2LywiLY4KOHMGeIDG
 WsA24wYAHTvAqSMN0FMTrqXf+4R/fcy2wxPkQZ0u2Q==
X-Google-Smtp-Source: ABdhPJwmxOcXemqcx/iHeC+5rhfR+jLJIk1g46DzXxw4IlVOobXtODT3C04tb5vYATLbftPggRgrWUZd+TJTk6AnJUY=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr299648edw.44.1629921613687;
 Wed, 25 Aug 2021 13:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
In-Reply-To: <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Aug 2021 20:59:26 +0100
Message-ID: <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 20:55, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> fdt_check_full was added in 1.4.7:
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7
>
> Only ubuntu appears to be lagging a bit behind. I wonder if they would co=
nsider an update.

I doubt it. You would need to wait until that actually falls off
our supported list. You also have a couple of years to wait until
Debian oldstable is no longer on our supported list.

thanks
-- PMM

