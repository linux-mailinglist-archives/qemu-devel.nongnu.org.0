Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779506137D9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUkx-0005AA-7W; Mon, 31 Oct 2022 09:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opUkh-0004yp-Mo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:22:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opUkg-0006U9-0K
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:22:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so5894896pjk.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7nXFldMSziBa/wu7OUJRAnV8Xwj60tSzgXAVAmYm6hE=;
 b=onutWbm0jfQZ0RcZKhMC/t4/sjKlBOmV9PGX+WaEybu2ZhsAf4UzfYGxYKAerh+2lD
 nNrdEh4xzhk4f9WQJcq7EhP6eIm295D0smUzKXOU9JRgAYHZtmaRVyb2Rfc57SmvZ+XX
 5pp84ajle6O8DmCXzGeDelkvkzNjZRSxZKoVY1nf+X7EkDCcy2O3F77MRAtp7nTm7cRx
 DEPRv4+g1TMKS/g0OwSHoRNrRYZee7Qz8Ik7gHMHpC8BZuGE/GMSMqu0f8xgiQQHAL1m
 H6uIWVFkkSs5vQx3RwWb80XOShjmCij5ftGWP5xthRKAUdykXWJ4vMk69seY5XCuxMTc
 H+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nXFldMSziBa/wu7OUJRAnV8Xwj60tSzgXAVAmYm6hE=;
 b=JvJfWBNwgydUn2rvItHAGGT0JPqhtvzt0b7Yihi3dvY3pLXUQ82pKFCXrjlvGLcn+0
 yMCN6Y4RB0HXsbSTSQ93we7MG/xnMpytLzYX655cL9U4lgMhAXuCI9g+PtVcEp3pC8Ad
 yuh46nLgwnE1+eVuFSs7+BLXDzsgEiPQseZuNY3n9+WBkOi4MaI8LqqbP9uu+SxdVjl2
 wbVg2SbMaYeygJM3A96kDISE3lhyYIFKOfXyXAcSPCuYf+kYLdLv+HYq6ZOFeiACMR14
 n9OpQYCvVLfbTF4qzQKIlNkJhR9H1Rpkr7NfjlRpAvDMvebJhNTt87R7++SpfbOcSZw6
 w65g==
X-Gm-Message-State: ACrzQf3PiVPGQWMj6Tae73mGoFuSYxa4Uf/NN6MXsLz6C4gpYUnKLr6k
 cp6eBak/p92PwkRE7bAHFpFRBnlDPbukBMmfoBzslA==
X-Google-Smtp-Source: AMsMyM571GMsH0RMC5Ryx3RvTcUpOGmohuyX6BTWSUcWjrKoxC5ByeCuHmALM1rQPXo7oI+tub5m56ZwlbU22z2VqO0=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr13953799pll.19.1667222572532; Mon, 31
 Oct 2022 06:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221028054835.29674-1-jasowang@redhat.com>
 <20221028054835.29674-6-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-6-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:22:41 +0000
Message-ID: <CAFEAcA9chHjjJuBw2EeHTG1Pk10J_yq_wV-G9b3swda21jPc=w@mail.gmail.com>
Subject: Re: [PULL 05/26] vhost-vdpa: allow passing opened vhostfd to
 vhost-vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org, 
 Si-Wei Liu <si-wei.liu@oracle.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 at 06:55, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Si-Wei Liu <si-wei.liu@oracle.com>
>
> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
> backend as another parameter to instantiate vhost-vdpa net client.
> This would benefit the use case where only open file descriptors, as
> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
> process.
>
> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>

> @@ -634,14 +634,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>
>      assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts = &netdev->u.vhost_vdpa;
> -    if (!opts->vhostdev) {
> -        error_setg(errp, "vdpa character device not specified with vhostdev");
> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
> +        error_setg(errp,
> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
>          return -1;
>      }
>
> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
> -    if (vdpa_device_fd == -1) {
> -        return -errno;
> +    if (opts->has_vhostdev && opts->has_vhostfd) {
> +        error_setg(errp,
> +                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
> +        return -1;
> +    }
> +
> +    if (opts->has_vhostdev) {
> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
> +        if (vdpa_device_fd == -1) {
> +            return -errno;
> +        }
> +    } else if (opts->has_vhostfd) {
> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
> +        if (vdpa_device_fd == -1) {
> +            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
> +            return -1;
> +        }
>      }

Hi; this doesn't compile with clang:


../../net/vhost-vdpa.c:654:16: error: variable 'vdpa_device_fd' is
used uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized]
    } else if (opts->has_vhostfd) {
               ^~~~~~~~~~~~~~~~~
../../net/vhost-vdpa.c:662:33: note: uninitialized use occurs here
    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
                                ^~~~~~~~~~~~~~
../../net/vhost-vdpa.c:654:12: note: remove the 'if' if its condition
is always true
    } else if (opts->has_vhostfd) {
           ^~~~~~~~~~~~~~~~~~~~~~~
../../net/vhost-vdpa.c:629:23: note: initialize the variable
'vdpa_device_fd' to silence this warning
    int vdpa_device_fd;
                      ^
                       = 0
1 error generated.


(clang version 10.0.0-4ubuntu1).

It's a false positive -- the compiler doesn't manage to figure out
that the error checks further up mean that there's no code path where
vdpa_device_fd isn't initialized. Put another way, the problem is
that we check "if (opts->has_vhostfd)" when in fact that condition
must always be true.

We could fix this by for instance:

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 854ebd61ae6..b1572ea00bc 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -634,11 +634,6 @@ int net_init_vhost_vdpa(const Netdev *netdev,
const char *name,

     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    if (!opts->has_vhostdev && !opts->has_vhostfd) {
-        error_setg(errp,
-                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
-        return -1;
-    }

     if (opts->has_vhostdev && opts->has_vhostfd) {
         error_setg(errp,
@@ -657,6 +652,10 @@ int net_init_vhost_vdpa(const Netdev *netdev,
const char *name,
             error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
             return -1;
         }
+    } else {
+        error_setg(errp,
+                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
+        return -1;
     }

     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);



or alternatively by

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 854ebd61ae6..e370ecb8ebd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -651,7 +651,8 @@ int net_init_vhost_vdpa(const Netdev *netdev,
const char *name,
         if (vdpa_device_fd == -1) {
             return -errno;
         }
-    } else if (opts->has_vhostfd) {
+    } else {
+        /* has_vhostfd */
         vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
         if (vdpa_device_fd == -1) {
             error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");

I think I prefer the second of these.

(I'll post a patch properly in a moment I guess.)

-- PMM

