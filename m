Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A13616B55
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 18:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqHz9-0007Sa-2Z; Wed, 02 Nov 2022 13:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqHz0-0007N8-Tq; Wed, 02 Nov 2022 13:56:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqHyz-00055f-As; Wed, 02 Nov 2022 13:56:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAxLT-1ojv7S09bF-00BLNd; Wed, 02 Nov 2022 18:56:51 +0100
Message-ID: <f4149c33-1c3d-a0aa-a9dd-171be8c0c3e1@vivier.eu>
Date: Wed, 2 Nov 2022 18:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] qapi: virtio: Fix the introduced version
Content-Language: fr
To: Han Han <hhan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com
References: <20221101014647.3000801-1-hhan@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221101014647.3000801-1-hhan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:owBB1OKz0ytaFWOhEN7fT5hjQ5XI1URVgSJklYtixB8UzWFRAZ9
 TNgUNXnAO0PALaU/pb9A/4LFA5B5Zc6QYAARKDxlScCKyfZF3tVaGTL6UBqI0/Dl+aNXotj
 eoFo/aUVUt8Rfoty0qmDXT1p6tFgUt04/6byi0TVwcHQmbbQSKOMQWj/ATQXYCOM3YWB+w/
 nOKn9TwYwJusMILuSMLSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TTlfyb7/jjc=:4LodDplBYkCp1E5gwYB7te
 sDlAfaYrGg/NW6YSZUuaZaKR+KehMgIRbRJ7LN3ves8667sqUZFZMgDTe1aMUgI+u0CLEoHDH
 48mZBf0m6W5NR+v0zYx/1Jqge6dB0ynPJoew1NK46NkXGV9qmBZMTQMrPAoz678DdTZWgToI3
 AAEMQFUegljqHPvfBPAgj2FWwRogFtrTr4aSTfkhjOGI7aejRfkNPUT4+/v8uktjUuGJbhCuh
 BNNyVbV4AwAOrbWb4gQwB0Pff6nG9mRhBQlwJgtp1SRR8YJcHxNPUp8yPT4Pu0ze4qtDRCHy5
 J0vLEWd7TJSjfmyL3/hAVl/MZoq0xkdV0bLrTa3aXRHh4mpTwzvqlM/HPI84o8PA32FbYUWy8
 foGpOzFZLulGTwjqLEQ+5HmCNae1xntHG1JMXs7oT0VfhYh3poESdzL5RW7Jco+ikYaCx80fj
 4wKNMK7fk5PxMJIwe0unqpSJig/UjgrEq8g5ouIelUUvFOpthB80f0pmb0a5ADipXkUdB4ryy
 g12mYvO+xQuIorYXsCAHc2dXfqLhzzUhHOyoZLW1N+CKeVKLFgqIGpw2JxtXQVOhzDUpnY1eS
 ThS/IMFcZil1VxN2oUncS9ArdjPg9ic8dQPOZtXdU191EjYTToTWee/fvJFzasFRxNEfvg78r
 Av8WngX9+s4bSkHwtnzITBRnXd5eAzD3v493Rktat2CdSqy69BFk2My05Gpp+aQSouQIXt/Ao
 q7QU9qvcRaOe+Ii9Ckrg1/SDoidEPfAzqzJECsPEOC1s/p+Af0IPCuKETAZlGWXqGHgxNnvJr
 eevQ/np
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 01/11/2022 à 02:46, Han Han a écrit :
> The items of qapi/virtio.json are introduced at a5ebce38576. They will be
> in the version 7.2 not 7.1.
> 
> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>   qapi/virtio.json | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index e47a8fb2e0..872c7e3623 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -15,7 +15,7 @@
>   #
>   # @name: Name of the VirtIODevice
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   { 'struct': 'VirtioInfo',
> @@ -32,7 +32,7 @@
>   #
>   # Returns: List of gathered VirtIODevices
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   # Example:
>   #
> @@ -97,7 +97,7 @@
>   #
>   # @log-size: vhost_dev log_size
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -167,7 +167,7 @@
>   #             Present if the given VirtIODevice has an active vhost
>   #             device.
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -206,7 +206,7 @@
>   #
>   # Returns: VirtioStatus of the virtio device
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   # Examples:
>   #
> @@ -452,7 +452,7 @@
>   #
>   # @unknown-statuses: Virtio device statuses bitmap that have not been decoded
>   #
> -# Since: 7.1
> +# Since: 7.2
>   ##
>   
>   { 'struct': 'VirtioDeviceStatus',
> @@ -471,7 +471,7 @@
>   # @unknown-protocols: Vhost user device protocol features bitmap that
>   #                     have not been decoded
>   #
> -# Since: 7.1
> +# Since: 7.2
>   ##
>   
>   { 'struct': 'VhostDeviceProtocols',
> @@ -492,7 +492,7 @@
>   # @unknown-dev-features: Virtio device features bitmap that have not
>   #                        been decoded
>   #
> -# Since: 7.1
> +# Since: 7.2
>   ##
>   
>   { 'struct': 'VirtioDeviceFeatures',
> @@ -535,7 +535,7 @@
>   #
>   # @signalled-used-valid: VirtQueue signalled_used_valid flag
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -576,7 +576,7 @@
>   #        shadow_avail_idx will not be displayed in the case where
>   #        the selected VirtIODevice has a running vhost device.
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   # Examples:
>   #
> @@ -666,7 +666,7 @@
>   #
>   # @used-size: vhost_virtqueue used_size
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -699,7 +699,7 @@
>   #
>   # Returns: VirtVhostQueueStatus of the vhost_virtqueue
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   # Examples:
>   #
> @@ -767,7 +767,7 @@
>   #
>   # @flags: List of descriptor flags
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -787,7 +787,7 @@
>   #
>   # @ring: VRingAvail ring[] entry at provided index
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -805,7 +805,7 @@
>   #
>   # @idx: VRingUsed index
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -829,7 +829,7 @@
>   #
>   # @used: VRingUsed info
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   ##
>   
> @@ -857,7 +857,7 @@
>   #
>   # Returns: VirtioQueueElement information
>   #
> -# Since: 7.1
> +# Since: 7.2
>   #
>   # Examples:
>   #

Applied to my trivial-patches branch.

Thanks,
Laurent


