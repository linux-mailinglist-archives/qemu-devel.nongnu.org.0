Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3D4D9ED3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:36:14 +0100 (CET)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9DY-0002vt-LG
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:36:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU98E-0000Qx-4i
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:30:42 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=43795
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU98C-00016k-Ec
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:30:41 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v35so1729109ybi.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80qy3XFyM2TGpNGLSYjRg/46HTnwbfKEq8yIMPRPyiw=;
 b=TbVFjs1qlGIdGLbqqcQgk+W0SacupzTaFELeBowITYikQFBbsof0UtxK6dVBD9Uscg
 J52qKpuvJg5QuWpMRrLVfac29J0kNI4PtXZfNEb/hMyX0r/ED99QKGgiQLaOI5DyxHlX
 LPUnxqiwE9J3CfRS7U51gf97tnO6CgI9RKBRKfAq5bxAIEXOEtSWiLUKLRugbJ0W0sXf
 gdxsROJQKsHh5rYZz0vDOeCXt+F4WW2+cgqk3f29ShM4LS5XVEmYBVMUmFKq6leqrWhN
 x87Nw+Xg7wukjC5F+7e4Q72BQrAiTqBqxG2yk4NZH+EdmBql7N8zZBaKJnhOiperHsFl
 Qm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80qy3XFyM2TGpNGLSYjRg/46HTnwbfKEq8yIMPRPyiw=;
 b=S7BFQsglnMF/HuT7XgjFIcBOEuJCm3UHIjpMwJTAzFGAmgQAJq5idBIrYuRHyQvUOr
 Bh7dI4YRaWpiCJsXpk9+RCr59olu3CNG99zEi3PpHyMXze4IqWnAKT2NgMOxwKOBnJtN
 OUia4EZY9kbg2iXmGdwV6/x/tqqUQxgVTUpHMhOZfeSKK7KdA5jvftEQWHioOdQnCUxy
 G4wEFHm3c68sldNedGcB3BoCM/ibaaLBc9uM2qMGUHj14e3A+NWLF8d8fS5VsoW8IHFO
 vU64zP9c79sm8bOqZOCuIOmT24FeUvmoMUE3BtGfrk0U6eCGof0XeUeZu8MTRyzdG9Y2
 eGWw==
X-Gm-Message-State: AOAM532PHoKZyVRI75Kb/AtEHXrK53xT6+ZxkMkAIrnSOkMCEdM8L4r6
 gujbHQ7HFvFjtpuRLPnCS3q5PTUH5qzjjf5Yhrjdgg==
X-Google-Smtp-Source: ABdhPJwVrvtd4axpElT6mniYFBOWxEJOJ18T6Yja4iZX0R0JBmAntt+4bQ4Aa3Qwzy1DbS59RdaHaF/67TYl85H86yI=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr18397102ybs.67.1647358239007; Tue, 15
 Mar 2022 08:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 15:30:27 +0000
Message-ID: <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 15:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> Maybe we're running into this bug
> https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
> ("zlib: compressBound() returns an incorrect result on z15") ?

Full repro info, since it's a bit hidden in this long thread:

Build an i386 guest QEMU; I used this configure command:

'../../configure' '--target-list=i386-softmmu' '--enable-debug'
'--with-pkgversion=pm215' '--disable-docs'

Then run the multifd/tcp/zlib test in a tight loop:

X=1; while QTEST_QEMU_BINARY=./build/i386/i386-softmmu/qemu-system-i386
./build/i386/tests/qtest/migration-test  -tap -k -p
/i386/migration/multifd/tcp/zlib ; do echo $X; X=$((X+1)); done

Without DFLTCC=0 it fails typically within 5 or so iterations;
the longest I've ever seen it go is about 32.

-- PMM

