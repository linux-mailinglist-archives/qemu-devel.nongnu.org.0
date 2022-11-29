Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81563BDB7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxaE-0000La-Et; Tue, 29 Nov 2022 05:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ozxaC-0000LI-RA
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:11:20 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ozxaA-0004HL-Vv
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:11:20 -0500
Received: by mail-io1-xd29.google.com with SMTP id i85so9677205ioa.5
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 02:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Qp00nHmGTOm2YzDm4WmmUSjwj64zwq5yxDV4msgDVU=;
 b=jFcWfWdssf5X0VOiQA/UImhIz0SYxSD1EOyGc3gC/zdleEuOlVroxVByQJyVSb8vle
 YQq5O/kcTNUwQdC+EwmXkqY64mA2tgHU/C7bn5RGFmKpBaADDS3OiKIMeuMRtCphRTQh
 uy2VUQT2zR9eS+ssKFRROytAUpg03YIKiJb1tbEmRD7crG+sxqTFuSf1x3ZwmV8p8eIW
 epkS2Ni/2NZEy7VPFsTxRAwKqoXei1DX11JlwIeu0DVWB0C/HrSY8H7oyAlIU4rYsOiT
 jNU7dLSbi9CYwKqCQAPkLM9oVYNkGjpqA5kZx4yNOdOfFd1B1Gypb4fUY75lbpHd0W4t
 X8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Qp00nHmGTOm2YzDm4WmmUSjwj64zwq5yxDV4msgDVU=;
 b=B4Em34F6pcEy6BE4A2DpO0Byl7EWPHNT+VyyokinBEXKszDEXA18jZWdlV0+gKychZ
 lthjVh7AsjLWWBB4K6/mY1dVlL/Y+EOKvekc5X8RBnH+mxnxO0cXnbq/6JnfHKQ675qQ
 TR/GnfMSSMdyPmcJe+e2pdBwhTRl84JGICcJNAkfUfauZrqCEOVtjiTClKBU9a0cQ+qt
 YUD1X6nWK/Cn8AeqYoh26WlzVbA5bFy11Zb37qRS0ZDxq/IiAckP1cySUfZ3oenkGzc9
 7w2kUciKrc4qZ8NFIIFPSREiMT4WhxOVvch8ukixZ7IHeyY89Umd+hxHlo/yrvrunIMJ
 Sv1Q==
X-Gm-Message-State: ANoB5pmet8Cr7twm4d2YL250XaQlEiD4nWyRGo437VLroS+B+zVH5fu7
 5UW32IQsqLZh9xiLX6PxrQIIp8O8DnELxRXncvrkSQ==
X-Google-Smtp-Source: AA0mqf4wulxU5G/TyaC1jzOCdcmLzntTq7rW8fl77/Bp2xclIYTTP646GZAE0sfCUltyx0wN2/XH1F+zvsvF6XWMVMM=
X-Received: by 2002:a5d:9446:0:b0:6d3:5145:937c with SMTP id
 x6-20020a5d9446000000b006d35145937cmr25611746ior.67.1669716677318; Tue, 29
 Nov 2022 02:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
 <20221129000647-mutt-send-email-mst@kernel.org>
 <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
 <874juirvrr.fsf@pond.sub.org>
In-Reply-To: <874juirvrr.fsf@pond.sub.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 29 Nov 2022 15:41:06 +0530
Message-ID: <CAARzgwzgtP93NKdiC-p_k5LLzgY_eEruFgeGC8wOcH9AvSrwtA@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
To: Markus Armbruster <armbru@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 29, 2022 at 2:18 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Tue, Nov 29, 2022 at 10:37 AM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> >>
> >> On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
> >> >
> >> >
> >> > On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:
> >> >
> >> >     Added the SPDX license identifiers for biosbits tests.
> >> >     Also added a comment on each of the test scripts to indicate tha=
t they run
> >> >     from within the biosbits environment and hence are not subjected=
 to the
> >> >     regular
> >> >     maintenance activities for QEMU and is excluded from the depende=
ncy
> >> >     management
> >> >     challenges in the host testing environment.
> >> >
> >> >     Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> >     Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> >     Cc: Maydell Peter <peter.maydell@linaro.org>
> >> >     Cc: John Snow <jsnow@redhat.com>
> >> >     Cc: Thomas Huth <thuth@redhat.com>
> >> >     Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> >     Cc: Igor Mammedov <imammedo@redhat.com>
> >> >     Cc: Michael Tsirkin <mst@redhat.com>
> >> >     Cc: Thomas Huth <thuth@redhat.com>
> >> >     Cc: qemu-trivial@nongnu.org
> >> >     Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >> >
> >> >
> >> > Is anyone going to queue this for 7.2 given it's quite trivial?
> >>
> >> Don't see why we should bother.
> >
> > Completeness?
>
> We're about to tag -rc3.  It's too late for trivial stuff.  Anything but
> release-critical fixes would be madness at this stage.
>
> I recommend to route this via qemu-trivial into the next release.

Sounds good. I'll make sure I remind people again after the release
and before I go underground for xmas.

