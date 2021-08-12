Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534AD3EA2F6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:28:27 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7wo-0007qJ-CS
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE7vW-00078v-3g
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE7vU-0002ad-Lw
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628764023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJTSNGc73sP7nQywtPVNO11LCzftukAPGyVN5157bVQ=;
 b=EWrm/Vk1tQEYq1uTBaSPnfX/cx4oYDnhDq63vGBwHzF5hjQV2YNmyur11iRHbs/8Kqo8wG
 pq9EZsobFe48qZCiIMfnMdFw0EgR9wrTJ0Zy/OqAFpnCR2pVTrGRIbCtcOCZWxtfjwLi+l
 NA4qYZgzlYZ6oQmJiIEOObG5htx9ZO8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-3zoQlmA4NSSIw_J3dqzSSg-1; Thu, 12 Aug 2021 06:27:02 -0400
X-MC-Unique: 3zoQlmA4NSSIw_J3dqzSSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1686286wmj.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tJTSNGc73sP7nQywtPVNO11LCzftukAPGyVN5157bVQ=;
 b=VPSgdNd+FJJZlLI695wYEek5nCHvnuXvVz1p7sQbXtqizPx1E1uNc7qFDz71GboSXN
 BAAm/km6Xbh+6uq/W/ojzkZcRveyvD/VFlDEWD25SkcYsibDwCV+l6/JaovHxZVGLcIF
 I5Ir2qxfNzcsu/0DmEmK1yV8LoeDOAGf4yGbMqCFiROYTYdHM+TT1tnM71dX0xrd/qVD
 ZFNM2J3p6GzQA3QcyT5MXazCm/fWu/zjuB7Nlzqh53UtZ8T66lXBNhHIERPs54jHm+w8
 oihJ0/gl5RgVW9J02nbMgVBr8y0S5q7dwkM1TC7l6abMexUKR5lHC/ElRvvDfQjScWUM
 GYGA==
X-Gm-Message-State: AOAM530oaDb7LCkxik37fVGkXyxw+3ImsPye1lkCo8i5XDvX0riO93B7
 L7WDaQD72YQEepqmPsuSX5AdUM2nvYkhAA8FO8YJ9wKRB+z24XutOZazu14H7CcfnLZpyqIoFyu
 rNBioq94+qQkof6E=
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr3225033wrx.144.1628764020949; 
 Thu, 12 Aug 2021 03:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBuqgiGGvMUdtesCJWvTbQYnL3+k60Y6KT2HKttkGABXEcN22fDOqdNzMXBaQxViNWx2juCg==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr3225019wrx.144.1628764020783; 
 Thu, 12 Aug 2021 03:27:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b20sm2368616wmj.48.2021.08.12.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 03:27:00 -0700 (PDT)
Subject: Re: [PATCH v3] docs: make sphinx-build be quiet by default
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210812102427.4036399-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9bd6d35b-c635-10f1-708a-aef612335b32@redhat.com>
Date: Thu, 12 Aug 2021 12:26:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812102427.4036399-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 12:24 PM, Daniel P. Berrangé wrote:
> The sphinx-build is fairly verbose spitting out pages of output to the
> console, which causes errors from other build commands to be scrolled
> off the top of the terminal. This can leave the mistaken impression that
> the build passed, when in fact there was a failure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> In v3:
> 
>  - Just set -q flag once in common arg list
> 
>  docs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 300b134329..cffe1ecf1d 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -9,7 +9,7 @@ endif
>  # Check if tools are available to build documentation.
>  build_docs = false
>  if sphinx_build.found()
> -  SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build]
> +  SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build, '-q']
>    # If we're making warnings fatal, apply this to Sphinx runs as well
>    if get_option('werror')
>      SPHINX_ARGS += [ '-W' ]
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


