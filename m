Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D02651219
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:39:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7L1Y-0000kg-9B; Mon, 19 Dec 2022 13:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7L1W-0000kT-TX
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:38:02 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7L1V-0002Rk-BL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:38:02 -0500
Received: by mail-ed1-x534.google.com with SMTP id i15so14234460edf.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WgOZm/6nf5v82bvQOde8gUBDTZ6kZIZKHDVoGmIGcRM=;
 b=kjB844ZEE8gPw83peoybjdGe1YbLI6ql99fxuoOuL/25fu7PpS7XsTCuMu8WHgguX7
 PuWsY1aTC/hLWB32JqWBGK0shPZFJYLdMdG5ZIY1XSYn9AXpCkMZjXm6PbE3CGeCPo+9
 22och0lEDFf22gRJ74iPQenRx5ZeVVCuJ9VOCTZjhDvUXS9rbnFPXZBAOYF6Jtosg4uq
 vztjmEwQaIH+ZjjRhrLdIY2s/M70B6DItwEbQFK+ytSlHGj8xv43pSofE6wjPbNsdokq
 d3XA7Mx0LKT5iWH06krKPctP3tOTUjcEN1hWDghpSqHaWnPMDqIKTj8Bh+rdxjNU5Zar
 uXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WgOZm/6nf5v82bvQOde8gUBDTZ6kZIZKHDVoGmIGcRM=;
 b=qL5tskLVE86nQq7/nDUBJVHG5eJ4tk7EuhQiNt1aWyaCN/JqVyhhnORLnQgConGJQ9
 MS36JYLw0axsp5NO6dqd3xZcPxPoT5nfieAWDELw4rTshrlp2TmzqsmIt0gki/9/yGws
 CepxGsvBadmAgWJBTLVbYThC3D49XRZ/gzL8Q7WoatZKWj2l6Hqm5OIdrMb5PymTTfx/
 c/99OYBdZ70T2B+n5lSGgAc0i3fFbg9T+ftzZ9WHlMt38DOUA/FiVA6w16L7sWiPIaAK
 psUG6Qw/04ihoyNRtHj3aYWJzdwjqJ3ckB508AW5B5Yw/iD1QVx9Sfn1ClnDjRmf/Aq0
 fVMA==
X-Gm-Message-State: ANoB5plja4MVhjAyQLCHtMT5vSyej01x1nXJANAC2qluYyzfA+EYuxwX
 n/ITdLP4aMKHiA1925FP6g2WnQ==
X-Google-Smtp-Source: AA0mqf5WAgNleZmTSY0J0wqo/ZfyrLLAA9JlnM3BJFUKn1tqVe523zzGYm89uWGF/R6xyoCMzOhVtQ==
X-Received: by 2002:a05:6402:205c:b0:46d:c48c:50eb with SMTP id
 bc28-20020a056402205c00b0046dc48c50ebmr53398145edb.13.1671475079209; 
 Mon, 19 Dec 2022 10:37:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170906709500b0079800b8173asm4688995ejk.158.2022.12.19.10.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:37:58 -0800 (PST)
Message-ID: <ca6542ba-87de-36de-0e73-173ec421ac58@linaro.org>
Date: Mon, 19 Dec 2022 19:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 7/7] libvhost-user: Switch to unsigned int for inuse field
 in struct VuVirtq
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com
References: <20221219175337.377435-8-marcel@holtmann.org>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219175337.377435-8-marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 19/12/22 18:53, Marcel Holtmann wrote:
> It seems there is no need to keep the inuse field signed and end up with
> compiler warnings for sign-compare.
> 
>    CC       libvhost-user.o
> libvhost-user.c: In function ‘vu_queue_pop’:
> libvhost-user.c:2763:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>   2763 |     if (vq->inuse >= vq->vring.num) {
>        |                   ^~
> libvhost-user.c: In function ‘vu_queue_rewind’:
> libvhost-user.c:2808:13: error: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Werror=sign-compare]
>   2808 |     if (num > vq->inuse) {
>        |             ^
> 
> Instead of casting the comparision to unsigned int, just make the inuse
> field unsigned int in the fist place.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>   subprojects/libvhost-user/libvhost-user.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
> index aea7ec5061d5..8cda9b8f577a 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -343,7 +343,7 @@ typedef struct VuVirtq {
>       /* Notification enabled? */
>       bool notification;
>   
> -    int inuse;
> +    unsigned int inuse;

Another use in subprojects/libvduse/libvduse.c.

Possibly both could be renamed refcount which is more meaningful.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


