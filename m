Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831BB47353A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:47:07 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrHu-0002PF-HT
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrGi-0001hy-HE
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrGg-0001LK-RD
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639424750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bK5PMlqHXxdrvIafWpteWQLDLEQkj0IecH4NajjsbE=;
 b=iKMwOUeeu8jFX2uALlaqb3ZJVlaa1EE/jHdSWJqC3mA0P9qKboQWBLJeTmcrKsmtYvjD8U
 6+chrONSo5XnMwBPcgQnkm7RB37rjJeO8an+iSthQTLRf9QA9PtbyxDBWu1HRZoCEO6c93
 pNzOU1apoMcC51/pXgnUGjcRcpunjPM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-YG_NMqvRPEy0Ka8BtAA8oQ-1; Mon, 13 Dec 2021 14:45:48 -0500
X-MC-Unique: YG_NMqvRPEy0Ka8BtAA8oQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 y68-20020a626447000000b004a2b2d0c39eso10656252pfb.14
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 11:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+bK5PMlqHXxdrvIafWpteWQLDLEQkj0IecH4NajjsbE=;
 b=ptULI5V8IpJuMQCYj226+ifXRgRuGrjJHOz3C/Vlaoq/LJKHSfXcJ5BL+uEMsHC9Nb
 qc2t1+ZNMPeHReHUT8VsaA0n+/csQLXbmaD9jPTET3ZJJ+N7E8IpU7HsfmFw6+Qz6KFU
 vtQhzRndnqg+YIG9qMQ/4misU4vUh9jEiKzMFX7WtOsoOn+ckb/N5RS6ofovRxFu8LQX
 SuvxpXTuTs87UbJvnDSy3VNBYnV4BZ/NFE6YMnuDC53+3Hvhx/mJmTUSpwV/eYKKKRaW
 v1mf90wBfs9B/qWlKCKpXjkmVtA84qsgxep35toyj0DsCDo8RgHjj1hFe7Awf39kW9AB
 +vrg==
X-Gm-Message-State: AOAM530ID1crC+aldKM9l351X1wCKvq2kPBfbCTZM2zUzNRdHWDg31lL
 IvAEhkr8TXkaAwP7Qwtjgd5WhNB05JWaH8T+4fQ5Kv3rzhYH1hFlow0HWWIbf9wGBAN9nCRIIxJ
 BgHH5mdlhCNsTM3OTou4MPa4emCmQenc=
X-Received: by 2002:a63:1645:: with SMTP id 5mr491517pgw.45.1639424747725;
 Mon, 13 Dec 2021 11:45:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCUZRYwGrvYF3tbkCujBbmcau9hnte9oVDrgIOjCSKMTTQqhyltuBKYQNkMVaneB1qzqJRCstch7EuakfVSL4=
X-Received: by 2002:a63:1645:: with SMTP id 5mr491500pgw.45.1639424747431;
 Mon, 13 Dec 2021 11:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20211213111554.62394-1-konstantin@daynix.com>
 <20211213111554.62394-5-konstantin@daynix.com>
In-Reply-To: <20211213111554.62394-5-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Dec 2021 23:45:36 +0400
Message-ID: <CAMxuvay=gUUE1odi5+8Pc5Zuxs9xdmrTidWV_02yxTR_7fCrHw@mail.gmail.com>
Subject: Re: [PATCH 4/5] gqa-win: get_pci_info: Replace 'while' with 2 calls
 of the function
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
> Microsoft suggests this solution in the documentation:
> https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-s=
etupdigetdeviceinterfacedetaila
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Arguably, the next patch should come first, as you introduce extra
leaking points here - alternatively, update the commit message.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/commands-win32.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index cef14a8762..6bde5260e8 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -552,10 +552,10 @@ static GuestPCIAddress *get_pci_info(int number, Er=
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
> @@ -567,6 +567,16 @@ static GuestPCIAddress *get_pci_info(int number, Err=
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
> +                goto cleanup;
> +            }
> +
>              dev_file =3D CreateFile(pdev_iface_detail_data->DevicePath, =
0,
>                                    FILE_SHARE_READ, NULL, OPEN_EXISTING, =
0,
>                                    NULL);
> @@ -597,8 +607,8 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
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
> @@ -608,6 +618,14 @@ static GuestPCIAddress *get_pci_info(int number, Err=
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
> +                goto cleanup;
> +            }
> +
>              /*
>               * CM API used here as opposed to
>               * SetupDiGetDeviceProperty(..., DEVPKEY_Device_Parent, ...)
> --
> 2.25.1
>


