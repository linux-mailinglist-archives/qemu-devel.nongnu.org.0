Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215FC62D90B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovckL-0001Ju-9J; Thu, 17 Nov 2022 06:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovckH-0001JX-LQ; Thu, 17 Nov 2022 06:07:49 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovckE-000275-MY; Thu, 17 Nov 2022 06:07:49 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id f201so1417941yba.12;
 Thu, 17 Nov 2022 03:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFw1xy4A4HcDtj/gEJGnEi3wFkCtlr1/mNbpjzW4OFE=;
 b=aN1524fYVJJ5czW5WAEAqz1/vKoG6GTiep4LVtf5Rd37Rzym63wt7E1J8ppit7AWZO
 l4IG/qXTQJxFCXtB+VegSFrWZw/2H0Iz3JDfDdPFRzn8n3ZL8Yh6IecS5/5vqDJf5IdS
 /1sOXktlWaW0rfhcKXjV9t8Y201qbu51N2mfp8uBhrU+7GHHeZ40e/VqY64TKcDSE77W
 2yKR5cI0zeZ/TaTLukdMrRmWuJnxIJEgxm0ACCM7snzaQVhh7EQWA82lZBizJvH+Vbuz
 oh9GX7DkhxoCJx8mVYn7l+vkGrYmnA9ScafxNFWgbWQwHIcB0J9z2Uje3fxTtggkD9/E
 Xc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFw1xy4A4HcDtj/gEJGnEi3wFkCtlr1/mNbpjzW4OFE=;
 b=ipOkYYMs/kBp9M7TPHYkJIor5a8R2u7s8NW0N9gTcUpKcULA942sbhIc1e9UT0ZqA2
 W4Ue9mzA2aZyO2zK7CiaM0tIuFzWj2F9doWZ/cfbew/xdbXnGFzLyPnwHAL6F0cvT61i
 PnRUhwnJ7iW1SGTDheDFrO7vbfGs3AirAMC5miD+WldeVMzHINyRIWhOVczooe2EpPpf
 50gw7Xz2vxJt/tRZE2U67nYYm3dirXKyvdDRh0JYsowvb9TLQj/MOKnDr+55ge4Mm4Y8
 IEZMo2fyeODKTPB3XpXGSCF5kJ/2kQd+l/rgw2vQICaQ8itt5Rvg9P7WUSebBu9JZDC/
 W0Og==
X-Gm-Message-State: ANoB5pmB7It+45N2X6ZYVcvbYKoHUbOPy2ae7avVQqDzE9E005DFeEFA
 YLVWCZOGXTrJ6l4DxMWEJGEojAVpYh2Ios8f4SNy9MkgKnAmsA==
X-Google-Smtp-Source: AA0mqf6MkYt2HyAffXnbEoC4Ds0JTWkfNjU8y3oZee5UJDCS+pQpEN6nLLEaqNTfQIoSsx0jHFLLEHMWXXztsu2qz1w=
X-Received: by 2002:a25:cf8d:0:b0:6d7:5e6f:2a46 with SMTP id
 f135-20020a25cf8d000000b006d75e6f2a46mr1710366ybg.118.1668683264677; Thu, 17
 Nov 2022 03:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
In-Reply-To: <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 06:07:32 -0500
Message-ID: <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 16 Nov 2022 at 21:49, Tobias Fiebig <tobias@fiebig.nl> wrote:
>
> Heho,
> Ok, I just learned more C than I ever wanted to. There is a bit more amis=
s here (ll from 7d7238c72b983cff5064734349d2d45be9c6282c):
>
> In line 1916 of rtl8139.c we set txdw0; If we calculate the MSS at this p=
oint, it is consistently 12 below requested, but generally accurate. The bi=
ts that flip re: -12 must happen somewhere in the Linux kernel driver (ll 7=
64 in drivers/net/ethernet/realtek/8139cp.c?); Didn't look there in-depth y=
et (and do not plan to, maybe one of you has more experience with this?) Gi=
ven the consistency of this deviation, maybe just doing a +12 might be more=
 straight forward.
>
> However, in ll2030ff we reset a couple of status indicators. These overla=
p with the fields for the MSS, leading to inaccurate values being calculate=
d later on; For example, requesting an MSS of 767 leads to an MSS of 3 bein=
g calculated by your patch; Similarly, requesting 1000 leads to 268. At lea=
st for the latter I see packets of that size being generated on the wire (w=
hich should also not happen, as the MSS should never be below 536; maybe a =
check could help here to make sure we are not trusting arbitrary values fro=
m the driver, esp. given the bobble of sec issues around PMTUD/MSS; Technic=
ally, now that MSS is defined earlier, we could also move this closer to th=
e start of TSO large frame handling).
>
> Below is also a draft patch following my suggestions (save txdw0, +12, ch=
eck for <536) and some examples for what I described above, which I can on =
your last patch. Please note again that this is essentially the first time =
I do anything in C; Also, I wasn't sure what has less perf impact (save the=
 whole 32bit of txdw0 even though it might not be needed vs. also doing the=
 shift/& even though it might not be needed).
