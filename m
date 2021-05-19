Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AE3896D3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:38:40 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS1f-0000gG-JB
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRbv-0007B7-5y
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRbt-0002YR-6L
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uw1zt5uSOgosQ2Qk0M9viRCNNg+X+ToqeljOcLTd8h0=;
 b=RFTkpsZGKqq3J2BQFqqs2UTJcOfkn2TcbrD9aYx1zS8Zw9At5QkXF5m+6TnB7X/yA6jUUQ
 hU0YoVYrofYyIPuA9+pBc+coDcG1y2hrf4jssFqNbr2zd04gdw8mJztzc919VEuKT/heYC
 zku/T1uFDDUQTiHeHKKavQwIAvyP55U=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YnMo25egMDOwInMYMeX4Ow-1; Wed, 19 May 2021 15:11:59 -0400
X-MC-Unique: YnMo25egMDOwInMYMeX4Ow-1
Received: by mail-vs1-f72.google.com with SMTP id
 n26-20020a67d61a0000b029023651d629a4so2433947vsj.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uw1zt5uSOgosQ2Qk0M9viRCNNg+X+ToqeljOcLTd8h0=;
 b=GEO48RnFxjs9WOix/O58ReP60Stcrf5zSEOBCF1qCO/4qqneqRCfyRfGF3Dy/4TeSJ
 t63YpKCCqK88o4PAeH8BvbdXhjPKI7Wc+lD7cPfTr+QbiPXzueRGdsffwvtuL3pzzAzt
 Q3nA5yZLSfVrNJqURCi/xFKfZfCAmOmcyUnj9AbQo04snJrtYYru92lhbNSOGiCEb6lF
 7YNWdOmX468ys+SoTAJXkCqFDgXqH2zOsh9vJv8SPN4bpu7e1I56hxLpuDub3j79weUx
 AWX0ZGkBSJCDIEWTpr4syxRdF3uzNM2ajUwitQMt3U1qbWiDPFI2U3cw1FRg7GRAaOY2
 J6dA==
X-Gm-Message-State: AOAM532I99ij9t9ayyUiFNX5eHxFPDx2lCM1DvpzPgJ0LKS7ih5xRCcQ
 CWpjGpwaUnieQ9hGevtgRxeF+qDa4bV6cbrICj9PSJcNsKeZOOYK7pI4ron6VS8rUsVPOT9TsXM
 1b2xfHlejRDgjajw2vVv7I8QWvIoqDZU=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr1118847vkp.11.1621451518476; 
 Wed, 19 May 2021 12:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+65QCp9vh2FQtyY2V/y2IvKPg6M+GPZJnsUhMi5FR1XD6KYmDVPFyrgPfYNZlrvuEbcuYJwUaew8UX6WC3c8=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr1118829vkp.11.1621451518349; 
 Wed, 19 May 2021 12:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-3-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-3-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:11:32 -0300
Message-ID: <CAKJDGDZf1Ln6sQgtupyT_0_TosMwD790u+uXZWyv+L1xBY55ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] gitlab-ci: Adapt JOBS variable for FreeBSD runners
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> 'nproc' is not available on FreeBSD:
>
>   $ JOBS=3D$(expr $(nproc) + 1)
>   bash: line 119: nproc: command not found
>   expr: syntax error
>
> Instead, use 'sysctl -n hw.ncpu'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


