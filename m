Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1B4ED536
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:08:02 +0200 (CEST)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZpqb-00084c-Bb
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZpmY-0006ZD-Uw
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:03:51 -0400
Received: from [2607:f8b0:4864:20::b29] (port=47032
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZpmX-0006Uv-30
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:03:50 -0400
Received: by mail-yb1-xb29.google.com with SMTP id e81so11889647ybf.13
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q7asBfNEw0jrgB6R/dJ6xXI5wZP7y6CfrpYnlsghmqg=;
 b=A7ZeR3j+WeEzBYg2/vJV+RvpvfAF7goxje/eci7NVCm8uTnt5LJwBYvt7mPa5M83Q4
 6wTz5b3YGkokSAsjck1WMns/Un/90h+LxNXCPixA4//T/Lpc/0EHqPSJBK//zbRPPFDO
 Vxcth2IXZr83NGHAa7XALXdU0f6YL8eH5i1cc9q3krBWepk6vVl/gcUN+La46+CJwFnK
 wX0LnPIBOBRQVgDl3p6Gn+6hJMhoGQqMoUpUs9IgGIcVZTZilC82W6J2XXRbxTdoTBal
 5DC232gEu2Jg+lXJJjbBKw9ItUvR+gBfNoATVcizZ0SJ4W29kwwujc5Zzyobujx9iGu0
 wlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q7asBfNEw0jrgB6R/dJ6xXI5wZP7y6CfrpYnlsghmqg=;
 b=8R2Gpt41BjvMGQ/ojxlDIlSmc8ekCuimbiPRSULVyehtL55fTF4shkVJT//OjmQ1Xv
 BIJozSUpf8VDt0NcaM63971sN9/A1wwBAvwlCBbN2NtUBl6OIYE30AOiQH3qtpsh0wUh
 89CkbPPMXj7Gy/IIS22O+Zv5xpgc/4IZDrY2GsWOoxAGdK7CrZcBgzqdHQgxVJlexQis
 8RFj+KJVc+weoKEROyLMZqD50lBLlAgeFeY6PhQwH4hD3aBY2aCaC3WzuCuHC8iGoaDf
 49lEZtvA1iQcDZ/6jog1+rGicOAjF6G22e72JujqHv7E6GJIhmi1yovjO9c1zxDx3VtP
 9CzA==
X-Gm-Message-State: AOAM533IkZJjC/Dac0AhsFOgLDMXJ/GL85f3M3jjWQxZYstr8lUYHlQb
 OXMUu7jmkZF1WG91TltdaPm5sJUe38NRgxkuQ7hCZA==
X-Google-Smtp-Source: ABdhPJy30TEPBppyX91hmfZ0vvA8I/RnVEo8stR2fa7q86fhJT6sZ/h5XdSz0O5EQnHGROpDjpFT9c4Ua8baddyWjRw=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr3158206ybc.39.1648713826989; Thu, 31
 Mar 2022 01:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <CAFEAcA-a8BUqGGGMPexauFq-DEwSy6SQc9G9MuH=WX3P2H1a1A@mail.gmail.com>
 <CAB26zV2zZg3Nri9i4LcnCvYkX-T33Pbn2FwU6hP_LEKiab_tVA@mail.gmail.com>
In-Reply-To: <CAB26zV2zZg3Nri9i4LcnCvYkX-T33Pbn2FwU6hP_LEKiab_tVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:03:35 +0100
Message-ID: <CAFEAcA8fdebk3Z9bUbHuYKL5VCFqtu9gqbHdB4i_Umuaabqr7g@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: Will Cohen <wwcohen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 22:55, Will Cohen <wwcohen@gmail.com> wrote:
>
> On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Is it possible to do this with a meson.build check for whatever
>> host property we're relying on here rather than with a
>> "which OS is this?" ifdef ?
>
>
> To confirm -- the game plan in this case would be to do a check for something along the lines of
> config_host_data.set('CONFIG_XATTR_SIZE_MAX', cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX'))
> and using that in the corresponding ifs, right?
>
> That makes sense -- if there's no objections, I'll go this route for v2, which I can submit tomorrow.

Yeah, something like that.

Looking a bit closer at the code it looks like the handling of
XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided
value, whatever it is, on macos we use a hardcoded 64K, and on
any other host we fail to compile. The comment claims we only
need to impose a limit to avoid doing an overly large malloc,
but if that's the case this shouldn't be OS-specific. I suspect
the problem here is we're trying to impose a non-existent fixed
maximum size for something where the API on the host just doesn't
guarantee one.

But that would be a 7.1 thing to look at improving.

-- PMM

