Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23F514C6B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:08:57 +0200 (CEST)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRIm-0007Hd-Jx
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkRGZ-0005kY-Kd
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkRGW-0002uh-Mz
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651241195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rv9jt2qK5IiJaLWP8ZfizCGhJHRHi914VoE4Z2MhzcY=;
 b=DEBePgUR/fIsofzRe0M5uosNZc5zScNM2pwi3fg/c0kQnQaNnL6+fisdLat1inoNtUhVIW
 +6SgVF9m7aOO55vZ8MHvPV8i2SWnGimKF7WzuEZPdpVCRwV2G7iCUEDTdIQHaT/9xvm+f2
 GaJKzgQOLIYZ+FY0pGzDXZLUyZLNWO0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-KZ0NvVQ_M5qd--DuLsQqCQ-1; Fri, 29 Apr 2022 10:06:34 -0400
X-MC-Unique: KZ0NvVQ_M5qd--DuLsQqCQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 bu6-20020ad455e6000000b004563a74e3f9so6035059qvb.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Rv9jt2qK5IiJaLWP8ZfizCGhJHRHi914VoE4Z2MhzcY=;
 b=51GgwUh9a8RmMRn8cO6pS9YG4H7rNs54PvdtduyuXwh6G5LNTzjhg50AaH0H6qyYag
 ED9Kk4Tn3DSRJMMazgd3xHyuaHVA0/FbGxFFg9S/kVd6ZVVnkOMgd4Fr3p/5kcJYih8m
 LLpsLsWFK+1hGPERnHizP3UpoCls+rNLR5XUzh+7/gS3DVyA80pyV28tzwkIgt0M44lU
 SWr1HjqRCfdS9RW8C1e4fFnWkJ8EqruxD7i3IgHusiqG0JH2GklSrjU1X03WAR+X19HA
 /lSKHbaKBrHHqHRW+MQ4F5QOTaz88X0fAxG7m5WLEsqhJpohnatwXcVOOMTbbmaVfSOZ
 QHEg==
X-Gm-Message-State: AOAM530O1afvgEdx81mO6rHmgDQn54Tlg6XkihncaN2C6bqQRMV9tocM
 JqnCGRgRcieBlxz3MyRiWbPy3/VPCg7+2J+Hpo6WO3Dc+uPMA8AyDjNolTbY/jVJDR7Dy3XGTw/
 OZBe57k3uI9WJSyc=
X-Received: by 2002:a05:622a:15c3:b0:2f2:510:160b with SMTP id
 d3-20020a05622a15c300b002f20510160bmr27184183qty.133.1651241193412; 
 Fri, 29 Apr 2022 07:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNZg9KFEWC8DsGZZ8gRowbikybht6km6sHalOYu9hUTFkOPgVNhfIN3uiFeRLmeRQ/YxDg8A==
X-Received: by 2002:a05:622a:15c3:b0:2f2:510:160b with SMTP id
 d3-20020a05622a15c300b002f20510160bmr27184152qty.133.1651241193040; 
 Fri, 29 Apr 2022 07:06:33 -0700 (PDT)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 l25-20020ac84cd9000000b002f382b88d48sm1613067qtv.15.2022.04.29.07.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:06:32 -0700 (PDT)
Date: Fri, 29 Apr 2022 11:06:29 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
Message-ID: <20220429140629.b3swm26lc3olfhlw@laptop.redhat>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422184940.1763958-5-jsnow@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> Point to this library's URLs instead of the entire project's.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/setup.cfg b/setup.cfg
> index c21f2ce..0a1c215 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -5,8 +5,8 @@ author = QEMU Project
>  author_email = qemu-devel@nongnu.org
>  maintainer = John Snow
>  maintainer_email = jsnow@redhat.com
> -url = https://www.qemu.org/
> -download_url = https://www.qemu.org/download/
> +url = https://gitlab.com/qemu-project/python-qemu-qmp
> +download_url = https://gitlab.com/qemu-project/python-qemu-qmp/-/packages

Afaik (and I might be wrong), it seems that download_url is not
recommended nowadays. External downloads got removed due to some abuse
and problems.

I remember reading about some changes in the distribution of Python
packages in PyPi where, by default, PyPi will not parse and expose
"download_url" for newly registered packages anymore. From PEP438:

"Many package uploaders are not aware that specifying the “homepage” or
“download-url” in their package metadata will needlessly slow down the
installation process for all users."

Please take this comment with a grain of salt, I'm not 100% sure about
this and I might be missing something.

--
Beraldo


