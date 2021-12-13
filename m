Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A75472BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:47:04 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjnK-0004oF-CZ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:47:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mwjlo-00041U-3B
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mwjlk-0003Td-Ap
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639395922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1eAtDyIKhlHk3b+qcnElmoKvyRYlWsAnvqlFgJ3i5k=;
 b=YUnEo4qtnmNpdRC25yOUoHdBSqvpJb59k1hi13ayBU/0U0sbWUFSjtVvIoj0/Atwo6DjNQ
 5QGH5rhbJ4hFitmxdWbn6FJUnX6LoMHhX18qTRGyhXK+rvVt4xBsgnEeN/fTj/3DXaPZcg
 Bh3sTXUgTJ3rTkbr5ZL0fuxjCrGjpek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-zC5CZzSJOlaCoaklcqrHIA-1; Mon, 13 Dec 2021 06:45:21 -0500
X-MC-Unique: zC5CZzSJOlaCoaklcqrHIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so9487738wmg.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G1eAtDyIKhlHk3b+qcnElmoKvyRYlWsAnvqlFgJ3i5k=;
 b=UiVEYH/BjAEQ7vzS5jnxYVv8x2PbocyDo1tb0lPwlNJU5qTi3qlIYIB6S3TCMzHeNY
 YKJGdqzFeo84GABL58W/9L4FYUPpB0+WtCSY/W1Xg4jIVaIn0eIBJfPWiyHeNkmyab6p
 NAhNpSfswYN5P8at8FFkyKhUzh0rl3OE8vfrOpk7lokOePk11iBc5DJYP0p/hXL7b7Y2
 ykpL/F1bvarEWMEZRcFJSvsLmxxiyyjwHjaTaN2ElWdACHIQL+rOEBYf9cEBH5FOkk60
 nGo+tVVNlmS8f056H4kf2i/13p9l/+Vc1BKiWKEshSjIb885R9+1UTmYzMMRkEb8rCgo
 Un1g==
X-Gm-Message-State: AOAM5322O6p99Aw9vrUI0ZY3uuhxvPoK7wS12Qn5AX2sQUXZesiMOY7k
 GoYv3tE3lcf51pJmFW55rh+T2fkqdcKlEYYE60sQ9Y6UIjNzFMwUkl0MF8QWgHeS2atoJM+nB5+
 NwMCqz1phFBEpkL0=
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr31713199wry.360.1639395919776; 
 Mon, 13 Dec 2021 03:45:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhLE5kCjdq3rWgK4WtGPXkhcnC6dPLLRfn1Eh1KbGBZPG0PtkIl/pNNLdaQCL6eZQhA3BGCA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr31713180wry.360.1639395919533; 
 Mon, 13 Dec 2021 03:45:19 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id q4sm10348234wrs.56.2021.12.13.03.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:45:19 -0800 (PST)
Date: Mon, 13 Dec 2021 11:45:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH] COLO: Move some trace code behind
 qemu_mutex_unlock_iothread()
Message-ID: <YbcyTCoQkUP19SGa@work-vm>
References: <20211210221435.142472-1-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211210221435.142472-1-lei.rao@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Rao, Lei (lei.rao@intel.com) wrote:
> Signed-off-by: Lei Rao <lei.rao@intel.com>

You don't say why you want to move it - it's just a trace, what's the
advantage?

Dave

> ---
>  migration/colo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/colo.c b/migration/colo.c
> index 2415325262..3ccacb29c8 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -683,8 +683,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>  
>      qemu_mutex_lock_iothread();
>      vm_stop_force_state(RUN_STATE_COLO);
> -    trace_colo_vm_state_change("run", "stop");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("run", "stop");
>  
>      /* FIXME: This is unnecessary for periodic checkpoint mode */
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_REPLY,
> @@ -786,8 +786,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>  
>      vmstate_loading = false;
>      vm_start();
> -    trace_colo_vm_state_change("stop", "run");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("stop", "run");
>  
>      if (failover_get_state() == FAILOVER_STATUS_RELAUNCH) {
>          return;
> @@ -870,8 +870,8 @@ void *colo_process_incoming_thread(void *opaque)
>          abort();
>  #endif
>      vm_start();
> -    trace_colo_vm_state_change("stop", "run");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("stop", "run");
>  
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
>                        &local_err);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


