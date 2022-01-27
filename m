Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10BD49ED4B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:17:03 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDC8c-0007GV-GQ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:17:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nDBu4-0006tq-Ba
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:02:00 -0500
Received: from [2a00:1450:4864:20::22a] (port=39574
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nDBty-0006BU-QH
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:02:00 -0500
Received: by mail-lj1-x22a.google.com with SMTP id z20so6124066ljo.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9lO1OklyoDmPOBdmBi2tJI2IFnDDbuqGS8Madrj3lE=;
 b=DQ4wpApDLOOD4jiZAr5PsCDVKBtDlbPOKQkOLp4miSg95JHGeZHfIRU5/tA4e1Wl49
 IPPIzuysTcujyXOKFAWuLWeBEDZxvE444CeBNvVhYxK2jJNkd2TrCUuJXNbEiXbahW1P
 U5jcaayf0TTHUtjWbugbsbDRJKQUE8AtJkGQaInjIB9ks2AXBGw4i0qgr3mqxH2QdHYJ
 DRrX9aeDTW9bUmkeLYhkCG1ifEN5VUNZEJJ1DJhc5xC9b3TOtI/zNJChacBKKJDFOcvu
 KH7GoybpHSBuwhlvzbR9B3X0ikI6eQR4l4QzO3Qn8pAKH7Isi317UB4CFNGRwbER+/HJ
 dNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9lO1OklyoDmPOBdmBi2tJI2IFnDDbuqGS8Madrj3lE=;
 b=qJ3+N4VUsZP8hDJytgp/730qSDPkycepZ1A06AevA49OP/vo3pgIJ7ijCZbyVClNuZ
 C7Cr3vCWL9jU6LsehHnHifU9L7Ytelbbm7aYD5sgGmuj25R537PkUPOSkui8wEBmvL6T
 yTaYufOO6Tzsk/64hhEkgQwUmtXIzE6BtVrkLbJpHU5SIEBTvNPLHFbIbLcLlujQLYsC
 5o3vZosbn/+rYJxO3qUFyCzgbk+2yWaMSq6+/CJZ0YBUG/K9N42dweBgl1hLSF28G1wo
 ms0W2+jItNQSaSKkODF4iKIyvuXKYlO76uxQ9etl14QaKh46nfnKk4nv5obqtEs2B5MQ
 Qfpg==
X-Gm-Message-State: AOAM532i/nixiXEpQNkmQNaSRU0ToOMwx9TBcFpGYEohJoIMDHl8fTgP
 tfuDU07ZjaMoEzKwg7A732dP+OP8yuSAuWZDgIqiS9NBsms=
X-Google-Smtp-Source: ABdhPJzuKGIWS2ImPQ1KCpS3M+CQLmjMoI8B9ny2fJcJ42ruZLQRgbgzJW2mFwlR+d4oBfCdFwrzBYZH6JQzci6Jk/c=
X-Received: by 2002:a17:907:2d8e:: with SMTP id
 gt14mr4292037ejc.509.1643316897297; 
 Thu, 27 Jan 2022 12:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-4-titusr@google.com>
 <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
In-Reply-To: <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 27 Jan 2022 12:54:20 -0800
Message-ID: <CAMvPwGoSXYOJnUnDz1jdKWXmGKS3wdvjZ+oV-Pdrk1Z-AXF+Ww@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/sensor: add Intersil ISL69260 device model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: f4bug@amsat.org, minyard@acm.org, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, venture@google.com, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=titusr@google.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

On Thu, 27 Jan 2022 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 Jan 2022 at 23:19, Titus Rwantare <titusr@google.com> wrote:
> >

> > +static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> > +{
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: reading from unsupported register: 0x%02x\n",
> > +                  __func__, pmdev->code);
> > +    return 0xFF;
> > +}
> > +
> > +static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> > +                              uint8_t len)
> > +{
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: write to unsupported register: 0x%02x\n",
> > +                  __func__, pmdev->code);
> > +    return 0xFF;
> > +}
>
> This device appears to have no implemented guest visible
> interface at all, and yet it has a lot of object properties.
> What's going on here ?
>
> thanks
> -- PMM

This device relies on read_byte and write_data implemented in
pmbus_device.c. Those generic implementations fall through to the
device specific implementations for registers not in the standard.
This qemu model happens not to include additional registers. However,
I must change these to LOG_UNIMP which is more appropriate to what's
going on.

Thanks,
Titus

