Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3A473520
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:40:58 +0100 (CET)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrBv-00055V-89
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:40:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwr9M-0003vv-LX
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwr9D-0008QX-D4
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639424284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sz8gNDWjl/TehOj+PXmEZgqDX8KzSa6valrN5y9qz7g=;
 b=J0PK75lKNg7191INMp2jv4CuBaM1uaoYCI8To0OBdqWWpA2bZ1EmNo0JxeZBwIvIxs3AgI
 /Vkx7JD8tlzYYzxerqscjjnrJkmgbFzmFkOGUtfdAltU1CtJCIFpfFb5pGPUlozu1Yhzn9
 49WX2fYeNnzDxferjOlTJpGy4/JaD/o=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-174-NzS5MchIMS6BWGF0xLYZ8g-1; Mon, 13 Dec 2021 14:38:03 -0500
X-MC-Unique: NzS5MchIMS6BWGF0xLYZ8g-1
Received: by mail-pg1-f198.google.com with SMTP id
 t1-20020a6564c1000000b002e7f31cf59fso9483210pgv.14
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 11:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sz8gNDWjl/TehOj+PXmEZgqDX8KzSa6valrN5y9qz7g=;
 b=C68Pjb3UqJmn/Hjpf2l5/4Q5bu0mbJvwKaYntRIKXLaoypVZlOC9AXEdRYJ5DXWTN8
 McXolw2fRY2qZ1Qfj/P/cMI+LRwd+Boy4rsU93A4pvG1brCXwK+E2O9xm3gbP6gwoTyw
 liSt2JptL6xVF4Z4MYuuY+0eAGX3Ic8bIFgEqjlUhDVXyX3+uW7ivHif6FtRbGDfL/ag
 DxNynh5MgBDEATM/mheSVkVMCrWnbS7ZC3j8k2HRtH43c6cMkHiX+QHS2YAXu588KPup
 Y+771Duu54b/Y/JhHVbEOQ8qsqNDTKiWayzrma/w06C0CZfaI2XGq3V2MB2aZXTpe9D6
 DFYg==
X-Gm-Message-State: AOAM533ECv5IcZkERmkzHgUi9ZQ1Qb+bYXiHYlMkClsLBkXaocManUI0
 evJY7V1gLPOTUjK+TQhTAKfGNrRI8LnWSNVDCoJpu8MsQ/XirRNZEKiBmf51iOabVn2k5lYEbf2
 1HIzpVQSvF1EgSbbcllKRsBhPt1ZPQuo=
X-Received: by 2002:a63:1645:: with SMTP id 5mr464166pgw.45.1639424281940;
 Mon, 13 Dec 2021 11:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwUWtWDUqGNJfJp13d+5i0X87OTUU1Eaes9xv8jQWkRZ84s3z18fzzxE5zRMPtHqHEiyKdIqsM4cg7FgPoUtw=
X-Received: by 2002:a63:1645:: with SMTP id 5mr464154pgw.45.1639424281713;
 Mon, 13 Dec 2021 11:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20211213111554.62394-1-konstantin@daynix.com>
 <20211213111554.62394-2-konstantin@daynix.com>
In-Reply-To: <20211213111554.62394-2-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Dec 2021 23:37:50 +0400
Message-ID: <CAMxuvaxpLY8VPsJSU-eqPnJ1yoFmjpveDYZHJ--SRjur6WpDKQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] gqa-win: get_pci_info: Clean dev_info if handle is
 valid
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 3:16 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 4e84afd83b..3dd74fe225 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -514,7 +514,7 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
>
>  static GuestPCIAddress *get_pci_info(int number, Error **errp)
>  {
> -    HDEVINFO dev_info;
> +    HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
>      SP_DEVINFO_DATA dev_info_data;
>      SP_DEVICE_INTERFACE_DATA dev_iface_data;
>      HANDLE dev_file;
> @@ -749,7 +749,9 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>      }
>
>  free_dev_info:
> -    SetupDiDestroyDeviceInfoList(dev_info);
> +    if (dev_info !=3D INVALID_HANDLE_VALUE) {
> +        SetupDiDestroyDeviceInfoList(dev_info);
> +    }
>  out:
>      return pci;
>  }
> --
> 2.25.1
>


