Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF265F2E9F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:08:13 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIMu-00026r-PX
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofIDL-0004WM-S5
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:58:19 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofIDJ-00056o-As
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:58:19 -0400
Received: by mail-lf1-x131.google.com with SMTP id d18so2754919lfb.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p1y51ZWmElyN6DvhKZTSvDQ60uz4/ZRWGwUNBF6/mBw=;
 b=bZxSe9ehkEas12IZuB508xtkh+3kt14TTk8+FVIrATKJ9eh6mW83v16nWtzllNwPcb
 OwCxrWZvS8etn/fOyLY0XXjgl82IgTE+r0isFCkxJ+0xtiqf2DY32sCSacePRY+yzJZE
 fff3ct/kCVexIVXYPxpD3qeQO1oO9nsojqzI9uRTzF3LVIIU+10MP6RKH4XEJiszPxjn
 waRvGGXBzqLk5aK5fyyEwXzSAJzBVKH8pn8Zl/h8V/buwRkRx5dyweTedKyLNl+uNi4M
 O50YRqmPvGbdQAY5CbqPB82Q/1FNj/RkECp+r7RfMT46048K3X60jbN/utBZC5iFQ0+t
 zMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p1y51ZWmElyN6DvhKZTSvDQ60uz4/ZRWGwUNBF6/mBw=;
 b=O8UlEhe+3wKgbp95gulUemAfOCgPMqbb2KxKhW/elQJeeoSD72stJr8qWUHxul/mFT
 QjttMP/HWUL6ldBHJjnKOHXDeuI+6kszbiRNjMjFvCDbUQ3FrsJbbr3t5ajbpfqtW/Dm
 hjPadQWl0w221QasCFlLt5JcFcWA5Fwa90DqFvABgRJyoiwG5aNCqvZ418s5MIXiIXKh
 QtmhQuQxebPFyHOIFZB7w/GvKDsBLiGcEBS6z1EDVzSivbiBrjPNAl6Ex23zGatQfP3V
 2yLIGu+ahkYulvJtyXv6OqeucmtwCtgfFo0Vn5+RlqAFKuDgWVVWW9xahrUH/qowQs0E
 9oPw==
X-Gm-Message-State: ACrzQf0S6yWTIV7eXD1fJnt3MWi3a6hv3Av6Q7LjjlqULtMc3ucnqDDs
 GP41hZa09L9rR9oWu1GZHeYVbhHfcqit4zxFLLA=
X-Google-Smtp-Source: AMsMyM7a2bEcqpkynLD/kWg6zLIIC3b6bG99kqCKrpTcqbIZbiXzzJ7TB9bQzTbhMJtMtxZZStPaDs/mmx4ROGVWlI8=
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id
 z13-20020a0565120c0d00b004a24129366emr1071954lfu.328.1664791094439; Mon, 03
 Oct 2022 02:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
 <20221003093911.1844031-7-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221003093911.1844031-7-alexander.ivanov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 3 Oct 2022 13:58:01 +0400
