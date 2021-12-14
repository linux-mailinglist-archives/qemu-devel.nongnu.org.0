Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546954743AA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:40:23 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx82Y-0001VX-Dt
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pZ-00042T-E6
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7pW-0002pB-Sd
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qs0Xob+N7avpYFXiWbx/bDTINKZWW8VYmWz70j/KhhM=;
 b=GHkH+nEdQ+zFmkNtCAcCGJvwdMcNDSSf9bnuthPZEovdRLP+TVhig2JfegnZ8t1+Cgi9vQ
 it1lSDLCUfxz8ZttGFLlwPQJorJLuF5b2Sro6hpKzhWS/Hi7VkcLGg70hzbaRNF6qWUzw0
 fyaxNAoo98t/5uMAxIEroBUxc6HT80A=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-IcSA4hsfNYiMtem6M3dMbA-1; Tue, 14 Dec 2021 08:26:53 -0500
X-MC-Unique: IcSA4hsfNYiMtem6M3dMbA-1
Received: by mail-pf1-f199.google.com with SMTP id
 e12-20020aa7980c000000b0049fa3fc29d0so11801481pfl.10
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qs0Xob+N7avpYFXiWbx/bDTINKZWW8VYmWz70j/KhhM=;
 b=cwvCy+kzFNBECR6Vo+t8ofBjUfXP/DIC+gSIFZuNUz5dfDRtBBm9fHfBo/3LqJOnuS
 rs6ElCQ00D6GJKsGFfxQe8eXXkIciBF7IrOib/i8oPw9eEpqLd0bdE03j3RykqgyQjHq
 JqZ7h5EVacCoiJUIttGywJtKtY4F1oIqUc92UAp/eBCgEOovrM5tSh7KTvOyVZZDnUi4
 b/YmFoMQylsFi10w0HAkDWmM9QAcKPy2agVJNUBONnTT5X2khhUJuxBkbXQhWllWBKcu
 d9QkJicfiEBrkhWdFEsHSxcByyUSZXJIUkWFjJmmtQY1OH914itmsQmzqNRP3Ynsq9K+
 H6+g==
X-Gm-Message-State: AOAM530zAFj7NnqCtA8mF9q4Z1vxzqcLtsrNO9zJjY1VONIFQga91tWw
 SQ4ioZLbeANdBCdptHhTYNm/jLXmyVCF2rMengWwTIRW6f/90lH3XKk9XnhNKFF7CN76eoK6EN/
 N5uErHr+jk4aNjbpNIN71OKEvu009kOU=
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr5796359pjb.134.1639488412000; 
 Tue, 14 Dec 2021 05:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVjTek2g4UWUU99XnE1Hf1Y/HjnAmwkaSZRuOllx4uBGj6Fgo0TXHKJuRCV9A8DIZGW8x6HpmTw3Co9hoTJ3U=
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr5796332pjb.134.1639488411703; 
 Tue, 14 Dec 2021 05:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-3-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-3-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:26:40 +0400
Message-ID: <CAMxuvazs10YUpzSShg6AEdBie3fjvzmcJbOLx1bpHLn1k3c+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gqa-win: get_pci_info: Use common 'end' label
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
> To prevent memory leaks, always try to free initialized variables.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-win32.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 3dd74fe225..93c5375132 100644
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
> +        goto end;
>      }
>
>      g_debug("enumerating devices");
> @@ -562,7 +562,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  } else {
>                      error_setg_win32(errp, GetLastError(),
>                                       "failed to get device interfaces");
> -                    goto free_dev_info;
> +                    goto end;
>                  }
>              }
>
> @@ -576,7 +576,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  CloseHandle(dev_file);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get device slot number");
> -                goto free_dev_info;
> +                goto end;
>              }
>
>              CloseHandle(dev_file);
> @@ -586,7 +586,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          } else {
>              error_setg_win32(errp, GetLastError(),
>                               "failed to get device interfaces");
> -            goto free_dev_info;
> +            goto end;
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
> +                    goto end;
>                  }
>              }
>
> @@ -617,14 +617,14 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>                  g_error("CM_Locate_DevInst failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get device instance");
> -                goto out;
> +                goto end;
>              }
>              cr =3D CM_Get_Parent(&parent_dev_inst, dev_inst, 0);
>              if (cr !=3D CR_SUCCESS) {
>                  g_error("CM_Get_Parent failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get parent device instance")=
;
> -                goto out;
> +                goto end;
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
> +                goto end;
>              }
>
>              ++dev_id_size;
> @@ -647,7 +647,7 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>                  g_error("CM_Get_Device_ID failed with code %lx", cr);
>                  error_setg_win32(errp, GetLastError(),
>                                   "failed to get parent device ID");
> -                goto out;
> +                goto end;
>              }
>          }
>
> @@ -661,14 +661,14 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>          if (parent_dev_info =3D=3D INVALID_HANDLE_VALUE) {
>              error_setg_win32(errp, GetLastError(),
>                               "failed to get parent device");
> -            goto out;
> +            goto end;
>          }
>
>          parent_dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
>          if (!SetupDiEnumDeviceInfo(parent_dev_info, 0, &parent_dev_info_=
data)) {
>              error_setg_win32(errp, GetLastError(),
>                             "failed to get parent device data");
> -            goto out;
> +            goto end;
>          }
>
>          for (j =3D 0;
> @@ -748,11 +748,10 @@ static GuestPCIAddress *get_pci_info(int number, Er=
ror **errp)
>          break;
>      }
>
> -free_dev_info:
> +end:
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


