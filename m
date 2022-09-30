Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D525F0E7B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:12:45 +0200 (CEST)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHgy-00075D-8w
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHdc-0003bO-SE
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:09:17 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHdY-0005rl-77
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:09:13 -0400
Received: by mail-ej1-x632.google.com with SMTP id lc7so9713634ejb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=hAaHtJNIozf9FH9bn/Yb3K5QkMsMZY15DXRTddBhJwU=;
 b=SmqhjqOUAECiIIptAHkc6fGw/lTTFtAoeykoUiZfuDJFffdwAotngfisHf7n9cSG0a
 3gzDT/cn4NVhIoVlRg1ae56aFY323RhdHy4FRyJZ9EMYmo6J2Y4k98Xp8Wahq4Dmq6Yg
 pZV2DoLc7W2I74148nTAkvjmC/qgixTzIzoSOW5PDMVRDcELFgurFqiriwIuCfFPo+Fq
 3+UWNaFTizNQtjFyg0P7YeMbVoPI4WOCrBy3IKaV6HnVSpzUVjVteb8eqwFSpK5vqleo
 RsU3K8nxsaomv6+bKdtaHgVEdSjiLxSbjuwD0P7ZOj5YtbjQJ3GomcVu4ucQUr5tNDw8
 CL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hAaHtJNIozf9FH9bn/Yb3K5QkMsMZY15DXRTddBhJwU=;
 b=4KrWuxTQeVEH5n4cjOUnrRf4IKXi7QK0Q/AxTCA7vBNHHQJX7HG1llu1sbGYVJlVOz
 stCbgrgN8dQ9ozvXjS2W3GIrvHD8UWg5R+IybhgfRp0wz2N51zW5CW6F4r/1epJBkg1p
 9lHzwPFSVUncaLrr/TATm9W4GZ8dfRgcokdeAsNEnzV8GKoyMviMk5rq7sWYfGjrIXO9
 6SNXP6GKA96/t5fbmRAhTbKXDNbnR04BPPcEEdcoAoRjoKeIKibJ+07xEqyX6WbDhOeF
 UjxL6mk13Lf9AqQFVLIGriYWo40AX4MfEDp81SB1t78kPC7d1fxzVQMcCIPkbhbMgmI4
 lXgw==
X-Gm-Message-State: ACrzQf0Omo0NfUFFtsurfD7leUdnptuN/lFu2gx62WyGcNvLxeiF6yzI
 Zl8FPqQ9IDpbD09/LX/OzlN1+YJh/ceboPrIQQx+Zw==
X-Google-Smtp-Source: AMsMyM7H5/xnOjFIrX3jx9JxnfPHXV1DajGkuzr14IOVuPTaw+WBv1q+gvbB/q2Sao8FMOlyO1ScQ3xWKy6FfO6syWI=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr7029151ejc.36.1664550549518; Fri, 30
 Sep 2022 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
 <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
 <87pmfdxagx.fsf@linaro.org>
 <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
 <87leq0yklp.fsf@linaro.org>
In-Reply-To: <87leq0yklp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 16:08:57 +0100
Message-ID: <CAFEAcA9_sbe2JYjZ0OA0bqrQtsYrVM2vWpWXvrPv9OWDqR0vBg@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 30 Sept 2022 at 15:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > It can be very useful for "give me a list of all the
> > PC values where we executed an instruction", for shorter
> > test cases. You can then (given several of these) look at
> > where two runs diverge, and similar things. I use it,
> > so please don't break it :-)
>
> ack.
>
> FWIW you can also do that with:
>
>    -plugin ./contrib/plugins/libexeclog.so,ifilter=3D"instruction"
>
> and avoid having to reduce a bunch of massive logs.

Yes, but if you needed the logs anyway (for the -d cpu output,
for instance) then it's simpler to use the exec logging and filter.

thanks
-- PMM

