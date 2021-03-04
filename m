Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DE32CC0D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 06:35:49 +0100 (CET)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHgeK-0003VL-0L
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 00:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHgcq-0002fV-Si
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHgcn-00086U-Fm
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614836052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1cI1K6+5ruRoZ1BJOBD/YB0HseDqL915QQ8vQ0doDc=;
 b=ddnn7qX4/pvvdMsRF9uDmIfzALypv7G4ULpl4evW+X+XTLUc6Z1+RVoNB6ClaavsfD8MHu
 MxOPO+gbSkYLtqvy7i9HF3UrOF9nDyLTl3WW1UdOZvRQKenIW/4mFDYPWyzgFEQpjnSjDj
 SWZJHwFt8rvsRRtdnQ6AFxav97IUlEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-KClGj9yPPTygMYTEq9P1Ug-1; Thu, 04 Mar 2021 00:34:08 -0500
X-MC-Unique: KClGj9yPPTygMYTEq9P1Ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80AF0803F4A;
 Thu,  4 Mar 2021 05:34:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 762686F7E7;
 Thu,  4 Mar 2021 05:33:51 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] seccomp: Replace the word 'blacklist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Eduardo Otubo <otubo@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d13b1ca5-6bc1-ce10-6da1-22a524a76867@redhat.com>
Date: Thu, 4 Mar 2021 06:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 19.46, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Acked-by: Eduardo Otubo <otubo@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Reworded comment (thuth)
> ---
>   softmmu/qemu-seccomp.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index 377ef6937ca..9c29d9cf007 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
>       { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
>   };
>   
> -static const struct QemuSeccompSyscall blacklist[] = {
> -    /* default set of syscalls to blacklist */
> +static const struct QemuSeccompSyscall denylist[] = {
> +    /* default set of syscalls that should get blocked */
>       { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
>       { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
>       { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
> @@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
>           goto seccomp_return;
>       }
>   
> -    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
> +    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
>           uint32_t action;
> -        if (!(seccomp_opts & blacklist[i].set)) {
> +        if (!(seccomp_opts & denylist[i].set)) {
>               continue;
>           }
>   
> -        action = qemu_seccomp_get_action(blacklist[i].set);
> -        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
> -                                    blacklist[i].narg, blacklist[i].arg_cmp);
> +        action = qemu_seccomp_get_action(denylist[i].set);
> +        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
> +                                    denylist[i].narg, denylist[i].arg_cmp);
>           if (rc < 0) {
>               error_setg_errno(errp, -rc,
> -                             "failed to add seccomp blacklist rules");
> +                             "failed to add seccomp denylist rules");
>               goto seccomp_return;
>           }
>       }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


