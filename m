Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39DC483E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:31:23 +0100 (CET)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fE3-0008VH-1X
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4euO-000319-2o
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4euM-0005fU-DY
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641283860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6B2iiV6eI+sujwMpseBePrcZld45QFA2+OMRsDIDdAE=;
 b=QrMOKc+6Yj8PA5rr2vMCLfjltd1Qe57hgF5cAoQhtE0GAfBALbSiBulQfWjeH5IqEPFJdK
 7ITFotHFv60A/rED3IRKWsOeldmHG35T0IcYUywx6EHblSDHlW/V6qfMnlZ+m9UtDEm113
 ulRB/ty7VPLWoOuYOFJY7Z/YvS1oGDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-Vgg28CT_MFuSNykkArXqPg-1; Tue, 04 Jan 2022 03:10:59 -0500
X-MC-Unique: Vgg28CT_MFuSNykkArXqPg-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso17199638wme.8
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 00:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=6B2iiV6eI+sujwMpseBePrcZld45QFA2+OMRsDIDdAE=;
 b=gd4HNgZpz/14PONHU0NCxY/HGWAM/b+QV3074TZG2in2vr1eIuojqHd7eMSGfKbAHS
 FCquAIBPMoHR7I+2NlcmRNDfuWabNo7PsXFUfHjTd5+15BOicptdsDcPcI0MI5G8tK/C
 xaFgPYFLI4TmMhVZ3SYaesbOxWcVrhkHUyrG6nrT+c+RKemLATfFCYD4s6DiY9WLVA8B
 ep2adPMJvu0VKdRrtqjYuuLWLYXT9VjCck15BuuyF2hA1IHOH2c7APZqS2vqq/R+Mpfk
 lFyFJ38rGuDiZSvQCLKT1gb8llfRX+K3xFOcJYL5bWHgGci6fBJrqDVxW59nxsXoImhl
 s4Tg==
X-Gm-Message-State: AOAM533vikn67JJ3bOG1vkZ4WTUyw1R76MpQ2vxrs/CcsbRi7gfNhwRE
 kMiUZWFebFiqmC2dG1KrDnVHLh8eiG5clEnBRdxvDrGdIxP8vZQEI355MLZLT/+Vy3KfOSF0FWS
 8T86ykMori1G88bE=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr40942842wmq.90.1641283858278; 
 Tue, 04 Jan 2022 00:10:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc0k10pg8xEv+7JmVhCsuPcnDE/mZ0QEgE3cCAf4m0ffPWzv3F+dWE+VZoHtPlJC+pMoEcQQ==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr40942827wmq.90.1641283858082; 
 Tue, 04 Jan 2022 00:10:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id n17sm36549736wmc.32.2022.01.04.00.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 00:10:57 -0800 (PST)
Message-ID: <9ace664b-2396-a338-c59f-35cdbdbde3e3@redhat.com>
Date: Tue, 4 Jan 2022 09:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docs/sphinx: fix compatibility with sphinx < 1.8
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/2022 08.46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> SphinxDirective was added with sphinx 1.8 (2018-09-13).
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/sphinx/fakedbusdoc.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
> index a680b257547f..d2c507904654 100644
> --- a/docs/sphinx/fakedbusdoc.py
> +++ b/docs/sphinx/fakedbusdoc.py
> @@ -7,12 +7,12 @@
>   # Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>   """dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
>   
> +from docutils.parsers.rst import Directive
>   from sphinx.application import Sphinx
> -from sphinx.util.docutils import SphinxDirective
>   from typing import Any, Dict
>   
>   
> -class FakeDBusDocDirective(SphinxDirective):
> +class FakeDBusDocDirective(Directive):
>       has_content = True
>       required_arguments = 1

Thanks, that fixes my issue, indeed!

Tested-by: Thomas Huth <thuth@redhat.com>

I wonder whether we could turn such sphinx warnings during the configure 
phase into a hard failure so that such bugs would fail in the CI instead of 
getting merge without notice...?

  Thomas


