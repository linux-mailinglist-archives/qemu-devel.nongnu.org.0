Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7204BA5FF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:33:25 +0100 (CET)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjid-0005NN-Jq
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKjcx-0002Il-Tc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:27:34 -0500
Received: from [2607:f8b0:4864:20::42a] (port=34664
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKjcv-0002yi-EZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:27:31 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g1so126617pfv.1
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=piQ+AaR3KsfxzywPotTriUaX9sZGJi9bo2vWFUyvr+0=;
 b=IPuPL/0GHf/dpxy+pzB1u+LDafPWP5/f3U69d43m2A8ZhtxqSNBInKUNYTpgDJxJaI
 rB8GPWIc9laFMpliQ7+tggGm74Pcyl7hm0OYnLzGXnzkhe0g+7Sz3Q0e0/BjItPp9FP2
 pGUChT73yGVtNTV42H+nZ23BFXyYlu4wVLjtDg8u3gimuQhw7BPKW1sFM76PDu4ZxVL5
 fCEE6OejQcqsf3w9UbMbh1lxtvPh1TVQnu8Mld/r6wz60coKHFm3rWqWx4v7vt0kqGXe
 C/suJdIg2fkTVDIWZh3drthWdIL6fP+tvqckzRX71tjhQTKwO4IRs/sNbO2ljhNCuZrx
 pc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=piQ+AaR3KsfxzywPotTriUaX9sZGJi9bo2vWFUyvr+0=;
 b=n0/x18RQRNhLuU9ITNQFUIb67abRNn1oYjwZWL5F+VaTLtOdITJ11R9Lsb9jIJhRpA
 nIPyOaalgWUQyGvU03kePUb7xObpcfZBUG+/c+yo4uK34npp6a+lZP0OqVcl1LBqtUiZ
 4gXy/eqRIh9ldA7TbQ8THOUO+QN9JrIzjQkBWKgNVayC1iL2l65ubK57XF6I4jGQRV7N
 CzQYH4UFHrEceLgqK7IRa0pEa59PPqJuCj/JJGRTgAgETDieVgim8+8eGv2NLYQ5MzFm
 cuGc8kZSo8OR6uQEVvWI3YiPf8k6z99+BMyq4sq/MuXegGzsBL1PQd278MV6r6U0tn0D
 kTBw==
X-Gm-Message-State: AOAM530nlMyKtxh1BcAgKw6S14npiIvd3Nwvzz32FiaELSaRl+Uq5y2r
 oLi14AMg44lxG8j+Pu9CIOnCanP+QbSrn3GSLMpGR85jhvI=
X-Google-Smtp-Source: ABdhPJytgt0YENDw9hnPicJYfG/fGeOktmqueccgIcnX0IbjzMVWRrB8maZaYXhIJGUxmc/PUTjf5n8/8JwUFPVTbDQ=
X-Received: by 2002:a05:6a00:1a8d:b0:4e1:cde3:7bf7 with SMTP id
 e13-20020a056a001a8d00b004e1cde37bf7mr2489791pfv.52.1645115248071; Thu, 17
 Feb 2022 08:27:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
 <20220217141227.sk7hfng7raq6xvuh@sgarzare-redhat>
In-Reply-To: <20220217141227.sk7hfng7raq6xvuh@sgarzare-redhat>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Feb 2022 16:27:16 +0000
Message-ID: <CAJSP0QVVehjYpFodccZsQUew_LM6Yz5rfdFDSAvP1-+vHKwLgA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 14:12, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Mon, Feb 14, 2022 at 02:01:52PM +0000, Stefan Hajnoczi wrote:
> >On Mon, 14 Feb 2022 at 07:11, Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >> >
> >> > Dear QEMU, KVM, and rust-vmm communities,
> >> > QEMU will apply for Google Summer of Code 2022
> >> > (https://summerofcode.withgoogle.com/) and has been accepted into
> >> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> >> > submit internship project ideas for QEMU, KVM, and rust-vmm!
> >> >
> >> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> >> > be a mentor. It's a great way to give back and you get to work with
> >> > people who are just starting out in open source.
> >> >
> >> > Please reply to this email by February 21st with your project ideas.
> >> >
> >> > Good project ideas are suitable for remote work by a competent
> >> > programmer who is not yet familiar with the codebase. In
> >> > addition, they are:
> >> > - Well-defined - the scope is clear
> >> > - Self-contained - there are few dependencies
> >> > - Uncontroversial - they are acceptable to the community
> >> > - Incremental - they produce deliverables along the way
> >> >
> >> > Feel free to post ideas even if you are unable to mentor the project.
> >> > It doesn't hurt to share the idea!
> >>
> >> Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
> >> (vhost/virtio drivers) would be an interesting idea.
> >>
> >> It satisfies all the points above since it's supported by virtio spec.
> >>
> >> (Unfortunately, I won't have time in the mentoring)
> >
> >Thanks for this idea. As a stretch goal we could add implementing the
> >packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
> >QEMU's virtio qtest code.
> >
> >Stefano: Thank you for volunteering to mentor the project. Please
> >write a project description (see template below) and I will add this
> >idea:
> >
>
> I wrote a description of the project below. Let me know if there is
> anything to change.

Thanks, I have added the idea:
https://wiki.qemu.org/Google_Summer_of_Code_2022#VIRTIO_F_IN_ORDER_support_for_virtio_devices

Stefan

