Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643664D07D8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:44:09 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJH5-00052D-TI
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ4e-00017K-QV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:31:16 -0500
Received: from [2a00:1450:4864:20::636] (port=39579
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ4d-0008Em-Az
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:31:16 -0500
Received: by mail-ej1-x636.google.com with SMTP id dr20so34186712ejc.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+VBjgqfAmm5FqntNoXnZ0xJrYlHgIcSItu6rjEPK8fw=;
 b=ePZCBKRSDeJf3B01MUXTxHy8A5j2SyQ3XlE7Ua62M6l7NxWzg82ElV6GjhFXeEsOzt
 ojkVX/nbEsl4yYI9mVYZ6oQDYgcqQCffRqUokqFhod+f0N3ln8IXKKxv/1GQAifhDtrE
 7DooeEqim6sZiYbGzQB4JjMMp8feSN024Ri5G8WZen4djqlELOgV7A2HzXs8sDIcZt54
 ZTUNHLd9ME/R4PjNo2pfpEXGnrs8xclK0dxA2oGnNUHRpLL4h26QewO4ehZbYH31HV5X
 55S9/80NthwH6kkFcxOIIPeE6mGluRNt2QPZFztqRskwLHHUnK73ulTkqYQplqJscV/M
 5V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+VBjgqfAmm5FqntNoXnZ0xJrYlHgIcSItu6rjEPK8fw=;
 b=3U/2ucCSBy2n7euCpAiCKJ26xasHz/ji6O2T/G1NeVd/eG1YoTSIXwxaQMH5IZY7t4
 DcFSZTazAMYrgZ3wXMw1zSosgBrFPM1HG8Oq/z5Nrg/uDR2lcg32mDtFJrGb2k8fI17B
 69n0cfyJohafWjUW5Y2cJUkuYqFyECMKLCLfxAYM48xBEexYqrRYvn9PkG4DjYCEWDIR
 WUFZhKcFd6Xd6VysGGlpBnjg6kcdOhozGjrKKzC68StNsUYCNMAMDSI7i3JDeTM8n6om
 JabTY1tWIToL5582nqnkEdnxSmMv6D56NyFK+pmTUolN1Ma628SxoAmzDmD0bMo+Dw6P
 7GPA==
X-Gm-Message-State: AOAM530527rrtrFzl1ubRC3fTt94mmxj6ZJMlsI2mJRzYPupLlFlcAR7
 rZAmVFY0RQV8GnJW3m4ZHUFEpa4vof2xCEYymnor8g==
X-Google-Smtp-Source: ABdhPJyh4O3FcH/U+aTx6JLnj+z/pDNXHhfUgK4HRVw4OuUt16wQ6OmcspGmFfHseyOhzIeiwhMe0vQ+s3VYtuSUdKw=
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr10112701ejb.749.1646681473825; Mon, 07
 Mar 2022 11:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-4-titusr@google.com>
 <96a31b84-3479-ef79-1d1d-b7515dc3f0f6@gmail.com>
In-Reply-To: <96a31b84-3479-ef79-1d1d-b7515dc3f0f6@gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 7 Mar 2022 11:31:00 -0800
Message-ID: <CAMvPwGqKfVMNpUt9wONm2GvasAHWw5mnYEoR94s-fdws8WAZ+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] hw/i2c: pmbus: add PEC unsupported warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Corey Minyard <minyard@acm.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, venture@google.com, 
 peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=titusr@google.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Yes, fixed.

On Fri, 4 Mar 2022 at 16:02, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 2/3/22 02:50, Titus Rwantare wrote:
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/i2c/pmbus_device.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> > index 93c746bab3..6eeb0731d7 100644
> > --- a/hw/i2c/pmbus_device.c
> > +++ b/hw/i2c/pmbus_device.c
> > @@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd=
)
> >
> >       case PMBUS_CAPABILITY:
> >           pmbus_send8(pmdev, pmdev->capability);
> > +        if (pmdev->capability & BIT(7)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
>
> That would be LOG_UNIMP?
>
> > +                          "%s: PEC is enabled but not yet supported.\n=
",
> > +                          __func__);
> > +        }
> >           break;
> >
> >       case PMBUS_VOUT_MODE:                 /* R/W byte */
>

