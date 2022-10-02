Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BB5F225C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 11:41:11 +0200 (CEST)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oevTC-0006F4-0G
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 05:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oevQp-0004hK-FS; Sun, 02 Oct 2022 05:38:43 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oevQm-0004cA-PZ; Sun, 02 Oct 2022 05:38:43 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id g9so1633299qvo.12;
 Sun, 02 Oct 2022 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=NzrPzA5/YcLYZVAtGdl+A494NBI4H/rJishUCxtUm6I=;
 b=cC7z24ewT+9t+HGT8RAJQ1KuN5Kl/PGakfhp6lCQkX4aWw6csxJTZYmc5yaBc/Y7dx
 yQjre/3Kl5MvYxNeNrqnjd69zOjufFMn/wdTWLA7x8AE4TFYBDnS7pvJ+xllu25O4baK
 jFfIfBWqylYbyGYXAPz1IXPQg/otxeSUXFZ2B7APJVU4WN3lF3wYZEMq2S3kecYLpPwu
 Ky3DA3npLhxDbFEJs0Ho3x9rK4ONyax551NUjICGZdiSq3VclOGw8r78K+9syI5yOTOC
 sLyWJGbGiBOQYCWtZWtD+6lAojPYPjAOt042CIp5GKYFuU8AJ2/WEilzZRVIRXhgfO25
 U/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=NzrPzA5/YcLYZVAtGdl+A494NBI4H/rJishUCxtUm6I=;
 b=Kt4eIHCgYAUG12ej45nutH2xxYv+8N+FPps65S76oxVtHEIFR1JxwpKPtGqXYt6/Zr
 isWlR6M4Zp5zybS+IhzCZW1j8wJffyO6i7rZy6iAzG3TCS9P1GD4+ARV7/B0APLMLrmq
 e4l5FXUMxnqS1Omvo8AN4k2BQWxQVgxK7FgGn8+Mnzozv5CBbtcb0S6u29Mka/7m7iO3
 h8NpvIKT7f9Blkx6mAvAPoTG2b2SGQZxEo6J+Jj+AvZTjDofD52Vq6JWhHsx6m5nM5V7
 jBEjSIffHBpahEnt9fUPSntKVF84yWPCQNDOYKSxQoei0JxNgRo00YrdIvTtcuj84/fr
 lFQw==
X-Gm-Message-State: ACrzQf3oj4EzDb5YMk1rov4ewF5nvC3wPQv42D/qNNCpPoOVftbruqan
 eKJI2dIr4RC30r75nuT2KsqTZWdvinYepFN0QVU=
X-Google-Smtp-Source: AMsMyM7uckyQCfs3o9oPbKsIcMub8pHgrUibLFiafo/4q97GJ3ifGSZMJJHMu7Fz6JcJgY8hesqvyt7jjPm8iKie7GY=
X-Received: by 2002:a05:6214:e85:b0:4b1:7e5a:3604 with SMTP id
 hf5-20020a0562140e8500b004b17e5a3604mr3697440qvb.114.1664703518715; Sun, 02
 Oct 2022 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
 <20220928144125.1997128-2-bmeng.cn@gmail.com>
 <YzbBM7Qc3p+Hiyvo@redhat.com>
In-Reply-To: <YzbBM7Qc3p+Hiyvo@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 Oct 2022 17:38:27 +0800
Message-ID: <CAEUhbmXH_y4ZuR2Z_HU2PoKX9A_P1VWUyF0eMVGbtvmvoPO4uw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] block: Refactor get_tmp_filename()
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

