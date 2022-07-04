Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989C56586D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:15:58 +0200 (CEST)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mrk-0008KX-OT
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o8MBh-0004rZ-FB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:32:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o8MBS-0004eH-Ra
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:32:29 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u12so16742403eja.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O44A4gYGwr7d6gUVbAhqtbCSz0YXMg0Q/sGFX25Brr8=;
 b=m1cas3DqW0x/RFr0Zvdu8Ug1gPUo2nKGEpKP00WPTHSQ4UBnQNuJ1QS/DeTMrRPx1s
 /nMYndAqDULH0gNVZEpQNVvbkHXwVEgjPMYQ03y4XyJXAE8fJRR72TSmgYrigvzaxiYL
 3MohJvT4ioCYUHFc9UItlRzLf7GvtUaMl7sDLNL+TzS/kY9dAvaWt+1EJnswJuep7+8N
 6yTuni0jiltk++YxdgkcfmoB9HpsWXCcM3dnZrfhiHJi86eQXRenqU8W5rYZJFjgB8aQ
 qMUVyRRmSJrJC9Fzq6dflpXlmOThqW+dz8K/qGtjww5DrrDBcZa/U6hacdPAbvl/Ks8H
 OQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O44A4gYGwr7d6gUVbAhqtbCSz0YXMg0Q/sGFX25Brr8=;
 b=iqHCJ8z1XzxQaUjIFCIkFi3Yl/TcV7gthLB0aLsD323YDInovL6blNdaNiGYgruHbb
 aG8i+KXvJa2RR1s0tXEDbVmuKSyFbm59qN4rZaJ7gzhOjewpxCeyq+g944cuYuBXqLbN
 /z7e37r6/CUP7GgUSMAPpdu4IyBGzruoKA32D+KNLvKjWCkisdtAX1RFZEaW7RF80R0Y
 vAoITNFx7XDvwmBFt3JmN5wBR99nlfNJPgyPGaoLqeduZ6nYHLZqzcK+oYxP6nvQ9WhC
 Lye2fS7iXqs/yp8FJHuKcQzAQfLhrLsBY12Hs/KlAAXV2rE1U3MKQpJ/KuRIkuFGH/n/
 a04g==
X-Gm-Message-State: AJIora91QTulLDrT2r3RYlFLmJfYvB+Xc22J26qiKNY5T28rPbdDWgrC
 wP/mj4PyHZYS13Ep/qJHoIJE4CnSl4jsfrm2G3AlrQ==
X-Google-Smtp-Source: AGRyM1vd3QFz15oLetEj5BGFkinR03zoCTEQzcr7c8FxNwzHWg9gJduXwxYOfYv9yvKk8DzP4DWyKzi5cyF3/m6MI8M=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr28590616ejc.64.1656941531815; Mon, 04
 Jul 2022 06:32:11 -0700 (PDT)
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
In-Reply-To: <20220701082552-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 4 Jul 2022 19:02:00 +0530
Message-ID: <CAARzgww0fYFFQkzCK0xwyRZB439KwtCs5gRTrdpyh-A_eXXAQg@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Fri, Jul 1, 2022 at 6:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 01, 2022 at 03:44:32PM +0530, Ani Sinha wrote:
> > but I thought you were suggesting we built bits every time the test is run?
>
> In my opinion 3 scenarios are worth supporting:
> - people not touching ACPI, including users - simply don't run the tests,
>         comparing tables with expected output should be enough
> - people making changes indirectly affecting ACPI -
>         use tests to validate that tables are still well formed,
>         using a pre built binary should be enough IMO
> - people working on ACPI - use tests to analyse the tables,
>         building from source might be necessary for debugging,
>         sources change very rarely
> - people developing the tests
>         building from source is required
>
> So I would suggest basically two github repos, one with binaries one with
> sources. We'll keep relevant hashes to use in the script.
> All in all not that different from submodules but I guess
> people have submodules and that is that.
>
> And I personally would probably not tie it to CI whoever owns the
> repository can worry about the builds, and I think keeping
> things distributed is important.
>
> So
> - people not touching ACPI - make check should see directory not found
>         and skip the test
> - people making changes indirectly affecting ACPI -
>         check out binaries and use
> - people working on ACPI -
>         see that source directory is present, go there
>         and run make. should not rebuild each time right?
> - people developing the tests
>         building from source is required

Ok I have now committed a Dockerfile that has all the build time
dependencies and builds bits and generates the tarballs/zip file that
my test requires:
https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile

We just need to fork the repo and generate automated builds with this
Dockerfile and put the binaries somewhere. This should also help
developers requiring to rebuild bits when necessary.
Oh and btw, I also made bits compliant with the latest gcc 11 compiler
that comes with Ubuntu 22.04 LTS :-)

