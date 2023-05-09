Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4156FC79B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:12:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN8X-0000c7-L4; Tue, 09 May 2023 09:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN8V-0000bs-MY
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:12:11 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN8T-0005Y5-VH
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:12:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so9062789a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637927; x=1686229927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WyG5C3MIu5Xhk+l/oQE5Wy8FhM0P6J7U1YJSlfe9Jvw=;
 b=OWspDKpqx+kDAxJMUAWIGTDMrNV8p71K8zOqyaiWomA60pCakSwksRT/vostS3032v
 qgXvkxwvyiFfxVaabjou+LrkeN4E+LOv6CuYNbEf8m/YUXWOs8lPnbfRICWpNE6WtLC5
 CbGbuBNqZyP/9H6BdCvdpkVo8/wpazLnfqSZ4MdkyZlM7VwnfDT+7GWM+DZsqsNgmrDZ
 XZXORXFMm3tRNCdxNGBP9G2AWiB86rsSCGKa783XHxnTFxSF3l8JA0d2TjIdERDSFRvY
 Zi2s2oyJgrcGjIqkyFTrSSZImP3pf3Wvu9/0naVFgF4Pcwmbc9rP5D3WJv9LFKmXeqJe
 QOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637927; x=1686229927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyG5C3MIu5Xhk+l/oQE5Wy8FhM0P6J7U1YJSlfe9Jvw=;
 b=NIYCUp5j+cvrAsPz+9JxkPpxh2lq02g46Wc43HOmWPPstncC2e68m+l4YRYWHGf6vT
 roxkYVBpjit/roybl0uQA8fIrwHRHSJb3xtKyx78SofUEIvXQXLfb8Adc0AbzI9tkvji
 D4putCO6hdIOJ5ZvbevFwsBD4q4R1/QhroLx2GMkzW9kU1MgYoBkvhGVmOmsOyeTDL1a
 gx/qIuuJNoEat0RU4l9wLpdA7TN7kj29i89vK5LA1tcEuD4ZFh2PGcYI/vUXrpH6mEBC
 aaiP2q4GL4gqq6IApafHEDUooOc0ssPbjXQbGDlFesN4IQ/lo6rR3DihYc6pLjt3uOPL
 yhvw==
X-Gm-Message-State: AC+VfDzDsePqwW7iPrjS3+1KBNLBCWjzRU4IsjW/b7MM4jGd474bxYbq
 +SWPCK7ZWQq4PLG6wDymjaTZHEnJ53nHNsiilmediewhVPOsSmSE
X-Google-Smtp-Source: ACHHUZ4PwN6CE7AFUmLcBzuJU3/M7pZygpMvT3oVPQac3ASSlQHONzzATYOr5c3z/u6o0wiISX+7fAWmHEQIW0uiOeU=
X-Received: by 2002:aa7:cd84:0:b0:50c:2215:317e with SMTP id
 x4-20020aa7cd84000000b0050c2215317emr11224921edv.15.1683637927222; Tue, 09
 May 2023 06:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230502135548.2451309-1-peter.maydell@linaro.org>
 <CAMxuvayLKQAaRyZZXdgKvAJtgwRcxsFUnQ-S5yB8qBRvJrgrRg@mail.gmail.com>
In-Reply-To: <CAMxuvayLKQAaRyZZXdgKvAJtgwRcxsFUnQ-S5yB8qBRvJrgrRg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:11:56 +0100
Message-ID: <CAFEAcA8OBka2yGWpktMRyW2fNaLjg7PtPd7F=+C6EGc6uKVetw@mail.gmail.com>
Subject: Re: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Kshitij Suri <kshitij.suri@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023 at 20:36, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
>
>
> On Tue, May 2, 2023 at 5:56=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>>
>> When we take a PNG screenshot the ordering of the colour channels in
>> the data is not correct, resulting in the image having weird
>> colouring compared to the actual display.  (Specifically, on a
>> little-endian host the blue and red channels are swapped; on
>> big-endian everything is wrong.)
>>
>> This happens because the pixman idea of the pixel data and the libpng
>> idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,
>> with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits
>> 0-7.  This means that on little-endian systems the bytes in memory
>> are
>>    B G R A
>> and on big-endian systems they are
>>    A R G B
>>
>> libpng, on the other hand, thinks of pixels as being a series of
>> values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA
>> always wants bytes in the order
>>    R G B A
>>
>> This isn't the same as the pixman order for either big or little
>> endian hosts.
>>
>> The alpha channel is also unnecessary bulk in the output PNG file,
>> because there is no alpha information in a screenshot.
>>
>> To handle the endianness issue, we already define in ui/qemu-pixman.h
>> various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent
>> byte-order pixel channel formats.  So we can use PIXMAN_BE_r8g8b8 and
>> PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of
>>     R G B
>> and 3 bytes per pixel.
>>
>> (PPM format screenshots get this right; they already use the
>> PIXMAN_BE_r8g8b8 format.)
>>
>> Cc: qemu-stable@nongnu.org
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1622
>> Fixes: 9a0a119a382867 ("Added parameter to take screenshot with screendu=
mp as PNG")
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks; shall I take this via target-arm.next, or would you
prefer to take it via the UI queue (with the commit message
typo fixed) ?

-- PMM

