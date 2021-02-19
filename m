Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63B31F488
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 05:47:57 +0100 (CET)
Received: from localhost ([::1]:38338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCxhs-0004jk-VK
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 23:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCxh4-0004DK-6i; Thu, 18 Feb 2021 23:47:06 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCxh1-0006Q7-7n; Thu, 18 Feb 2021 23:47:05 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id u75so4395370ybi.10;
 Thu, 18 Feb 2021 20:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdVtki8nc9irIVc2nYwC2eQkf3+KHXxsDaOPR+4/kw4=;
 b=Q6cozl0T0qQbOrLOc07kzBedjseU3xL1vAdwoLtVAbahm+S5q34CemlvGv7g0RVRPM
 Iz7D77hoOryNMDBrDaO4DsecTcUH+u9xmP3x6lGeS1v84pUADwTP3nkGjNGwbf+82oBB
 KXyAxrpx1sYupIw6WHaVY9GTm1zY84PeAmdXGjlf5Tf+p6doZ+JIWWtFKF/Sw358yQLj
 GrnEMTUOdvQziSqofGEBcuD2/vJnrDZi2T9OyoF3WMkOLMQcK/HkjRVGvRXmBiX9Kmjr
 SaybL+BdVME59/I5sIJDia666syET36usy4vkqaHJezGzxyNp0H2Cz/vKSKljlqhafLX
 ozng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdVtki8nc9irIVc2nYwC2eQkf3+KHXxsDaOPR+4/kw4=;
 b=aVm6FNYR0A9r5zZkazNqSPasXqtewnOOHqUmVKIhtVS/GRCUuR5c+eg6SFxDkdWrMu
 Xw1VA95K0QTfACJKsHgK/EU9zDFxXTCXdWIeBpuo+Nnz8P5LPWGksM+o+9lvrPg91fh0
 mLfNUpSYsJ5efPz1VpUqgLjC1viH59Itlchw7+tIFy/j7RoRy66IyoBPcRg6J9ZDEUmN
 UsWYPY3xxonUsTu/H8VSj/Fw8BQ2EX9pXUQZTL+dLMHr73hW6yHBhwZKhAzoEeu9GsgE
 VtRQA+Ufocl/5r1gnY03T67XpZrxL8BeiNfChNL0SbykX6c83ZnwHUQuDwRLcFsl7/Jd
 jZgA==
X-Gm-Message-State: AOAM530958IF9OyS8ENxfOaJo3AT684E8ZRMu0RqKdnb5rAz8HDLLTzr
 PuCZ+adnaJZ+lOpJlCCkrhZknAnSXurJFfl8tC0=
X-Google-Smtp-Source: ABdhPJy6G8PRC2X6AZ5MJeIBXbCW7DSN+3t1qCPzJvPUAK1BBpZFvZABHuduMxH7TN5H4m6I915sLYXKQA4J6wbb1WA=
X-Received: by 2002:a25:c407:: with SMTP id u7mr12432613ybf.387.1613710021352; 
 Thu, 18 Feb 2021 20:47:01 -0800 (PST)
MIME-Version: 1.0
References: <1612766576-7792-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA9QzNnXb61vA0Quy3Lii+vpO5wyqh_kthHTf0Jsbn8RkA@mail.gmail.com>
 <CAEUhbmVpwsmh8Eu6Fb7BbHUkMePa85YV_s_hcYTx=gysHa5kXQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVpwsmh8Eu6Fb7BbHUkMePa85YV_s_hcYTx=gysHa5kXQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 19 Feb 2021 12:46:50 +0800
Message-ID: <CAEUhbmW795rjhGv0n5Q4C=P9rTJYE0fKeHRwTfz8sN96KLgAzg@mail.gmail.com>
Subject: Re: [PATCH RESEND] hw/net: fsl_etsec: Do not reject short frames
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, slirp@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 8:06 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Cc'ing libSLiRP

I am not sure whether my reply arrived to libSLiRP as I did not
subscribe to that list ...

>
> Hi Peter,
>
> On Tue, Feb 9, 2021 at 12:09 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 8 Feb 2021 at 14:53, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > As of today both slirp and tap networking do not pad short frames
> > > (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > >
> > > If eTSEC is programmed to reject short frames, ARP requests will be
> > > dropped, preventing the guest from becoming visible on the network.
> > >
> > > The same issue was reported on e1000 and vmxenet3 before, see:
> > >
> > > commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> > > commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> >
> > How a short frame should be handled is ethernet device specific:
> > what is correct for one device model doesn't necessarily apply
> > to another.
>
> I digged some history about the above 2 commits and they are the same
> issue caused by slirp and tap networking, and workarounded in the
> ethernet controller models.
>
> >
> > > Ideally this should be fixed on the slirp/tap networking side to
> > > pad short frames to the minimum frame length, but I am not sure
> > > whether that's doable.
> >
> > It would be useful to investigate further exactly where these
> > short frames are coming from. If one guest is sending out short
> > frames, or we are doing tap networking and get a genuine short
> > frame from some external host then we should pass them to the
> > guest as short frames; if QEMU itself is generating frames (eg
> > from the 'fake' hosts in usermode networking) then it should be
> > generating valid frames, not bogus ones, and we should fix whatever
> > bit of code that is.
>
> From what I can tell it's the QEMU networking codes that generate such
> short frames.
>
> However it looks no one has ever attempted to fix that in the QEMU
> networking, instead the ethernet controller models are patched in the
> *receive* path, which is to pad such short frames to 60 bytes in e1000
> and vmxnet3.
>
> >
> > > This commit changes to codes to ignore the RCTRL_RSF setting and
> > > still allow receiving the short frame. The log message is updated
> > > to mention the reject short frames functionality is unimplemented.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > RESEND using correct email address
> > >
> > >  hw/net/fsl_etsec/rings.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> > > index 121415a..503b4d3 100644
> > > --- a/hw/net/fsl_etsec/rings.c
> > > +++ b/hw/net/fsl_etsec/rings.c
> > > @@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
> > >          return -1;
> > >      }
> > >
> > > +    /*
> > > +     * Both slirp and tap networking do not pad short frames
> > > +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > > +     *
> > > +     * If eTSEC is programmed to reject short frames, ARP requests
> > > +     * will be dropped, preventing the guest from becoming visible
> > > +     * on the network.
> > > +     */
> > >      if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> > >          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> > > -        RING_DEBUG("%s: Drop short frame\n", __func__);
> > > -        return -1;
> > > +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
> > >      }
> >
> > This doesn't look right. If the guest programs the device to
> > reject frames less than 60 bytes and then expects to recieve a
> > frame that's less than 60 bytes, that's a guest bug. If QEMU
> > itself is generating packets to send and they're short that sounds
> > like a bug elsewhere in QEMU.

Could anyone familiar with the QEMU networking have a look at the
implementations to solve this short frame issue once and for all?

Regards,
Bin

