Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71C566FDE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:51:25 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ixY-0004Pp-Qu
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o8ivK-0002yR-Oo
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:49:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o8ivI-0006EE-PN
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:49:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id v12so2749359edc.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXg9GM9kcgZogBb4NVTD+ieKzzFjbx1VgT1hUCWlEBU=;
 b=CLVxNI8Ni8+f1K6Y8iRje1kq2lW/9FzKWFbCxEDVKM7EhaIL7fMe9rZi8ig2idm1jK
 9crcMjKsfvv34b0TKESgK2w3PgXS9I5jdI44Ewk3YtGsdCIVlaf/n2VSFQpAAkLrWWA9
 vgqoIm5kswYtBm/TaamApDANY/xWWpbaDB1mqvoZfvgIXMBtHPnV1FfM5ACA5ZnxrzXJ
 uSpVU8x5DpKXlEsCeCd1w6163Op53ujEHmzt6jAN8gn78cJN3ExWNCQ0ZL/0SYcjZhGK
 bz3OYAYQk8i/OqT96dAfo3HPSFmFm9324IgMXyV7fv6F2lrIdaX6Jl+6yLmiUoeE/gOw
 fRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXg9GM9kcgZogBb4NVTD+ieKzzFjbx1VgT1hUCWlEBU=;
 b=Ac7fbm9f7hpkbR+oovKnBm30nFpnzAY+LxGDurVptkWw0/8BJGZLftsAa6BKtjaUvX
 R3CcVLZEDNvLzPCXCdZvL+B4qbu0najC+CspVTGM1aK6VhBuaBxdhGHyisanv+ULTQCX
 XuMN/5Mi9QZGBm1zPnUqVONP6z2grt86IB26ibnumGXFE4cBruCTrbhlymOLh/4aJ/Pu
 jeHRzWHve2tdXy4tT+0Rns4DnwnjJxJ0FbFXf7Ps1r76TYQ+4YIVtos61Hbukh/QzFVE
 Fs9ccaf5e2mN/q43QfeUSpz3iK9msgH7JtBVnm9Nac1h2AUgQBVxOY9SL6jg0vTunOqx
 w2VA==
X-Gm-Message-State: AJIora/wsLwEgnEj2+Y29HUr2zLH5NX3Bx3e0T5zBGEBGyM0no9TCG2v
 iC96Tb2WZTNdGlYJAKrnASAFBftwmoEkftP/d4Sorg==
X-Google-Smtp-Source: AGRyM1sgG0dh64yBTsvbu6wNo20vyNbfRbSV1kBFJdZCvMTd2eaZnrLtHESLdpr+O7zM8ZGollOv3JaIcH2wOmVcPCk=
X-Received: by 2002:a05:6402:5250:b0:43a:6c36:2e57 with SMTP id
 t16-20020a056402525000b0043a6c362e57mr12373296edd.65.1657028942727; Tue, 05
 Jul 2022 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
 <9b96f98e-2b7d-47a3-c64d-9cd785432840@redhat.com>
 <20220701024108-mutt-send-email-mst@kernel.org>
 <CAARzgwxnFRN=y9qz0ERiLOxMBCxEyxsn=xW_-i8mawWPj1Dxqw@mail.gmail.com>
 <20220701033006-mutt-send-email-mst@kernel.org>
 <CAARzgwwhrsG1EkA9=kH9Y456_Yz5KEA9tMQoQ6wGufoPGTu69w@mail.gmail.com>
 <20220701053949-mutt-send-email-mst@kernel.org>
 <CAARzgwx4GKLvATe+X+jZQminm1xAM7sgxXeeDQn_KHDozyde+A@mail.gmail.com>
 <20220701082552-mutt-send-email-mst@kernel.org>
 <CAARzgww0fYFFQkzCK0xwyRZB439KwtCs5gRTrdpyh-A_eXXAQg@mail.gmail.com>
In-Reply-To: <CAARzgww0fYFFQkzCK0xwyRZB439KwtCs5gRTrdpyh-A_eXXAQg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 5 Jul 2022 19:18:51 +0530
Message-ID: <CAARzgwwJm60vbu25NfoM=uwQMaSfHuoO8_u+sZbR_HDnM5+u7w@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
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

On Mon, Jul 4, 2022 at 7:02 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Fri, Jul 1, 2022 at 6:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 01, 2022 at 03:44:32PM +0530, Ani Sinha wrote:
> > > but I thought you were suggesting we built bits every time the test is run?
> >
> > In my opinion 3 scenarios are worth supporting:
> > - people not touching ACPI, including users - simply don't run the tests,
> >         comparing tables with expected output should be enough
> > - people making changes indirectly affecting ACPI -
> >         use tests to validate that tables are still well formed,
> >         using a pre built binary should be enough IMO
> > - people working on ACPI - use tests to analyse the tables,
> >         building from source might be necessary for debugging,
> >         sources change very rarely
> > - people developing the tests
> >         building from source is required
> >
> > So I would suggest basically two github repos, one with binaries one with
> > sources. We'll keep relevant hashes to use in the script.
> > All in all not that different from submodules but I guess
> > people have submodules and that is that.
> >
> > And I personally would probably not tie it to CI whoever owns the
> > repository can worry about the builds, and I think keeping
> > things distributed is important.
> >
> > So
> > - people not touching ACPI - make check should see directory not found
> >         and skip the test
> > - people making changes indirectly affecting ACPI -
> >         check out binaries and use
> > - people working on ACPI -
> >         see that source directory is present, go there
> >         and run make. should not rebuild each time right?
> > - people developing the tests
> >         building from source is required
>
> Ok I have now committed a Dockerfile that has all the build time
> dependencies and builds bits and generates the tarballs/zip file that
> my test requires:
> https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
>
> We just need to fork the repo and generate automated builds with this
> Dockerfile and put the binaries somewhere. This should also help
> developers requiring to rebuild bits when necessary.
> Oh and btw, I also made bits compliant with the latest gcc 11 compiler
> that comes with Ubuntu 22.04 LTS :-)

Pushed a build script here:
https://github.com/ani-sinha/bits/commit/90b99ef05d55ead4b33b2fb19ad07dfb9682ec92

and the bios bits binaries are in this branch:
https://github.com/ani-sinha/bits/tree/bits-builds

