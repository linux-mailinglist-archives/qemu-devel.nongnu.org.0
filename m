Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F272473523
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:42:10 +0100 (CET)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrD7-00073X-LU
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrAu-0005Ez-DS
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mwrAq-0000EC-Dy
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 14:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639424386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nM9TqFIVO4Spz03IIMj5oy4CxCSFM47L08C/t3UgtYw=;
 b=A2FcZsmhwIgGy3o+BFsGlF7yyoqd8neQbZ4fDhw8vgpIGjLGZshCivfOorRdJGvISxCZfj
 2IJzin50di0XVYxLKS+RkSnMrCFrKbA8gUHPDkgpbp1U/LaXBwI2SEGDFQjL+MylrqW9I1
 ElRA33uF2MVcYuPM42RvfeUbEILaq8I=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-514-ESlklV_tNdK3T_VSxaa3mw-1; Mon, 13 Dec 2021 14:39:45 -0500
X-MC-Unique: ESlklV_tNdK3T_VSxaa3mw-1
Received: by mail-pg1-f198.google.com with SMTP id
 14-20020a63144e000000b0032f07c8df95so9498351pgu.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 11:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nM9TqFIVO4Spz03IIMj5oy4CxCSFM47L08C/t3UgtYw=;
 b=rQ0qUuEZRhBjY7GPS0mSUxCtk0smkpzu8kBLz9c3tyeeBJCWmBC4ASFGNuTatvEuof
 F+/FBshAhmYvQdv3UAqZpqEGakadsmDDlqSWWbjqz4Uwv+0t/uRmiERV8dber9igLFXa
 +BbCSPK4I6oAmOxjaYgPqFyGrb+ueAWPACMlyl5AwBkL87M+1kP7g7+GPz28vNdW0DCQ
 IoxxiKgbzX1J/JHlWkPs4EvLV4lGvK2pE4Xke+MS/7pEgYmZIu0NwidOB5A2PoK++f3B
 qkhxM2kv62YmuhSy1z4+YllX0w79/1lEQZW3lwGeeuY5/xIkvU9nxc/Cuk5t39AT1rLb
 oiEg==
X-Gm-Message-State: AOAM533xyKQeI5EFPULYVcir0Zu4thujpfsEUr9POIwoN4+SJFd9lbFC
 2LClen/rfvbCeo3AsfxthCFMq60zkKBo5E7yyQiPlvGCze0i2wyvqna/EVyjoZnXzwKAWGn0BDY
 +E2QHEw70sluUFOKxFutcwWmAp6WeRBQ=
X-Received: by 2002:a17:90b:1c91:: with SMTP id
 oo17mr320165pjb.193.1639424384546; 
 Mon, 13 Dec 2021 11:39:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHAfP5YgZftsOigCi9OHda7iItVItpSeF0p57a2UOaorbHEZdgr2EksaBtDkaqiqQcp3GfyxJHoLcfT+eWg+E=
X-Received: by 2002:a17:90b:1c91:: with SMTP id
 oo17mr320137pjb.193.1639424384296; 
 Mon, 13 Dec 2021 11:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20211213111554.62394-1-konstantin@daynix.com>
 <20211213111554.62394-3-konstantin@daynix.com>
In-Reply-To: <20211213111554.62394-3-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Dec 2021 23:39:33 +0400
Message-ID: <CAMxuvaw720ch760a1FmodGY0jK6ueRZGPzLL+mY=vQMCax98Hw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gqa-win: get_pci_info: Use common 'cleanup' label
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
> To prevent memory leaks, always try to free initialized variables.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>

(nit: since it's a common return point, I would rather name the label
"end" instead)

> ---
>  qga/commands-win32.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 3dd74fe225..12f7a88078 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -532,7 +532,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                                     DIGCF_PRESENT | DIGCF_DEVICEINTERFACE=
);
>      if (dev_info =3D=3D INVALID_HANDLE_VALUE) {
>          error_setg_win32(errp, GetLastError(), "failed to get devices tr=
ee");
> -        goto out;
> +        goto cleanup;
>      }
>
>      g_debug("enumerating devices");
> @@ -562,7 +562,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  } else {
>                      error_setg_win32(errp, GetLastError(),
>                                       "failed to get device interfaces");
> -                    goto free_dev_info;
> +                    goto cleanup;
>                  }
>              }
>
> @@ -576,7 +576,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  CloseHandle(dev_file);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get device slot number");
> -                goto free_dev_info;
> +                goto cleanup;
>              }
>
>              CloseHandle(dev_file);
> @@ -586,7 +586,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          } else {
>              error_setg_win32(errp, GetLastError(),
>                               "failed to get device interfaces");
> -            goto free_dev_info;
> +            goto cleanup;
>          }
>
>          g_debug("found device slot %d. Getting storage controller", numb=
er);
> @@ -603,7 +603,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  } else {
>                      error_setg_win32(errp, GetLastError(),
>                                       "failed to get device instance ID")=
;
> -                    goto out;
> +                    goto cleanup;
>                  }
>              }
>
> @@ -617,14 +617,14 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>                  g_error("CM_Locate_DevInst failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get device instance");
> -                goto out;
> +                goto cleanup;
>              }
>              cr =3D CM_Get_Parent(&parent_dev_inst, dev_inst, 0);
>              if (cr !=3D CR_SUCCESS) {
>                  g_error("CM_Get_Parent failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get parent device instance")=
;
> -                goto out;
> +                goto cleanup;
>              }
>
>              cr =3D CM_Get_Device_ID_Size(&dev_id_size, parent_dev_inst, =
0);
> @@ -632,7 +632,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  g_error("CM_Get_Device_ID_Size failed with code %lx", cr=
);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get parent device ID length"=
);
> -                goto out;
> +                goto cleanup;
>              }
>
>              ++dev_id_size;
> @@ -647,7 +647,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  g_error("CM_Get_Device_ID failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get parent device ID");
> -                goto out;
> +                goto cleanup;
>              }
>          }
>
> @@ -661,14 +661,14 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>          if (parent_dev_info =3D=3D INVALID_HANDLE_VALUE) {
>              error_setg_win32(errp, GetLastError(),
>                               "failed to get parent device");
> -            goto out;
> +            goto cleanup;
>          }
>
>          parent_dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
>          if (!SetupDiEnumDeviceInfo(parent_dev_info, 0, &parent_dev_info_=
data)) {
>              error_setg_win32(errp, GetLastError(),
>                             "failed to get parent device data");
> -            goto out;
> +            goto cleanup;
>          }
>
>          for (j =3D 0;
> @@ -748,11 +748,10 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>          break;
>      }
>
> -free_dev_info:
> +cleanup:
>      if (dev_info !=3D INVALID_HANDLE_VALUE) {
>          SetupDiDestroyDeviceInfoList(dev_info);
>      }
> -out:
>      return pci;
>  }
>
> --
> 2.25.1
>


