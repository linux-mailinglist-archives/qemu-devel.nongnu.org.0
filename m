Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3843BE223
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:37:02 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zIz-0006Lg-VO
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zIF-0005gX-1P
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zID-0004FM-FJ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625632572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5B6YYPRsEJqxNNGukI5cMjj/ptZLGGUFmgJk3BDxpqs=;
 b=eY3dbWtrQm5qBUaZkKJlbUp5WBqAOvmSl7xudiV9HXnbn6uqLcHT2+Q8Beaaxvhhl+ky+4
 xU8h+iEUNUTZtsyg9ZR89oy1DbECbJZfX3gp046ZTPiAJVEVDwdVCBbbZWBdXQYfuBEVbX
 nBqYzMJre8w99c3HsWCLjqkrXhhDnL8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-xPZGIfaXOFayEU5wx6jBkA-1; Wed, 07 Jul 2021 00:36:11 -0400
X-MC-Unique: xPZGIfaXOFayEU5wx6jBkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so404305wmh.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 21:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5B6YYPRsEJqxNNGukI5cMjj/ptZLGGUFmgJk3BDxpqs=;
 b=lorzmG5nJri7ALXu15ZvTxUZX8GK1KBZF3Bp7vD3KrP5FwNRUlTN5cwN+i0qSp2YyW
 ijHq47od1tCS+I1wwlGqFAChcn6QZkuczArCpEIfXypL/X+i+9CdG8yJQX5z/oahx6t3
 cG8vGP1AhLForIAdAJcy5A4KW2WIXvpBEpFJ+GHtxMrWOFe+7H2NraRRa0muZADIR1Et
 TaasBGOxbsn5Ti95EpSHDWbZJJy0Rdq8e9nzN2/ZtcBZfmBezc2TDThSivyQXxiBG5kn
 E2IlrImCdtxGFfHk8z7aq4xQEkDrC4/zWt25c1L+Ex6c2f2XPgpVqroZbrnvX68oQLOX
 +K/g==
X-Gm-Message-State: AOAM532JTRrq01aZybXhy5g0586dwiIXrlmWC3NvdLrse5faGEUiwVCp
 S6aqkFtJTeRNGHzcUiMEcLfXMSd111h+Kef6GvCeWwoJP7FKwd86ySOCO43+qleCwbF44rlIhBT
 lMT7Z82z2Jy1X/3E=
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr4372285wmq.135.1625632570099; 
 Tue, 06 Jul 2021 21:36:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgVU2gt5cZe9vj6ALMrl6sBPIArxWr5Ku6vrK587HliOyZVfk4Yk02mKfgoeBiAbL6jQAB0Q==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr4372270wmq.135.1625632569975; 
 Tue, 06 Jul 2021 21:36:09 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id a64sm3802957wme.8.2021.07.06.21.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 21:36:09 -0700 (PDT)
Subject: Re: [PATCH v1 32/39] contrib/plugins: enable -Wall for building
 plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-33-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <35647c46-fbfc-ad8f-a0de-a50cdec2caac@redhat.com>
Date: Wed, 7 Jul 2021 06:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-33-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 16.58, Alex Bennée wrote:
> Lets spot the obvious errors.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index b9d7935e5e..17e6e2ec4f 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -24,7 +24,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
>   # The main QEMU uses Glib extensively so it's perfectly fine to use it
>   # in plugins (which many example do).
>   CFLAGS = $(GLIB_CFLAGS)
> -CFLAGS += -fPIC
> +CFLAGS += -fPIC -Wall

In pc-bios/s390-ccw/Makefile we're using:

  -Wall $(filter -W%, $(QEMU_CFLAGS))

to also get the other warning options from config-host.mak. You might want 
to consider to do that here, too.

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


