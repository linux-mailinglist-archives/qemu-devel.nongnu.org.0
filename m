Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F27514136
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:13:38 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkI0f-0000ZH-Ir
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nkHz9-0008IE-A9
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:12:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nkHz7-00086Q-Dr
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:12:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id l18so13133682ejc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YnbnAjCJ0RuXWeA6Y5lQ6XDvqMs6ykuDugFotYEdeso=;
 b=dduz2z/xrltLfg4AgrzaZZXmpbcSv3HOl69d7XQBtgoGAUPo4cXn1cHbk1HbFbSsWN
 vg06h7zi0AOVcFdU9A9dItm2hJhSP2P1as4gaWR7OSF3heGOHOUJayvXUHJhyFc3SoA3
 PQwQMzStZOg2ip/7eAH04i0oLOjlh9OOZrFOhbiiaTLUHpK/BfL02Bw6v1NW78wEeGFL
 GzIBqAijh9fCNrOyaY0IsHb7c1nMQNbLr9tIuRc1TgyBWkrjPRpJc4WLYbe0TlrH/iw6
 680GNPKs5mweUad1mP8cw8UtczPCLKX5jgZk/c2yPXZO79J90+zJndwBcftlu0hBs9cG
 ybfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YnbnAjCJ0RuXWeA6Y5lQ6XDvqMs6ykuDugFotYEdeso=;
 b=vm0dbWQTBQtw8ZVuFskwfmkVsNTW9lB3CQD+oaNzRudB15t5GoCtRgbIAqy/k6zxuA
 Iu4DwFKJMtygW5q1x0fHQ+rgvBe8r2/9U731zd6Pd8f4rUVzK3KfFiCxtcRKZh1FWhAh
 Risu70mZspycCg1XBo3JRz+MBIhjyS6BZAbv94S2xH0gcKdAyA0bvNPZkXE4N1CBPraq
 A7UfM8nHyk8BYxA1A8fYUeHd90QjNn3vrAnVr0E6VEUwKHFklNHqdSb563WAbgFD/M9s
 CBfOFtZx+6wLHx2JrmM+mcUfA1hASoMxRAGVwGKLhzpb5Sv8Tr08j2BRK4XWO62//Lt0
 nJhQ==
X-Gm-Message-State: AOAM5302w+548r24Tt873jc1cH5mFBUuGLezjMX4Y08XUJaOHssgA5LY
 /l8Fc1+/Axc/QH7AEyGfkv3TrkYKfizZi3my5ZGdQQ==
X-Google-Smtp-Source: ABdhPJxqFEJSzgdOpPnQqOQOwRfk1xX2OVVHhUdVcXooCVXxdeiHy+HtyXgcRrIUrUdPAWXl7OLN7NQfKlhtuMl3wEI=
X-Received: by 2002:a17:906:2709:b0:6f0:13d5:d58f with SMTP id
 z9-20020a170906270900b006f013d5d58fmr34353164ejc.443.1651205519585; Thu, 28
 Apr 2022 21:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
 <20220428121614.GB20626@yangzhon-Virtual>
 <CAMGffEkmoEFoY6opV8fxp4RqmBUPojG44F7AFBY63=Ab267W1g@mail.gmail.com>
 <20220429020557.GA21670@yangzhon-Virtual>
In-Reply-To: <20220429020557.GA21670@yangzhon-Virtual>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Fri, 29 Apr 2022 06:11:48 +0200
Message-ID: <CAMGffE=SqtTT6WF_JzhTMqABO9Gz6=nX6cbiREK_+OynVXxWmw@mail.gmail.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
To: Yang Zhong <yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::62a;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 4:22 AM Yang Zhong <yang.zhong@intel.com> wrote:
>
> On Thu, Apr 28, 2022 at 02:56:50PM +0200, Jinpu Wang wrote:
> > On Thu, Apr 28, 2022 at 2:32 PM Yang Zhong <yang.zhong@intel.com> wrote:
> > >
> > > On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> > > > On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
> > > > >
> > > > > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > > > > Hi Yang, hi Paolo,
> > > > > >
> > > > > > We noticed sgx-epc machine type is not listed in the output of
> > > > > > "qemu-system-x86_64 -M ?",
> > > > snip
> > > > > >
> > > > > >
> > > > > > I think this would cause confusion to users, is there a reason behind this?
> > > > > >
> > > > >
> > > > >   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
> > > > Hi Yang,
> > > >
> > > > Thanks for your quick reply. Sorry for the stupid question.
> > > > The information I've got from intel or the help sample from
> > > > https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> > > > specify commands something like this to run SGX-EPC guest:
> > > > qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> > > > host,+sgx-provisionkey  -object
> > > > memory-backend-epc,id=mem1,size=512M,prealloc=on -M
> > > > sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img
> > > >
> > > > Do you mean internally QEMU is converting -M sgx-epc to PC or Q35, can
> > > > I choose which one to use?
> > > >
> > >
> > >   Qemu will replace object with compound key, in that time, Paolo asked me
> > >   to use "-M sgx-epc..." to replace "-object sgx-epc..." from Qemu command line.
> > >
> > >   So the "-M sgx-epc..." will get sgx-epc's parameters from hash key, and
> > >   do not covert sgx-epc to PC or Q35.
> > >
> > >   SGX is only one Intel cpu feature, and no dedicated SGX Qemu machine type for SGX.
> > >
> > >   Another compound key example:
> > >   "-M pc,smp.cpus=4,smp.cores=1,smp.threads=1"
> > >
> > >   Yang
> > ah, ok. thx for the sharing.
> > so if I specify "-M pc -M sgx-epc.." it will be the explicit way to
> > choose PC machine type with sgx feature.
> > and "-M q35 -M sgx-epc.." qemu will use Q35 machine type?
>
>   The below command is okay,
>   "-M pc,sgx-epc.." or "-M q35,sgx-epc.."
Thanks!
>
>   Yang
>
> > >
> > >
> > > > Thanks!
> > > > Jinpu

