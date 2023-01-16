Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDFE66CEF5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 19:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHUMa-0006IF-Lb; Mon, 16 Jan 2023 13:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHUMV-0006GR-RE; Mon, 16 Jan 2023 13:37:40 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHUMU-00012x-4Z; Mon, 16 Jan 2023 13:37:39 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mt8cD-1oSXSu0yr3-00tU9Q; Mon, 16 Jan 2023 19:37:33 +0100
Message-ID: <fc534cbc-04a4-e652-8036-6ca3300ca048@vivier.eu>
Date: Mon, 16 Jan 2023 19:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH trivial for 7.2 2/2] hw/virtio/virtio.c: spelling: suppoted
Content-Language: fr
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221105114851.306206-1-mjt@tls.msk.ru>
 <20221105114851.306206-2-mjt@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221105114851.306206-2-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:t8gBIWPCk5tdCqxg+YzALscWfzp+5G+lrkXteyK7O3w/xyQmHv6
 xfqJb6PqX32LJKvm0cpbczqvC30NN8RhVzsAVAyHE5US0/aTKj0267ip5Lxyq3fdfOdARk7
 E8L/g7kMH2/YkYNGxermkZO595MWstvOV0QM/6vw3zVcr3VWYcI+xNaVZab0a5UNvn9V1VL
 a7g70r0uMOgvEVP9dDbHg==
UI-OutboundReport: notjunk:1;M01:P0:xmcd+a46o+g=;yrSxr7mKrePaPl3nK6JmtazE9uJ
 c5gk/M46MdXd7MBRM8UCM8EjAYjQoq7H4ouddZfqamZt1YIQc4H30PT5Xz2egGITCucymhgpJ
 3i2BnOsom8mSJjOGxcDcOtkZ6MmXKmkfv8nssYG9yvM+qjzHmJqx+JNlR2hUWT9aO/HCZYmNE
 F4v0WUXQyjjheOl2hYUyriisN8jDjrdGZZUmYP+SBF5HO71PzvKinT1aEq+aJ1Z1hml7fcXUb
 rDpHS/qWusfpbwhmc+uUQV2K8ySA8BaNS65HJf6UwgBrCAegmP9v/EF364kyjy9LFAMqpiQLe
 GWjfmCtyl6cyzJ8IM+063qwLUTNOQ9AYgZx7Ox5P3f4rX/1LutWngeu0DweFmnl1oDeIGp7GW
 yMgq/7OWK7vaJSJskN0aQ3j/1ld7mVm7Ja3eXqChuAGtREZrMTDM0zgYMfW24n63fvAzl75mK
 4zyKLolT2IiquwMGrCb5122p8aBYhUfUW7Axs3o3d4kMeHRA0sgsYv9zD94pW+o9zV+2pr4zm
 jFA0wPN1twPu0woa3xfQ+cEto46yc+IjI8urxWELOvWAYHyMvq76EUZGPj2rLqZ9IcvzpQ2V1
 Vt0v/xMSt7/Gx4ml9U0AIeoYNOL7Od2ViKCBZBPqZ/DgxUTsWFEltP+fGDGz5T7em9wSo/Kns
 mTj4z1HvNXWePEHVJEtbYntuOwCPe4N4G4EXPwGfPw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 05/11/2022 à 12:48, Michael Tokarev a écrit :
> Fixes: f3034ad71fcd0a6a58bc37830f182b307f089159
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/virtio/virtio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 808446b4c9..e76218bdd5 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -340,7 +340,7 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
>   qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
>               "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
> -            "buffers suppoted"),
> +            "buffers supported"),
>       FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
>               "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
>               "supported"),

This patch needs to be rebased.

This typo has been moved to hw/virtio/virtio-qmp.c

Thanks,
Laurent

