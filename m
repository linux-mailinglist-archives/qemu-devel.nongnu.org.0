Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02A3C5D58
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:35:37 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w5v-0005dz-QU
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m2vaJ-0000Li-AP
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:55 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:34728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m2vaH-0005q3-H9
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:02:54 -0400
Received: by mail-lf1-x129.google.com with SMTP id f30so43160697lfj.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aSF0pnmVvIClrfNgv64NSNsd/ppKcaFCPNt3AwYYpfk=;
 b=fJOM+jhlrrfR8nbXG5hxAb9lBrBRexO2VfuxTw2gYtxS54zCZgztqA2oR49VstdvKE
 EgGvBcAET2qehUJSddtBAE3QuddnlHHw/faxTdURKVVK8jwlbZDQZlG5tW2YcJNkiIFd
 Eo7w0yep/iSzALln2SdK0K5lCyvvJeCHZZA+4SzjTROAeXvDmq+4mbfbXcEGv2knbZP6
 XkznFyBtExKQ+7jBrK832rFSx7C1jfTeJjrmxtfw2rNxqDfhI6b6Ia0DTbIWlGElgf2q
 sNVRRNGhHNmv3ulLXXNNBCKICnAig/h+EShHfz+jBCAP41ew7u7j96zPl8ClRzYEpCGd
 aEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSF0pnmVvIClrfNgv64NSNsd/ppKcaFCPNt3AwYYpfk=;
 b=XaPQ6fmMyr9pwLt+/K8HHC3B3wlLlbKACrvxQZ+TNPwNLZcbNR1w9/NiFIsi+rzCO0
 JD3P75Xr5D6KPlfZ18idakV0+roXEapPHQ5YRwBSj6JdkjI6JUih+G7VFWHFI4n/EdBr
 lJ3b01X0or0bGXxsnGRt0pF1qk/HpapJ1rJERubxYLetMRr3e9Vd/FoB16n6FvaqdqQO
 524rDMx2k2GRWzvIVv8psFqlAZPzq++ucmICD6R4KS9tRdorpuy6TszVyskNpCfaqLqM
 soG3WRv27cdpTaLD9TqNJPFmqLuR9zNn9XuQ9RuSQjcZockNagfJyVwniQpYeA9JroVE
 tUKg==
X-Gm-Message-State: AOAM532H5sojbS3Emg/pPC8K1+YgLj+cG+94TJPiHmc7aMqAVgHtwotb
 S5AYrEwWaqfIBqtyKHY5Y7nGVnpSS9zgYeFvqng=
X-Google-Smtp-Source: ABdhPJyZAOEWJU9rLa84PUXgVTQgn/rgVHZ8sK/73MCH4VT8DjrYtS/ZteRRC/KeCq/ubbfK4gIA/q5rtBpWRGve6WI=
X-Received: by 2002:a05:6512:3b20:: with SMTP id
 f32mr12190347lfv.279.1626094971640; 
 Mon, 12 Jul 2021 06:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
In-Reply-To: <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Mon, 12 Jul 2021 08:02:46 -0500
Message-ID: <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 mathieu.tarral@protonmail.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear Maxim,

Thanks for your reply. I knew, in our current design/implementation,
EPT/NPT is enabled by a module param. I think it is possible to modify
the QEMU/KVM code to let it support EPT/NPT and show page table (SPT)
simultaneously (e.g., for an 80-core server, 40 cores use EPT/NPT and
the other 40 cores use SPT). What do you think? Thanks!

Best regards,
Harry

On Mon, Jul 12, 2021 at 4:49 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Sun, 2021-07-11 at 15:13 -0500, harry harry wrote:
> > Hi all,
> >
> > I hope you are very well! May I know whether it is possible to enable
> > two-dimensional page translation (e.g., Intel EPT) mechanisms and
> > shadow page table mechanisms in Linux QEMU/KVM at the same time on a
> > physical server? For example, if the physical server has 80 cores, is
> > it possible to let 40 cores use Intel EPT mechanisms for page
> > translation and the other 40 cores use shadow page table mechanisms?
> > Thanks!
>
> Nope sadly. EPT/NPT is enabled by a module param.
>
> Best regards,
>         Maxim Levitsky
>
> >
> > Best,
> > Harry
> >
>
>

