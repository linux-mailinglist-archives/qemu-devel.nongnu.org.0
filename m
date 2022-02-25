Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A24C450D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:57:05 +0100 (CET)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNa9g-0001aD-Ik
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nNZsY-000576-Ds
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:39:22 -0500
Received: from [2607:f8b0:4864:20::629] (port=40959
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nNZsV-0002Ev-Ve
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:39:21 -0500
Received: by mail-pl1-x629.google.com with SMTP id b22so4699749pls.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn4VPSsQYQOMEMMN7BFTuP31EPiRMpkNtye61ZMxpro=;
 b=QdhreaU4spdu6fpoE4k1DOvYqxJH8++Fr9y2h824A1G7AnjHrU1MkJ9MQQnGqys6UE
 unZg9z+l3v8CAvhMj745rcPCcUnhW0ur26U0i61cLr025QA5qcO052OCwX8IEV0iXHjL
 O0EQT2ZqHCpR/kmLj6XSEGitTbHTW8kiHL1upF5CQ5b9n59CZ4gFbvNNO6iGj+tm67jT
 nbE+QexwSV1oKDqXjAAT2NaxcmfKqglf7B5VfcJqQUEaLf7IYvo/RK6tHMNXeA7DVfJn
 0zSS2hc/soMV87iM4pfjvKHtN7PTld10awXV3riLIsKdMxqQNm8b7L/pR4vJ00HTazk3
 3l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn4VPSsQYQOMEMMN7BFTuP31EPiRMpkNtye61ZMxpro=;
 b=syzo7JLfPCQD+OTpzOThctznZTI/URyoNgz3uN3S8rg97f1zs/Ubcxp95cy3KPcGGs
 +r4XxnZ/HO+K5gtb4v95trrOtT95AOsoR7vZGCFo2+utlV9kHl/zK1i7uugMaBOcXoDm
 UC2xSXbhCDrPEz3zbWAgvC8Ra9kIXriImz9lBJYKM42i8Qtau9MLH/rlxMz5KVoVvutK
 3SGrEFE56bZ407/iW5kXXPOGZE5joOjUNQ8N/PecvaIukFePRAv3P5XfOMAeKdMjRCl2
 L/Z6AS2y+a1GRofEBPZsAyBf5K0wc+46oKH2GQhTHY7CGg9AvzlkYz5jMsRACVyJBZgN
 E4Bg==
X-Gm-Message-State: AOAM531axt2YYcofN/A1cP2yAXYHzpXGi28YqdAIEDB0ojl69wnEgC4V
 GvpSojlM/sCgcUPMojKsm2KpuJcqpYpp8gQOdV0=
X-Google-Smtp-Source: ABdhPJySf8E24Qj66QVY/C18YHKkZ7fEJPmGgNBgO4s0OgZDn6WUB397GsP1VBOw3zrgS4XMEaqJc1c6cuNOhVMISyg=
X-Received: by 2002:a17:90a:d3d0:b0:1bb:f5b3:2fbf with SMTP id
 d16-20020a17090ad3d000b001bbf5b32fbfmr3009006pjw.87.1645792757974; Fri, 25
 Feb 2022 04:39:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <YhMtxWcFMjdQTioe@apples>
 <CAJSP0QVNRYTOGDsjCJJLOT=7yo1EB6D9LBwgQ4-CE539HdgHNQ@mail.gmail.com>
 <YhN+5wz3MXVm3vXU@apples>
 <CAJSP0QXz6kuwx6mycYz_xzxiVjdVR_AqHnpygwV4Ht-7B9pYmw@mail.gmail.com>
 <20220222150335.GA1497257@dhcp-10-100-145-180.wdc.com>
In-Reply-To: <20220222150335.GA1497257@dhcp-10-100-145-180.wdc.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 25 Feb 2022 12:39:06 +0000
Message-ID: <CAJSP0QXQr1UBX9S_0QzwO89wLcTyBe+rofTY6+dyUNHvvDyPzA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x629.google.com
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Sergio Lopez <slp@redhat.com>,
 kvm <kvm@vger.kernel.org>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 15:03, Keith Busch <kbusch@kernel.org> wrote:
>
> On Tue, Feb 22, 2022 at 09:48:06AM +0000, Stefan Hajnoczi wrote:
> > On Mon, 21 Feb 2022 at 12:00, Klaus Jensen <its@irrelevant.dk> wrote:
> > >
> > > Yes, I'll go ahead as mentor for this.
> > >
> > > @Keith, if you want to join in, let us know :)
>
> Thank you for setting this up, I would be happy assist with the cause!

Hi Keith,
I have added you as co-mentor. Thank you for participating!

Stefan

