Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCB55F698
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 08:31:49 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6REm-0002km-Uj
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 02:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6RBa-0001hT-5N
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 02:28:26 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6RBY-0000b7-BB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 02:28:25 -0400
Received: by mail-ej1-x62e.google.com with SMTP id d2so18728620ejy.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WDGgK5nTtlC+Zg3GB0OWCd+/lTTO/WqWUgCR8PCzcJ0=;
 b=24LEyDHgIVf+38h9oJHOxph3hJftChJsfjlk3gkAhyUf54z4oaWI7RfPzzBXGsydGH
 4VBPfJhAgAe8xKUnCc1h4lOdmN7SsPNPZmldSfT46YO/SLEkxwUezG6SNzpqpn+qJg+D
 Cs0ni3kIoenQ1Cub1s32Z82vDeFE0q90qxOhUAm1bgmHKpfVt7MUxf0Q25MzRRku/+jR
 OeSeMW5Y8XLHMVWqWw3tDb622iBsTrOM7LldzxjPK06Mfi/huT52OY5q4sjd0iWpBSyM
 +keLkaWtxcpO6lwa9fvCT8ouIiN9tXcvgwvXpP7bmDXmE2ii5Vnx+JtYtLOUg6jh6DYp
 sg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WDGgK5nTtlC+Zg3GB0OWCd+/lTTO/WqWUgCR8PCzcJ0=;
 b=bnYf1N5ThH4KTzfaheracICDhz8gYEXWGvGiG+l15fa/PyGfFwLpq6uZFIqoU9CG33
 DpRxaF8HZedmAfiaGggzG7eLg4oG4eBq4oH9etKjpenbseW2qTcSZIgN9BXcMQ77MegJ
 POb99xAwIWx51YBLZIQuUqppEctTHy6eoqVoqlE3B6xWYH2Y73ijXicIB05d40ZCIlKU
 fsFHikPHkPLNDWnZmbWpEXHZIK6CnFE11Yl+Euql4VUJNo0dJYG97okBm5I2GrADbNzX
 JS01xlHc5JHk38tAzcqm507taZCDwBF/PmwomjfhCQcj3aG5M5CRqLT1qjqQab2JzJ5/
 re/g==
X-Gm-Message-State: AJIora9Lp0WJli5PfQiCaloC2Ytw9Z/rEWJuFcQTfV5/AAlnTVW9uZTp
 DrS2Hvd94ikNDjYHVlrlUQ0FQq3xUZTj9Z4H6GbnNA==
X-Google-Smtp-Source: AGRyM1uQzcVa45ngRpZ7tYvdWYNYMahWcXQ7pXlT+LEQ1tkSIvLBfK+JtWUaq5TOOQJN0dCyV1FVlaFSUJbivsDWW24=
X-Received: by 2002:a17:906:b795:b0:722:e662:cffe with SMTP id
 dt21-20020a170906b79500b00722e662cffemr1714004ejb.121.1656484102161; Tue, 28
 Jun 2022 23:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
 <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
 <YrspCYpLwFDHkaRv@redhat.com> <20220628135133-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628135133-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 29 Jun 2022 11:58:11 +0530
Message-ID: <CAARzgwwoNUn2pN9uAn-sqrH42dsOW4WQyc6ZuewRPPovUqykMQ@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62e.google.com
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

On Tue, Jun 28, 2022 at 11:30 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 05:15:05PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > FYI, the reason much of this is intentionally NOT under the /qemu-proje=
ct
> > gitlab namespace is that we did not want to be responsible for distribu=
ting
> > arbitrary binary blobs/images. That in turn makes the QEMU project resp=
onsible
> > for license compliance, which is non-trivial todo correctly for much of=
 this
> > stuff. As such it is highly desirable to delegate both the hosting the
> > binaries and source to the third party who builds it.
>
> This might be understadable for random guest OS images which include tons=
 of stuff
> and are thus hard to audit.  But not to biosbits which has its own
> license (more or less bsd) + gpl for grub:
> https://github.com/biosbits/bits/blob/master/COPYING

These are all the dependencies:
https://github.com/biosbits/bits/tree/master/deps

We can go through the licenses for each and make a determination. The
audit would be lost easier because there is a bounded number of
dependencies for bits.

>
> > I agree the use of personal github accounts is not nice, but it was the
> > least worst solution identified.
>
>
> --
> MST
>

