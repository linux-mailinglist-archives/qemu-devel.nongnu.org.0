Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02EC513386
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:21:57 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk39e-0005z0-4k
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk36z-00053m-F7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:19:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk36x-0003sN-FM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:19:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id g20so5297039edw.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qeW+HyTzfG5szaLICtq8PuT1Q/Egx/+glW6I3DSEUUQ=;
 b=euNYU3QHRx+FWW8PbDAx2Gtmb6qF3Ql3+neGVuhjjXD5MqckQ5siu43Wewrnhln8b4
 wHI6/iKFCxWC3uWDVrnoze0wbb1ismVaYEk/ejoS1pjuX3SRlJ5qkc2jsf5znkAq/5At
 egUhPOth03DGalF/L/0kpDevPupekYToMD1dr8L5rCOH82+oGREVpewUDLtL8rKljZ89
 1gRzqqhbmce/+p0bEcwAMjiy0fYghSxhyzQHqSY6lxTY1EWEwrLFW3XDvEzJzeSGe4Wn
 RzKIXCQfzEixnv72hrT8Ws29t9kIpp8RMCUC7k+pR8lOgDSz5vLrQf9R4Pp0Err3UygR
 /8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qeW+HyTzfG5szaLICtq8PuT1Q/Egx/+glW6I3DSEUUQ=;
 b=5JVGzdf7a1WunfVWvUKJg/zJHw9JxNFAFikurG4NjpI36SidkMbQccAMDsDBAZkUt1
 qsL0pAwKvLF++xOZ7EQdiilFfT4HULOMwoDdPW2z4urOkCeRbl5dPLpvcAQAay/mrg0d
 vQzmZt8I4OTZ9SnqRsTm70mueDO+lGXxZebMddaYgf+q3oc2kxENMLIKitFlDNbdynxW
 2XLW/yEtKqWNjIlmGrfJB1nmlMQ8WOghPUgHiMMXaZ74eHzSiduP/YjA59xMacNv16O1
 PN0y44/PtluxToo5SpFj04pAB2bIjRvzaQEgqWa9lsog2T3suxUgprr/pZr3bbI7eyWN
 KpuA==
X-Gm-Message-State: AOAM531MegjQ3SrygL4uS5QzDzAkq27HOAux+xH0R7toNaPqHOMdOGTM
 qeg2+8BuGMZDdXNwZcs3aU8oi7HaHnZAFSNnPb0JCw==
X-Google-Smtp-Source: ABdhPJx8oc3Tzp+WHoHNHTGso/xZHxFIutIr2BDHpnYAPPGppfE0SRbLpp0JR/gyhLVe6QmlgyxAUMKeAzJ/tABbpQs=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr35383212edb.118.1651148345070; Thu, 28
 Apr 2022 05:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
In-Reply-To: <20220428114850.GA20626@yangzhon-Virtual>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 28 Apr 2022 14:18:54 +0200
Message-ID: <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
To: Yang Zhong <yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::535;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x535.google.com
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

On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote:
>
> On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > Hi Yang, hi Paolo,
> >
> > We noticed sgx-epc machine type is not listed in the output of
> > "qemu-system-x86_64 -M ?",
snip
> >
> >
> > I think this would cause confusion to users, is there a reason behind this?
> >
>
>   No specific machine type for SGX, and SGX is only supported in Qemu PC and Q35 platform.
Hi Yang,

Thanks for your quick reply. Sorry for the stupid question.
The information I've got from intel or the help sample from
https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
specify commands something like this to run SGX-EPC guest:
qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
host,+sgx-provisionkey  -object
memory-backend-epc,id=mem1,size=512M,prealloc=on -M
sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 /tmp/volume-name.img

Do you mean internally QEMU is converting -M sgx-epc to PC or Q35, can
I choose which one to use?

Thanks!
Jinpu

