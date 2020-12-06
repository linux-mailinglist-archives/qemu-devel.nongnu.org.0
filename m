Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5212D04E7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 13:49:41 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kltTv-0005e6-Ks
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 07:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kltPP-0004TH-Ry; Sun, 06 Dec 2020 07:44:59 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:40236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kltPK-0006BJ-Qd; Sun, 06 Dec 2020 07:44:59 -0500
Received: by mail-yb1-xb44.google.com with SMTP id o144so10280917ybg.7;
 Sun, 06 Dec 2020 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K+a8GLNhS5kz1ayNB+wyvyeVq/+HoG6SYkYYVIKVY/c=;
 b=aMeOiHqoWIlEFCaxZAxK537taWLP3YfLwHy9hr55Tv3/XfK/C+gOgMr0zIm7IYgTrS
 DuaGXSFleXbBusET2TL2Gr9LYyyVL3MMXAZbeJO65i0daGzKnCM8/QjGPb/iLClvi2Xt
 dk05SPvKyoiefbvMrkObf6y+C5DmP2FfFTiyBZ6D64TLDhjV+cYcdT6SoaspwmMaURqB
 sejpNooNuAB6Pz53TrqPJO3tPLB7qpIqxlt9ecd8FZupF+l8q2Fm67QvOm0TDMcNI8vd
 okm0GGeT210P/4BCUkbdztGT6oxXeUvxAI53QvTIwtFW7DEufjgUu8wF4758je3Tf5Vp
 w5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K+a8GLNhS5kz1ayNB+wyvyeVq/+HoG6SYkYYVIKVY/c=;
 b=buZixk0sW32kZ8/Ykk1PhAI4wm4rfgZcmNXHAa9NqOGb2ZvS+Vd3sTAsp2m9jvDxvO
 g1UzxGGsJueg+ZDuvWJ9BA/Lfll/Nsis4khKWSVoFr9wM6YmfVU8fi9Y5FtIaYi9pqRW
 oIAvlteuwPwZTeEBpPhZc1TxQ83e7CqW/ZvwXVIapmxtEIDZqjvc54TQKJA5IcYCQ8XY
 C/CUFsrmFT3xjay0dJ8M8KhdXLC5/H8a6zf58ZQ8ZLkrv3itzKvBAQ37xQf7GqO/0yY5
 M3jxGaWse+oT9PUTflV2vG/SUV+LjBL0F3n+Zj7Nm4BdUmnczlrEkA/i0rN71SBIvrlo
 n9/A==
X-Gm-Message-State: AOAM530D0ycrNNCTrh7004IWngqaaAx179eKJ7jyoG1HNKClJ4OD/1dK
 Z9LWD4g6YqUyBFaaol3eJ84CaHlaMqYx89OXZgQ=
X-Google-Smtp-Source: ABdhPJz5qrQQkWkiNP2bKMjxspW0551AxJy5859jYAV3SaADS0hWbnmO3MX4UZumVANKlo7EctyNfYKIh+He5KdL6x0=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr18111943ybk.152.1607258691399; 
 Sun, 06 Dec 2020 04:44:51 -0800 (PST)
MIME-Version: 1.0
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
 <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
