Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6E513451
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:00:09 +0200 (CEST)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3ke-0000BB-NF
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk3hh-0006BZ-7a
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:57:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk3hf-0002MS-Az
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:57:04 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i19so9357432eja.11
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BSO4hSMQ9Oo8PLOVhG22R2HA1YjIw6po1o/JoZSR/fc=;
 b=Gxq5onESoJgIgihXJxCtt+/hHVURxYBzpSjtMClMv6DExh/Kp5ypSG6PBNqjeB2gxv
 6RE3hqOKgd0SoihgwoM3HlfEB++n/lm8SeYvpaKwo//XfstSqLbHRG2r8iWTRQEm8AaA
 pUl0g+PLP6EXNM3xp7c++t0PesupAbgLXpRCFzoarnNZVGs8HI8EVKmpiP5SSCUZNKSR
 hDc0Xm+NNVc0XYlaTA2d/3MyAWNQX8Zye1TjKYp/WyefeF7v9v+qVNqRH9NzXp1HwBf0
 XHTUnS59nYgsXaHU/2JXYxY2WN3ANONe8icf1/K73CGUgrEjKzKM8842k4uBVL4Gbhn4
 EffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BSO4hSMQ9Oo8PLOVhG22R2HA1YjIw6po1o/JoZSR/fc=;
 b=XHR4rfebDFn6X+bJxvP7e+Tb/RHyDydhyqEt1figb5RHFmM8NLgzp/qfdd4Zv5itRI
 LiLv2cKNnZX2tO1dXdAvd72eiLaFHOHRiYBVvdoQiUBI11YEHBEl4QFx3h5BV4G0c4sJ
 39Zdr6cBcNmnZxit8WczgolOLCRQmOPJVUZ3bfqc+9BIJDcM7AfaQsHl+qTOXdiIH/a+
 T+SqqUIBsAWowaiZH+hbq13D+ajP6nFXmDVdxOPCw8ol5PIDci4J3QTU8M12A+oGMvnK
 2kSQk68RNyCPCSOGk8kyLkJ01JpjYMccInfIX7PQc6q7JPACJgz0O96oWi1SbAbRQKTZ
 ISwg==
X-Gm-Message-State: AOAM5327hZZdnEkxqx4DLXvGuf8BQla5Y17KFwsMVQSF+DOxFsjwdmKm
 ypQNiGWIjqUlKTD7MA6vggEb5/gV/WP8/CYm49ybWA==
X-Google-Smtp-Source: ABdhPJwt63k5vom3Dyi1dmuSZ3zJLIqO8zph0k57Q7fZhj3elMEjB1C5PMu1cJZmj8Jt65fVMRtmX/vvppk1OxWFkno=
X-Received: by 2002:a17:906:3fd1:b0:6ef:606f:e5c5 with SMTP id
 k17-20020a1709063fd100b006ef606fe5c5mr31275203ejj.441.1651150621538; Thu, 28
 Apr 2022 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
 <20220428121614.GB20626@yangzhon-Virtual>
In-Reply-To: <20220428121614.GB20626@yangzhon-Virtual>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 28 Apr 2022 14:56:50 +0200
Message-ID: <CAMGffEkmoEFoY6opV8fxp4RqmBUPojG44F7AFBY63=Ab267W1g@mail.gmail.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
To: Yang Zhong <yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::62d;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SCC_BODY_URI_ONLY=0.833, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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

On Thu, Apr 28, 2022 at 2:32 PM Yang Zhong <yang.zhong@intel.com> wrote:
>
> On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> > On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
> > >
> > > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > > Hi Yang, hi Paolo,
> > > >
> > > > We noticed sgx-epc machine type is not listed in the output of
> > > > "qemu-system-x86_64 -M ?",
> > snip
> > > >
> > > >
> > > > I think this would cause confusion to users, is there a reason behind this?
> > > >
> > >
> > >   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
> > Hi Yang,
> >
> > Thanks for your quick reply. Sorry for the stupid question.
> > The information I've got from intel or the help sample from
> > https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> > specify commands something like this to run SGX-EPC guest:
> > qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> > host,+sgx-provisionkey  -object
> > memory-backend-epc,id=mem1,size=512M,prealloc=on -M
> > sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img
> >
> > Do you mean internally QEMU is converting -M sgx-epc to PC or Q35, can
> > I choose which one to use?
> >
>
>   Qemu will replace object with compound key, in that time, Paolo asked me
>   to use "-M sgx-epc..." to replace "-object sgx-epc..." from Qemu command line.
>
>   So the "-M sgx-epc..." will get sgx-epc's parameters from hash key, and
>   do not covert sgx-epc to PC or Q35.
>
>   SGX is only one Intel cpu feature, and no dedicated SGX Qemu machine type for SGX.
>
>   Another compound key example:
>   "-M pc,smp.cpus=4,smp.cores=1,smp.threads=1"
>
>   Yang
ah, ok. thx for the sharing.
so if I specify "-M pc -M sgx-epc.." it will be the explicit way to
choose PC machine type with sgx feature.
and "-M q35 -M sgx-epc.." qemu will use Q35 machine type?
>
>
> > Thanks!
> > Jinpu

