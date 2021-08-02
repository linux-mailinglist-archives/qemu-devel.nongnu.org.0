Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9C3DDFDA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:08:00 +0200 (CEST)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdI7-00017I-4u
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAdDB-0001Yu-5K
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAdD8-0007jY-Os
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uN4dZTMhwOV2WgAT8FsgwaYRIMl0zctPd+clLtvvQ4=;
 b=KSxMQ2Hgz/68HmrVrXKBCO6VPhlVnW0PCeApyjTq72jnCZYFuF2Huit6eMtVS0Dx5B5wVi
 SCfx6cFbeM8SUn4+RLsLBzrRG9kFQmFRHBoqsHHE02h1g5opZySXpdplSxqAr4RdCbd1hI
 NkF3SI91d83c2YgmjBnWeCPWEnwjNc4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-kBYkgsN4OHujeuvfGxOG0A-1; Mon, 02 Aug 2021 15:02:48 -0400
X-MC-Unique: kBYkgsN4OHujeuvfGxOG0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so42269wml.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/uN4dZTMhwOV2WgAT8FsgwaYRIMl0zctPd+clLtvvQ4=;
 b=D3/xT20HakGC7OufkREet1Od+iO49vBcZ36us4IXTQnBWuLrepkPUM+LWzTmGoRxTk
 usDg/hAcphRFVTquCU/Ag0007kiuDoscYKbwcn2jg+XTJ0e13B2XtKoHy3PuqpYic24W
 y8hBDi7rfK4NG9PeWgRQU4FgX7MRQeDAZXZ7Sj9oCZ2DScR0Zr5YjZ000Q27Lp2HWunx
 af4OhVSzLWqYEmuJxD1MnxZ/JP7vogZ6/vPL6iroXT+3kK/D+t8EXqpquhCTMZggDnS4
 cjB+iR0gw3gdWjI+4oYyOIX02AjIjbYdTe20vwdA3JrrDT/A2NXlqGM46qwgQlgyOw6n
 MQpQ==
X-Gm-Message-State: AOAM533cwNjwGsBt7RV2+dkHsjpzChR0xoKK1pyh6WQ0j1Jpqt1OMPTp
 Me9Tp6Z26kM/VUxcp0GaYC5KYKSjMmJGEaVuO0DEXygLDAwkdRmMSWZDf+ZcicTLqN28PbZ6iP1
 wW8EHi4lVrWAAqTE=
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr8068548wme.22.1627930967741; 
 Mon, 02 Aug 2021 12:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyauelXZJ3uSnNcAmWnIHxFtNysTp+p4HmmJc94USSc+T3ji5p4VotmKtgqi7Uoh70qW16buw==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr8068523wme.22.1627930967612; 
 Mon, 02 Aug 2021 12:02:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t16sm2497371wmi.13.2021.08.02.12.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:02:47 -0700 (PDT)
Subject: Re: [PATCH 01/16] error: Use error_fatal to simplify obvious fatal
 errors (again)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <198e6959-2c32-9829-18aa-bd01e7412d7a@redhat.com>
Date: Mon, 2 Aug 2021 21:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cornelia.huck@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:53 PM, Markus Armbruster wrote:
> We did this with scripts/coccinelle/use-error_fatal.cocci before, in
> commit 50beeb68094 and 007b06578ab.  This commit cleans up rarer
> variations that don't seem worth matching with Coccinelle.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/s390x/ipl.c        |  6 +-----
>  migration/migration.c |  7 +------
>  qemu-img.c            |  6 +-----
>  qemu-io.c             |  6 +-----
>  qemu-nbd.c            |  5 +----
>  scsi/qemu-pr-helper.c | 11 +++--------
>  softmmu/vl.c          |  7 +------
>  target/i386/sev.c     |  8 +-------
>  ui/console.c          |  6 ++----
>  ui/spice-core.c       |  7 +------
>  10 files changed, 13 insertions(+), 56 deletions(-)

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4df1496101..0d2db1abc3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2673,12 +2673,7 @@ void qmp_x_exit_preconfig(Error **errp)
>      qemu_machine_creation_done();
>  
>      if (loadvm) {
> -        Error *local_err = NULL;
> -        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
> -            error_report_err(local_err);
> -            autostart = 0;

Uh, odd assignment...

> -            exit(1);
> -        }
> +        load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
>      }
>      if (replay_mode != REPLAY_MODE_NONE) {
>          replay_vmstate_init();

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


