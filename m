Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2423B486AA5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 20:48:33 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5YkR-0006FC-O4
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 14:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5YgY-0004GB-RQ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:44:30 -0500
Received: from [2607:f8b0:4864:20::42a] (port=37768
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5YgW-0000Q2-Sx
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:44:30 -0500
Received: by mail-pf1-x42a.google.com with SMTP id p37so3380390pfh.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 11:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1kCcktnWT/wWl/YBKHyVHLbTh6QvRWRF2R0wpohYdVE=;
 b=H5RDFk8dFQeybC3eaVNqdzDClpsI+SI5GRBMXEO+jL6LkfcrGfSlVKA3M7e2/l1PGN
 +CFCyO5amiE+bkAQSd1iQmCXpFifp/6CWXEq4Bf5TQf2yA4cfWx5/em5prJAr3GJva17
 nubIHxVBBP/AeOsLxsxXiUDuZKJ828VizMxgeSmRgFk9knpIs7TpQbf3150p0SDb1aHo
 y7k5sTZxqI+RTDJ07RVPzASsPDm56rLO3V1+Cjxek/ixZj/IphQ5QPGnK30MDgUrdaaz
 MNJn7HC5hk4rm4n/tKVmfAMbEYk2vFwmUITO9Rm0MJ/8frs1R6KPcJRwA8ezXNWTViYp
 m4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1kCcktnWT/wWl/YBKHyVHLbTh6QvRWRF2R0wpohYdVE=;
 b=QznbCpJuoDygkX7vxvBgtga8sD8IJ7OwLduquxjzXpktSSuHhMfwYxSpfs8D3NIN3Y
 1nYmRaxiO2L4uCfgTf9dFI7jJlgPs+BLG5jh75QV0NamtUHZcU5D6MalwrUiv9UVQyNq
 tovn4xXzlEtYm3Lel9Oi8Ae4Eyw0pQNa60YiDkjeYyqurm1/u7DAf/YL+HxY/h2N3ox1
 v27qd158dTG4miPPR5hOYnfEu18JYQ4vxB2XtT4wOj7k0w6M9dG8ADUBGFr4jT5S6YiK
 IGt6kxPSCbUUP5M70bigXtazr2N8I1qYfhWDFgMDIy1rCDeU+SSgiWBUm3ac7wSVyrRM
 9pxg==
X-Gm-Message-State: AOAM5307Gw0VPHAKv5q0WZwipp5gLc6w/BhQd+OnT3Z7meo36VSdK85R
 7XvzHQIit3dfIe8Up0n/U0A1N5lRYIZiKw==
X-Google-Smtp-Source: ABdhPJzDTWxGAaJHWNcbO7zLZx2aEnSEHFHG6RxswxELT+/hSW61PiVCsuMXOP7Pa5aPhOby3ZwYMw==
X-Received: by 2002:a63:7f58:: with SMTP id p24mr54298439pgn.109.1641498267506; 
 Thu, 06 Jan 2022 11:44:27 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id s7sm3663613pfu.133.2022.01.06.11.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:44:27 -0800 (PST)
Message-ID: <051681aa-5a02-d096-f5e2-be828407face@amsat.org>
Date: Thu, 6 Jan 2022 20:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] net: Fix uninitialized data usage
Content-Language: en-US
To: Patrick Venture <venture@google.com>, jasowang@redhat.com
References: <20220106182851.3583896-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106182851.3583896-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, Peter Foley <pefoley@google.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 19:28, Patrick Venture wrote:
> From: Peter Foley <pefoley@google.com>
> 
> e.g.
> 1109 15:16:20.151506 Uninitialized bytes in ioctl_common_pre at offset 0 inside [0x7ffc516af9b8, 4)
>   1109 15:16:20.151659 ==588974==WARNING: MemorySanitizer: use-of-uninitialized-value
>   1109 15:16:20.312923     #0 0x5639b88acb21 in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c:183:9
>   1109 15:16:20.312952     #1 0x5639b88afd66 in net_tap_fd_init third_party/qemu/net/tap.c:409:9
>   1109 15:16:20.312954     #2 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
>   1109 15:16:20.312956     #3 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
>   1109 15:16:20.312957     #4 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
>   1109 15:16:20.312958     #5 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
>   1109 15:16:20.312960     #6 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
>   1109 15:16:20.312961     #7 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
>   1109 15:16:20.312962     #8 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
>   1109 15:16:20.312964     #9 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
>   1109 15:16:20.312965     #10 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
>   1109 15:16:20.312967     #11 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
>   1109 15:16:20.312968     #12 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
>   1109 15:16:20.312969     #13 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
>   1109 15:16:20.312970
>   1109 15:16:20.312975   Uninitialized value was stored to memory at
>   1109 15:16:20.313393     #0 0x5639b88acbee in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c
>   1109 15:16:20.313396     #1 0x5639b88afd66 in net_tap_fd_init third_party/qemu/net/tap.c:409:9
>   1109 15:16:20.313398     #2 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
>   1109 15:16:20.313399     #3 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
>   1109 15:16:20.313400     #4 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
>   1109 15:16:20.313401     #5 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
>   1109 15:16:20.313403     #6 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
>   1109 15:16:20.313404     #7 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
>   1109 15:16:20.313405     #8 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
>   1109 15:16:20.313407     #9 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
>   1109 15:16:20.313408     #10 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
>   1109 15:16:20.313409     #11 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
>   1109 15:16:20.313410     #12 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
>   1109 15:16:20.313412     #13 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
>   1109 15:16:20.313413
>   1109 15:16:20.313417   Uninitialized value was stored to memory at
>   1109 15:16:20.313791     #0 0x5639b88affbd in net_tap_fd_init third_party/qemu/net/tap.c:400:26
>   1109 15:16:20.313826     #1 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
>   1109 15:16:20.313829     #2 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
>   1109 15:16:20.313831     #3 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
>   1109 15:16:20.313836     #4 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
>   1109 15:16:20.313838     #5 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
>   1109 15:16:20.313839     #6 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
>   1109 15:16:20.313841     #7 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
>   1109 15:16:20.313843     #8 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
>   1109 15:16:20.313844     #9 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
>   1109 15:16:20.313845     #10 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
>   1109 15:16:20.313846     #11 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
>   1109 15:16:20.313847     #12 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
>   1109 15:16:20.313849
>   1109 15:16:20.313851   Uninitialized value was created by an allocation of 'ifr' in the stack frame of function 'tap_probe_vnet_hdr'
>   1109 15:16:20.313855     #0 0x5639b88ac680 in tap_probe_vnet_hdr third_party/qemu/net/tap-linux.c:151
>   1109 15:16:20.313856
>   1109 15:16:20.313878 SUMMARY: MemorySanitizer: use-of-uninitialized-value third_party/qemu/net/tap-linux.c:183:9 in tap_probe_vnet_hdr_len
> 
> Fixes: dc69004c7d8 ("net: move tap_probe_vnet_hdr() to tap-linux.c")
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Peter Foley <pefoley@google.com>
> ---
>   net/tap-linux.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 9584769740..5e70b93037 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -150,6 +150,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>   int tap_probe_vnet_hdr(int fd, Error **errp)
>   {
>       struct ifreq ifr;
> +    memset(&ifr, 0, sizeof(ifr));

Or:

        struct ifreq ifr = { };

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   
>       if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
>           /* TUNGETIFF is available since kernel v2.6.27 */