On Fri, Sep 30, 2022 at 6:13 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 28.09.2022 um 16:41 hat Bin Meng geschrieben:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present there are two callers of get_tmp_filename() and they are
> > inconsistent.
> >
> > One does:
> >
> >     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
> >     char *tmp_filename = g_malloc0(PATH_MAX + 1);
> >     ...
> >     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> >
> > while the other does:
> >
> >     s->qcow_filename = g_malloc(PATH_MAX);
> >     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> >
> > As we can see different 'size' arguments are passed. There are also
> > platform specific implementations inside the function, and the use
> > of snprintf is really undesirable.
> >
> > The function name is also misleading. It creates a temporary file,
> > not just a filename.
> >
> > Refactor this routine by changing its name and signature to:
> >
> >     char *create_tmp_file(Error **errp)
> >
> > and use g_file_open_tmp() for a consistent implementation.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v5:
> > - minor change in the commit message
> > - add some notes in the function comment block
> > - add g_autofree for tmp_filename
> >
> > Changes in v4:
> > - Rename the function to create_tmp_file() and take "Error **errp" as
> >   a parameter, so that callers can pass errp all the way down to this
> >   routine.
> > - Commit message updated to reflect the latest change
> >
> > Changes in v3:
> > - Do not use errno directly, instead still let get_tmp_filename() return
> >   a negative number to indicate error
> >
> > Changes in v2:
> > - Use g_autofree and g_steal_pointer
> >
> >  include/block/block_int-common.h |  2 +-
> >  block.c                          | 45 ++++++++++++--------------------
> >  block/vvfat.c                    |  7 +++--
> >  3 files changed, 20 insertions(+), 34 deletions(-)
> >
> > diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> > index 8947abab76..d7c0a7e96f 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
> >  }
> >
> >  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> > -int get_tmp_filename(char *filename, int size);
> > +char *create_tmp_file(Error **errp);
> >  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
> >                                        QDict *options);
> >
> > diff --git a/block.c b/block.c
> > index 582c205307..bd3006d85d 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -860,35 +860,25 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
> >
> >  /*
> >   * Create a uniquely-named empty temporary file.
> > - * Return 0 upon success, otherwise a negative errno value.
> > + * Return the actual file name used upon success, otherwise NULL.
> > + * This string should be freed with g_free() when not needed any longer.
> > + *
> > + * Note: creating a temporary file for the caller to (re)open is
> > + * inherently racy. Use g_file_open_tmp() instead whenever practical.
> >   */
> > -int get_tmp_filename(char *filename, int size)
> > +char *create_tmp_file(Error **errp)
> >  {
> > -#ifdef _WIN32
> > -    char temp_dir[MAX_PATH];
> > -    /* GetTempFileName requires that its output buffer (4th param)
> > -       have length MAX_PATH or greater.  */
> > -    assert(size >= MAX_PATH);
> > -    return (GetTempPath(MAX_PATH, temp_dir)
> > -            && GetTempFileName(temp_dir, "qem", 0, filename)
>
> We're using different prefixes on Windows and on Linux. This patch
> unifies both paths to use the Linux name. Nobody should rely on the name
> of temporary files, so there is hope it won't break anything.
>
> > -            ? 0 : -GetLastError());
> > -#else
> > +    g_autofree char *name = NULL;
> > +    g_autoptr(GError) err = NULL;
> >      int fd;
> > -    const char *tmpdir;
> > -    tmpdir = getenv("TMPDIR");
> > -    if (!tmpdir) {
> > -        tmpdir = "/var/tmp";
> > -    }
> > -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> > -        return -EOVERFLOW;
> > -    }
> > -    fd = mkstemp(filename);
> > +
> > +    fd = g_file_open_tmp("vl.XXXXXX", &name, &err);
>
> This implicitly reverts commit 69bef7931e8, g_file_open_tmp() uses /tmp
> as the default instead of /var/tmp as this function does before the
> patch.

Oops, thanks for the pointer. Commit message of 69bef7931e8 does not
explicitely explain why to change from /tmp to /var/tmp. Is that
because QEMU block codes write a huge size of data to this file in
/tmp?

> This is probably not a good idea, we should keep the /var/tmp default.
>
> But if we did want to do this, it's definitely a change in behaviour
> that should be mentioned in the commit message at least.
>

If we have to keep /var/tmp, how about this?

diff --git a/block.c b/block.c
index bd3006d85d..d964ceaeac 100644
--- a/block.c
+++ b/block.c
@@ -24,6 +24,7 @@
  */

 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include "block/trace.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
@@ -878,7 +879,20 @@ char *create_tmp_file(Error **errp)
         return NULL;
     }
     close(fd);
+#ifdef _WIN32
     return g_steal_pointer(&name);
+#else
+    g_autofree char *base = NULL;
+    char *newname;
+
+    base = g_path_get_basename(name);
+    newname = g_strdup_printf("/var/tmp/%s", base);
+    if (g_rename(name, newname) < 0) {
+        error_setg_errno(errp, -errno, "Could not create file");
+        return NULL;
+    }
+    return newname;
+#endif
 }

Regards,
Bin

