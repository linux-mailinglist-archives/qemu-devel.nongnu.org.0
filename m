Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E318651345F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:03:37 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3o0-0004Rt-Q1
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk3if-0007Ub-0n
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:58:05 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk3id-0002Vk-4I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:58:04 -0400
Received: by mail-ed1-x534.google.com with SMTP id be20so5406300edb.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZxkbjA5D5/i1MS7ns0OvgA/eiXUmsND0ciJN5eR5ccI=;
 b=JW+D2KpJBScBU9VFieudtTbmnvfQZU54Z2Y76Do1dN3kgZiuNCmpNlcXNKzLNQV3Q/
 dzvIJZDTadnC7f1kJTk3+HHuHbvfIEJ+pcxnj9YTcrWlqiIOledDoah4Xnu9schDj7vs
 SFTrhAIr7I0aFWA0MxoTlE3soxg2Y3XHvEK6f+I2IpfYxPHWlvL65QsWdfrlrlx3ouBF
 /utWFvbg6BHnQoNqhFFeyvl/GJ/gYN5pNTTDL9v2Rb9TQ68LW9Y64IgBcQPEPGdCPNUk
 7U6N9GyZcCbjh73X9yWNNrLNM3H4yGPqECmowiEfiBxWbeSvMBtPrCWzkt65JjwZiU7L
 vMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZxkbjA5D5/i1MS7ns0OvgA/eiXUmsND0ciJN5eR5ccI=;
 b=K+BE+cRRWeQa8O5zzv5teef/inIpJJGdE0s3Uq+Autt1RFLtH5c2l4xJtEmu7SGPg3
 CYE9T7fS4/nKOT4JF7m7mXk9di5N4SbCRpXkyhPpKhnHm4+KgtqEPEtyud2I64ssIkHB
 9SUvkjvoB1tg2id3DstrVvQkvLbsJFSEEV7kgqjnEJ6/kGD6snp58SOJvue5lZI8kOo4
 JwMs2vSh1ZQR52LhJ3RxubplI74LKGWTjCjiEc0HbYiYxjSIjPWM9roofR35EpA/EamX
 SsXSMoJwZuaka+O+QYuxcoPMhp0A9BteZiXv70rlYn4swpUlcm0FvvgWk01sjHtuxCYi
 uN3Q==
X-Gm-Message-State: AOAM533rq2HMpAhKUPoz8vgVgkzRSIcbfkh0LKCrH2gw5aV1Q7r3HkTS
 AbEGZEKBnEF31JTxGufjBRGfZfyYnl2n9SyD5v4eRw==
X-Google-Smtp-Source: ABdhPJx1PrOrJFGx5Qe7KkJUzQ7e8GBBYmbd0UGtibVp8OLU19u4+YZ1IlfD8nWlUoffesst02FerqXsJrDvL5Ixwc8=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr35555210edb.118.1651150681825; Thu, 28
 Apr 2022 05:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
 <20220428114850.GA20626@yangzhon-Virtual>
 <CAMGffEmGjwAViuRa+ORMyO3+P7KhoOeuvNF3a3tju-WEMLdSrw@mail.gmail.com>
 <YmqJfa9510SO1yuS@redhat.com>
In-Reply-To: <YmqJfa9510SO1yuS@redhat.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 28 Apr 2022 14:57:51 +0200
Message-ID: <CAMGffEm-9+p7cRqfpzGYY_qNE1Fgqo5f4Qg9CTHdRz9ziGzH+w@mail.gmail.com>
Subject: Re: RFC: sgx-epc is not listed in machine type help
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=2a00:1450:4864:20::534;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x534.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Thu, Apr 28, 2022 at 2:33 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Apr 28, 2022 at 02:18:54PM +0200, Jinpu Wang wrote:
> > On Thu, Apr 28, 2022 at 2:05 PM Yang Zhong <yang.zhong@intel.com> wrote=
:
> > >
> > > On Thu, Apr 28, 2022 at 01:59:33PM +0200, Jinpu Wang wrote:
> > > > Hi Yang, hi Paolo,
> > > >
> > > > We noticed sgx-epc machine type is not listed in the output of
> > > > "qemu-system-x86_64 -M ?",
> > snip
> > > >
> > > >
> > > > I think this would cause confusion to users, is there a reason behi=
nd this?
> > > >
> > >
> > >   No specific machine type for SGX, and SGX is only supported in Qemu=
 PC and Q35 platform.
> > Hi Yang,
> >
> > Thanks for your quick reply. Sorry for the stupid question.
> > The information I've got from intel or the help sample from
> > https://www.qemu.org/docs/master/system/i386/sgx.html, We need to
> > specify commands something like this to run SGX-EPC guest:
> > qemu-system-x86-64 -m 2G -nographic -enable-kvm -cpu
> > host,+sgx-provisionkey  -object
> > memory-backend-epc,id=3Dmem1,size=3D512M,prealloc=3Don -M
> > sgx-epc.0.memdev=3Dmem1,sgx-epc.0.node=3D0 /tmp/volume-name.img
>
> That isn't an sgx-epc machine type.
>
> That is an (implicit) i440fx  machine type, with an sgx-epc.0.memdev
> property being set.
>
>
> With regards,
> Daniel
Thanks for your reply, I have better understanding now.
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

