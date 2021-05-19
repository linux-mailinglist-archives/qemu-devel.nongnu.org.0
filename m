Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF8388C61
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:10:12 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljK5b-0004yz-50
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK3e-0003B9-2f
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK3c-0005Nj-IY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621422487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZKaHb4yWbYeoJY6P5K+mCNIQEF9EZfAZKYwiHU5RBA=;
 b=IFA61dlChEvwzdMOh0uPjMUOUsRwjBd08WHFy4ZCCVKnDdrbz7ftVMvjcvolCB8sLkdLRv
 Mp7MUEE3HkMHzzZee2czc57NBngy8/G1r7aWIF3XgkgeW8Wl33oyvHhSeSfUnzHclEn/W8
 t7vT405TpeiHhtIc4KECcvXFcdBSObw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-Cp_wgdbQMvq4jkwxOAnnVQ-1; Wed, 19 May 2021 07:08:05 -0400
X-MC-Unique: Cp_wgdbQMvq4jkwxOAnnVQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 bi3-20020a170906a243b02903933c4d9132so3564999ejb.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 04:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZKaHb4yWbYeoJY6P5K+mCNIQEF9EZfAZKYwiHU5RBA=;
 b=E48yA6Kxv93SpJ69RM5+BGVZ49N7UQythhewNI8p6W1sQdFzO187xRhfZD9Oace9bE
 V0y3Spj4SCx+dnrSw5dQ9e1ZFJiA724TjSh1Dhqg/eypkbIykl9qjFwzkugFsYhGA78S
 91dDqN6fpTQHV+99XpPm4LWWYQpMX6NiVPygTvFtkAsjD345WbyyX3W+r+PS6PiYOHMc
 pvxOKkdfeWZ9na1EzOH0XCbnvZCMj1hcjEz8d1ZzfNnI5MIXbaeHcKIISDWEDXVL1muL
 ypVrDTRe4Hp5qnj0w1GeJUVANCZi75vDhOdsw+E+DtxRiZLHocvcH8bJZ4MLK3DgfYA8
 peBA==
X-Gm-Message-State: AOAM531c+lCDGbuBDwK7dV1zbnI31AAtSGEV4NslPtdReLdXArkw4pwv
 G9UwUshk2fihLDx3CiwfQplTfnXXt8TFjVGSNi808PYxMyKMQZIlOrVZCcyvEi8/rDfOwy0FoBC
 1DZ05G+Rj7GeV2Sc=
X-Received: by 2002:a50:aa95:: with SMTP id q21mr13526849edc.329.1621422484320; 
 Wed, 19 May 2021 04:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypo8iq4jsH2XNG2BeSz/OYyBka286x1EXQXnj1WreyCvtlUkmUwnbsp8oUn2Bf0la1oVLKWA==
X-Received: by 2002:a50:aa95:: with SMTP id q21mr13526830edc.329.1621422484138; 
 Wed, 19 May 2021 04:08:04 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f5sm8590690eds.55.2021.05.19.04.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:08:03 -0700 (PDT)
Subject: Re: [PATCH] configure: Avoid error messages about missing
 *-config-*.h files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210519105719.290435-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acfb4c5c-e491-f4f9-942d-f6d400372927@redhat.com>
Date: Wed, 19 May 2021 13:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519105719.290435-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 12:57 PM, Thomas Huth wrote:
> When compiling with --disable-system there is a harmless yet still
> annoying error message at the end of the "configure" step:
> 
>  sed: can't read *-config-devices.h: No such file or directory
> 
> When only building the tools or docs, without any emulator at all,
> there is even an additional message about missing *-config-target.h
> files.
> 
> Fix it by checking whether any of these files are available before
> using them.
> 
> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 963e35b9a7..a8a9e78c61 100755
> --- a/configure
> +++ b/configure
> @@ -6458,10 +6458,14 @@ fi
>  
>  # Create list of config switches that should be poisoned in common code...
>  # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
> -sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> -    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> -    *-config-devices.h *-config-target.h | \
> -    sort -u > config-poison.h
> +target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
> +if test -n "$target_configs_h" ; then
> +    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> +        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> +        $target_configs_h | sort -u > config-poison.h
> +else
> +    touch config-poison.h

  :> config-poison.h is safer.

> +fi
>  
>  # Save the configure command line for later reuse.
>  cat <<EOD >config.status
> 


