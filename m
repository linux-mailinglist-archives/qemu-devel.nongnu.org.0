Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D13706BD
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 12:00:17 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcmQ3-000457-VJ
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 06:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcmOf-00037j-Gp; Sat, 01 May 2021 05:58:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcmOb-0005qn-OD; Sat, 01 May 2021 05:58:49 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbAYo-1l1Wpi1p3A-00bYM7; Sat, 01 May 2021 11:58:30 +0200
Subject: Re: [Trivial] docs: More precisely describe memory-backend-*::id's
 user
To: Robert Hoo <robert.hu@linux.intel.com>, mjt@tls.msk.ru,
 qemu-trivial@nongnu.org
References: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fd3f6329-2eb3-9a75-0337-2c927447528f@vivier.eu>
Date: Sat, 1 May 2021 11:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oi95i08pVMJMmLJvPMaZ8dVFJENnUMQG5MJPEhBQGcPk/YZILm8
 KT4nwj7mcRorwL1wm916ftfwhICwxAJ+ociS0U2HYSRi7qZsqV4M2eZ9/0gPfpwVW/GmDL8
 7Cd4CDYN1zByEBJKhE2z3eWW/sUejPsb1oyZPFLoESh6WsizsjAxHxuagGcU3R0EeLEfETI
 oekKVVhENdcmIVcATCn1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B/ZHnJy6nQw=:VJZz8LOdd9k1uSgGEj/Nw+
 jnHtRNeSrk8yZ7GAcnVWDkhcEqIqouXx/kz5ui/YB1C0UXvZEw5zAjzYxQTyTVdIbzysMfCKU
 4ocdsT7sh0LSWazWmQyNKe9asfpMCzSr/TLZJpt4CIic6bwgkLb9wZAH5TzTf0ai71044EJ2w
 bR01MtEiEN2jeeZL277c3ar4PmVzLGLyTS5UYspRQtP32PeMfyXMAIEDl3/vdtsq3BGyjSFNe
 F/vRW2ZR4hhwGhUThJYZ/r2nJRrGt4GEj4q1va0gPHEhbcjvVVt5d7aXmjyiAbR6WSzlK4/Du
 4kVxCukQou5uWB/Pd9wHZ6D82+rdE6gDCgg1yaMYR0HdSBMbIzhmqHgfSlThmH0ZetM++AS54
 RmkTLo0DBIZuvqVhT10r2tBEd6txQqPFZcqzaxX47Z280qZstsLOKSdIVk5G991wd9uQ8F2Dp
 MkCp5274f+JVul8Cqti+frtKGHJ1VXNYoGqPLXh+cuZ4/1KNuyV93WdaePu/oUKOFJmAFvo3v
 FREn2MeQCb/1jRywdrWuWo=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/04/2021 à 10:42, Robert Hoo a écrit :
> 'id' of memory-backend-{file,ram} is not only for '-numa''s reference, but
> also other parameters like '-device nvdimm'.
> More clearly call out this to avoid misinterpretation.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> ---
>  qemu-options.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002..635dc8a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4508,11 +4508,11 @@ SRST
>          the guest RAM with huge pages.
>  
>          The ``id`` parameter is a unique ID that will be used to
> -        reference this memory region when configuring the ``-numa``
> -        argument.
> +        reference this memory region in other parameters, e.g. ``-numa``,
> +        ``-device nvdimm``, etc.
>  
>          The ``size`` option provides the size of the memory region, and
> -        accepts common suffixes, eg ``500M``.
> +        accepts common suffixes, e.g. ``500M``.
>  
>          The ``mem-path`` provides the path to either a shared memory or
>          huge page filesystem mount.
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


