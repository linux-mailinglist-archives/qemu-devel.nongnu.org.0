Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906E4ABC3B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:46:06 +0100 (CET)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2T7-0008DJ-2W
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:46:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2LX-0004K4-TK
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:38:16 -0500
Received: from [2a00:1450:4864:20::62c] (port=39845
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2LV-0002Vj-KI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:38:15 -0500
Received: by mail-ej1-x62c.google.com with SMTP id j14so17767557ejy.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87QXd2xhYlxbk3xnSmk693oAUobFCA8eRKA6cXDYZJQ=;
 b=Lla4xelk3uIRQEYE4IKsOhIV0NyvrbX8yUHzEDnKbTO76GkXpe5BTn6ZTrFlUlqcGW
 BP4WvTF4wFEneT/imGOPSZuglO2qLZ0uJiXQR1NemlE9Tpud2+kyvv0ao4I5D8ckL+N9
 kkpp+AmxE1feLC4bKS4uMm8sA7UZqmwerHfl2Sx/UZ6L33GW3FjvKTMqJHdzkFg4xsqc
 xwm0K6IBEVxzEVdvcTyPNwsz4RmtBx6LJ7PrqRVG57wHEsu8amBzp9nMxnb6luNNYNX5
 QUw0bwuOCC7h1CMJiqUiig2DbSe96bL96bks3gxMAioET5t4Q57/yBUWvrCLt74NI/WD
 K/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87QXd2xhYlxbk3xnSmk693oAUobFCA8eRKA6cXDYZJQ=;
 b=DM2SsQoF1yxGmad15Z0d1zgeQmAyYnLMwn1yZ22Qcgj/oXpL6/PaAfdZCeVPF9u2a6
 xXl8bLUxBSbCJI6kk0Losn0zbRDI+Cmux+u8lHszcvQNiGfe5B9IwtMMNiezDNh1/+fV
 oSLnb0sJpRIcSlvJHX3kgkapixTjOf3vxMdNB2qbx3JNgZznELulFsm0N/z4K9LyBIdx
 PVlVTd991swDd0XMea5yuWQFq84iy5nSG64PpaIzWIA8hC/o1SeEq60ZwWnrYw4f7wfy
 aWFsAO6ToCtGEZVPSv+eEd5o+Z+Z7WNkj+A25Ro1f1z2GPFJb43q+n4kERAeYdaCKhEX
 9oEg==
X-Gm-Message-State: AOAM531DFbXaGyYPHegOacKLYpBgebiIysmhkzQpfomyj72tlCGxaCSN
 YRoo0Y4H2NHsrK6aL89j0eqbnw51giajIfusEErMiA==
X-Google-Smtp-Source: ABdhPJzpwSZ1J+fQU4mkuJw6u8+NShZbG6PCeI3fFf+oO0fjNcjbUPwmQzosjAp6HxOh2XmHlCL8cR4c7jLRg18OMSI=
X-Received: by 2002:a17:907:6e09:: with SMTP id
 sd9mr10106259ejc.259.1644233860179; 
 Mon, 07 Feb 2022 03:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com> <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk> <YgDpYTpdk9hJeL6v@angien.pipo.sk>
 <CAARzgwyjH70AaEZ=DNSARP++KJfAi2wZkpx6uOhpW0jEigf16A@mail.gmail.com>
 <YgECb9o2EwkUldzz@angien.pipo.sk>
In-Reply-To: <YgECb9o2EwkUldzz@angien.pipo.sk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Feb 2022 17:07:29 +0530
Message-ID: <CAARzgwx=VC3ycf_t235zrKOJV9qA0r4EvxPrvq0hYFxK_yddDA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
To: Peter Krempa <pkrempa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 4:58 PM Peter Krempa <pkrempa@redhat.com> wrote:
>
> On Mon, Feb 07, 2022 at 16:50:28 +0530, Ani Sinha wrote:
> > On Mon, Feb 7, 2022 at 3:12 PM Peter Krempa <pkrempa@redhat.com> wrote:
> > >
> > > On Mon, Feb 07, 2022 at 10:36:42 +0100, Peter Krempa wrote:
> > > > On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > > > > On Mon, 7 Feb 2022 09:14:37 +0100
> > > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > [...]
> > >
> > > > Even if we change it in libvirt right away, changing qemu will break
> > > > forward compatibility. While we don't guarantee it, it still creates
> > > > user grief.
> > >
> > > I've filed an upstream issue:
> > >
> > > https://gitlab.com/libvirt/libvirt/-/issues/272
> >
> > I can look into this bug. Feel free to assign it to me.
>
> No need to. I've noticed that we already call query-hotpluggable-cpus
> so with a simple modification the VM startup code path can be easily
> fixed so I've done so.

Ok I will look for your patch in the mailing list and review them.

>

