Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C0447F39
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 13:03:59 +0100 (CET)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk3NW-0000I7-AT
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 07:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3Ky-0007pu-Ip; Mon, 08 Nov 2021 07:01:20 -0500
Received: from eastern.birch.relay.mailchannels.net ([23.83.209.55]:9854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3Kw-0006px-AA; Mon, 08 Nov 2021 07:01:20 -0500
X-Sender-Id: duplika|x-authuser|me@xcancerberox.com.ar
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 780DC620643;
 Mon,  8 Nov 2021 12:00:32 +0000 (UTC)
Received: from cloud.estebanecheverria.gob.ar (unknown [127.0.0.6])
 (Authenticated sender: duplika)
 by relay.mailchannels.net (Postfix) with ESMTPA id EB24362132E;
 Mon,  8 Nov 2021 12:00:26 +0000 (UTC)
X-Sender-Id: duplika|x-authuser|me@xcancerberox.com.ar
Received: from cloud.estebanecheverria.gob.ar (cloud.estebanecheverria.gob.ar
 [67.227.157.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.109.184.200 (trex/6.4.3); Mon, 08 Nov 2021 12:00:32 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: duplika|x-authuser|me@xcancerberox.com.ar
X-MailChannels-Auth-Id: duplika
X-Skirt-Scare: 6070d8342f30e116_1636372830208_2672660993
X-MC-Loop-Signature: 1636372830208:172738923
X-MC-Ingress-Time: 1636372830207
Received: from ipbcc2ffad.dynamic.kabel-deutschland.de
 ([188.194.255.173]:60276 helo=[192.168.1.216])
 by cloud.estebanecheverria.gob.ar with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3K4-0007GS-SO; Mon, 08 Nov 2021 09:00:24 -0300
Message-ID: <2303675e-ebec-9acd-af58-0f9feee5728c@xcancerberox.com.ar>
Date: Mon, 8 Nov 2021 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tests/avocado: Remove p7zip binary availability check
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211106091059.465109-1-philmd@redhat.com>
From: Joaquin de Andres <me@xcancerberox.com.ar>
In-Reply-To: <20211106091059.465109-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AuthUser: me@xcancerberox.com.ar
Received-SPF: pass client-ip=23.83.209.55; envelope-from=me@xcancerberox.com.ar;
 helo=eastern.birch.relay.mailchannels.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 10:10, Philippe Mathieu-Daudé wrote:
> The single use of the 7z binary has been removed in commit a30e114f3
> ("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
> we don't need to check for this binary availability anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20211105155354.154864-1-willianr@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 4ed01ed7893..9c618d4809f 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -22,13 +22,6 @@
>   from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import process
>   from avocado.utils import archive
> -from avocado.utils.path import find_command, CmdNotFoundError
> -
> -P7ZIP_AVAILABLE = True
> -try:
> -    find_command('7z')
> -except CmdNotFoundError:
> -    P7ZIP_AVAILABLE = False
>   
>   """
>   Round up to next power of 2
> 

Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>

