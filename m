Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB01D76F9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 13:25:51 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jadu2-0003iV-7K
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 07:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jadt5-0002Y2-TY
 for qemu-devel@nongnu.org; Mon, 18 May 2020 07:24:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48975
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jadt4-0008Sc-Qt
 for qemu-devel@nongnu.org; Mon, 18 May 2020 07:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589801089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95OJlbsIq+3zM0doJ7T9YqKQycJAvmjcXl5ajA7kBEk=;
 b=VsbWCurpx2w3x7x6bH8sHNFsQWrKtt4SiMXYnNcEKvXzguhOJuY5fFrcL1cWzqVx7Vkb8k
 G4ih7v7hcaq+TVKA+78tjKZhnfbBU0P+xX4RCKrhBFhOzg/xsb7GmOlVoopTriwPx8Kenp
 zGdZAtawDqjGAMwQNXHC89HJE4ZLaQI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-BWI1O0GpOgKu7xeXzo1NjA-1; Mon, 18 May 2020 07:24:46 -0400
X-MC-Unique: BWI1O0GpOgKu7xeXzo1NjA-1
Received: by mail-wr1-f70.google.com with SMTP id q13so5506538wrn.14
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 04:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=95OJlbsIq+3zM0doJ7T9YqKQycJAvmjcXl5ajA7kBEk=;
 b=oA20YOM4qON0TgOBdAAD/UZitiXNU7teyKJQzsSx3RQokl2EUIXFnibYBFrYHxGscK
 CeEESf6czjMPuZndwkecaYo2CEqQVl++TwBGEF9JgK4kjpXaFqTp60HjiBUNNDZ2coVT
 aQ8VL3WhcMGfOQwOz9+3MZzLwbPezuB6FrB0+DxhI/G8UsVTBRolA1nS37pYLFaUCg9p
 J7ikVL9KBkqFHntq9usA1NPpCNdrauJV6bBib9jeSSgLczlvDYYgjVctvmbqPX2KTnI0
 +TEeXZZ4bUR6hq+YsH9NzLEf6ouqpEG7fwbsO5scbzmKuhUSIkaGl3A+Vp4FGoTi4eSD
 Rcog==
X-Gm-Message-State: AOAM533mBc3lXhPKmiCRo61Q3FwmBnDl2wGO6c7wIDKfPej5gEGrb+8Y
 2W307l8mP523oBK3c/zgi45hUgoq/dWDweZZN3/3PIR53JIs9jNywxdArtLbMe+8tRHQ+0ucgGQ
 4FBGNMdIyzwAQYto=
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr20328022wru.95.1589801085171; 
 Mon, 18 May 2020 04:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykODMZpB3pqyppYtEhzNwjKu/E5ALQVTNnIzo2rAkHldj+Mpz3GFPireH/MQ8MdGEim6HPig==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr20328009wru.95.1589801084948; 
 Mon, 18 May 2020 04:24:44 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm16493556wmm.17.2020.05.18.04.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 04:24:44 -0700 (PDT)
Subject: Re: [PATCH] icount: fix shift=auto for record/replay
To: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org
References: <158875154623.957.4036561733593052357.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f87511a-53bb-f37a-a529-c34c9e7da08c@redhat.com>
Date: Mon, 18 May 2020 13:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158875154623.957.4036561733593052357.stgit@pasha-ThinkPad-X280>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com,
 dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex

On 5/6/20 9:52 AM, Pavel Dovgalyuk wrote:
> This patch fixes shift=auto when record/replay is enabled.
> Now user does not need to guess the best shift value.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> ---
>   cpus.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 5670c96bcf..dfb9f4717f 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -379,7 +379,8 @@ static void icount_adjust(void)
>   
>       seqlock_write_lock(&timers_state.vm_clock_seqlock,
>                          &timers_state.vm_clock_lock);
> -    cur_time = cpu_get_clock_locked();
> +    cur_time = REPLAY_CLOCK_LOCKED(REPLAY_CLOCK_VIRTUAL_RT,
> +                                   cpu_get_clock_locked());
>       cur_icount = cpu_get_icount_locked();
>   
>       delta = cur_icount - cur_time;
> @@ -685,6 +686,7 @@ static const VMStateDescription icount_vmstate_timers = {
>       .fields = (VMStateField[]) {
>           VMSTATE_INT64(qemu_icount_bias, TimersState),
>           VMSTATE_INT64(qemu_icount, TimersState),
> +        VMSTATE_INT16(icount_time_shift, TimersState),
>           VMSTATE_END_OF_LIST()
>       },
>       .subsections = (const VMStateDescription*[]) {
> 
> 


