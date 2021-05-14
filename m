Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E1380F35
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:46:54 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbtl-0006k7-16
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbi4-0001cx-1Q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhbi0-0000l0-Gz
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdL5cKEDtfvsIr7V29GU8p8hD/MKRbNJTq1+Rvacsqw=;
 b=KiOEolajYXcmsbLBjCYk9KzcT3qgcYLa5v1oC2E77sOTUAPss9T4rGXyJr59q8mxQ3NKjx
 yLxj0WvnZ3RCYyG8g7ceA85xPebREfKV9UBsBVBY62c6zK7D2v5q/Zg9f2ngeAwsmfChqo
 7jd+raIhfUbPtF9/3n4lC5nWu9PYFhM=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-FfFvoM5tOPO0DH-1r9Z5Rw-1; Fri, 14 May 2021 13:34:39 -0400
X-MC-Unique: FfFvoM5tOPO0DH-1r9Z5Rw-1
Received: by mail-vk1-f200.google.com with SMTP id
 h6-20020ac5cbc60000b02901fbf6b5cd7eso102098vkn.15
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NdL5cKEDtfvsIr7V29GU8p8hD/MKRbNJTq1+Rvacsqw=;
 b=UrWUdvmmUKfFFYtoFaX3TnXzoIv1cgaxZuTu6oIookr37oXl3wJriL0z+w5Y4BKpAl
 Wcs0yzGrFMKvxCqJ2d2Yme7mkjbsprRwHx/yFsQB6vDAhQLSrsnhWZq98mH1iBSGgVxG
 itO4zoeV0L7Uqml900Q/h3ijcnFMsZY9E/naulYhoxtKj959ksHFFiYNlFIc5f44nEpr
 U7FvjM54sOEI1jCkExXi5JGDTX2xwkEJdL7QNFgmBAnrmZxmCNyutAXN9OEPGh1rcxCr
 1KvP0mdAekCw06RBRCV954SQYp5kzmYBT+jmo+nWq5OYcBA5S033xrFv9ej2nauU1uNi
 s1Mw==
X-Gm-Message-State: AOAM532kJPtI53g9AqY/vmw/+6H8jll/rhtlw9mqY0STmvMy79OJVNnO
 W2wNgkKgjrIncuZFaJ9B1ywTW74wyhpaNU39zazecv1kbkyryu4PsQsbxogoxjZggGBZsHZ6zEq
 VeTeP/DiTuOWR9xtFNBNZbpMKEIdnrkY=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9350593vsi.45.1621013679084; 
 Fri, 14 May 2021 10:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyERNX1NRAMdc4iscEUuVT8lY1L0A69snf1pqzMq4MCM4FqiOpnsGkQVi8M1OYiwFGOW9UOXVXSBRpzgyOokNo=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr9350581vsi.45.1621013678951; 
 Fri, 14 May 2021 10:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-11-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-11-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 14:34:13 -0300
Message-ID: <CAKJDGDY+jTMKYuiLgaAePNavcmwSYyk9gOd1bjUvCJByqiJLSA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] configure: bump min required glib version to 2.56
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:05 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> The glib version was not previously constrained by RHEL-7 since it
> rebases fairly often. Instead SLES 12 and Ubuntu 16.04 were the
> constraints in 00f2cfbbec63fb6f5a7789797a62ccedd22466ea. Both of
> these are old enough that they are outside our platform support
> matrix now.
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 2.56.4
>       Debian Buster: 2.58.3
>  openSUSE Leap 15.2: 2.62.6
>    Ubuntu LTS 18.04: 2.56.4
>    Ubuntu LTS 20.04: 2.64.6
>             FreeBSD: 2.66.7
>           Fedora 33: 2.66.8
>           Fedora 34: 2.68.1
>             OpenBSD: 2.68.1
>      macOS HomeBrew: 2.68.1
>
> Thus Ubuntu LTS 18.04 / RHEL-8 are the constraint for GLib version
> at 2.56
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure             |   2 +-
>  include/glib-compat.h |  13 +--
>  util/oslib-win32.c    | 204 ------------------------------------------
>  3 files changed, 3 insertions(+), 216 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