In-Reply-To: <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 6 Dec 2020 20:44:40 +0800
Message-ID: <CAEUhbmUBeUzjPG=2-WF=UnpMnVkH3qT0FkXpgBhP==yt53UfBg@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paul Durrant <paul@xen.org>, Zhang Chen <chen.zhang@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Sun, Dec 6, 2020 at 7:50 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Ben,
>
> On 12/6/20 3:14 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present net_checksum_calculate() blindly calculates all types of
> > checksums (IP, TCP, UDP). Some NICs may have a per type setting in
> > their BDs to control what checksum should be offloaded. To support
> > such hardware behavior, introduce a 'csum_flag' parameter to the
> > net_checksum_calculate() API to allow fine control over what type
> > checksum is calculated.
> >
> > Existing users of this API are updated accordingly.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> >  hw/net/allwinner-sun8i-emac.c |  2 +-
> >  hw/net/cadence_gem.c          |  2 +-
> >  hw/net/fsl_etsec/rings.c      |  8 +++-----
> >  hw/net/ftgmac100.c            | 10 +++++++++-
> >  hw/net/imx_fec.c              | 15 +++------------
> >  hw/net/virtio-net.c           |  2 +-
> >  hw/net/xen_nic.c              |  2 +-
> >  include/net/checksum.h        |  7 ++++++-
>
> When sending a such API refactor, patch is easier to
> review if you setup the scripts/git.orderfile config.

Sure. I thought I have done this before but apparently not on the
machine this series was genearated :)

>
> >  net/checksum.c                | 18 ++++++++++++++----
> >  net/filter-rewriter.c         |  4 ++--
> >  10 files changed, 41 insertions(+), 29 deletions(-)
> ...
> > diff --git a/include/net/checksum.h b/include/net/checksum.h
> > index 05a0d27..7dec37e 100644
> > --- a/include/net/checksum.h
> > +++ b/include/net/checksum.h
> > @@ -21,11 +21,16 @@
> >  #include "qemu/bswap.h"
> >  struct iovec;
> >
> > +#define CSUM_IP     0x01
>
> IMO this is IP_HEADER,

Yes, but I believe no one will misread it, no?

>
> > +#define CSUM_TCP    0x02
> > +#define CSUM_UDP    0x04
>
> and these IP_PAYLOAD, regardless the payload protocol.

We have to distinguish TCP and UDP.

>
> > +#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)
>
> Maybe CSUM_HEADER / CSUM_PAYLOAD / CSUM_FULL (aka RAW?).
>
> > +
> >  uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
> >  uint16_t net_checksum_finish(uint32_t sum);
> >  uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
> >                               uint8_t *addrs, uint8_t *buf);
> > -void net_checksum_calculate(uint8_t *data, int length);
> > +void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
> >
> >  static inline uint32_t
> >  net_checksum_add(int len, uint8_t *buf)
> > diff --git a/net/checksum.c b/net/checksum.c
> > index dabd290..70f4eae 100644
> > --- a/net/checksum.c
> > +++ b/net/checksum.c
> > @@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_=
t proto,
> >      return net_checksum_finish(sum);
> >  }
> >
> > -void net_checksum_calculate(uint8_t *data, int length)
> > +void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
> >  {
> >      int mac_hdr_len, ip_len;
> >      struct ip_header *ip;
> > @@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      }
> >
> >      /* Calculate IP checksum */
> > -    stw_he_p(&ip->ip_sum, 0);
> > -    csum =3D net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> > -    stw_be_p(&ip->ip_sum, csum);
> > +    if (csum_flag & CSUM_IP) {
> > +        stw_he_p(&ip->ip_sum, 0);
> > +        csum =3D net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> > +        stw_be_p(&ip->ip_sum, csum);
> > +    }
> >
> >      if (IP4_IS_FRAGMENT(ip)) {
> >          return; /* a fragmented IP packet */
> > @@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      switch (ip->ip_p) {
> >      case IP_PROTO_TCP:
> >      {
> > +        if (!(csum_flag & CSUM_TCP)) {
> > +            return;
> > +        }
> > +
> >          tcp_header *tcp =3D (tcp_header *)(ip + 1);
> >
> >          if (ip_len < sizeof(tcp_header)) {
> > @@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      }
> >      case IP_PROTO_UDP:
> >      {
> > +        if (!(csum_flag & CSUM_UDP)) {
> > +            return;
> > +        }
> > +
> >          udp_header *udp =3D (udp_header *)(ip + 1);
> >
> >          if (ip_len < sizeof(udp_header)) {
> ...

Regards,
Bin

