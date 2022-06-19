Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A5550B1F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 16:14:01 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2vge-0006IJ-F6
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2vdx-0005A9-NU
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 10:11:13 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2vdv-0006a2-FG
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 10:11:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z7so11796776edm.13
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A7jdiSJVtjQJm9aehAxVCzeZMALZP4eZYxrjgPANViU=;
 b=K/DxnBNm3woZCDKrR7L/dt91GSsr7K/ckQOlVg4z2aSOhO63qykOkjQwk6YPJ8nhlG
 VnoodtHXPVPb83GnRsoH3/95Ox5bcNYovYcT0O1XJ8JHG5en6nzzFP8XP069p+aMFWDq
 G8+gm3KDrXRvFHXxSxdNGW3ZjvbPLd/lnEgrNkXpN6MM1sHMf7ee9W5hBOiRFb/MhDGw
 dNujttS5Vy+IEXzpPx0bEI/TvX6hMZDmL6G9XqRHlITp9XxlzqOapvghBUy6i4spgkk4
 OKhglhMv/KhmLL/QW4LN85Ei1GRY7RGcfD6cha2g+i2kEn3qhUBd9qOa/Z1+OEgwLb7k
 WRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7jdiSJVtjQJm9aehAxVCzeZMALZP4eZYxrjgPANViU=;
 b=HMJuaNmJTe+pwIGd/7yRcOGUZiE1dOqrrPaZH8mLuLFwviecQLJJMn7w53TPd0To1D
 4UoOICDX1+31WqCK3Nx4L5Vopzl6eKWDjV88N8pXYL6qUrQYfXimiD1OrlukQkPLTs6S
 HfZ8PfGKWbPiAC71JB89aQmwKrrd1ZzoUN/hZcDbIJOyzkJ13MbzjYZp2FyjIMq69lKQ
 Kl5K1owd9nap5aYJ/T6vM/VCVwtupG7PEyYBj0x8CTGXWFhFOU2a96v7k6T5W7rUd0/D
 u7XxTbGjXxo5s9QMvx55r3IBESIMlGBk2ke+ZgGadnsFlnOeCF52xB/gXh6iF8vfqADu
 yB0g==
X-Gm-Message-State: AJIora/sNABy/CRlpp2GDIH2I5miNwA6D94WEbAZryOay7E5xZEfw+MP
 q1RvasqAHlrvvsY7pRF/QcI+ruddSYxuu9icktlUNQwLpNkx9PST
X-Google-Smtp-Source: AGRyM1uhybBmwEaJUWvGjBH0iZabxukCOKRofLJPKWAuoJCb6A2wCRypdeTURhT0warha6sDqX8hWP7lGSGTj+VW3+E=
X-Received: by 2002:a05:6402:2987:b0:434:ef34:6617 with SMTP id
 eq7-20020a056402298700b00434ef346617mr23824964edb.176.1655647869133; Sun, 19
 Jun 2022 07:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwxLQt13Ago2jDSr4oqkrP0DHzjO8HP_wotwxnmi-=Wdmw@mail.gmail.com>
 <CAARzgwzxOj=WKMhnMR7Xdgj0MGBRaO89zbc2FWV4j7+UU7j+Fw@mail.gmail.com>
In-Reply-To: <CAARzgwzxOj=WKMhnMR7Xdgj0MGBRaO89zbc2FWV4j7+UU7j+Fw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 19 Jun 2022 19:40:57 +0530
Message-ID: <CAARzgwyU81MA-GNg66G37FNEiBvSQYhZT4BPy5KD=Se=dfoXQw@mail.gmail.com>
Subject: Re: A new qemu acpi test with bios bits
To: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 17, 2022 at 10:44 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> oops, Phil's redhat email bounced!
>
> On Fri, Jun 17, 2022 at 10:41 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > Hi :
> > I am trying to write a new ACPI/smbios test framework that uses bios
> > bits (https://biosbits.org/ ).
> > This test will effectively:
> > (a) use a pre-built bits software zip file kept somewhere (where to
> > keep is TBD).
> > (b) unzip it.
> > (c) add a python based acpi and smbios test script to the unzipped
> > bits directory.
> > (d) make an iso out of the directory.
> > (e) spawn a qemu instance with the iso. The iso is built such that it
> > runs the acpi/smbios tests in batch mode. After running the test, the
> > spawned instance is killed automatically (vm shutdown).
> > (f) Collect the logs the vm has sent out.
> > (g) look for test failures.
> >
> > My question is, what framework would be best to achieve the above?

Never mind. docs/devel/testing.rst talks about QEMUMachine which seems
to be exactly what I want to use for this relatively simple test.

I
> > looked around and it seems closest to the avocado based integration
> > tests. I do not think it is qtest and qtest backend is not required
> > here.
> >
> > Suggestions welcome.
> > Thanks
> > ani

