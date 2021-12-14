Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D34743B2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:41:53 +0100 (CET)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx840-0003lE-QA
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:41:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7rV-0006L7-Ve
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7rU-000329-AG
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkw8TaRDHkBIeT/p5OIkte8hmXUjbUDyF9J+PbMyTHk=;
 b=CSmqeo+/pfabMx2hSUBwxW1xjb0laqMYK5hlHYpKDd/ajX92bxdSmDJT9Pdsh24p88V1U2
 7IMesgQY5ImL8N0unVFt5xkI4zzOX5U09uHJO4fuDPgmSvbVYN5b8hckUI60RspUJzEf1N
 9QI/QwyIO9jd3w7QZosuvKJIjAj3fyw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-a_dVaO8sNJyOdh4lNep2vw-1; Tue, 14 Dec 2021 08:28:54 -0500
X-MC-Unique: a_dVaO8sNJyOdh4lNep2vw-1
Received: by mail-pf1-f197.google.com with SMTP id
 m16-20020a628c10000000b004a282d715b2so11815076pfd.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hkw8TaRDHkBIeT/p5OIkte8hmXUjbUDyF9J+PbMyTHk=;
 b=SnqNkZPcjpf+7TOYtxQ+1Gy0MPq+IWjmi71pRlnU4dNaJWjUbFxVOEoEbkGDdgIyDr
 AOQyEb2XxJgdUP/HudBXlHbVgTCBOt5bTf15+HVXXY2vMJ7lMOk18I9x90e3HhX0Jly9
 AlL3VD1BqaFYKFM0mu+N3i4dIi+cogPxze9+Ve2+eCu2CGO4uifvM4DRWMrDnErlpL8y
 eyqNMw2pZd/ZUwMsf/yTTCTHCOtJrr8/OIx5cLwjJ+Jh+JzEJSyBV4Wm/JFoxEgOjwVY
 6wUmS76JyhZl4FonqnM1kCm0RbT9NhNkf+uEHqCBYEIOiPCxDG7BXCf6Gq3wJvFdJK8O
 ojWA==
X-Gm-Message-State: AOAM532R/DMtp3SbGahAhFJ+APE39p/qukdNLJCgYx6/XU1q97Uxa1Wy
 N+WYhkITqr0TDarB60gozpcqmLWu4Lhi2iDbX3aUlH3/7oxr9HdLde5jrqmTF1/N5pmzdDhOpZP
 l8JCxZXQKlN0fO8HrFf01Axh7L9MCLeg=
X-Received: by 2002:a63:1645:: with SMTP id 5mr3789393pgw.45.1639488532743;
 Tue, 14 Dec 2021 05:28:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9CNd9MEpYYyBrFR8y71nVM99pmdkYzjXHcQLTUrnJKdoDMp8RrFYvWMGuSPT64aS3WmrU+YCINhow8nZ48cQ=
X-Received: by 2002:a63:1645:: with SMTP id 5mr3789372pgw.45.1639488532414;
 Tue, 14 Dec 2021 05:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-7-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-7-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:28:41 +0400
Message-ID: <CAMxuvay7LVqY-AUR6YRNPEm-H4A-8cGT9EOzmOZ9O=TaL14TRw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] gqa-win: get_pci_info: Replace 'while' with 2
 calls of the function
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
> Microsoft suggests this solution in the documentation:
> https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-s=
etupdigetdeviceinterfacedetaila
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 3092566313..892082504f 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -636,10 +636,10 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>          if (SetupDiEnumDeviceInterfaces(dev_info, &dev_info_data,
>                                          &GUID_DEVINTERFACE_DISK, 0,
>                                          &dev_iface_data)) {
> -            while (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface=
_data,
> -                                                    pdev_iface_detail_da=
ta,
> -                                                    size, &size,
> -                                                    &dev_info_data)) {
> +            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_da=
ta,
> +                                                 pdev_iface_detail_data,
> +                                                 size, &size,
> +                                                 &dev_info_data)) {
>                  if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
>                      pdev_iface_detail_data =3D g_malloc(size);
>                      pdev_iface_detail_data->cbSize =3D
> @@ -651,6 +651,16 @@ static GuestPCIAddress *get_pci_info(int number, Err=
or **errp)
>                  }
>              }
>
> +            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_da=
ta,
> +                                                 pdev_iface_detail_data,
> +                                                 size, &size,
> +                                                 &dev_info_data)) {
> +                // pdev_iface_detail_data already is allocated
> +                error_setg_win32(errp, GetLastError(),
> +                                    "failed to get device interfaces");
> +                goto end;
> +            }
> +
>              dev_file =3D CreateFile(pdev_iface_detail_data->DevicePath, =
0,
>                                    FILE_SHARE_READ, NULL, OPEN_EXISTING, =
0,
>                                    NULL);
> @@ -680,8 +690,8 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>              ULONG dev_id_size =3D 0;
>
>              size =3D 0;
> -            while (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
> -                                               parent_dev_id, size, &siz=
e)) {
> +            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
> +                                            parent_dev_id, size, &size))=
 {
>                  if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
>                      parent_dev_id =3D g_malloc(size);
>                  } else {
> @@ -691,6 +701,14 @@ static GuestPCIAddress *get_pci_info(int number, Err=
or **errp)
>                  }
>              }
>
> +            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
> +                                            parent_dev_id, size, &size))=
 {
> +                // parent_dev_id already is allocated
> +                error_setg_win32(errp, GetLastError(),
> +                                    "failed to get device instance ID");
> +                goto end;
> +            }
> +
>              /*
>               * CM API used here as opposed to
>               * SetupDiGetDeviceProperty(..., DEVPKEY_Device_Parent, ...)
> --
> 2.25.1
>


