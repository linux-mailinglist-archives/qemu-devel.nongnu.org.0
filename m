Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A92372B24
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:36:00 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvDT-0008SV-35
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ldv9y-0005wp-3v
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:32:22 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ldv9w-0002Ns-82
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:32:21 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mate1-1l7KUe0mWB-00cN7l; Tue, 04 May 2021 15:32:15 +0200
Subject: Re: [RFC PATCH 07/27] virtio-snd: Add properties for class init
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, kraxel@redhat.com,
 mst@redhat.com
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <df6c1dc7-5d0f-f094-5d2f-2d8f9a909a1c@vivier.eu>
Date: Tue, 4 May 2021 15:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
X-Provags-ID: V03:K1:En5D1PrgeUAebnuMzSZ3AjNR5lpTPBNiy3llhBPthA1GtJe8oTw
 pjFsTqQP1iaYd9t89gOrP/i0VWpSE5AQG5Gkw3uIUG/4ERRPVk26vImwXzyZhwWKrWh5lv3
 vwAjTR1pz7TVGmKXdpzDmmMpBhk6DH+950dAIitCbne2frFegotc1sHPb730wyJ1GnjsO7m
 Xrnli4NKGHgFlW9a9+eug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:735cue6uegU=:7coXA7lWkXafVnA9/081q4
 Ne53oGxUWLG7XqaZzctvC1vPXwXT4V47DUS4TbwAUwhos0cQRuIOryC6ppVDeJ9aYkzRI47l4
 p43kTqF6l56DxsRdtuSlDGxUBBtFY9kc5dUcE4dKqnPZPuZxRBxKzEQR0zwk7JTL0CZOS9U7V
 j3FsSjVZsWtjYBaRrkRJOFlSDK+hbvA8cR7KHzMxzt4YR+UIkPnXxIw9fGRyuG3mZNz5qszYk
 Ywr91kewgXm59s7R4GkYL0tS8ihhfF7SR3SCjABva5g/zf2VxtXWF2hw654AbEtNXkvYiOPVf
 zL00fcL+3c2c0a/jHyxATmcnprVa30wx8ayMztZ/l70a8UsclBoVx6v2kpbo0jJJEA9UEqvpv
 hdJTKIQTVNBGAftFemh7zk/NrYNw9bxnOXo3G1yAI+LVdFRRYEYyBB9/3EHXC84xY1B6pULVN
 9/Jp5N1V0d9twwooRPXuhqr725TsbofDfCgq1xY+rQp4aRslVwK8GgemNhpjkbiTErySIY6Hy
 Y04Z/XM4JlQJTuMTxEdEog=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/04/2021 à 14:04, Shreyansh Chouhan a écrit :
> Added properties and function stubs for virtio sound device class
> init.
>
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> ---
>  hw/audio/Kconfig      |   5 ++
>  hw/audio/meson.build  |   1 +
>  hw/audio/virtio-snd.c | 126 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 hw/audio/virtio-snd.c
>
> diff --git a/hw/audio/Kconfig b/hw/audio/Kconfig
> index e9c6fed826..00b4e1ca88 100644
> --- a/hw/audio/Kconfig
> +++ b/hw/audio/Kconfig
> @@ -50,3 +50,8 @@ config CS4231
>  
>  config MARVELL_88W8618
>      bool
> +
> +config VIRTIO_SND
> +    bool
> +    default y if PCI_DEVICES
> +    depends on PCI

There is nothing specific to PCI in that code, why do you prevent the use of virtio-snd as a MMIO
device?

Thanks,

Laurent


