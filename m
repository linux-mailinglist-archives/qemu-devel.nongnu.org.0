Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816A42A5D3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:38:29 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHz9-0008Df-VM
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maHw6-0005tO-Qr
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maHw3-00058i-OO
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634045713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvugbAr22Z+87FxBBheKoB1F2jXHjTWvWTSQXxghx8E=;
 b=T8ynoaOOjwb1hpTHSAvELPGw0yAMAtSmtOTLIzGvGwuVrp5YIGZStU5preOfDFXNys50XN
 laYOViH9JmZX679BAAGPgvR5TR0VJ1yHEMw0l5PHhh3bO3P9f8TlZcfDI0U833wJnOlS9Q
 nFQkzkbxpEdISk1lkAgYLzCmPd8wuCQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-VB9UbpO4MReu9oG-gAyYfA-1; Tue, 12 Oct 2021 09:35:09 -0400
X-MC-Unique: VB9UbpO4MReu9oG-gAyYfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso18877433edj.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvugbAr22Z+87FxBBheKoB1F2jXHjTWvWTSQXxghx8E=;
 b=67wK9fIu0lBTMpbxw5LTUgoFYjofgTmf+//WALBaDZJhF+9zuNNC5Y93LYx6onyLPg
 V22GgL3ub6Cs2WcG/QBNCRfLIN9IlYuLoxfeLj/Bu2lb7mmbkE+rkK7h5SyyTyN9oi+4
 HH1BSMokk1h4H1/6z4KNG/1Bilz4lym1DpoP+2pluffWlH+8oEO+YAncwEqauBwhPdf1
 ndibegb7YAnXgKZ6m91y2YUGMQEmrpKmpvvdfaYcEREVRHfQCPCSzX7ela6+xqvbL+Ty
 SczZEPyfsTZiORbAA1Tx/EU9wchjVa1sP+wZrT6K0o/ybUuLg69iDLAHPtmHkIqXXHKv
 0K4w==
X-Gm-Message-State: AOAM531B3ebE59OEQqe1kwY5VXX7vF6AlquFEe7wASoYD5aJW+8ThfpE
 E6kmgZXwPeDvusxe7fslydJzjPuMzah55ZmPmH+lTjMXTHDGLJ6/eTyOQII+ZPaS4h4Il2l5Jf+
 aqX6y3taoI5XYuGY=
X-Received: by 2002:a17:906:46db:: with SMTP id
 k27mr12227202ejs.436.1634045708176; 
 Tue, 12 Oct 2021 06:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI+tgksWT4bgJ3tSwe+ol4D+K113QZG32tYfNuw6c08oVLZ2SoQPeNvhQDatQPyFyIcQVA/A==
X-Received: by 2002:a17:906:46db:: with SMTP id
 k27mr12227163ejs.436.1634045707917; 
 Tue, 12 Oct 2021 06:35:07 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id k15sm3599868eje.37.2021.10.12.06.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 06:35:07 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-15-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 14/24] configure, meson: move pthread_setname_np checks
 to Meson
Message-ID: <c7c6aeea-9fb7-200a-43ac-2a257b3cfc01@redhat.com>
Date: Tue, 12 Oct 2021 15:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-15-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> This makes the pthreads check dead in configure, so remove it
> as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-9-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                | 78 ----------------------------------------
>   meson.build              | 23 ++++++++++++
>   util/qemu-thread-posix.c |  5 ++-
>   3 files changed, 25 insertions(+), 81 deletions(-)
> 
> diff --git a/configure b/configure
> index 52f89b05d6..a1e142d5f8 100755
> --- a/configure
> +++ b/configure
> @@ -3146,71 +3146,6 @@ if test "$modules" = yes; then
>       fi
>   fi
>   
> -##########################################
> -# pthread probe
> -PTHREADLIBS_LIST="-pthread -lpthread -lpthreadGC2"

Looks like the variants in PTHREADLIBS_LIST were not taking into account for 
linking anymore since the switch to meson? Are there still recent systems 
around where this is needed? I guess not, otherwise people would have 
complained with QEMU v6.x already, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