Message-ID: <CAJ+F1CKNAXXuqSVDGFBCnN0xgsf3vczrz-0zgY=8UPCUhOse=g@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] qga: Move HW address getting to a separate function
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 kkostiuk@redhat.com
Content-Type: multipart/alternative; boundary="000000000000cf341e05ea1e61ea"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000cf341e05ea1e61ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Oct 3, 2022 at 1:39 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> In the next patch FreeBSD support for guest-network-get-interfaces will b=
e
> added. Previously move Linux-specific code of HW address getting to a
> separate functions and add a dumb function to commands-bsd.c.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-bsd.c    |  16 +++++++
>  qga/commands-common.h |   6 +++
>  qga/commands-posix.c  | 100 ++++++++++++++++++++++++------------------
>  3 files changed, 80 insertions(+), 42 deletions(-)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index ca06692179..40f7ec7600 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -167,3 +167,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>      return NULL;
>  }
>  #endif /* CONFIG_FSFREEZE */
> +
> +#ifdef HAVE_GETIFADDRS
> +/*
> + * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
> + * buffer with ETHER_ADDR_LEN length at least.
> + *
> + * Returns -1 in case of an error, otherwise 0. "obtained" arguument is
> + * true if a MAC address was obtained successful, otherwise false.
> + */
> +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
> +                      bool *obtained, Error **errp)
> +{
> +    *obtained =3D false;
> +    return 0;
> +}
> +#endif /* HAVE_GETIFADDRS */
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index 2d9878a634..a9cdaf7278 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool
> has_mountpoints,
>  int qmp_guest_fsfreeze_do_thaw(Error **errp);
>  #endif /* CONFIG_FSFREEZE */
>
> +#ifdef HAVE_GETIFADDRS
> +#include <ifaddrs.h>
> +int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
> +                      bool *obtained, Error **errp);
> +#endif
> +
>  typedef struct GuestFileHandle GuestFileHandle;
>
>  GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index f5b9e5c530..2a172c6492 100644
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
> @@ -2889,6 +2881,57 @@ static int guest_get_network_stats(const char *nam=
e,
>      return -1;
>  }
>
> +#ifndef __FreeBSD__
> +/*
> + * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
> + * buffer with ETHER_ADDR_LEN length at least.
> + *
> + * Returns -1 in case of an error, otherwise 0. "obtained" arguument is
> + * true if a MAC address was obtained successful, otherwise false.
> + */
>

In include/qapi/error.h, we recommend returning a bool for success/failure.