>
> Apart from that, my patch seems to work, and the MSS gets set correctly; =
Someone else testing would be nice, though:
>
> # MSS_requested=3D1320
> RTL8139: +++ C+ mode offloaded task TSO IP data 2648 frame data 2668 spec=
ified MSS=3D1320
>
> # MSS_requested=3D1000
> RTL8139: +++ C+ mode offloaded task TSO IP data 2008 frame data 2028 spec=
ified MSS=3D1000
>
> # MSS_requested=3D600
> RTL8139: +++ C+ mode offloaded task TSO IP data 1796 frame data 1816 spec=
ified MSS=3D600
>
> With best regards,
> Tobias
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index e6643e3c9d..59321460b9 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -77,7 +77,6 @@
>      ( ( input ) & ( size - 1 )  )
>
>  #define ETHER_TYPE_LEN 2
> -#define ETH_MTU     1500
>
>  #define VLAN_TCI_LEN 2
>  #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
> @@ -1934,8 +1933,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State =
*s)
>  #define CP_TX_LS (1<<28)
>  /* large send packet flag */
>  #define CP_TX_LGSEN (1<<27)
> -/* large send MSS mask, bits 16...25 */
> -#define CP_TC_LGSEN_MSS_MASK ((1 << 12) - 1)
> +/* large send MSS mask, bits 16...26 */
> +#define CP_TC_LGSEN_MSS_SHIFT 16
> +#define CP_TC_LGSEN_MSS_MASK ((1 << 11) - 1)
>
>  /* IP checksum offload flag */
>  #define CP_TX_IPCS (1<<18)
> @@ -2027,6 +2027,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State =
*s)
>              s->currCPlusTxDesc =3D 0;
>      }
>
> +    /* store unaltered txdw0 for later use in MSS calculation*/
> +    uint32_t txdw0_save =3D txdw0;
> +
>      /* transfer ownership to target */
>      txdw0 &=3D ~CP_TX_OWN;
>
> @@ -2149,10 +2152,12 @@ static int rtl8139_cplus_transmit_one(RTL8139Stat=
e *s)
>                      goto skip_offload;
>                  }
>
> -                int large_send_mss =3D (txdw0 >> 16) & CP_TC_LGSEN_MSS_M=
ASK;
> +                /* set large_send_mss from txdw0 before overlapping mss =
fields were cleared */
> +                int large_send_mss =3D ((txdw0_save >> CP_TC_LGSEN_MSS_S=
HIFT) &
> +                    CP_TC_LGSEN_MSS_MASK) + 12;

Hi Tobias,
Thanks for posting this information.

12 bytes hapens to be the size of the Ethernet header:
https://en.wikipedia.org/wiki/Ethernet_header#Structure

That could be a clue. I'll try to investigate some more.

Stefan

