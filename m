Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BD53E476
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:44:42 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyC64-0006Yr-D8
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nyC1t-000303-Ot
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:40:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nyC1n-0003jo-7P
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:40:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id z7so18622337edm.13
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUQk8LjdKRxpSwB7GLGk+VL5mXUdTnmd6B0PiGOh/Tk=;
 b=UK0QW0tq3/xOaxBuExr+UxSeARXVSTgSeDfp9lIF3/WtZVbp3YVHFymGN8zhPY4u4M
 KGCAlnNttuwrj9qrVcSHpzc60YELVTGydTTsQXuTFLLAfLI8ryEd00QV77zNhWNDYsNo
 yqh9SDJ9DfqlSSYOE5SZGshLjSbpOT/RBm4U7gMDfcH4uVi0otHuqvCmE/5uWClb9B5o
 POKA3lhodGilI6KwAXcj8PXa5F+S9aYoardPMwj2L+x64tGOtDmI5imbuzqIcrcf9kWw
 62fi+ODoXaoP/3vI8kTQjKL1W++zBFGWeom/bqT0U3gR4S87rcfUT3S+HbXXrBezyQ3x
 JlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUQk8LjdKRxpSwB7GLGk+VL5mXUdTnmd6B0PiGOh/Tk=;
 b=mIYP1PK5ruI6NVEuo7XBfxN4Z3aScyHxAH3qm4ceP/vW7ZkDGvAmDl8g0ZG1GBvjpb
 tpx0oyFvtSGr7IYln8jAVr25WyWdTUIkztbLfFDS/iuPDQM+xnx2Vd3dNC6QvvCjcG4u
 LaUYMbfJN8W82nhwT2U/hV6SzZYDh3Ubs191kPj02k/Z/N+ANhz2683T7hzJwxXaidpv
 DPWwBrhqEnKZLBl8PhmqgluVuoGM+besZ4aWUuViFMjF0qd9ej5nSqrMg02G58R2sEEp
 Og2MWQpcX7mpjg2BFObdzHTDaMs/TtDvfzjSmJj3losQJw7Nm3Zz3Jq1p2r73lAYRrar
 XMrg==
X-Gm-Message-State: AOAM532aRQIZDP2RyfsN7nMgLbe1kxfM1B+a3bivAdRJ9TpIGL9Vqc/Q
 8UCC9gcLskqhRV6wNgfpIBhTLepnfBbnliJtNhN2
X-Google-Smtp-Source: ABdhPJyFwxDNNa9FR1rb3QzJv95sYpFlDiR2WtJEaFvTyLKIx/VY/vYa2XoPaU1iu71lI5WtOFOpDMPFNtMuEI94TBY=
X-Received: by 2002:a05:6402:524a:b0:431:51b3:bc7 with SMTP id
 t10-20020a056402524a00b0043151b30bc7mr7643129edd.5.1654519211147; Mon, 06 Jun
 2022 05:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220531095221.114-1-xieyongji@bytedance.com>
 <Ypdjr4UO+XrBbM09@stefanha-x1.localdomain>
 <CACycT3vR4rb+R5Z-SYMW1q1S1hhFZPPDJAVb82_5vnxgVr7WiA@mail.gmail.com>
 <Yp3fhbvlXqeJwA9L@stefanha-x1.localdomain>
In-Reply-To: <Yp3fhbvlXqeJwA9L@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 6 Jun 2022 20:41:08 +0800
Message-ID: <CACycT3sGu95yEqmF0ex9wPGcXQfosdMuA=G7T9zoZtXEv5z14g@mail.gmail.com>
Subject: Re: [PATCH v2] vduse-blk: Add name option
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x530.google.com
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

On Mon, Jun 6, 2022 at 7:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Jun 01, 2022 at 09:10:58PM +0800, Yongji Xie wrote:
> > On Wed, Jun 1, 2022 at 9:03 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, May 31, 2022 at 05:52:21PM +0800, Xie Yongji wrote:
> > > > Currently we use 'id' option as the name of VDUSE device.
> > > > It's a bit confusing since we use one value for two different
> > > > purposes: the ID to identfy the export within QEMU (must be
> > > > distinct from any other exports in the same QEMU process, but
> > > > can overlap with names used by other processes), and the VDUSE
> > > > name to uniquely identify it on the host (must be distinct from
> > > > other VDUSE devices on the same host, but can overlap with other
> > > > export types like NBD in the same process). To make it clear,
> > > > this patch adds a separate 'name ' option to specify the VDUSE
> > > > name for the vduse-blk export instead.
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > ---
> > > >  block/export/vduse-blk.c             | 9 ++++++---
> > > >  docs/tools/qemu-storage-daemon.rst   | 5 +++--
> > > >  qapi/block-export.json               | 7 ++++---
> > > >  storage-daemon/qemu-storage-daemon.c | 8 ++++----
> > > >  4 files changed, 17 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > > > index 3b10349173..d96993bdf5 100644
> > > > --- a/block/export/vduse-blk.c
> > > > +++ b/block/export/vduse-blk.c
> > > > @@ -245,7 +245,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> > > >      }
> > > >      vblk_exp->num_queues = num_queues;
> > > >      vblk_exp->handler.blk = exp->blk;
> > > > -    vblk_exp->handler.serial = exp->id;
> > > > +    vblk_exp->handler.serial = g_strdup(vblk_opts->name);
> > >
> > > Do we want to expose the VDUSE device name to the guest? Maybe the
> > > serial string should be a separate parameter.
> > >
> >
> > OK, it makes sense to me. But we might need a default value. Any suggestions?
>
> hw/block/virtio-blk.c defaults to the empty string:
>
>   const char *serial = s->conf.serial ? s->conf.serial : "";
>
> I think it's reasonable to say that anyone who wants to use serial will
> also want to set the value explicitly.
>

LGTM.

Thanks,
Yongji

