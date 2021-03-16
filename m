Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1F33D042
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:00:48 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5ZF-0008Lr-Nk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM5XL-0007u7-Oc
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:58:47 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM5XK-0001Z7-4I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:58:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id u75so35987069ybi.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5KEzImOCJf0tS6SHDr9hBn50pzqc2xupQbBLOG2fxew=;
 b=DwhF1yRJLA70IXf1Xsb65zwLryycV5hUq3sPfKz3OJLwJHUG2sx40yjOmnpjH/lOWR
 Lc2vJSNXXoqRBjFiD7cS8PmkAzFwDjkByS9MFeDVefnyAi5eLYXFFxF6w/fLr2NsBeJ2
 IW0Tzir10En8X5RsBLSpiNLSYa2ZlBPFMpnVCdGKsstLjxFwx4ZebvTFQgptzb3K9Pvd
 PVKXk3GbtvGc7RxRx2tSHquFPiaAsgJ+Ha0LwQA3aosxQjyclIFI4v6Yiz9JvqIdQvtW
 t7AFkG3WqdUPIxE99JIapoi0tmjB2JLBUE8YEX2TwC5CwqWSV8XyqZ6Um9EJhyQCyGOk
 g3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5KEzImOCJf0tS6SHDr9hBn50pzqc2xupQbBLOG2fxew=;
 b=oIzTIJEGBtXdGcSRy5dnVf+jHua1JXRSj+KOPlII8sYYcVpJmw57qQGuyMM1t2AIrE
 SPrXbfMsp4ajl6XGVdgFHHoHqb3O2rhWRQKxF22YDVigfnW5wO9Ty1iZsGk0beXL+VSg
 8V6KCkrPX8lirgU8t4dYA+YUSOMz7Blw1Rs/D3enic7GhJ8F/F8DqUQdB94z18713CZp
 cfDqroPXXkbHwPkm0TLiO35q334VBlHuWsXHE9g7wSNz4dJ1vWrhd9EVFeTjEJoxpXt+
 BJWjSymwsrJhjpw7ayuXo59efas1N/fr6fSjRRiopNLCIXsjMfDV9lh5CLiCxTuH5h9d
 UyMw==
X-Gm-Message-State: AOAM532CW/7M/UzdcsW1OMQda2Y7+2cbRJ1fGBr5PPgg95zzbDbm1QC9
 o51jfunHah8wvFPJaVRODqwbpmvjcVe0m8olaw8=
X-Google-Smtp-Source: ABdhPJyNYk7YvQ56Q6mWdRz+jq0ixA+y2oJBIQwIDXTS88c0J5kInXAYPje/EbmS4Kuo/G5ZaqrrZkRL8vT3G5vemfg=
X-Received: by 2002:a25:ed0a:: with SMTP id k10mr2037245ybh.152.1615885125228; 
 Tue, 16 Mar 2021 01:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
 <20210316081254.72684-2-bmeng.cn@gmail.com>
 <cea98a59-0327-0a80-8a9f-1f4a8008cd4b@redhat.com>
In-Reply-To: <cea98a59-0327-0a80-8a9f-1f4a8008cd4b@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 16 Mar 2021 16:58:33 +0800
Message-ID: <CAEUhbmUNN_s9kGvgn6gnFP191J9iu7y7Kq3Mwzgg=XCzxm0nuA@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] net: eth: Add a helper to pad a short ethernet
 frame
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 4:49 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 3/16/21 9:12 AM, Bin Meng wrote:
> > Add a helper to pad a short ethernet frame to the minimum required
> > length, which can be used by backend codes.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > ---
> >
> > Changes in v3:
> > - use 'without' instead of 'sans'
> > - add a helper to pad short frames
> >
> >  include/net/eth.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/include/net/eth.h b/include/net/eth.h
> > index 0671be6916..bc064f8e52 100644
> > --- a/include/net/eth.h
> > +++ b/include/net/eth.h
> > @@ -31,6 +31,31 @@
> >
> >  #define ETH_ALEN 6
> >  #define ETH_HLEN 14
> > +#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
> > +
> > +/**
> > + * pad_short_frame - pad a short frame to the minimum ethernet frame l=
ength
> > + *
> > + * If the ethernet frame size is shorter than 60 bytes, it will be pad=
ded to
> > + * 60 bytes at the address @min_pkt.
> > + *
> > + * @min_pkt: buffer address to hold the padded frame
> > + * @pkt: address to hold the original ethernet frame
> > + * @size: size of the original ethernet frame
> > + * @return true if the frame is padded, otherwise false
> > + */
> > +static inline bool pad_short_frame(uint8_t *min_pkt, const uint8_t *pk=
t,
> > +                                   int size)
> > +{
> > +    if (size < ETH_ZLEN) {
> > +        /* pad to minimum ethernet frame length */
> > +        memcpy(min_pkt, pkt, size);
> > +        memset(&min_pkt[size], 0, ETH_ZLEN - size);
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
>
> I don't want to be too nitpicky but since I'm Cc'ed...
>
> - 'ethernet' -> 'Ethernet'
>
> - I'm not sure inlining is justified
>
> - The same function is used for 2 different operations,
>   . check if padding is required
>   . do the padding
>
> - If we provide a function a buffer to fill, we need to check the
>   buffer size is big enough to avoid overflow
>
> What about something like:
>
>   bool pad_short_frame(char *padded_pkt, size_t *padded_buflen,
>                        const void *pkt, size_t pkt_size);
>   {
>       assert(padded_buflen && *padded_buflen >=3D ETH_ZLEN);
>       if (src_size >=3D ETH_ZLEN) {
>           return false;
>       }
>       /* pad to minimum ethernet frame length */
>       memcpy(padded_pkt, pkt, pkt_size);
>       memset(&padded_pkt[pkt_size], 0, ETH_ZLEN - padded_buflen);
>       *padded_buflen =3D ETH_ZLEN;
>
>       return true;
>   }
>
> What do you think?

Looks good to me. Will update in the next version.

Regards,
Bin

