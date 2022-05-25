Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9C533D09
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:55:58 +0200 (CEST)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqY5-0004HF-RO
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ntqTQ-0001VB-5n
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:50:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ntqTL-0001sh-Fw
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:50:45 -0400
Received: by mail-ed1-x52d.google.com with SMTP id j28so26833129eda.13
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+zWfEcBn8R8qG6JRVAIvmLuc8kO+BbiDT3PmcxvLls=;
 b=MJd6SGtRBsE+DRWDvkyUJhMrHWBnuq56G5CxFv6whdRyfp20Ck3vH0Tp0SWFhcj9Ig
 txYLvIP8F+KKD022dG0/kLi9rQlruZCMCeEUjxH8G+XH42l9LykKt70uFQrjCRnd14pC
 c8r75yKnvJQ6QDPbELS2t0Ryz27Qt2KhIkU6HR2WOMAQv99V1WEUi7y50hVnQO/vbtB2
 ZYNxxaKJ9sBGqcmB/Gj58G72FrYtjH0ycUu0wYDzgZDx3UAcZPaF45aIL4XLxyRCRqOZ
 UiQ0J+Kr/YHt/Xbog68CoE8/oEdclrW9U8dOsnr/D0nE+2PtTqG9l1juRC32SOOggyOM
 TYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+zWfEcBn8R8qG6JRVAIvmLuc8kO+BbiDT3PmcxvLls=;
 b=R2S0/ZpMfFgqN9QMioviUM5cTDylM/AAOJZzSK4csW8vRdyY7SRu3BdoERaGq2zg0C
 MJnaWJE0Op4ofgNdAKz8tyZzvrCicPo5qyiIgC00s322mxpKK4mG2nvkxqwI3qbYzZVS
 3Vxb6hKAFFYPWLc50SGSVMnHBYJOVT/0FXu2jjfYkpfGlhCtrYenQdSQhEtkzPDJMjyD
 tTRlRP2xOOb2Lzkup+ofUCNEhwYA4NsK/uECIbySXYQYqZKBwVgLkwRp1v/U5uCQnhiG
 lS6LWsC1azkMXJtyYQ6c/0mpKyWb4mgMl6p5K42x7h+iBWKQV2+7vClBiFL1BTobcv+Y
 s8uQ==
X-Gm-Message-State: AOAM532Sm2hi5Q4WAdkE9VCLRUEbLLnKU7NKX9sdbWcc8ybaV8UfQJRa
 iym5xw46aToB2mHF1Rpwvp4D9kLrdFEKeyrmi1Xm
X-Google-Smtp-Source: ABdhPJxrUT9p9ntAQvqokYU0BkiOqlC8EAHPKKSgZUSUJU238IsZOZKqg29PY7Tm4TA225V0XEB//vuD5HTzj++dY98=
X-Received: by 2002:aa7:ca44:0:b0:42a:cd1e:ac6f with SMTP id
 j4-20020aa7ca44000000b0042acd1eac6fmr33771264edt.328.1653483041326; Wed, 25
 May 2022 05:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <Yo4ljbJKI9pfIQtf@stefanha-x1.localdomain>
In-Reply-To: <Yo4ljbJKI9pfIQtf@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 25 May 2022 20:51:27 +0800
Message-ID: <CACycT3vmxSMXJiR_M0yXGzCg+aOQ=_A=j68=3TiKPuFGKmXmHg@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Support exporting BDSs via VDUSE
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 8:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, May 23, 2022 at 04:46:03PM +0800, Xie Yongji wrote:
> > Hi all,
> >
> > Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> > been merged into Linux kernel as a framework that make it
> > possible to emulate a vDPA device in userspace. This series
> > aimed at implementing a VDUSE block backend based on the
> > qemu-storage-daemon infrastructure.
> >
> > To support that, we firstly introduce a VDUSE library as a
> > subproject (like what libvhost-user does) to help implementing
> > VDUSE backends in QEMU. Then a VDUSE block export is implemented
> > based on this library. At last, we add resize and reconnect support
> > to the VDUSE block export and VDUSE library.
> >
> > Now this series is based on Stefan's patch [2]. And since we don't
> > support vdpa-blk in QEMU currently, the VM case is tested with my
> > previous patchset [3].
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > [2] https://lore.kernel.org/all/20220518130945.2657905-1-stefanha@redhat.com/
> > [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> >
> > Please review, thanks!
>
> I talked to Kevin about who should merge this. He will do a final
> review and it can go through his tree.
>
> I will drop it from my 'block' branch for now.
>

OK, thank you!

Thanks,
Yongji

