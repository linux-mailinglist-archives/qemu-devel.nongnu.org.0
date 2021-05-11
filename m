Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650537B02B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:38:37 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZ9I-0004AT-Hx
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ7V-0002C2-GG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZ7T-0001pf-Sl
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620765403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm92PgUtae4Kbqe+Hg3CNCyc+kociQeEhTeK608+7KA=;
 b=SCO7ih5q7EttwEv7ieEOjl5EsMmsFbWnaOvxTjIUlpn0qRjFFMbrxHMYGRZBax9Wb/KX38
 6rWsuywhZ8qxONCa/J0KxDHxhQI6O7xpgiNf+D82nNkcpQwYOqFF3Vctdkv3am7SaHbmTU
 kD2sbre77wuCpCGU1/PeVWJbysCKbLk=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-fRVGRNyDN1amGQdyd0wutQ-1; Tue, 11 May 2021 16:36:39 -0400
X-MC-Unique: fRVGRNyDN1amGQdyd0wutQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 x22-20020a67c0960000b02902259994ab39so10188748vsi.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xm92PgUtae4Kbqe+Hg3CNCyc+kociQeEhTeK608+7KA=;
 b=XfQneqwQF1zpfkwFPL376piJDRFAHRA3qguZlNj+0SIc9dBR8tawql9pqhLA3T60jR
 n6cAyvZP4cQRTfU6vy3wYgzlWbmdo95Tuj7TRUWm9lEEPbzOU1rcg3XdKMjKwsiMra13
 B2iOcP/RIvnvrIkaS6UUry0VYlCv0p7xrYKz/8R2h8p9/nz5KOylQqDQ7lsFnmWOPekE
 F7VH8ZDf024QHYDEtr5lPNiE099tAA2BUrSlx1uP81JXvW2lKe9YmwHpAdAPABfXcM5l
 5qFGPngD9lit1qliAvXInh6GWvDXV+R8549OdpDL4Y4+hVvFXlTy+8v4QQRVdZrmnyK6
 l8Eg==
X-Gm-Message-State: AOAM53167vrwcFmJZYkr8l62Mo6WXs2ftQ1x5Brt1AXVrMA4NExgBF3i
 VLXKWoI6grDBK1rC4OlANXTwUgKTVuGwZjxnhLUHfehMVIRun4ZOuCbOKkRXFl7YTWl8DE+9qBs
 ga9524ohRGtJqnNMS8hWLjK6XLUZTAdw=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr28327123uad.133.1620765399083; 
 Tue, 11 May 2021 13:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfrT7ap6+XyW90e00sD5nRpB0+eP8b8skXkABozcssqTniptRQzMCjWRp2HfPOpXcvGs+fsUMFJiHaaeS/Rr4=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr28327107uad.133.1620765398898; 
 Tue, 11 May 2021 13:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-10-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-10-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:36:13 -0300
Message-ID: <CAKJDGDa_OHdmf+48d75dn=7bwfLHE3L=e4evsw9jAbS0Kv+BOw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gitlab-ci: Extract core container jobs to
 container-core.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> It is not possible to use the previously extracted templates
> without this set of core containers. Extract them into a new
> file (container-core.yml) to be able to build them without
> having to build all the other containers by default.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
>  .gitlab-ci.d/containers.yml     | 17 +----------------
>  2 files changed, 18 insertions(+), 16 deletions(-)
>  create mode 100644 .gitlab-ci.d/container-core.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


