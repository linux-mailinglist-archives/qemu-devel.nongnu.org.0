Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121295EF50E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:17:04 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsTK-0008L5-8D
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odris-0006I5-7w
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:28:59 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odrip-0007J2-KF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:28:57 -0400
Received: by mail-lf1-x132.google.com with SMTP id o2so1750148lfc.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6XTJfuO/mCwfUiQVk851aXwb53iEmEQsHRoUhMOFIMo=;
 b=XT9Jok9x6f1xJ2CIQ+/M9BLf49k5ZiSjuJrayyF0LcgWxxJTQLXt9+zV2rBJepKQAY
 QKrso2xNRk4ZCIIAfFLvBAOhfH8Slq6kRZLk1H8gNjWQjYy3zhyY8SG53SATSSbjsAKU
 r/TTFwMK1ZeyV9RQCGi4U/O9MYKha+XwhqTutwWme2m2/dQpQviQmiVX3cmMSuQ1PPrV
 nHfJu0LxdoAIEBsRvHGk53f/pjhcBBBNO/LhNWJ+hWFAE3dApbiVOd5GJWsisJ8ivPCw
 6NOr0/b3ljawqveo5q8dZeOJXKUDR3TFUeD7P9JxZeNblyLo87Vj59DvQkSKCv9uc+c1
 9Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6XTJfuO/mCwfUiQVk851aXwb53iEmEQsHRoUhMOFIMo=;
 b=OhXWOyAH0o2Cs1V88xfNZwlQdfFucZIPDdud4pjoiBLUBK5RvTNVTP3xvlL3iz3iOY
 /OfgkHd+8BILOfbMUsLpW9i2nmafrbZyObkK8UqwdOmY552vK4GgKBU7tyFTPuSymJTd
 x89QO+eHuc1TXgqyK4rCDoyUBv6Otn9D/RwLrG6P3kR/zFR1mmCtiTQA+M7rtxJXS8RT
 9kBY5hO+JadKU8BYayObV5plQVemtmbcCNahi7bfxkgTUQ3Fh9fOv/JlJsyOt0xgFYSh
 2EslsxnV5hsodtrjyx3FBmpAtg3HX1MU1KOwdgdI2n9nMkSSWmPTFW0ov7KiojdzeRfL
 S6iQ==
X-Gm-Message-State: ACrzQf2y0TOpO/8Es3XtffkI7loEADg+UvvCJyNsN4XZ8n/7uAX+FYCX
 l7D2JP8TIG0jmXQYYy6gQEu0YXxcZsF0hAghIk8=
X-Google-Smtp-Source: AMsMyM7ZsZpTP/dsNMEppm95EjPHp7z0pma7ZeFKdrQ7Hn2TigioNrviHkM2pPlp2hVRVByEzFkCx5GYIyuyEV+39cQ=
X-Received: by 2002:ac2:5e66:0:b0:49e:bce2:3df5 with SMTP id
 a6-20020ac25e66000000b0049ebce23df5mr1133545lfr.362.1664450932009; Thu, 29
 Sep 2022 04:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-7-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220929075239.1675374-7-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 15:28:40 +0400
Message-ID: <CAJ+F1CL1N5uZDHEN-vycDzDMKm=WkB29qfXbigeL5ZLM=71D=A@mail.gmail.com>
Subject: Re: [PATCH 6/7] qga: Move HW address getting to a separate function
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="0000000000008c6fed05e9cf2ea5"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008c6fed05e9cf2ea5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 29, 2022 at 12:02 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> In the next patch FreeBSD support for guest-network-get-interfaces will b=
e
> added. Previously move Linux-specific code of HW address getting to a
> separate functions and add a dumb function to commands-bsd.c.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-bsd.c    |  18 +++++++
>  qga/commands-common.h |   6 +++
>  qga/commands-posix.c  | 114 +++++++++++++++++++++++-------------------
>  3 files changed, 87 insertions(+), 51 deletions(-)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index ca06692179..ca81114171 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -167,3 +167,21 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>      return NULL;
>  }
>  #endif /* CONFIG_FSFREEZE */
> +
> +#ifdef HAVE_GETIFADDRS
> +/*
> + * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
> + * buffer with ETHER_ADDR_LEN length at least.
> + *
> + * Returns -1 in case of an error, 0 if MAC address can't be obtained or
> + * 1 if MAC addres is obtained.
>

Not a typical Error function return value...

Eventually, you could return a bool for error/ok and take an additional
"bool *obtained/valid" argument. Just a suggestion.



> + */
> +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error
> **errp)
> +{
> +    /*
> +     * We can't get the hw addr of this interface,
> +     * but that's not a fatal error.
> +     */
> +    return 0;
> +}
> +#endif /* HAVE_GETIFADDRS */
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index 2d9878a634..2485a037fd 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool
> has_mountpoints,
>  int qmp_guest_fsfreeze_do_thaw(Error **errp);
>  #endif /* CONFIG_FSFREEZE */
>
> +#ifdef HAVE_GETIFADDRS
> +#include <ifaddrs.h>
> +
> +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error
> **errp);
> +#endif
> +
>  typedef struct GuestFileHandle GuestFileHandle;
>
>  GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 6ce894ca6e..0bebd9e690 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -41,20 +41,12 @@
>  #endif
>  #endif
>
> -#ifdef __FreeBSD__
> -/*
> - * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD=
.
> - * Fix it in one of the following patches.
> - */
> -#undef HAVE_GETIFADDRS
> -#endif
> -
>  #ifdef HAVE_GETIFADDRS
>  #include <arpa/inet.h>
>  #include <sys/socket.h>
>  #include <net/if.h>
> +#include <net/ethernet.h>
>  #include <sys/types.h>
> -#include <ifaddrs.h>
>  #ifdef CONFIG_SOLARIS
>  #include <sys/sockio.h>
>  #endif
> @@ -2659,14 +2651,6 @@ int64_t
> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>      return -1;
>  }
>
> -void qmp_guest_set_user_password(const char *username,
> -                                 const char *password,
> -                                 bool crypted,
> -                                 Error **errp)
> -{
> -    error_setg(errp, QERR_UNSUPPORTED);
> -}
> -
>

