Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356B4743B5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:43:37 +0100 (CET)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx85f-0006iS-6O
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pr-0004UB-5C
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:27:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pp-0002ru-QS
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAqY4otktyrfPamfLea4EdMwnicNCArlJkRhv61XIwM=;
 b=KGFIEzTej6BzEXwLYqyOcTI9MlxJxG9xvOtbZDUn/+7O6Qp56nffbXZTfK8xadjXi0ziqr
 dhzRGzuH4Kai58L2Cy5OHG4OlVt7EDHYY7UzZwyMjDfbaA5HghurRsQ65t/dAAE0RtQK4p
 bqQHAPMpahJerVI3S2B0ScNu/PNKAco=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-7whV9933N6mR5Fx4PKeu4w-1; Tue, 14 Dec 2021 08:27:11 -0500
X-MC-Unique: 7whV9933N6mR5Fx4PKeu4w-1
Received: by mail-pj1-f71.google.com with SMTP id
 61-20020a17090a09c300b001adc4362b42so10309930pjo.7
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZAqY4otktyrfPamfLea4EdMwnicNCArlJkRhv61XIwM=;
 b=2YGHPgf+rgAWyBvGNcJC/q0jQjKkf2nAtBGKqjKaRPU8c+Iwk/M7XfalJHj4Lsgg7L
 buC48SgvFVuyR7xtYf8v+AaS283/HCuQAhjl1Njrbc6FCwK8pJK4IWIOZRsMzMwFxWom
 Z/sJOHptgFnlCl2pNf0qwGW69GdcExTBxWMaBB+n6iZjqW3VDGNawP6Bqx3OAWvXGC6J
 25eWCruloLDx9mcUGzBaTYSZ6ts37PfdW4FLjKTXANxtLYynScYbSlHhta/qZxuQSpkA
 JNkc2K98MIVUtdeL2AghUuYHNvy4gTtDdripiabZdDbOSh4RwNVmUZfHbzG8vTYsM6qD
 H+QA==
X-Gm-Message-State: AOAM532Cb7YJBg8MYg9INSRBQwiy9OySVXJx39jrFLOb6K20/zHzQ61v
 AhqfB7WIHBTgVefytE2D0HFDJmmU5UOqkwv8luvH6qIwQk6rmMbYTj5qxHhvYP1EHuZtk0F4dG/
 ptPXTuZF/2YZ4A+tgFgsqWGXdZJnYjiM=
X-Received: by 2002:a17:90b:1c91:: with SMTP id
 oo17mr5782765pjb.193.1639488430796; 
 Tue, 14 Dec 2021 05:27:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/pPt/K9q/m86Y9FBkJSAfuO6MbGABnSqQi+I0pM7bmO5F670qq9PzDVlFja6dV5/Yz+FHfc+bMyxm5I/swUQ=
X-Received: by 2002:a17:90b:1c91:: with SMTP id
 oo17mr5782747pjb.193.1639488430574; 
 Tue, 14 Dec 2021 05:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-4-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-4-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:26:59 +0400
Message-ID: <CAMxuvayW_kU=gCgK5bwq+skzrrxFfrsKS2RNuYnKXLGxx+ibFQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gqa-win: get_pci_info: Free parent_dev_info
 properly
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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

On Tue, Dec 14, 2021 at 4:41 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> In case when the function fails to get parent device data,
> the parent_dev_info variable will be initialized, but not freed.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 93c5375132..f6de9e2676 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -515,6 +515,8 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
>  static GuestPCIAddress *get_pci_info(int number, Error **errp)
>  {
>      HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
> +    HDEVINFO parent_dev_info =3D INVALID_HANDLE_VALUE;
> +
>      SP_DEVINFO_DATA dev_info_data;
>      SP_DEVICE_INTERFACE_DATA dev_iface_data;
>      HANDLE dev_file;
> @@ -542,7 +544,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data =3D NULL=
;
>          STORAGE_DEVICE_NUMBER sdn;
>          char *parent_dev_id =3D NULL;
> -        HDEVINFO parent_dev_info;
>          SP_DEVINFO_DATA parent_dev_info_data;
>          DWORD j;
>          DWORD size =3D 0;
> @@ -744,11 +745,13 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>                  break;
>              }
>          }
> -        SetupDiDestroyDeviceInfoList(parent_dev_info);
>          break;
>      }
>
>  end:
> +    if (parent_dev_info !=3D INVALID_HANDLE_VALUE) {
> +        SetupDiDestroyDeviceInfoList(parent_dev_info);
> +    }
>      if (dev_info !=3D INVALID_HANDLE_VALUE) {
>          SetupDiDestroyDeviceInfoList(dev_info);
>      }
> --
> 2.25.1
>


