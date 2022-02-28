Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0214C6715
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:30:51 +0100 (CET)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdIi-0003Zm-U1
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:30:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOdGq-0002VS-DJ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:28:48 -0500
Received: from [2a00:1450:4864:20::536] (port=46878
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOdGo-0003aF-2j
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:28:47 -0500
Received: by mail-ed1-x536.google.com with SMTP id s1so16835756edd.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fGm0ayJzivNqNxYjA3UdGoxvXjTipQCJTbmRgNzQV1s=;
 b=W6xTtlliRz7MJYiCpu0v7bJ9/MZy1Kl5FSpYF0YJUCiE/5v34IKgNgkwsJBiLvl6E3
 1TGOM8Ftyaf1yooJ3NkiXHTnglIVXpBaJzv09os5t5n7SvgHRk0mOB/0rNHM+qangKay
 TtAuUVOpJAXh7HVDMfcdyn6U2+OL/WdBIL/nnUaoYGYvsR1RW2+bHFrpRbIC6SK0zU/8
 HYt5YZPA4VMtiI95NeI5kibaIytJ0g7eXDrYEmeW1mg/r271WioXtuettk1bd4sLTMmU
 7UMK/nXUSLZ/rzWf1r7qwn255vu8TiNc8iQu17ju0nJP7adacTU7I8qj8DjyqGF2okka
 74MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGm0ayJzivNqNxYjA3UdGoxvXjTipQCJTbmRgNzQV1s=;
 b=bO4EHs1pJdHpGJxhlRy0PpsVK03c5VbmuahdVPAsJiEEGx3f0t3kiHwBJjg0eXXUee
 Un08KshNLstO0YT43Vos+L8Gjqjxd8sy5sSyuHdwMRSjsej1FTfl4F0L+IP94eDMh6qw
 /qA0WBDAgqUALawvZXS4NU6qPDkzVzBXCjdhK/5XKgqIkvNIJX3MN5cr+Q/5YYwF7EpX
 rY0wsZcrfjwJod9lmcCNOwjXXXDOO6FFAD74KlfAgugRSoWywUo8BxFs6Am9wKJQPbIq
 PnQeIP2bphpmuoh1uJQlTrTXREs4gXpTUhrqb7xK2BD8PW0D9E8TwX709L6KATqC6Iiu
 NJKQ==
X-Gm-Message-State: AOAM533dSElB95gRe3FFQ8KWUeIsu+y8us0Z+OMZeqZWLB/qIdfLZOdk
 slwwAtevcPZV4IAnK24juVw7X2qVAEUIQzpJfdNvww==
X-Google-Smtp-Source: ABdhPJz/8l8lzl85XhL8pbi0hlaCzeAeDykstNiVW6OlapD1OIQyFYJxtOqpMQNbPTKLQ9tqyPH8Y+l49Nezn/C3Tr8=
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id
 q9-20020a50cc89000000b004008f8299e8mr18343786edi.7.1646044124599; Mon, 28 Feb
 2022 02:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <20220223100410.756ffe35@redhat.com>
 <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
 <20220224100345.2bdfc9d9@redhat.com>
 <CAARzgwyTsbpxHAko9iLE1RSeuJCAEvRywdQ25e93oLkvSWP8GA@mail.gmail.com>
 <20220224142135.69fa8a0b@redhat.com>
In-Reply-To: <20220224142135.69fa8a0b@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 28 Feb 2022 15:58:33 +0530
Message-ID: <CAARzgwyhT=ofzcJykuP_GKEsGQJvOzeWYUNpieLvkT7SypPJPw@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 6:51 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 24 Feb 2022 18:14:35 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Thu, Feb 24, 2022 at 2:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Wed, 23 Feb 2022 17:30:34 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > On Wed, Feb 23, 2022 at 2:34 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > > >
> > > > > On Thu, 10 Feb 2022 18:58:21 +0530
> > > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > > > > > entries. This is incorrect. We should simply return early with the count of
> > > > > > the number of reserved entries added.
> > > > >
> > > > > can you expand commit message to explain what's wrong and
> > > > > how problem manifests ... etc.
> > > >
> > > > The issue has been present for the last 8 years without apparent
> > > > visible issues. I think the only issue is that the bug allocates more
> > > > memory in the firmware than is actually needed.
> > >
> > > let me repeat: Why do you think it's an issue or why it's wrong
> >
> > Allocating more memory than what we need unnecessarily bloats up the
> > rom. We should not be allocating memory that we do not use.
>
> see how firmware uses "etc/e820" fwcfg file first, to make up
> mind on 'need' part.
>

This patch is certainly wrong. For ref, please see the following
commit in seabios from Gerd:

ce39bd40318203dd30faa ("Add support for etc/e820 fw_cfg file")

"etc/e820" is supposed to have both E820_RESERVED and E820_RAM entries.