Why this in this patch?


>  GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>  {
>      error_setg(errp, QERR_UNSUPPORTED);
> @@ -2804,7 +2788,15 @@ out:
>          close(datafd[1]);
>      }
>  }
> -#endif
> +#else /* __linux__ || __FreeBSD__ */
> +void qmp_guest_set_user_password(const char *username,
> +                                 const char *password,
> +                                 bool crypted,
> +                                 Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +}
> +#endif /* __linux__ || __FreeBSD__ */
>
>  #ifdef HAVE_GETIFADDRS
>  static GuestNetworkInterface *
> @@ -2887,6 +2879,54 @@ static int guest_get_network_stats(const char *nam=
e,
>      return -1;
>  }
>
> +#ifndef __FreeBSD__
> +/*
> + * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
> + * buffer with ETHER_ADDR_LEN length at least.
> + * Returns -1 in case of an error, 0 if MAC address can't be obtained or
> + * 1 if MAC addres is obtained.
> + */
> +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error
> **errp)
> +{
> +    struct ifreq ifr;
> +    int sock;
> +
> +    /* we haven't obtained HW address yet */
> +    sock =3D socket(PF_INET, SOCK_STREAM, 0);
> +    if (sock =3D=3D -1) {
> +        error_setg_errno(errp, errno, "failed to create socket");
> +        return -1;
> +    }
> +
> +    memset(&ifr, 0, sizeof(ifr));
> +    pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa->ifa_name);
> +    if (ioctl(sock, SIOCGIFHWADDR, &ifr) =3D=3D -1) {
> +        /*
> +         * We can't get the hw addr of this interface, but that's not a
> +         * fatal error. Don't set info->hardware_address, but keep
> +         * going.
> +         */
> +        if (errno =3D=3D EADDRNOTAVAIL) {
> +            /* The interface doesn't have a hw addr (e.g. loopback). */
> +            g_debug("failed to get MAC address of %s: %s",
> +                    ifa->ifa_name, strerror(errno));
> +        } else{
> +            g_warning("failed to get MAC address of %s: %s",
> +                      ifa->ifa_name, strerror(errno));
> +        }
> +        close(sock);
> +        return 0;
> +    }
> +#ifdef CONFIG_SOLARIS
> +    memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
> +#else
> +    memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
> +#endif
> +    close(sock);
> +    return 1;
> +}
> +#endif /* __FreeBSD__ */
> +
>  /*
>   * Build information about guest interfaces
>   */
> @@ -2907,10 +2947,9 @@ GuestNetworkInterfaceList
> *qmp_guest_network_get_interfaces(Error **errp)
>          GuestNetworkInterfaceStat *interface_stat =3D NULL;
>          char addr4[INET_ADDRSTRLEN];
>          char addr6[INET6_ADDRSTRLEN];
> -        int sock;
> -        struct ifreq ifr;
> -        unsigned char *mac_addr;
> +        unsigned char mac_addr[ETHER_ADDR_LEN];
>          void *p;
> +        int ret;
>
>          g_debug("Processing %s interface", ifa->ifa_name);
>
> @@ -2924,45 +2963,18 @@ GuestNetworkInterfaceList
> *qmp_guest_network_get_interfaces(Error **errp)
>          }
>
>          if (!info->has_hardware_address) {
> -            /* we haven't obtained HW address yet */
> -            sock =3D socket(PF_INET, SOCK_STREAM, 0);
> -            if (sock =3D=3D -1) {
> -                error_setg_errno(errp, errno, "failed to create socket")=
;
> +            ret =3D guest_get_hw_addr(ifa, mac_addr, errp);
> +            if (ret =3D=3D -1) {
>                  goto error;
>              }
> -
> -            memset(&ifr, 0, sizeof(ifr));
> -            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
> -            if (ioctl(sock, SIOCGIFHWADDR, &ifr) =3D=3D -1) {
> -                /*
> -                 * We can't get the hw addr of this interface, but that'=
s
> not a
> -                 * fatal error. Don't set info->hardware_address, but ke=
ep
> -                 * going.
> -                 */
> -                if (errno =3D=3D EADDRNOTAVAIL) {
> -                    /* The interface doesn't have a hw addr (e.g.
> loopback). */
> -                    g_debug("failed to get MAC address of %s: %s",
> -                            ifa->ifa_name, strerror(errno));
> -                } else{
> -                    g_warning("failed to get MAC address of %s: %s",
> -                              ifa->ifa_name, strerror(errno));
> -                }
> -
> -            } else {
> -#ifdef CONFIG_SOLARIS
> -                mac_addr =3D (unsigned char *) &ifr.ifr_addr.sa_data;
> -#else
> -                mac_addr =3D (unsigned char *) &ifr.ifr_hwaddr.sa_data;
> -#endif
> +            if (ret =3D=3D 1) {
>                  info->hardware_address =3D
>                      g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
>                                      (int) mac_addr[0], (int) mac_addr[1]=
,
>                                      (int) mac_addr[2], (int) mac_addr[3]=
,
>                                      (int) mac_addr[4], (int) mac_addr[5]=
);
> -
>                  info->has_hardware_address =3D true;
>              }
> -            close(sock);
>          }
>
>          if (ifa->ifa_addr &&
> --
> 2.34.1
>
>
>
looks ok to me otherwise

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008c6fed05e9cf2ea5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 12:02 PM Al=
exander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexan=
der.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">In the next patch FreeBSD support for guest-network=
-get-interfaces will be<br>
added. Previously move Linux-specific code of HW address getting to a<br>
separate functions and add a dumb function to commands-bsd.c.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 |=C2=A0 18 +++++++<br>
=C2=A0qga/commands-common.h |=C2=A0 =C2=A06 +++<br>
=C2=A0qga/commands-posix.c=C2=A0 | 114 +++++++++++++++++++++++-------------=
------<br>
=C2=A03 files changed, 87 insertions(+), 51 deletions(-)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index ca06692179..ca81114171 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -167,3 +167,21 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
+<br>
+#ifdef HAVE_GETIFADDRS<br>
+/*<br>
+ * Fill buf with MAC address by ifaddrs. Pointer buf must point to a<br>
+ * buffer with ETHER_ADDR_LEN length at least.<br>
+ *<br>
+ * Returns -1 in case of an error, 0 if MAC address can&#39;t be obtained =
or<br>
+ * 1 if MAC addres is obtained.<br></blockquote><div><br></div><div>Not a =
typical Error function return value...</div><div><br></div><div>Eventually,=
 you could return a bool for error/ok and take an additional &quot;bool *ob=
tained/valid&quot; argument. Just a suggestion.<br></div><div><br></div><di=
v>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* We can&#39;t get the hw addr of this interface,<br>
+=C2=A0 =C2=A0 =C2=A0* but that&#39;s not a fatal error.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+#endif /* HAVE_GETIFADDRS */<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index 2d9878a634..2485a037fd 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mount=
points,<br>
=C2=A0int qmp_guest_fsfreeze_do_thaw(Error **errp);<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
+#ifdef HAVE_GETIFADDRS<br>
+#include &lt;ifaddrs.h&gt;<br>
+<br>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **err=
p);<br>
+#endif<br>
+<br>
=C2=A0typedef struct GuestFileHandle GuestFileHandle;<br>
<br>
=C2=A0GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);<br=
>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 6ce894ca6e..0bebd9e690 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -41,20 +41,12 @@<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
-#ifdef __FreeBSD__<br>
-/*<br>
- * The code under HAVE_GETIFADDRS condition can&#39;t be compiled in FreeB=
SD.<br>
- * Fix it in one of the following patches.<br>
- */<br>
-#undef HAVE_GETIFADDRS<br>
-#endif<br>
-<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0#include &lt;arpa/inet.h&gt;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;net/if.h&gt;<br>
+#include &lt;net/ethernet.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
-#include &lt;ifaddrs.h&gt;<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
=C2=A0#include &lt;sys/sockio.h&gt;<br>
=C2=A0#endif<br>
@@ -2659,14 +2651,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorLis=
t *vcpus, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-void qmp_guest_set_user_password(const char *username,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
-}<br>
-<br></blockquote><div><br></div><div>Why this in this patch?</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_UNSUPPORTED);<br>
@@ -2804,7 +2788,15 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(datafd[1]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-#endif<br>
+#else /* __linux__ || __FreeBSD__ */<br>
+void qmp_guest_set_user_password(const char *username,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *password,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool crypted,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+}<br>
+#endif /* __linux__ || __FreeBSD__ */<br>
<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0static GuestNetworkInterface *<br>
@@ -2887,6 +2879,54 @@ static int guest_get_network_stats(const char *name,=
<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
+#ifndef __FreeBSD__<br>
+/*<br>
+ * Fill buf with MAC address by ifaddrs. Pointer buf must point to a<br>
+ * buffer with ETHER_ADDR_LEN length at least.<br>
+ * Returns -1 in case of an error, 0 if MAC address can&#39;t be obtained =
or<br>
+ * 1 if MAC addres is obtained.<br>
+ */<br>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **err=
p)<br>
+{<br>
+=C2=A0 =C2=A0 struct ifreq ifr;<br>
+=C2=A0 =C2=A0 int sock;<br>
+<br>
+=C2=A0 =C2=A0 /* we haven&#39;t obtained HW address yet */<br>
+=C2=A0 =C2=A0 sock =3D socket(PF_INET, SOCK_STREAM, 0);<br>
+=C2=A0 =C2=A0 if (sock =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
create socket&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;ifr, 0, sizeof(ifr));<br>
+=C2=A0 =C2=A0 pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa-&gt;ifa_name);<br>
+=C2=A0 =C2=A0 if (ioctl(sock, SIOCGIFHWADDR, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We can&#39;t get the hw addr of this i=
nterface, but that&#39;s not a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* fatal error. Don&#39;t set info-&gt;ha=
rdware_address, but keep<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* going.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D EADDRNOTAVAIL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The interface doesn&#39;t hav=
e a hw addr (e.g. loopback). */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to get MAC =
address of %s: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifa-=
&gt;ifa_name, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_warning(&quot;failed to get MA=
C address of %s: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ifa-&gt;ifa_name, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef CONFIG_SOLARIS<br>
+=C2=A0 =C2=A0 memcpy(buf, &amp;ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);<br>
+#else<br>
+=C2=A0 =C2=A0 memcpy(buf, &amp;ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);<br=
>
+#endif<br>
+=C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 return 1;<br>
+}<br>
+#endif /* __FreeBSD__ */<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Build information about guest interfaces<br>
=C2=A0 */<br>
@@ -2907,10 +2947,9 @@ GuestNetworkInterfaceList *qmp_guest_network_get_int=
erfaces(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestNetworkInterfaceStat *interface_stat=
 =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char addr4[INET_ADDRSTRLEN];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char addr6[INET6_ADDRSTRLEN];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int sock;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ifreq ifr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char *mac_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char mac_addr[ETHER_ADDR_LEN];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;Processing %s interface&quo=
t;, ifa-&gt;ifa_name);<br>
<br>
@@ -2924,45 +2963,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_in=
terfaces(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info-&gt;has_hardware_address) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we haven&#39;t obtained HW ad=
dress yet */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock =3D socket(PF_INET, SOCK_ST=
REAM, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sock =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(e=
rrp, errno, &quot;failed to create socket&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D guest_get_hw_addr(ifa, m=
ac_addr, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;ifr, 0, sizeof(ifr))=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstrcpy(ifr.ifr_name, IF_NAMESIZ=
E, info-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(sock, SIOCGIFHWADDR, &=
amp;ifr) =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We can&#39=
;t get the hw addr of this interface, but that&#39;s not a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* fatal erro=
r. Don&#39;t set info-&gt;hardware_address, but keep<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* going.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D E=
ADDRNOTAVAIL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* T=
he interface doesn&#39;t have a hw addr (e.g. loopback). */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_de=
bug(&quot;failed to get MAC address of %s: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ifa-&gt;ifa_name, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_wa=
rning(&quot;failed to get MAC address of %s: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifa-&gt;ifa_name, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-#ifdef CONFIG_SOLARIS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_addr =3D (unsi=
gned char *) &amp;ifr.ifr_addr.sa_data;<br>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_addr =3D (unsi=
gned char *) &amp;ifr.ifr_hwaddr.sa_data;<br>
-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;hard=
ware_address =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0g_strdup_printf(&quot;%02x:%02x:%02x:%02x:%02x:%02x&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int) mac_addr[0=
], (int) mac_addr[1],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int) mac_addr[2=
], (int) mac_addr[3],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int) mac_addr[4=
], (int) mac_addr[5]);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;has_=
hardware_address =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ifa-&gt;ifa_addr &amp;&amp;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>looks ok to me otherwise<br></div><b=
r>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<=
br></div></div>

--0000000000008c6fed05e9cf2ea5--

