Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D6574F4C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:37:10 +0200 (CEST)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz1h-0002oT-OI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByq0-0004FM-59
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:25:04 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBypv-0000Er-Fe
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:25:03 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y195so3258554yby.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aipFfxuSGHTprqSgKZTFQgdoeu77ZawRtLMvcQQYko=;
 b=ocVvAcZpnQa/LhwqpRc9Kn3oOAYPxiGViB9+bGHYUYyCcYPXLqasyrohqjr2dunYgM
 AvFsJQRPpaPDsfFZVkTlvEWvK76GzaHF4MUSJdaFzRsY7oCxzNmngOTSyhTaWdFRokL/
 cnZs8lYbAg3504HGrxcIc4vYvK78UTigIbmF8PyoCG+6hCWmr+c3Fhh6V8h8vvMptxn1
 sHNO1GvfGk0ZO2/5KD5P5VHzKRRcm5+J8pfh9RDQZ/3odhwXtX70o8ngXwmRedRGfdJa
 PxyD/q4kX902HtHbpfFdk8/WxWwJm5p2TvRDvnZacQkkHQR9Nvo5LK6BbxpyfOLAWqGZ
 CToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aipFfxuSGHTprqSgKZTFQgdoeu77ZawRtLMvcQQYko=;
 b=FNvQ/fDSItXQqnQBLDRhReVp1n1wYEEFOgq71xi3BhsJc5B7DC5uKHzTConpvSFL3f
 G6c8U2UFsEfahTZjtewpk2EhFV6nUIBJuxKmMN+Q6zqB7ttOs1PN98gaJJ4/B/sLN+dE
 Cj5eQBndNInTA1rfDBfUCXy5Y/DxAZ198s/2FTuNxUV0aOGwC4Vxxfm9np9IKb/JjKLp
 LVtvIU9BRETtrXLJyoj9JI8hPdOqq0EYtFitxENyQRLFPAdxCX6upT37ySK6l9TKA1mt
 q1e3g0mDS9MyKdG9u0e4+LqNLTh6oSq5kFqcCgEx6GsXwBaqCJY5TSGNn0D2cjsclWxc
 5zZw==
X-Gm-Message-State: AJIora9Vz94SUMvIbQE+RiXkhsbIrpQ5j+E4VsK56+DNIZDN+9ug7FwC
 zdsukl06EJfXA9ZFLwn60eEufF9PhRX8mw3H7Uaw5Q==
X-Google-Smtp-Source: AGRyM1vRPAGHV5oI9SIYVzqO8BXvGHbtA8h2DL5LL6MaHISeB4cfrC4j/6gaKEtsuVwg1bTUmj6gW7qyCcgJ5DXNC5A=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr8349339ybf.67.1657805096872; Thu, 14
 Jul 2022 06:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220711044032-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 14:24:18 +0100
Message-ID: <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, thuth@redhat.com, 
 berrange@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, 
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > Changelog:
> > v2:
> >  - a new class of python based tests introduced that is separate from avocado
> >    tests or qtests. Can be run by using "make check-pytest".
> >  - acpi biosbits tests are the first tests to use pytest environment.
> >  - bios bits tests now download the bits binary archives from a remote
> >    repository if they are not found locally. The test skips if download
> >    fails.
> >  - A new environment variable is introduced that can be passed by the tester
> >    to specify the location of the bits archives locally. test skips if the
> >    bits binaries are not found in that location.
> >  - if pip install of python module fails for whatever reaoson, the test skips.
> >  - misc code fixes including spell check of the README doc. README has been
> >    updated as well.
> >  - addition of SPDX license headers to bits test files.
> >  - update MAINTAINERS to reflect the new pytest test class.
> >
> > For biosbits repo:
> >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> >    The build script generates the zip archive and tarball used by the test.
>
> So far so good, I think it's ok for a start. It's probably a good idea
> to host the source on qemu.org. Peter - any objection to this?

Dan was looking at v1 from the point of view of how we handle the
guest binary blobs for these tests -- I'd rather defer to him rather
than taking the time to get up to speed on the issue myself.

thanks
-- PMM

