Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726A6063E4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:10:52 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXC4-0001wx-G3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:10:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWuM-0000CE-5l
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olV0N-0007FL-0G
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:50:40 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olV0K-0004g9-Tf
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:50:34 -0400
Received: by mail-io1-xd36.google.com with SMTP id 137so17036362iou.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/CX3r8KjBVYPSjkMtuL76RaBsJZ0CRLSmZWoprDQeUk=;
 b=fV2cdlCTNkgJma0Q6+NFR5nthAcjsbtRPxEXsIUzovTNJFxLkfNpaIVaz5jIjFto8W
 St+toB4+SFqHJ/HfYcj7MlxeSI5Xjl3IXNLMH1WyiCGDkUmJQcSi9uFmRCtGlp05/rCL
 enaNahiIm+GJYL6QVdB/Z46KuZMKi2Cs22HQ7iQIzBvu/WH0Iqy7K1XkOhjasObSyWd9
 WDmIRnMkqNMovfr4c+NRoLFmJszE3D1MMFyNW5CwfZW6tT0Ph0hPtyoz0CnqnXOUM9oY
 rxU33ITW9NmMUeBm4mtC2mliNk+1iWF++0+4Ex6kAC8NKzmX75IbRMXRNfWNXPA4OOb5
 5P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CX3r8KjBVYPSjkMtuL76RaBsJZ0CRLSmZWoprDQeUk=;
 b=uEdO/6L0hbU/88boa6B2YL3yzqg0HGvZ/GarFFR13GZivR+lTFBYSa5U7rtpwLGwLE
 zPVediq4M4VZCjUUh9q7rV57KY3TyYrDfQqmYaCZjzVX2nlyB8Or7380cfzeYYIjAHmI
 XqHqSXXzVM9xbOONdlWKv3ggUY0sVY1hYrAo3QNeLWPHlKeJpWjQpa0OhFdCZtzLdeLn
 +QqtVZZT2hahEDKC4MtJAaFyx8e6g1CxZhTmieox24nhxzZ0Z4bEU+pMVON7Ehm/lNNR
 4qt4SJOUei1KR7OTWUDO8do1InKue+CTJp9gk/sq+8xTBpsCA4R/ikCSPY8Xq+qSL93j
 vOQw==
X-Gm-Message-State: ACrzQf3IWqPjM6tg/9T+7WPupire550uGYsytVT8APoOo24CPwKPz/Cq
 u+c1HV9DHbi8if6MOUQAcJkTzX4HZ3AIi+6XTlYqmg==
X-Google-Smtp-Source: AMsMyM7q4QlUyWUJenBG1Gwfs2t3CAPT9+RgbHnPwWU/DXz/NUjJfqOL24O8l1tZxGT/X5JKDWH1ZTRuLWK134dGZVo=
X-Received: by 2002:a05:6638:2382:b0:364:12ef:b735 with SMTP id
 q2-20020a056638238200b0036412efb735mr11280795jat.92.1666270231251; Thu, 20
 Oct 2022 05:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221020084311-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 20 Oct 2022 18:20:20 +0530
Message-ID: <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
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
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
> > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> > > >
> > > >
> > > > Changelog:
> > > > v6:
> > > >   - skip test when dependencies (xorriso for example) are not installed.
> > > >   - skip test when run on a platform other than x86_64.
> > >
> > > Hmm why is that btw?
> >
> > The bits binaries that generate the iso (grub-mkrescue etc) are built
> > for and are known to work only on x86_64 platform. They might also
> > work on amd64 but I do not have one at my disposal at the moment to
> > check.
> > On other platforms, for example 32 bit x86 and non-x86, those binaries
> > will likely not work. The test will fail.
>
> confused. I thought we are distributing the iso?

No, the test builds the iso after adding the modified test scripts and
then spawns the vm with it. It is all part of the test itself.
We need to do that so that the iso contains the newly added tests etc.