+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
> +                      bool *obtained, Error **errp)
> +{
> +    struct ifreq ifr;
> +    int sock;
> +
> +    *obtained =3D false;
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
> +         * fatal error.
> +         */
> +        if (errno =3D=3D EADDRNOTAVAIL) {
> +            /* The interface doesn't have a hw addr (e.g. loopback). */
> +            g_debug("failed to get MAC address of %s: %s",
> +                    ifa->ifa_name, strerror(errno));
> +        } else{
> +            g_warning("failed to get MAC address of %s: %s",
> +                      ifa->ifa_name, strerror(errno));
> +        }
> +    } else {
> +#ifdef CONFIG_SOLARIS
> +        memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
> +#else
> +        memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
> +#endif
> +        *obtained =3D true;
> +    }
> +    close(sock);
> +    return 0;
> +}
> +#endif /* __FreeBSD__ */
> +
>  /*
>   * Build information about guest interfaces
>   */
> @@ -2909,9 +2952,9 @@ GuestNetworkInterfaceList
> *qmp_guest_network_get_interfaces(Error **errp)
>          GuestNetworkInterfaceStat *interface_stat =3D NULL;
>          char addr4[INET_ADDRSTRLEN];
>          char addr6[INET6_ADDRSTRLEN];
> -        int sock;
> -        struct ifreq ifr;
> -        unsigned char *mac_addr;
> +        unsigned char mac_addr[ETHER_ADDR_LEN];
> +        int ret;
> +        bool obtained;
>          void *p;
>
>          g_debug("Processing %s interface", ifa->ifa_name);
> @@ -2926,45 +2969,18 @@ GuestNetworkInterfaceList
> *qmp_guest_network_get_interfaces(Error **errp)
>          }
>
>          if (!info->has_hardware_address) {
> -            /* we haven't obtained HW address yet */
> -            sock =3D socket(PF_INET, SOCK_STREAM, 0);
> -            if (sock =3D=3D -1) {
> -                error_setg_errno(errp, errno, "failed to create socket")=
;
> +            ret =3D guest_get_hw_addr(ifa, mac_addr, &obtained, errp);
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
> +            if (obtained) {
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
otherwise, lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

--000000000000cf341e05ea1e61ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3, 2022 at 1:39 PM Alex=
ander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com">alexande=
r.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">In the next patch FreeBSD support for guest-network-g=
et-interfaces will be<br>
added. Previously move Linux-specific code of HW address getting to a<br>
separate functions and add a dumb function to commands-bsd.c.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 |=C2=A0 16 +++++++<br>
=C2=A0qga/commands-common.h |=C2=A0 =C2=A06 +++<br>
=C2=A0qga/commands-posix.c=C2=A0 | 100 ++++++++++++++++++++++++------------=
------<br>
=C2=A03 files changed, 80 insertions(+), 42 deletions(-)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index ca06692179..40f7ec7600 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -167,3 +167,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
+<br>
+#ifdef HAVE_GETIFADDRS<br>
+/*<br>
+ * Fill &quot;buf&quot; with MAC address by ifaddrs. Pointer buf must poin=
t to a<br>
+ * buffer with ETHER_ADDR_LEN length at least.<br>
+ *<br>
+ * Returns -1 in case of an error, otherwise 0. &quot;obtained&quot; arguu=
ment is<br>
+ * true if a MAC address was obtained successful, otherwise false.<br>
+ */<br>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool *obtained, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 *obtained =3D false;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+#endif /* HAVE_GETIFADDRS */<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index 2d9878a634..a9cdaf7278 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mount=
points,<br>
=C2=A0int qmp_guest_fsfreeze_do_thaw(Error **errp);<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
+#ifdef HAVE_GETIFADDRS<br>
+#include &lt;ifaddrs.h&gt;<br>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool *obtained, Error **errp);<br>
+#endif<br>
+<br>
=C2=A0typedef struct GuestFileHandle GuestFileHandle;<br>
<br>
=C2=A0GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);<br=
>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index f5b9e5c530..2a172c6492 100644<br>
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
@@ -2889,6 +2881,57 @@ static int guest_get_network_stats(const char *name,=
<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
+#ifndef __FreeBSD__<br>
+/*<br>
+ * Fill &quot;buf&quot; with MAC address by ifaddrs. Pointer buf must poin=
t to a<br>
+ * buffer with ETHER_ADDR_LEN length at least.<br>
+ *<br>
+ * Returns -1 in case of an error, otherwise 0. &quot;obtained&quot; arguu=
ment is<br>
+ * true if a MAC address was obtained successful, otherwise false.<br>
+ */<br></blockquote><div><br></div><div>In include/qapi/error.h, we recomm=
end returning a bool for success/failure.</div><div><br> </div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool *obtained, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 struct ifreq ifr;<br>
+=C2=A0 =C2=A0 int sock;<br>
+<br>
+=C2=A0 =C2=A0 *obtained =3D false;<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* fatal error.<br>
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
+=C2=A0 =C2=A0 } else {<br>
+#ifdef CONFIG_SOLARIS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf, &amp;ifr.ifr_addr.sa_data, ETHER_A=
DDR_LEN);<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf, &amp;ifr.ifr_hwaddr.sa_data, ETHER=
_ADDR_LEN);<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *obtained =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 close(sock);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+#endif /* __FreeBSD__ */<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Build information about guest interfaces<br>
=C2=A0 */<br>
@@ -2909,9 +2952,9 @@ GuestNetworkInterfaceList *qmp_guest_network_get_inte=
rfaces(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestNetworkInterfaceStat *interface_stat=
 =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char addr4[INET_ADDRSTRLEN];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char addr6[INET6_ADDRSTRLEN];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int sock;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ifreq ifr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char *mac_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char mac_addr[ETHER_ADDR_LEN];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool obtained;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *p;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;Processing %s interface&quo=
t;, ifa-&gt;ifa_name);<br>
@@ -2926,45 +2969,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_in=
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
ac_addr, &amp;obtained, errp);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obtained) {<br>
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
</blockquote></div><div><br></div><div>otherwise, lgtm</div><div>Reviewed-b=
y: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
">marcandre.lureau@redhat.com</a>&gt;<br><br><br></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cf341e05ea1e61ea--

