Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96044B378D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 20:09:53 +0100 (CET)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIxmK-0007gj-HZ
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 14:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxlM-00070h-EF
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:08:52 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxlK-0004mC-GG
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:08:52 -0500
Received: from [192.168.100.1] ([82.142.19.58]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MhDAi-1nxGaP1hvW-00eIrH; Sat, 12 Feb 2022 20:08:43 +0100
Message-ID: <a910913f-9621-1b75-d9a1-e5e7e0e5a135@vivier.eu>
Date: Sat, 12 Feb 2022 20:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 00/25] Virtio Sound card Implementation
Content-Language: fr
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, kraxel@redhat.com,
 mst@redhat.com
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XrBBXZorVPL0us4l5d3qoTP0xC5q2Q3G/BI9fkFRZBM1aXAMH9L
 ty7Ct9+gB+BYO8hhK0KZRG0IaNgMAVRQVWfK7qPcNIy09tBzhLqGtqk3xuGVue8i4Px+CoQ
 wX5GuNvdJGkr7b3Rvhqmir7ynVmSsBufj4qPaduNnYw+5uQyK8py/cOAFWzYAHYMsbN1As7
 5jpTEkHwLuHE0+AdL5JPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:59UcUA+DLFw=:jTX6ii2eiQB+GtbMChcrwi
 untFhW4rAwmPn8ORNjnfEeInQuBMxtKiVnrEVb2un7W01j31Fj6sXCVtOu672CHwsnEvFVyCS
 tmssh1w7sd1SEJigG0QNQ68Oy5+44l0N9WwEtWYgdbOYWVxqBqFy2xTh8wSaRw4OqG2ND7cV1
 +vtB7mu2Ov0YR/wZBJkn3SQI8gO1u5ST6PcjOB/YdUJRY39P++ZEIQHXXRsQGGZozkfu5doDX
 oaxD+ddYJIYc2a7onr7qStXllu8MaYEDsNpL4+bthedTzFViL/JG42v7ncuDuogEXr306AWvz
 o1fB2ywDkdgdKFU5GBiK+nskKvbLpNI4QfMbGnMJ2HRyGHORkNhKFQU//pagyqpggcmEbDy5X
 EEax4O2ht5/YYRJuoof/M8lU8GmCwCGl/Q+K5kGMqKnJ69gvIyDIEIi9IPTXY/FGEgvmbu1nz
 6elP4vzfUIbd3XigH7BR/qSxwJED2fbso21Ddku5YlFohXAWLTZklJnlQAxjtp2zuA8VxrAOE
 tEaEqhyL7lQN0k0ARaS52/GzC39GLThHXj4ares1clXn+6Jpe2Iy6NKE0g6kWcJh+vsA08ZxC
 TLbVz6+D/v6kpb3xRDF0ckI6D6lx4EOB3nKR35XTiv8PNUUOhEwb0+nBysqJc5TiDvEyIrNLT
 DSwq71QlPyU8ImUFzdatnTD0P6oZgezYctcaCIfj3spv0jxhulAU2nBrnnYG3AiJF6Ns=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/02/2022 à 23:12, Shreyansh Chouhan a écrit :
> The second RFC for implementing the VirtIO Sound card as described in
> the virtio specs. Sorry for the absence of activity on this.
> 
> The output from the sound card works.
> 
> What remains to be done:
> - Features defined in PCM features. (Eg message polling)
> - Channel maps
> - Jack remaps
> - Input
> 
> I will work on the input after I have implemented the output
> along with all the features since at that point it should just be a
> matter of reversing a few things in the code that writes the audio.
> 
> I can work on this patchset mostly on weekends now but I will try to be
> more regular with this.
> 
> Reviews are welcome :)
> 
> Shreyansh Chouhan (25):
>    virtio-snd: Add virtio sound header file
>    virtio-snd: Add jack control structures
>    virtio-snd: Add PCM control structures
>    virtio-snd: Add chmap control structures
>    virtio-snd: Add device implementation structures
>    virtio-snd: Add PCI wrapper code for VirtIOSound
>    virtio-snd: Add properties for class init
>    virtio-snd: Add code for get config function
>    virtio-snd: Add code for the realize function
>    virtio-snd: Add macros for logging
>    virtio-snd: Add control virtqueue handler
>    virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
>    virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP handler
>    virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
>    virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
>    virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
>    virtio-snd: Add default configs to realize fn
>    virtio-snd: Add callback for SWVoiceOut
>    virtio-snd: Add start/stop handler
>    virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
>    virtio-snd: Replaced goto with if else
>    virtio-snd: Add code to device unrealize function
>    virtio-snd: Add xfer handler
>    virtio-snd: Add event vq and a handler stub
>    virtio-snd: Replaced AUD_log with tracepoints
> 
>   hw/audio/Kconfig               |    5 +
>   hw/audio/meson.build           |    1 +
>   hw/audio/trace-events          |   14 +
>   hw/audio/virtio-snd.c          | 1241 ++++++++++++++++++++++++++++++++
>   hw/virtio/meson.build          |    1 +
>   hw/virtio/virtio-snd-pci.c     |   72 ++
>   include/hw/virtio/virtio-snd.h |  383 ++++++++++
>   7 files changed, 1717 insertions(+)
>   create mode 100644 hw/audio/virtio-snd.c
>   create mode 100644 hw/virtio/virtio-snd-pci.c
>   create mode 100644 include/hw/virtio/virtio-snd.h
> 

Thank you for your work.

IMHO, all your patches can be merged in only one. Morever it would help for review as some patches 
remove code done in previous patches.

The "v2" tag is missing in the subject of the patches of your series.

And don't send a series as a reply of a previous one.

You can use "git-publish" it helps a lot when we have to send several versions of a series.

Thanks,
Laurent


