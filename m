Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F67E4E6A25
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:14:45 +0100 (CET)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUn6-0005mH-AJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:14:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUlN-0004lx-3o
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUlI-00033t-4F
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648156371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7z9KSQxRMEaTQHnSc7b9F6KZMA5HMlI7RVRU+IKIsU=;
 b=cvj+vYD5q/XPBXC3mg8TG+Uk1m7FHPFIEb9d4RsI+1O0oPZ3c5Um6sC+MDnXIc10iPls48
 cj55GtSPKHVTQdkVaJT71k8l542KDUkSCdOgaeQIY/RA0RX9NV4WX3/p7FhaOXLK+RwVnf
 8N/DrePkPAuoWybVlqY5xTFiHyaIrV4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-m5bQC-WUOhaJl54D72MUiw-1; Thu, 24 Mar 2022 17:12:49 -0400
X-MC-Unique: m5bQC-WUOhaJl54D72MUiw-1
Received: by mail-vk1-f199.google.com with SMTP id
 v3-20020a056122120300b0033f83d8e254so1158187vkc.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7z9KSQxRMEaTQHnSc7b9F6KZMA5HMlI7RVRU+IKIsU=;
 b=CqihD1OuRPaDdhHCDHWzy47w/mFJ0ovuGErCabyhvgfcrc/6tet4bfNvY+5bqc5Z2T
 MefwkdwttXhTk16jzXE0pakiiFLHSCHsVRCwZWDfora8aYxHuXLgeqEikC5iI2kHs8pr
 ZGiAHyAd5FtGsBBcKM0oVrAtdO8swaXFcyY+KmZkC4c+IFYwY43YZaYesTmFedq3DJSc
 mVjVLxaf4G14n2+nelD6+x99nvd0T49pxR0YLnIahWKkRchuHbQRvE9+u7nqK+VDInuK
 oK754t+kJ49is7zo9Wm6WWbeeXBzXfhfxVVlh93v8KO7UG3v1I9LApUVmyyOJsAsY+f2
 YR7g==
X-Gm-Message-State: AOAM531R2E03dDNF304gx1O9ZTLaj2+oLWF7qHnYuFeexCwnUpJ+iqwt
 3E+X3x042kTNSciwC/iMYxkOgltQwGJxHFzep9de03FiTXE8E15E1luQvjOTTBtm3HlC98xHT9V
 BFyKvzedtIAN9J3szptmMU5UZS8zbP5U=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr475239vkd.3.1648156369362; 
 Thu, 24 Mar 2022 14:12:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCKKFDglU47eJz0ZwdaAeIgZ0Z9ZSFbyKXFwKkXpmlF9DURKdLSIczh3E5dkQNutSn/ESQoqR3w/viV2eGoU4=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr475231vkd.3.1648156369182; Thu, 24 Mar
 2022 14:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-10-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-10-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:12:38 -0400
Message-ID: <CAFn=p-bFnbzieReJN=mZuUKzExpVaowW4d0kTUKRMVf_HdDSmw@mail.gmail.com>
Subject: Re: [PATCH 09/14] qapi: run-state examples: add missing member
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> As reason member in not optional.

Suggest:

"The 'reason' member is not optional."

I also like how you included the type/structure name in the other
commit messages, can you work "SHUTDOWN" into this one?

>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/run-state.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 43d66d700f..1b9f64c9cd 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -150,7 +150,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "SHUTDOWN", "data": { "guest": true },
> +# <- { "event": "SHUTDOWN",
> +#      "data": { "guest": true, "reason": "guest-shutdown" },
>  #      "timestamp": { "seconds": 1267040730, "microseconds": 682951 } }
>  #
>  ##
> @@ -188,7 +189,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "RESET", "data": { "guest": false },
> +# <- { "event": "RESET",
> +#      "data": { "guest": false, "reason": "guest-reset" },
>  #      "timestamp": { "seconds": 1267041653, "microseconds": 9518 } }
>  #
>  ##
> --
> 2.35.1
>

With commit tweaks:

Reviewed-by: John Snow <jsnow@redhat.com>