>
> -                DPRINTF("+++ C+ mode offloaded task TSO MTU=3D%d IP data=
 %d "
> -                    "frame data %d specified MSS=3D%d\n", ETH_MTU,
> +                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
> +                    "frame data %d specified MSS=3D%d\n",
>                      ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>
>                  int tcp_send_offset =3D 0;
> @@ -2177,9 +2182,13 @@ static int rtl8139_cplus_transmit_one(RTL8139State=
 *s)
>                      goto skip_offload;
>                  }
>
> -                /* ETH_MTU =3D ip header len + tcp header len + payload =
*/
> +                /* MSS too small? Min MSS =3D 536 */
> +                if (tcp_hlen + hlen >=3D large_send_mss || 535 >=3D larg=
e_send_mss) {
> +                    goto skip_offload;
> +                }
> +
>                  int tcp_data_len =3D ip_data_len - tcp_hlen;
> -                int tcp_chunk_size =3D ETH_MTU - hlen - tcp_hlen;
> +                int tcp_chunk_size =3D large_send_mss - hlen - tcp_hlen;
>
>                  DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP =
"
>                      "data len %d TCP chunk size %d\n", ip_data_len,
>
>
>
> Some examples (with additional DPRINT capturing txdw0/MSS at various plac=
es; txdw0_0=3Dll1923, txdw0_4=3Dll2029, txdw0_5=3Dll2039, txdw0_cur=3Dll215=
3):
>
> MSS_requested=3D556
> +++ txdw0_cur=3D18000440 txdw0_cur_shift=3D1800 txdw0_cur_MSS=3D0;
> +++ txdw0_0=3D9a200440 txdw0_0_shift=3D9a20 txdw0_0_MSS=3D544;
> +++ txdw0_1=3D9a200440 txdw0_1_shift=3D9a20 txdw0_1_MSS=3D544;
> +++ txdw0_2=3D9a200440 txdw0_2_shift=3D9a20 txdw0_2_MSS=3D544;
> +++ txdw0_3=3D9a200440 txdw0_3_shift=3D9a20 txdw0_3_MSS=3D544;
> +++ txdw0_4=3D9a200440 txdw0_4_shift=3D9a20 txdw0_4_MSS=3D544;
> +++ txdw0_5=3D18000440 txdw0_5_shift=3D1800 txdw0_5_MSS=3D0;
> +++ txdw0_6=3D18000440 txdw0_6_shift=3D1800 txdw0_6_MSS=3D0;
> +++ txdw0_7=3D18000440 txdw0_7_shift=3D1800 txdw0_7_MSS=3D0;
>
> MSS_requested=3D800
> +++ txdw0_0=3D9b140cab txdw0_0_shift=3D9b14 txdw0_0_MSS=3D788;
> +++ txdw0_1=3D9b140cab txdw0_1_shift=3D9b14 txdw0_1_MSS=3D788;
> +++ txdw0_2=3D9b140cab txdw0_2_shift=3D9b14 txdw0_2_MSS=3D788;
> +++ txdw0_3=3D9b140cab txdw0_3_shift=3D9b14 txdw0_3_MSS=3D788;
> +++ txdw0_4=3D9b140cab txdw0_4_shift=3D9b14 txdw0_4_MSS=3D788;
> +++ txdw0_5=3D19040cab txdw0_5_shift=3D1904 txdw0_5_MSS=3D260;
> +++ txdw0_6=3D19040cab txdw0_6_shift=3D1904 txdw0_6_MSS=3D260;
> +++ txdw0_7=3D19040cab txdw0_7_shift=3D1904 txdw0_7_MSS=3D260;
>
> MSS_requested=3D1050
> +++ txdw0_cur=3D1c0e07bf txdw0_cur_shift=3D1c0e txdw0_cur_MSS=3D1038;
> +++ txdw0_0=3D9c0e07bf txdw0_0_shift=3D9c0e txdw0_0_MSS=3D1038;
> +++ txdw0_1=3D9c0e07bf txdw0_1_shift=3D9c0e txdw0_1_MSS=3D1038;
> +++ txdw0_2=3D9c0e07bf txdw0_2_shift=3D9c0e txdw0_2_MSS=3D1038;
> +++ txdw0_3=3D9c0e07bf txdw0_3_shift=3D9c0e txdw0_3_MSS=3D1038;
> +++ txdw0_4=3D9c0e07bf txdw0_4_shift=3D9c0e txdw0_4_MSS=3D1038;
> +++ txdw0_5=3D1c0e07bf txdw0_5_shift=3D1c0e txdw0_5_MSS=3D1038;
> +++ txdw0_6=3D1c0e07bf txdw0_6_shift=3D1c0e txdw0_6_MSS=3D1038;
> +++ txdw0_7=3D1c0e07bf txdw0_7_shift=3D1c0e txdw0_7_MSS=3D1038;
>
> MSS_requested=3D1060
> +++ txdw0_cur=3D1c0809ff txdw0_cur_shift=3D1c08 txdw0_cur_MSS=3D1032;
> +++ txdw0_0=3D9c1809ff txdw0_0_shift=3D9c18 txdw0_0_MSS=3D1048;
> +++ txdw0_1=3D9c1809ff txdw0_1_shift=3D9c18 txdw0_1_MSS=3D1048;
> +++ txdw0_2=3D9c1809ff txdw0_2_shift=3D9c18 txdw0_2_MSS=3D1048;
> +++ txdw0_3=3D9c1809ff txdw0_3_shift=3D9c18 txdw0_3_MSS=3D1048;
> +++ txdw0_4=3D9c1809ff txdw0_4_shift=3D9c18 txdw0_4_MSS=3D1048;
> +++ txdw0_5=3D1c0809ff txdw0_5_shift=3D1c08 txdw0_5_MSS=3D1032;
> +++ txdw0_6=3D1c0809ff txdw0_6_shift=3D1c08 txdw0_6_MSS=3D1032;
> +++ txdw0_7=3D1c0809ff txdw0_7_shift=3D1c08 txdw0_7_MSS=3D1032;
>
> MSS_requested=3D1320
> +++ txdw0_cur=3D1d0c0b37 txdw0_cur_shift=3D1d0c txdw0_cur_MSS=3D1292;
> +++ txdw0_0=3D9d1c0b37 txdw0_0_shift=3D9d1c txdw0_0_MSS=3D1308;
> +++ txdw0_1=3D9d1c0b37 txdw0_1_shift=3D9d1c txdw0_1_MSS=3D1308;
> +++ txdw0_2=3D9d1c0b37 txdw0_2_shift=3D9d1c txdw0_2_MSS=3D1308;
> +++ txdw0_3=3D9d1c0b37 txdw0_3_shift=3D9d1c txdw0_3_MSS=3D1308;
> +++ txdw0_4=3D9d1c0b37 txdw0_4_shift=3D9d1c txdw0_4_MSS=3D1308;
> +++ txdw0_5=3D1d0c0b37 txdw0_5_shift=3D1d0c txdw0_5_MSS=3D1292;
> +++ txdw0_6=3D1d0c0b37 txdw0_6_shift=3D1d0c txdw0_6_MSS=3D1292;
> +++ txdw0_7=3D1d0c0b37 txdw0_7_shift=3D1d0c txdw0_7_MSS=3D1292;
>

