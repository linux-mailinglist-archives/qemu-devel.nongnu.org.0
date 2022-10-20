Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442776063BA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:01:40 +0200 (CEST)
Received: from localhost ([::1]:45704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX2i-0003dG-Ey
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:01:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWxL-0003bh-7n
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUsg-0001qd-RU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:42:42 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUsR-0002PO-DA
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:42:38 -0400
Received: by mail-io1-xd31.google.com with SMTP id i65so17072293ioa.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pjxyPA5BTz8q2tLawzk0eVqCDGXHqa6P6ePOnkZ8r5Q=;
 b=JGTt3Q9z4KPaAdqXTRuQau5JsX8x6qt8HOIKzmiwnunI9OTBm86JyVQOSjN69L2Jdk
 haLU6GbDAAtP5P6n6KsdVIbWb4WuTWrQQC5r6TUiWg1VTLPeiNdrUC69LIH/GzXku4Wi
 UJd446lojl11vJw+PWgHLXTJT2PLS5ed7hqlXgpHGB/CBhVszWbeaBcAJEklY/yErgV8
 K8cxyBGIFg64Q6sx3W72a9S3K6BG3l0yktn2Ndqzzt8lNnBN8QsO326at/EU6c8ta5Q1
 Q+A0nDPAQLc2qw7N59ZgHUzcuAZ3DjtkVNKrzd367BTY7kwVHL22OOVEhLOsPvQxeeYC
 OBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pjxyPA5BTz8q2tLawzk0eVqCDGXHqa6P6ePOnkZ8r5Q=;
 b=LVCxndXpSZZsYQbHWoKglys5rTOanRPmdkgoPLloxAXvNWJHf0wofjTOJoiBjZ/n0f
 9qQDMuSOIWYNIlG0ZgUvs5BT9eIBra1Hs5Oe113/j7RMFVAlOTHb8O8GgZLwOvc/AjxF
 AmJpwD63exPdiKVhwnLSWLZCZ0gS9/LGs1lYrc5e7lPoxV7mVV/y46BSZPkVrK71UBkb
 gv5WAwo1j449KG4Q+7f//QypD8AsYFZd/FSIxdgwmR338lXuInyt617be5+bSOzDJlRx
 837mTdgoHXbNf+JcjNLDptqSurDSQ/P6yPvzIicsHpkqgMTmlQlFpNRnNudZUV/5lRD1
 gjrA==
X-Gm-Message-State: ACrzQf2BAuJF6UNF0C8HYBps95mzTO8PYDBqCBJ8JjGt+S4nMK+PAiW7
 GX2OnX2VIABaeEqBnlHcFTiuJ4TUhjXi7I5V4qgB5A==
X-Google-Smtp-Source: AMsMyM41ZEHrHjldhgT5AmOl52b38XUpeaqBfzU7vpe1XIDs7IoS9JH9E3Sj+iNoamkrWI9Ts6uW9rtQYzEztn/LNmI=
X-Received: by 2002:a05:6638:168a:b0:364:77b:6e54 with SMTP id
 f10-20020a056638168a00b00364077b6e54mr10476832jat.261.1666269741017; Thu, 20
 Oct 2022 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221020083810-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 20 Oct 2022 18:12:10 +0530
Message-ID: <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> >
> >
> > Changelog:
> > v6:
> >   - skip test when dependencies (xorriso for example) are not installed.
> >   - skip test when run on a platform other than x86_64.
>
> Hmm why is that btw?

The bits binaries that generate the iso (grub-mkrescue etc) are built
for and are known to work only on x86_64 platform. They might also
work on amd64 but I do not have one at my disposal at the moment to
check.
On other platforms, for example 32 bit x86 and non-x86, those binaries
will likely not work. The test will fail.

