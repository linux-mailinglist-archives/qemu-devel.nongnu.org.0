Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D11154CC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:03:11 +0100 (CET)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idG4T-0001iA-Cf
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1idElK-0000q3-D9
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:39:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1idElJ-0001mV-3g
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:39:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48834
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1idElI-0001lS-Vb
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575643156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RL7kMDsD4e2cnfTxJ1MCPGfDIr084aZFRegixMLgMc8=;
 b=HwwgC0WBtVH28afB4wmntY3JPLgAYvL4ewWiUj9qFxA5qWfRz4Ej1tSCZ0RKJc1QoCHucV
 lR6Qm3Bl5WMCOqXrl9l2/iMmYriXD7N6RW8C6pffrR7pPBsA9k6KjlplZnE2thXwUw2tj8
 IgajBpojKNdqCeHfV/Ymp4TzMqvEP2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-iCLJ73oqMGqPMf4WxhSq5Q-1; Fri, 06 Dec 2019 02:37:03 -0500
Received: by mail-wr1-f71.google.com with SMTP id f17so2761993wrt.19
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 23:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygPNusQdsCmqtIuqy85luhdaAxxl+M0og4icBqWYOtY=;
 b=Fwk59WdnTgV8zZLc5quR4VfvhfuxATAGnlzESt4OQuvyQO0MAZpXMRsy08UVPiKWvL
 GHk3yDY3/J+KMu4Lw6md8tio6G9oVOXVqlBWEnTYiDUPSSGZS6bKGfNGSgW2KwruyABc
 ozHfHCfY2UNkpLIMBCzffs+cBTB998IsFxcBzrL5lbpiNpIigY6l5CAgH4JS/eUFdJZz
 fczk2G/BBf5GMinWjBWvUtH0UeaQwjDUuVOkuxuU9F39PJ9zxT18ocShby+fkMvf7yrp
 iqIBdCwg7Nn9gdemiBLUbYfzi/uvlPNpq80ur2YaxoEPQmJMiI40Vqi0UVploizfRkpD
 4l2w==
X-Gm-Message-State: APjAAAVLY9ww+akF/PACRyC1xGZIdMDEp65ZCaeYi1xpjOdJZY+FEMLV
 tSx/0YVeM5mILrEWiSB2q7JKW7NMgF31bUHkECSma7uj1aFln2KOWSGGAv+eqPNjrFjNDc/kgU8
 z+xgggATo6dk0FhY=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr14559433wrq.196.1575617822444; 
 Thu, 05 Dec 2019 23:37:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEkc3g4vCW0E5hX7+LPVNLqKzI8txeW9iRaOVt1N9AeglusFP4o/EaXt7UAVONzJRrjnqcqA==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr14559414wrq.196.1575617822179; 
 Thu, 05 Dec 2019 23:37:02 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id g7sm15120787wrq.21.2019.12.05.23.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 23:37:01 -0800 (PST)
Subject: Re: [PATCH v8 12/21] qga: rename Error ** parameter to more common
 errp
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
 <20191205174635.18758-13-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <48d526b1-2649-0699-d2cb-e2ef6700b152@redhat.com>
Date: Fri, 6 Dec 2019 08:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205174635.18758-13-vsementsov@virtuozzo.com>
Content-Language: en-US
X-MC-Unique: iCLJ73oqMGqPMf4WxhSq5Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: armbru@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/19 6:46 PM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

> ---
>   qga/commands-posix.c |  2 +-
>   qga/commands-win32.c |  2 +-
>   qga/commands.c       | 12 ++++++------
>   3 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 1c1a165dae..3bd7b54c08 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2781,7 +2781,7 @@ static double ga_get_login_time(struct utmpx *user_=
info)
>       return seconds + useconds;
>   }
>  =20
> -GuestUserList *qmp_guest_get_users(Error **err)
> +GuestUserList *qmp_guest_get_users(Error **errp)
>   {
>       GHashTable *cache =3D NULL;
>       GuestUserList *head =3D NULL, *cur_item =3D NULL;
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 55ba5b263a..2461fd19bf 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -1946,7 +1946,7 @@ typedef struct _GA_WTSINFOA {
>  =20
>   } GA_WTSINFOA;
>  =20
> -GuestUserList *qmp_guest_get_users(Error **err)
> +GuestUserList *qmp_guest_get_users(Error **errp)
>   {
>   #define QGA_NANOSECONDS 10000000
>  =20
> diff --git a/qga/commands.c b/qga/commands.c
> index 0c7d1385c2..43c323cead 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -143,7 +143,7 @@ static GuestExecInfo *guest_exec_info_find(int64_t pi=
d_numeric)
>       return NULL;
>   }
>  =20
> -GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **err)
> +GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
>   {
>       GuestExecInfo *gei;
>       GuestExecStatus *ges;
> @@ -152,7 +152,7 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, E=
rror **err)
>  =20
>       gei =3D guest_exec_info_find(pid);
>       if (gei =3D=3D NULL) {
> -        error_setg(err, QERR_INVALID_PARAMETER, "pid");
> +        error_setg(errp, QERR_INVALID_PARAMETER, "pid");
>           return NULL;
>       }
>  =20
> @@ -385,7 +385,7 @@ GuestExec *qmp_guest_exec(const char *path,
>                          bool has_env, strList *env,
>                          bool has_input_data, const char *input_data,
>                          bool has_capture_output, bool capture_output,
> -                       Error **err)
> +                       Error **errp)
>   {
>       GPid pid;
>       GuestExec *ge =3D NULL;
> @@ -405,7 +405,7 @@ GuestExec *qmp_guest_exec(const char *path,
>       arglist.next =3D has_arg ? arg : NULL;
>  =20
>       if (has_input_data) {
> -        input =3D qbase64_decode(input_data, -1, &ninput, err);
> +        input =3D qbase64_decode(input_data, -1, &ninput, errp);
>           if (!input) {
>               return NULL;
>           }
> @@ -424,7 +424,7 @@ GuestExec *qmp_guest_exec(const char *path,
>               guest_exec_task_setup, NULL, &pid, has_input_data ? &in_fd =
: NULL,
>               has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &=
gerr);
>       if (!ret) {
> -        error_setg(err, QERR_QGA_COMMAND_FAILED, gerr->message);
> +        error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
>           g_error_free(gerr);
>           goto done;
>       }
> @@ -499,7 +499,7 @@ int ga_parse_whence(GuestFileWhence *whence, Error **=
errp)
>       return -1;
>   }
>  =20
> -GuestHostName *qmp_guest_get_host_name(Error **err)
> +GuestHostName *qmp_guest_get_host_name(Error **errp)
>   {
>       GuestHostName *result =3D NULL;
>       gchar const *hostname =3D g_get_host_name();
>=20


