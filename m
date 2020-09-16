Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07126C1EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 12:58:44 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIV99-0002fv-Rk
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 06:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIV7t-0001j3-IN
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 06:57:25 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIV7r-0000t9-Pv
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 06:57:25 -0400
Received: by mail-wm1-x341.google.com with SMTP id z9so2521263wmk.1
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXFr3apjMDjpSl0jxE5ha3dcqTlRr4S4QPldxzvw1uo=;
 b=SLB/JdkSV/EGlP0+Z7vUFvrNMW7iHhVg9tYVO4J1i74Q1X68jxsMKAjubMTbbMuAnl
 jo9IxtNF8I0FlM5yRXcpnxnBKgzQ/vJ6WBXQitwX/HWnjn9QHU3yeIKd0o8IrMHT4Iyv
 u9m4asbSvKIlubRcobpJJ0WLfubBVGpSjC9fHWa+JUZjOL3rfVG945ETD/rhgT0WUnj4
 Mtu2HY0LIP56frPbzlfOs0too4acHJUhTJJTlN+tDyzvn2JsEWeXVFJeFUA3OwR3kmQV
 4hEtgiBp9/HfumyR7rH8vDlhzFjXy/xU07bOsl/VJqkIA0Z4U5cYTeN0eCstO+w8ffXB
 ntlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXFr3apjMDjpSl0jxE5ha3dcqTlRr4S4QPldxzvw1uo=;
 b=PQFh8H84+fwZtcZMVlK79gcILqJVRq2drDLxslyqQLSxzbKPhb9u5FTfrLjvwDOooJ
 WIKBPRLaCxI4Gpz8wh4IMRL1YpeekVw3Naj+Qo5WgZoxq+vEXhWC3C7SDgxJZlU2S4h3
 prhwSo5rgy/WNbFyXNJxrrnHVyoYyc8sqoUljO0vDQwO8prlYS5hXiyGUFLdrEKcc2hm
 GlLKpG3oAyjKwnLZ2i4uf5Xv0H1OIp7gNBb4AxSzASzPDbg+Lxzxp1zY454SvDZMlT3n
 YQg2wUJ8SgQEoMJ6BxhWpeJd0oeABfBnvLnbdvu5oU7NXYjAcJfJ60RY2wrfIa7sO6HH
 7TDA==
X-Gm-Message-State: AOAM533hKzTrJIDKy5h7HS/Vnxx4UiKLbFmv/BwC0hcetsUaqR46okBX
 LV93CiI3esugHAz3GBwtzN4B7YkwCnU0Y0DQPkjMBw==
X-Google-Smtp-Source: ABdhPJwpdvmptt1/4yw4p5DEay20AGnfVFmmmF8gTunGMB0qDg5VAWk+UsYCDDjtK8I7/rtpuCKI3Z4m/E/62OknuII=
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr4079536wmf.20.1600253842052; 
 Wed, 16 Sep 2020 03:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200916061335.14045-1-ani@anisinha.ca>
 <20200916061335.14045-11-ani@anisinha.ca>
 <3be8a75b-d1be-16a2-9ed4-a26674cde0e7@redhat.com>
In-Reply-To: <3be8a75b-d1be-16a2-9ed4-a26674cde0e7@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Sep 2020 16:27:10 +0530
Message-ID: <CAARzgwyjB2YxNAKMNc+rfVRwdtH7goxkiJPKqD21cnWZrgS3pA@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/acpi: unit test exercizing hotplug off for
 pci root bus & bridge in i440fx
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::341;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 16, 2020 at 1:11 PM Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> On 16/09/2020 08.13, Ani Sinha wrote:
> > This change adds a unit test to exercize the case when hotplug is disabled both for
>
> exercize ==> exercise
> (also in the subject, please)
>
> [...]> diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> > index 7632cfe1be..4c834474ad 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -768,6 +768,21 @@ static void test_acpi_piix4_bridge_hotplug(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_piix4_bridge_root_hotplug(void)
> > +{
> > +    test_data data;
> > +
> > +    memset(&data, 0, sizeof(data));
> > +    data.machine = MACHINE_PC;
> > +    data.variant = ".hpbrroot";
>
> You could use:
>
>     test data = {
>         .machine = MACHINE_PC;
>         .variant = ".hpbrroot";
>     };
>
> ... then you don't need the memset() call anymore.

It seems the tests which initialize data that way are the ones which
have more test attributes to set in data. Most tests does a memset. So
I will leave the memset as is for now.

>
>   Thomas
>

