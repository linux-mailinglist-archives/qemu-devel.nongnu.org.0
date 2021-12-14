Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D594743D6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:49:32 +0100 (CET)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8BP-0006xi-Gy
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pS-0003zR-MQ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pQ-0002ok-Hq
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfoTG+csa+5rV+ejcpvY2mKlRE3peSMFTRzVdeg1aCs=;
 b=BnQCPMY2k3ZWXK/664T4L0jDIvbaBCPUElXTu33l46zkMsiLttBzCiO6uGXu6xmXZrQhjP
 xBkwbY6iuCfQQgXXN5s60LQGzY9pv8CCP5+vfshoFFQiuwTxeQumFJcIi1hekbkljoTzWd
 RR9jBmFjVQow0kJCdo56S4nhGYQOOsc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-cDUwuqlcPo-GTJ8joNF8Nw-1; Tue, 14 Dec 2021 08:26:40 -0500
X-MC-Unique: cDUwuqlcPo-GTJ8joNF8Nw-1
Received: by mail-pl1-f198.google.com with SMTP id
 p3-20020a170903248300b00143c00a5411so5420820plw.12
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfoTG+csa+5rV+ejcpvY2mKlRE3peSMFTRzVdeg1aCs=;
 b=6FLSKZjFm9dq36HXL+FwNLe6uL/bs4ztQqXkFFdmMemJhWV7+nmpoyfysov1s5jkG+
 TaNTjVHM0enDw4ePbEWWM0tP9OMkfuDHQK/g3ksZhGxJpT0+wBiQi5G72LREWWmvqefO
 v7B5k8TgT24kMRZ7tOmNOCcTbWxRioJJ0Udyc2kG7CoKTll18qrRXFmhiloWsL/NG8FY
 aXOoChx/ScznX8vIDl/6GNqPGyuAXboJ0S3/O4nISToXv/l1WMhgQ+oLbEex+BRtaoMQ
 ayi6f5y/FjGmYZNpVyTZRvj9fhgxMbf6IAIelcBZWrGVPextNQT2CNJGLfvsb7TfHl38
 LamA==
X-Gm-Message-State: AOAM530NBhfx7hUpu1LWNw14Me4i1spvrNVKBBQkIYQSmdge9xojhUbP
 lO1DgQXag6CaH7EUiiAP9/UKJtRLKBOzS+CNDB+abEqjBB+So84iRfd+27tdw9HUMW2VBpzwHfr
 ghtGOlK3xVC532F4InEApDQkjRmaW5wE=
X-Received: by 2002:a17:902:c206:b0:142:631:5ffc with SMTP id
 6-20020a170902c20600b0014206315ffcmr5954525pll.38.1639488399629; 
 Tue, 14 Dec 2021 05:26:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSzIFx4Oubxgh/QlnTd+hqmSgQdNEG4KMN62yIYB0DV/kktKve7Ff8LdRwIXNp2jhbr7cHyt81WvoVe4xC0fk=
X-Received: by 2002:a17:902:c206:b0:142:631:5ffc with SMTP id
 6-20020a170902c20600b0014206315ffcmr5954498pll.38.1639488399362; Tue, 14 Dec
 2021 05:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-2-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-2-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:26:28 +0400
Message-ID: <CAMxuvayGQOtb79dBUbD3c1xWERt8Mk=Yji0+K8g7SJWgDmG3_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] gqa-win: get_pci_info: Clean dev_info if handle is
 valid
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


