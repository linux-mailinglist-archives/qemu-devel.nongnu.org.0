Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D63408A9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:20:44 +0100 (CET)
Received: from localhost ([::1]:35178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuS3-0006JV-HZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMuN0-0003PP-Jq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMuMx-0006PI-KY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616080526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUksXG3Roj7YFDjOyYsqm/VvXrn2teaj/1sb67Hdd2U=;
 b=NQj+oVERPEjTkNA7S8UTQoJ/yuJ4RyDsQ8q+2HgFeOMwBKsNCeNQhPaLHWOzYkJdDsV6g2
 SdEElfgVsWidv2sCNaulXZjvilCNLc4KpcXjvH38yZeHSiknjdrxaNYSljLPQK2f1/kuE2
 LFtwyXg28HGZtPd/FcbSd7jkg/Ahe1s=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-sH9kWQI5NjObvj9OoDu2Tg-1; Thu, 18 Mar 2021 11:15:21 -0400
X-MC-Unique: sH9kWQI5NjObvj9OoDu2Tg-1
Received: by mail-oo1-f72.google.com with SMTP id h18so21139531oot.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mUksXG3Roj7YFDjOyYsqm/VvXrn2teaj/1sb67Hdd2U=;
 b=bN//8ylLWTZcqeZk96iYis46kUCEBjDp4VzMdNCQtmygbz/qlrjVH7PTO/IJnTxjF2
 /RcKGAjZeQyweRQP9h1oCax6/rO64KM3HTh0zplqmdBnWQUQCU4H6D0MGZk5VgTCw7lG
 GX0r4ZZcgZiQwVa9wYkPVpaH8kU9DlKJy1dQIfshAmVnrE/Sek3GKJHoY2nsXOHNzbiw
 YXZhnYiRDeNhggrMNaQKbWqlf8+HbT1i3Wynw+3NXy1WpcA4OA4+KEJGIgSBqld4LURG
 c+2s6p+Zze2yFbKV+3+e3xuRV5AyyYkavtcZaZVCZmRCe5+a1Vc5oX/oB+ZekKTkuJpO
 7UFA==
X-Gm-Message-State: AOAM530Tx97UR20RCs1uck28aqafRDKDtjse4nTElf9C5vOr5Etasf3u
 uZE7n5Hgu7790UnuEWxDbgs07w/4NjhrNTSEdRJ/YxQ1iYl/JVGrRVMO52LqI5mCtNbKb9oQb7q
 uOoexCVqjQ3GQfmM=
X-Received: by 2002:aca:1904:: with SMTP id l4mr3455235oii.159.1616080520754; 
 Thu, 18 Mar 2021 08:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Opx8UQfmL2RnCZ6om+pcpTVtp3RJJz9U2nA/ehvt5IGTtB78QwhIv+a8B6jS7oMNoKYbsw==
X-Received: by 2002:aca:1904:: with SMTP id l4mr3455222oii.159.1616080520536; 
 Thu, 18 Mar 2021 08:15:20 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 y200sm561856oia.49.2021.03.18.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:15:20 -0700 (PDT)
Subject: Re: [PATCH] tools/virtiofsd: include --socket-group in help
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210318100911.16261-1-alex.bennee@linaro.org>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <cca0d1bf-5901-cdc4-5b63-ba4376b57f32@redhat.com>
Date: Thu, 18 Mar 2021 10:15:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318100911.16261-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 5:09 AM, Alex Bennée wrote:
> I confused myself wandering if this had been merged by looking at the
> help output. It seems fuse_opt doesn't automagically add to help
> output so lets do it now.
> 
> Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tools/virtiofsd/fuse_lowlevel.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 1aa26c6333..58e32fc963 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -2450,6 +2450,7 @@ void fuse_lowlevel_help(void)
>       printf(
>           "    -o allow_root              allow access by root\n"
>           "    --socket-path=PATH         path for the vhost-user socket\n"
> +        "    --socket-group=GRNAME      name of group for the vhost-user socket\n"
>           "    --fd=FDNUM                 fd number of vhost-user socket\n"
>           "    --thread-pool-size=NUM     thread pool size limit (default %d)\n",
>           THREAD_POOL_SIZE);
> 

And it looks like this is already in the man page too, so I think this 
patches the last place it was missing from, nice!

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


