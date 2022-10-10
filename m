Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE25F9BCC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:24:22 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohp1J-0007os-Lg
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohoqo-00069e-4v
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:13:30 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohoqm-0001EW-EU
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:13:29 -0400
Received: by mail-io1-xd30.google.com with SMTP id l127so7966232iof.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tIWRDH6AZKGRIgjU4w/efbs3ExXfxH7pd0fDUNC4HqE=;
 b=vgTe0l3qW1E/g42j82HGeNDW8L1p4mbMs4NJUpGUxDxFPtAberU6px6AbYXklJZ5+3
 JBWkFzwJiL4B/ehr9/O9cdp2T2/80twMbpB7aFCZ12JKu6dO71G7/vve0P+QXbOXJ5Uw
 bBTIzjI21NGTZzcz01qfHFIugza+P4lELhQK1ecAG3ENa/b3QHXE17cUXjZYTx1MDrx0
 oH4yb2xNL1/wzhjR0Kb7DyY1ZMztIzpPZa3PFRrVvvjCfgv9slh1NxwHpkIoGeD1ubHl
 W6Mb9/9u3Crn8VXb1D7LUm9awlgD9vUIxcQCNBj6q8QQWAte3UijwDnzfqrRMfeEYKwh
 1B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIWRDH6AZKGRIgjU4w/efbs3ExXfxH7pd0fDUNC4HqE=;
 b=bDppeuL9QVI+wiMBlLnrQfonwgkDF9PcuHZdIEn8Mtj9120i7DQ5NMHL2XoHhjSqag
 uBK5qsLkL/zSPWw4GRPwrXr4w6oJ5tsRPgL2t4GkMxaQgwLVKOJBZs5eaUvphx+IS8Kb
 LnKEeuLYUl+81cJstyvSmsbhLWpgkepxBz2eWRrFD6+AEg1IfLUb+oRsGQFhF7b0SL9M
 oIoo015YblgNPlY8fE1giJtLOGraKbtu5HZDg9UjXkZfrkqromTuIp0ZQW4Z/JTOdAH+
 Zy6hc3Fjj4Toh8xY9l6S2zBxzkKCX3FlJWqO3KHtikIWcL5W30acpOsYuacT57QO653L
 s/jQ==
X-Gm-Message-State: ACrzQf1HVYYE9DWUAEBM4cwfIhpmtH9VB8eU/tK/fEtxJpv7H9+hhoJu
 +/7roDKvT8PTt3Y/0ouX54cKZYixLYQklq0XlHbKdw==
X-Google-Smtp-Source: AMsMyM6rAEjbLkWXe/0l78C/qWpuuW/84HrbrT/dGwokKupQ4oXJAqSkvZ5Mmv3ZZeqCpXwnxx1X6qDSFbKZ2+VkK/Y=
X-Received: by 2002:a02:866e:0:b0:35a:1c86:2a5c with SMTP id
 e101-20020a02866e000000b0035a1c862a5cmr8822282jai.265.1665393207138; Mon, 10
 Oct 2022 02:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010075439.4146972-1-ani@anisinha.ca>
 <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
 <07a72a1c-6dd1-a776-56d5-95880c295f48@redhat.com>
In-Reply-To: <07a72a1c-6dd1-a776-56d5-95880c295f48@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 10 Oct 2022 14:43:16 +0530
Message-ID: <CAARzgwzzQpKnd+gk_Tcw0cAzRs2s-sOe5HCUga1cF7oZ=kwS7w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Igor M <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd30.google.com
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

On Mon, Oct 10, 2022 at 2:26 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/10/2022 10.13, Ani Sinha wrote:
> > On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
> >>
> >> Please see the README file added in patch 10 for more details.
> >> Sample runs are as follows:
> >>
> >> $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
> >> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
> >> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
> >> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
> >
> > None of the above files are avocado tests or avocado related python
> > scripts. They are run from within bits in a python 2.7 environment. I
> > could not find a mechanism to exclude a directory from avocado tests.
> > I also do not think making those scripts python 3 compliant is a good
> > use of my time since upgrading bits to use python 3 would be a major
> > task unrelated to QEMU testing.
>
> Maybe you could at least switch those three lines to use the new print()
> syntax

There are lots of print statements in those three files using old
syntax. It's only complaining about the first one.

to silence at least these ugly errors? ... Python 2.7 should cope
> very well with the new syntax, as far as I know...
>
> Otherwise, it might be better to put the non-avocado python files into
> another directory under tests/ ?
>
>   Thomas
>
>

