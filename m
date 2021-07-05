Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9F3BBE65
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:49:17 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0PuO-0006Pn-Ih
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0PtC-0005Ab-9d
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Pt9-0008GO-Ix
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625496477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAXECgbumfPeFXaTMksfsfnAP3Fbg9BJdBQOlFRgOQI=;
 b=epdTlYnSgMKWLFKx9qCQw3hV9DdTfVJgflbF4yJLXCkNSTeNqIOYSZHX6QjbuYcg1KvvVz
 hCox6YkOWSU0RTGMCTNnpG7fGnq8GaXjkwirRrh8w/WEcVBlZambUPhwLSpp0stgTQbJDx
 4jv9y1V0LJ64k/Ryg3YNhM6iczeLtN8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-IAc9TxPYOfutAIYwZvuoXg-1; Mon, 05 Jul 2021 10:47:56 -0400
X-MC-Unique: IAc9TxPYOfutAIYwZvuoXg-1
Received: by mail-vk1-f200.google.com with SMTP id
 s201-20020a1f5ed20000b0290257535f6335so2025833vkb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAXECgbumfPeFXaTMksfsfnAP3Fbg9BJdBQOlFRgOQI=;
 b=EuhZona/HwQgqZsa1aKN9ETyzMazxF2cjsACkDnixLSNvvI4Aly7uDXQhunXnSOQAg
 ZBocrONGycxHYMg7F80l/xRGnK2LIL8gTpgJEfEID0WS3uXJE4/ylZy2QpoPS3jeyrlD
 GTQlcyKB3fMA7z61sqyz6RKXqPDdlIj4lzkOy606dXgebVM1Cmfnxrq15zD9SjXRCv1c
 C45kqIRoUTCdNkMpHQRsld0cpx7w16BWskCdCwM87f4GlfEwvN6q7JfoxoRsxg+emkj1
 5YDKr67pTFGf3FYFtgKaW+tjMTCFyXsyhOzvjygtSDHQbddm4vErmQZBRTQEN35qKsek
 mliQ==
X-Gm-Message-State: AOAM5320yg8hA38Xf/vfeG/sl0s3k7ap7uurA7RpufVVDXRq21DtJjPk
 /GuqgtKkQYZV4pKbZWuqa+MeRJPGQd0AZ9U5jndPdxI0vz+hXarUzpS2E00kADj/MOjB7n6ouB3
 1Z1jH9oXuPMR1iamXr+9xouLE/Fn4vkg=
X-Received: by 2002:a05:6102:3008:: with SMTP id
 s8mr1979361vsa.50.1625496475782; 
 Mon, 05 Jul 2021 07:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzytk0FTS6iUm1FoU1XQEB9ipZ+Nncm3U2Y/fyAnL9gZYN0M5Hettl5lCYrl8FWgtFkJ/OWLMVlHy3KqS5bNdo=
X-Received: by 2002:a05:6102:3008:: with SMTP id
 s8mr1979354vsa.50.1625496475692; 
 Mon, 05 Jul 2021 07:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210623091137.1156959-1-kraxel@redhat.com>
 <20210623091137.1156959-4-kraxel@redhat.com>
In-Reply-To: <20210623091137.1156959-4-kraxel@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 11:47:29 -0300
Message-ID: <CAKJDGDYJxGJzrERft9_s2MG+45mpHfG9L8TVudHFt7akr4agoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ci: build & store guest agent msi
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 6:12 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Build guest agent windows msi install package in gitlab CI,
> store the result as artifact.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml               | 3 ++-
>  .gitlab-ci.d/crossbuilds.yml                       | 2 ++
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


