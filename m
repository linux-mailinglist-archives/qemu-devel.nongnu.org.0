Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE2387D85
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:30:57 +0200 (CEST)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2cP-0004Ls-Uf
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lj2ao-0003eZ-Hk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:29:14 -0400
Received: from mail.ispras.ru ([83.149.199.84]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lj2am-0004fN-Ix
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:29:14 -0400
Received: from [192.168.233.227] (unknown [185.102.120.181])
 by mail.ispras.ru (Postfix) with ESMTPSA id 43D9540D403D;
 Tue, 18 May 2021 16:29:04 +0000 (UTC)
Subject: Re: [RFC PATCH] hmp-commands: expand type of icount to "l" in replay
 commands
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210518140855.27026-1-alex.bennee@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ffb09c46-8e3d-64ff-7785-12f1a435b7c8@ispras.ru>
Date: Tue, 18 May 2021 19:28:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518140855.27026-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.05.2021 17:08, Alex Bennée wrote:
> This is not a 32 bit number, it can (and most likely will) be quite a
> big one.

Thanks, I forgot about it.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

> ---
>   hmp-commands.hx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 435c591a1c..5ee9cfd520 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1667,7 +1667,7 @@ ERST
>   
>       {
>           .name       = "replay_break",
> -        .args_type  = "icount:i",
> +        .args_type  = "icount:l",
>           .params     = "icount",
>           .help       = "set breakpoint at the specified instruction count",
>           .cmd        = hmp_replay_break,
> @@ -1699,7 +1699,7 @@ ERST
>   
>       {
>           .name       = "replay_seek",
> -        .args_type  = "icount:i",
> +        .args_type  = "icount:l",
>           .params     = "icount",
>           .help       = "replay execution to the specified instruction count",
>           .cmd        = hmp_replay_seek,
> 


