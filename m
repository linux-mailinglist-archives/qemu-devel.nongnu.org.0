Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16FC52A3EB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:55:39 +0200 (CEST)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxfm-0007Ot-Rb
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nqwpb-0004RG-UY
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:01:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nqwpW-0000MP-3g
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:01:40 -0400
Received: by mail-ed1-x531.google.com with SMTP id g12so6980779edq.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZECXkO9uG5b8jcuSv44fdkLWjbVh6+oKekCbO8KHnk=;
 b=aryAF5nY8N2ITf4qPVLB56ujHf34dyloNNH2IiqBoQ0ji6xrNICbTbWq/uRgsTLg9G
 hzA9iytoxhdx+nnKKtx6ijhh4Q34P+gkFkwBSfJI1iWmeOxn1ucN2bavxoVc4jDF0CfB
 rbyrpp7OMgFXcPdA18CxvFiWXlr2NdwYkq9c6l1JKtGRhS3SPgE2b2yThn3pRJ/XSaAf
 r2hVEAhks55cGeVMVHcnVm5BCBQ3b08aEsYbqWknEcdbDIckFqIHkimh+V0bfve4vz35
 HDVlbaenn9od6HGWhkWbYK8W7rNorUQzoCBwG69Qt59FqMWT4O9h7Ond8qGJ1BvgFpqi
 9HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZECXkO9uG5b8jcuSv44fdkLWjbVh6+oKekCbO8KHnk=;
 b=TqpfluvX61PWDv1tRLHsfH7sSU+2FVr15J95qlM9QlPBjirrsv+DaNlaOYx9Hz4tt5
 FroKFQUcEmpdrBi9sFU9w7guhEB7cuvQkAHlPzJfafk3Zacu9j8tTs+YDzZMPvJf5SDp
 TykV3fI/JspTiLfbrGOHLkNeI/30kr7hAZMjIc5X3SrIQXe7GMnxPm4Gpxtk7mweX2qI
 4kKS40pfhE5xdy3EQxHuZJcm9G2lsxzkl7dZwFH+LxIBi7D1maW3wgxbcXQtgkN3ea4r
 LNIPW7jD50B6R3mebTpbpeYmtB7gG9fRMOgaIgAxx4L/1nl0dFsrX9avIX3GOblK7O5a
 8Cvg==
X-Gm-Message-State: AOAM5315e8pN1ohaypfhDnQslPZRKTqyncbrMztYwFoXhjBPY9jcammJ
 uapuXz+LFUxBWJZ8obOUJckylSU87OcUnocJFnPq
X-Google-Smtp-Source: ABdhPJyhfnxmBxmtdfvZeZmjVD9Vp6Ud75BuI3/i5hF72jdV6PeUh9UfN3njvKTfQapN5fUsMDNb9aqBWtXuAftx4fU=
X-Received: by 2002:aa7:ca44:0:b0:42a:cd1e:ac6f with SMTP id
 j4-20020aa7ca44000000b0042acd1eac6fmr1805803edt.328.1652792495648; Tue, 17
 May 2022 06:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220513060205-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220513060205-mutt-send-email-mst@kernel.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 17 May 2022 21:02:16 +0800
Message-ID: <CACycT3uk32ts4tH=vfcDKGokYe2mm4fbvj2=nH8modqDHG_sRQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Support exporting BDSs via VDUSE
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x531.google.com
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

On Fri, May 13, 2022 at 6:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 03:40:43PM +0800, Xie Yongji wrote:
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
> > Since we don't support vdpa-blk in QEMU currently, the VM case is
> > tested with my previous patchset [2].
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> >
> > Please review, thanks!
>
> This needs review by storage maintainers.
>

Hi Stefan and Kevin, could you take a look?

Thanks,
Yongji

