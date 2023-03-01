Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F86A6AB4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:21:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJZd-0005w7-Am; Wed, 01 Mar 2023 05:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXJZP-0005tC-RP
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:20:25 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXJZN-0008SA-Gl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:20:23 -0500
Received: by mail-ed1-x529.google.com with SMTP id f13so51721745edz.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSHSzt4zOHyJ9WuSAB5ugdJasUqyMnV0M3NNCNfAwzM=;
 b=j0oRwga4YHNtii0VjNYF3Ymc8DcqRgmjrz0Nnfvo52IwOQJ6u5T0MD8iidrhAQkQZu
 /gFO6zRvP1ChkrlKoR9JTTpSrNxVJl4uneOjR6IV/oV5A+/Bg/4t7wA+2jTkN7aykDJA
 rM0ZzewNTzpu6Bsj9a7usV6G/NB7uARktOvIVcCafNEkE7S8P2rDL097rjbNBRychkqK
 xGBjOWsqESqc3tDOJ68CkZ7tpu0S9VI474NbZrrvPjxyTTiBt4YhR+/Zt9ZOcX3ingzv
 LeCJzff/X9w2d4k4ob8JiFt9NM8nCMczw553q+4TZqfhW/hOuZdJWHvbs/RzlZTe2R2M
 Dg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSHSzt4zOHyJ9WuSAB5ugdJasUqyMnV0M3NNCNfAwzM=;
 b=l9BHNGEqZenvK1ZAuKRtEYUmCdisNDQf3vl6rgLfCUZZQeymj8YwwNjmwwnIJDlAoW
 S4nsGeQFDaqfx3tu+Xx998z7WVv1+smAFm/ldwEIjEIMvUELRUK7Jfi4wpe3MbCmHUI0
 tXKb+JPUf6bW8OJ2HNg5mFNpHJoJkozNTuU/0a50x8ckm1OmWG+QSOW3FaspUBldTULf
 dlQiw+Y50NoJCxW5lxPWwv/6yIhvjR9y8pYoTKryzDMrh/bFLxgK9TiUHmFNETDIcvIZ
 1liTfAXrSQircHKOPPdp/Iq76hjHm80zfIXik00hUM9EA0ouLlSMu+ijXD2gxvMVBbpD
 Cw5g==
X-Gm-Message-State: AO0yUKUQqcLGPJgJIUC6Ifd0hgPCHC095md4vF/IPSsc9D6Xum9wKsGb
 zunX7DVRJsBWKWM8J8JoVkAF/PBzNCrfLyfRC7c=
X-Google-Smtp-Source: AK7set86CyTXF6l7m9ZyOPklZBJpPMoD47UQaNgsSc+ypLeUKllBYpDx4f1kXix31F1MAQufS3KIkj9lJ0xa7SSRb1o=
X-Received: by 2002:a17:906:c7c8:b0:8b1:30da:b585 with SMTP id
 dc8-20020a170906c7c800b008b130dab585mr2984943ejb.6.1677666019799; Wed, 01 Mar
 2023 02:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
 <d57cabeb-192a-e56e-7eac-c8d5634368bc@kaod.org>
In-Reply-To: <d57cabeb-192a-e56e-7eac-c8d5634368bc@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Mar 2023 18:20:08 +0800
Message-ID: <CAEUhbmV+F1vEjy5giNR82gU6auOmJ0SUyaFu83_s8STuDUeVAw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] net: Pad short frames for network backends
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Bin Meng <bmeng@tinylab.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

Hi C=C3=A9dric,

On Wed, Mar 1, 2023 at 5:13=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org>=
 wrote:
>
> Hello Bin,
>
> On 3/1/23 10:01, bmeng.cn@gmail.com wrote:
> > From: Bin Meng <bmeng@tinylab.org>
> >
> > The minimum Ethernet frame length is 60 bytes. For short frames with
> > smaller length like ARP packets (only 42 bytes), on a real world NIC
> > it can choose either padding its length to the minimum required 60
> > bytes, or sending it out directly to the wire. Such behavior can be
> > hardcoded or controled by a register bit. Similarly on the receive
> > path, NICs can choose either dropping such short frames directly or
> > handing them over to software to handle.
> >
> > On the other hand, for the network backends like SLiRP/TAP, they
> > don't expose a way to control the short frame behavior. As of today
> > they just send/receive data from/to the other end connected to them,
> > which means any sized packet is acceptable. So they can send and
> > receive short frames without any problem. It is observed that ARP
> > packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> > these ARP packets to the other end which might be a NIC model that
> > does not allow short frames to pass through.
> >
> > To provide better compatibility, for packets sent from QEMU network
> > backends like SLiRP/TAP, we change to pad short frames before sending
> > it out to the other end, if the other end does not forbid it via the
> > nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> > does not violate the spec. But with this change, the behavior of
> > dropping short frames from SLiRP/TAP interfaces in the NIC model
> > cannot be emulated because it always receives a packet that is spec
> > complaint. The capability of sending short frames from NIC models is
> > still supported and short frames can still pass through SLiRP/TAP.
> >
> > This series should be able to fix the issue as reported with some
> > NIC models before, that ARP requests get dropped, preventing the
> > guest from becoming visible on the network. It was workarounded in
> > these NIC models on the receive path, that when a short frame is
> > received, it is padded up to 60 bytes.
>
> I guess we can drop this code in ftgmac100.c also then :
>
>      /* TODO : Pad to minimum Ethernet frame length */
>      /* handle small packets.  */
>      if (size < 10) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: dropped frame of %zd bytes\n=
",
>                        __func__, size);
>          return size;
>      }
>
> Correct ? No need to resend. I can take care of it.
>

Yes, I think so. Thanks!

Regards,
Bin

