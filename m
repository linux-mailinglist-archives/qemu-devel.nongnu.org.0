Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABA5F7531
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:20:32 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogias-0004z8-Kg
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogiPM-0007Zf-H5
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:08:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogiPL-0005mX-1W
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:08:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so4068406pjl.3
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xx18lHJrJa25XpeylvaXYsd+YwQwXe9Yw+bbuhBl8ys=;
 b=ktXfQ58e8A5ADWaWQBK1zfljs2h1bWl/47izBE6RZ6dEg1VlWAOf3jPZCB2RAriCui
 ld2c5kXXTNin2WpQx3JR29/oPn82JRI2bE2cXsmjmUmpo6MnRRdh+uS7d9og9En0OsWI
 E4CvkAMKKK8hPWoornQOP0HNV7UANtwV931SAfbIkx0kG6wH92ZOnVMSZiclA1HmoiEC
 yNk+3+WdFYIYB/BlN2GCwG60fwXxjyhQDvDZwv3pNWfoXGjVf2JZfi/rBLEfw2My1hkL
 iPPV0vje/Aho2t6JgUGIZpHg+mHf6CaLDY5rDd60uC9IiRKxoYeQnsAgdBEHwcwJQM4H
 /kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xx18lHJrJa25XpeylvaXYsd+YwQwXe9Yw+bbuhBl8ys=;
 b=vnfncK7h56ImM6CXhz3z8/JANcVcQJHNu8wqBN/WozmVbTwqcrqnkU4AEd0Rt6majZ
 NgHgYcNbEOABYu6h3RtXdZPeCANr3AclW+YqodaLKlmG5SZPdTN4i+g78pNRj3cRwC00
 R2RVdg3nBcd4ylY/XuN9BgyYkuZikc0slKN+n7TPqDqyll541wnuInLagiGNbY/fXHHU
 rLwm7qYTkqo3Nq+QIN/K48NH/8/mJkPjkzxSJU6e0F/CJCaUJqHgsnTb5xsy0SLkanRD
 IP3UYmoox54SBBM/MKAIO13nA8RgX3SHg0VBTVXiLG8fqVBEhL+WtcqD8yVO+Sm7qS3l
 di1A==
X-Gm-Message-State: ACrzQf15vXf+XpN4sEaHa0wpBKNS+JbGG1Mj49b1RUC7mxUNP7osq5Yj
 KEDdRfrwSdEWcd8qBwtjG0+gv1dkYbHuoSj6rBvO7A==
X-Google-Smtp-Source: AMsMyM6vFae8K4e+CC2fFHMukI1gi3YMuhcBYK4kPNnPfNiYduEyedou13y4OL3j07A6WeVVflYW+wU+q6mrRV3LUZs=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr3598554plb.60.1665130113509; Fri, 07
 Oct 2022 01:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
 <fb8c58b9-35d9-55ab-5164-a28530ba38a8@kaod.org>
In-Reply-To: <fb8c58b9-35d9-55ab-5164-a28530ba38a8@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 09:08:21 +0100
Message-ID: <CAFEAcA_UNe+3-i6T8vrRNSVWg9nO6RWGi6bF7SX0Sf9xO5k17A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/aspeed: increase Bletchley memory size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Fri, 7 Oct 2022 at 08:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 10/7/22 00:52, Patrick Williams wrote:
> > For the PVT-class hardware we have increased the memory size of
> > this device to 2 GiB.  Adjust the device model accordingly.
>
> You should add some defines similar to  :
>
>      /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
>      #if HOST_LONG_BITS =3D=3D 32
>      #define FUJI_BMC_RAM_SIZE (1 * GiB)
>      #else
>      #define FUJI_BMC_RAM_SIZE (2 * GiB)
>      #endif
>
> or are we done with 32bit hosts ?

We are not.

-- PMM

