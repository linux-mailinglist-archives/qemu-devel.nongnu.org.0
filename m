Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BC6B7F88
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:32:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbm0h-00072l-34; Mon, 13 Mar 2023 13:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbm0X-0006zq-DQ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:30:50 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbm0V-0006Iz-4q
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:30:48 -0400
Received: by mail-pg1-x531.google.com with SMTP id z10so7365257pgr.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678728645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i+hPFBDCgAXkGHwRRdx4xzCu36A6oA4pN630X3SQXOU=;
 b=k4R400zG1kvC3OossUoz4uDgUhqsHSJce7eWQoSSTwntAJ7N0qnubCvGL8voGWK49t
 CuYYqFaPKBNMP0+vm0APP3BZh5uPBbGGD0q1VasSS9qsfKdbZeHnSil67zDscGetJZbZ
 WO+tPUAuFBbmLM5ZbCUaumRrPPk1vfe5UJOmRQAtZJbKKzrCn4Gj0Fi8CdW/C2fqy8A2
 7BYgn0jen/+SNbjXnDYqVUmvfMuVN1645LSJqeFbBlcome02YIpmkHYJgrgzcOJsxOpP
 N41TBA9mLTEgFsDiJT3hs97tYxeMUt1NQrhX/VnwPvMge9Z+deSYq5rphWe6Yk04KuOn
 xMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678728645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+hPFBDCgAXkGHwRRdx4xzCu36A6oA4pN630X3SQXOU=;
 b=B5naUf2UN6Sbdzs9QfUSiCgpTiQf5kZ4yEF7fVWLKTEg36CN3a11NXSSyo8KFNCv9s
 t0IbHE60ctDCRFVBATrsN7LdAJr6jvcOxFibJ9nY1TBut1W0j4vDqbDEbxAq+YA/QuI3
 SunROLjPTAXW/FkYdQOBXDljOlPW/uX/xNwOPclgs9IYtiKH7cptpWXdGw7K1+u4JY11
 8nWmD0kzeA7FLTb0Oxx3DfSQltISmQTmDw6FMmtGfrX38WrTTiQtjuufa5YQzPUX4mLo
 K5nt6rVvGo/pwwMPr1G8+kSIpczHFxJlrQo85G/crtICMSPQAVhWYNb9rLbhTG3YGl6d
 hYRg==
X-Gm-Message-State: AO0yUKW7BqkQZ7EHQvliVxHhHpTgHhJzTj3h+mKu5a0bSMLkQz2xNJGd
 n5WT9DNigK+u+uCJtXdi8FbmbxrXSt6NWDqcPLRtlA==
X-Google-Smtp-Source: AK7set+Uy7f1+v5V9LM/ctSSkweHNd0MJ2cUNCC1UrSVcwFihep8SwaV42purBHmWXllZTwRDWhrQFMw3Z26jcpjv7I=
X-Received: by 2002:a62:4e84:0:b0:625:4ff8:3505 with SMTP id
 c126-20020a624e84000000b006254ff83505mr473619pfb.1.1678728645658; Mon, 13 Mar
 2023 10:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
 <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
 <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
In-Reply-To: <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:30:33 +0000
Message-ID: <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 13 Mar 2023 at 17:14, Thomas Huth <thuth@redhat.com> wrote:
>
> On 13/03/2023 18.03, Peter Maydell wrote:
> > On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
> >> I also keep running into this problem ... I wonder whether we should run
> >> sphinx with "-W" to turn warnings into errors when configure has been run
> >> with --enable-werror ...?
> >
> > We certainly try to do that: docs/meson.build says:
> >
> >    # If we're making warnings fatal, apply this to Sphinx runs as well
> >    if get_option('werror')
> >      SPHINX_ARGS += [ '-W' ]
> >    endif
> >
> > Has that broken ?
>
> It apparently does not work in our CI, see e.g.:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3922732898#L1420
>
> ... there is a warning here, but the job succeeded happily.

Specifically:

/builds/qemu-project/qemu/docs/../include/exec/memory.h:1741: warning:
Function parameter or member 'n' not described in
'memory_region_unmap_iommu_notifier_range'
/builds/qemu-project/qemu/docs/../include/exec/memory.h:1741: warning:
Excess function parameter 'notifier' description in
'memory_region_unmap_iommu_notifier_range'
ninja: bad depfile: multiple outputs:
/builds/qemu-project/qemu/docs/devel/secure-coding-practices.rst !=
docs/docs.stamp

Also, what's that 'bad depfile' warning from ninja about ??

I looked at the build.ninja file (which you can fish out of
the artifacts for this build), and it shows that we are
passing -W to sphinx-build:

build docs/docs.stamp: CUSTOM_COMMAND_DEP ../docs/conf.py |
/usr/bin/env /usr/bin/sphinx-build
 DEPFILE = docs/docs.d
 DEPFILE_UNQUOTED = docs/docs.d
 COMMAND = /usr/bin/env CONFDIR=etc/qemu /usr/bin/sphinx-build -q -W
-Dversion=7.2.50 -Drelease= -Ddepfile=docs/docs.d
-Ddepfile_stamp=docs/docs.stamp -b html -d
/builds/qemu-project/qemu/build/docs/manual.p
/builds/qemu-project/qemu/docs
/builds/qemu-project/qemu/build/docs/manual
 description = Generating$ docs/QEMU$ manual$ with$ a$ custom$ command

So I think the problem here is not with Sphinx, but with the
kernel-doc script. That script has an option "-Werror" which
turns its warnings into errors, but our Sphinx extension
docs/sphinx/kerneldoc.py does not set it. I think we need to
have the extension say "if Sphinx was run with -W then
pass this flag along" (hopefully Sphinx lets us find out...)

thanks
-- PMM

