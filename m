Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489964278F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 15:31:32 +0200 (CEST)
Received: from localhost ([::1]:60464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb3Lf-0005e2-Fs
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 09:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37050)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hb3IJ-0004XX-Lr
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hb3ID-0005G3-9Q
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:28:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52469)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hb3IC-0005Es-QS
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:27:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so6600419wms.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 06:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tLx/TYo1KJCRfD9wsRuveCpM/9BityOCphrjqWwEkOU=;
 b=P8pqUjkjCC6zfsNmvngHAuTBbVVbaYjXpN7O+Y4EeOj4uaCE49SCZjrC+NILt6/9Zr
 7j5CJskHq/FlDnJNwY0WnsIH54OFJvpi9ztg87xwTEGgmQ0md1S4oceVD395a9XLt9fD
 NJ0p+QNfOYDhRHaJLEpxiia8m/fMcsCKvYdhlzd/+nGpBiqMNdhRIzVXLPPvNZtT1UOJ
 A+mFhxdq+9DIrQ/ubje71aTGUr0hhDasQFNa6RZbSH7o1706gt38rjP81FC4MK0ZO/H5
 6Hx/TEkdxfHOvSUWbuwP223bDuLoRIXQOJwSiuU6iYoF5QjA4ZLYyLLVZC/CshwhAwlL
 zImg==
X-Gm-Message-State: APjAAAXZyxIady1zhdfr6HZCETm7OBSKQfk+Oh68Y6tJnc56EliV7TWX
 x1wCOvL92s+DMws+0haN0fGl4w==
X-Google-Smtp-Source: APXvYqyuJ2tPf25XI1UMtYfu5+H5T6pBiwJb8EJw+RzUBXQ2JJsWvYyYn+14teSyO0EcHbBOG0lHwg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr23688482wmj.64.1560346075089; 
 Wed, 12 Jun 2019 06:27:55 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2eec:b420:bca5:71b1:6738:c7ee?
 ([2a01:e35:2eec:b420:bca5:71b1:6738:c7ee])
 by smtp.gmail.com with ESMTPSA id c2sm18061558wrf.75.2019.06.12.06.27.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 06:27:54 -0700 (PDT)
To: Pino Toscano <ptoscano@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20190605213654.9785-1-ptoscano@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a8797829-a5c6-24a3-647f-14872bc2f951@redhat.com>
Date: Wed, 12 Jun 2019 15:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605213654.9785-1-ptoscano@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v6] ssh: switch from libssh2 to libssh
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
Cc: kwolf@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, rjones@redhat.com, mreitz@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Alex (Docker, Travis) and Stefan (MinGW)

On 6/5/19 11:36 PM, Pino Toscano wrote:
> Rewrite the implementation of the ssh block driver to use libssh instead
> of libssh2.  The libssh library has various advantages over libssh2:
> - easier API for authentication (for example for using ssh-agent)
> - easier API for known_hosts handling
> - supports newer types of keys in known_hosts
> 
> Use APIs/features available in libssh 0.8 conditionally, to support
> older versions (which are not recommended though).
> 
> Signed-off-by: Pino Toscano <ptoscano@redhat.com>
> ---
> 
> Changes from v5:
> - adapt to newer tracing APIs
> - disable ssh compression (mimic what libssh2 does by default)
> - use build time checks for libssh 0.8, and use newer APIs directly
> 
> Changes from v4:
> - fix wrong usages of error_setg/session_error_setg/sftp_error_setg
> - fix few return code checks
> - remove now-unused parameters in few internal functions
> - allow authentication with "none" method
> - switch to unsigned int for the port number
> - enable TCP_NODELAY on the socket
> - fix one reference error message in iotest 207
> 
> Changes from v3:
> - fix socket cleanup in connect_to_ssh()
> - add comments about the socket cleanup
> - improve the error reporting (closer to what was with libssh2)
> - improve EOF detection on sftp_read()
> 
> Changes from v2:
> - used again an own fd
> - fixed co_yield() implementation
> 
> Changes from v1:
> - fixed jumbo packets writing
> - fixed missing 'err' assignment
> - fixed commit message
> 
>  block/Makefile.objs        |   6 +-
>  block/ssh.c                | 610 +++++++++++++++++++------------------
>  block/trace-events         |  14 +-
>  configure                  |  62 ++--
>  tests/qemu-iotests/207.out |   2 +-
>  5 files changed, 351 insertions(+), 343 deletions(-)
> 
> diff --git a/block/Makefile.objs b/block/Makefile.objs
> index ae11605c9f..bf01429dd5 100644
> --- a/block/Makefile.objs
> +++ b/block/Makefile.objs
> @@ -31,7 +31,7 @@ block-obj-$(CONFIG_CURL) += curl.o
>  block-obj-$(CONFIG_RBD) += rbd.o
>  block-obj-$(CONFIG_GLUSTERFS) += gluster.o
>  block-obj-$(CONFIG_VXHS) += vxhs.o
> -block-obj-$(CONFIG_LIBSSH2) += ssh.o
> +block-obj-$(CONFIG_LIBSSH) += ssh.o
>  block-obj-y += accounting.o dirty-bitmap.o
>  block-obj-y += write-threshold.o
>  block-obj-y += backup.o
> @@ -52,8 +52,8 @@ rbd.o-libs         := $(RBD_LIBS)
>  gluster.o-cflags   := $(GLUSTERFS_CFLAGS)
>  gluster.o-libs     := $(GLUSTERFS_LIBS)
>  vxhs.o-libs        := $(VXHS_LIBS)
> -ssh.o-cflags       := $(LIBSSH2_CFLAGS)
> -ssh.o-libs         := $(LIBSSH2_LIBS)
> +ssh.o-cflags       := $(LIBSSH_CFLAGS)
> +ssh.o-libs         := $(LIBSSH_LIBS)
>  block-obj-dmg-bz2-$(CONFIG_BZIP2) += dmg-bz2.o
>  block-obj-$(if $(CONFIG_DMG),m,n) += $(block-obj-dmg-bz2-y)
>  dmg-bz2.o-libs     := $(BZIP2_LIBS)
> diff --git a/block/ssh.c b/block/ssh.c
> index 12fd4f39e8..ce2363a471 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -24,8 +24,8 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include <libssh2.h>
> -#include <libssh2_sftp.h>
> +#include <libssh/libssh.h>
> +#include <libssh/sftp.h>
>  
>  #include "block/block_int.h"
>  #include "block/qdict.h"
> @@ -43,14 +43,13 @@
>  #include "qapi/qobject-output-visitor.h"
>  #include "trace.h"
>  
> -/*
> - * TRACE_LIBSSH2=<bitmask> enables tracing in libssh2 itself.  Note
> - * that this requires that libssh2 was specially compiled with the
> - * `./configure --enable-debug' option, so most likely you will have
> - * to compile it yourself.  The meaning of <bitmask> is described
> - * here: http://www.libssh2.org/libssh2_trace.html
> +/* TRACE_LIBSSH=<level> enables tracing in libssh itself.
> + * The meaning of <level> is described here:
> + * http://api.libssh.org/master/group__libssh__log.html
>   */
> -#define TRACE_LIBSSH2 0 /* or try: LIBSSH2_TRACE_SFTP */
> +#define TRACE_LIBSSH  0 /* see: SSH_LOG_* */
> +
> +#define HAVE_LIBSSH_0_8 (LIBSSH_VERSION_INT >= SSH_VERSION_INT(0, 8, 0))

As I noticed with ssh_get_publickey() and reading
https://www.redhat.com/archives/libvir-list/2018-May/msg00597.html, I'm
not convinced this definition is accurate. Used in [1].

>  
>  typedef struct BDRVSSHState {
>      /* Coroutine. */
> @@ -58,18 +57,14 @@ typedef struct BDRVSSHState {
>  
>      /* SSH connection. */
>      int sock;                         /* socket */
> -    LIBSSH2_SESSION *session;         /* ssh session */
> -    LIBSSH2_SFTP *sftp;               /* sftp session */
> -    LIBSSH2_SFTP_HANDLE *sftp_handle; /* sftp remote file handle */
> +    ssh_session session;              /* ssh session */
> +    sftp_session sftp;                /* sftp session */
> +    sftp_file sftp_handle;            /* sftp remote file handle */
>  
> -    /* See ssh_seek() function below. */
> -    int64_t offset;
> -    bool offset_op_read;
> -
> -    /* File attributes at open.  We try to keep the .filesize field
> +    /* File attributes at open.  We try to keep the .size field
>       * updated if it changes (eg by writing at the end of the file).
>       */
> -    LIBSSH2_SFTP_ATTRIBUTES attrs;
> +    sftp_attributes attrs;
>  
>      InetSocketAddress *inet;
>  
> @@ -89,7 +84,6 @@ static void ssh_state_init(BDRVSSHState *s)
>  {
>      memset(s, 0, sizeof *s);
>      s->sock = -1;
> -    s->offset = -1;
>      qemu_co_mutex_init(&s->lock);
>  }
>  
> @@ -97,21 +91,20 @@ static void ssh_state_free(BDRVSSHState *s)
>  {
>      g_free(s->user);
>  
> +    if (s->attrs) {
> +        sftp_attributes_free(s->attrs);
> +    }
>      if (s->sftp_handle) {
> -        libssh2_sftp_close(s->sftp_handle);
> +        sftp_close(s->sftp_handle);
>      }
>      if (s->sftp) {
> -        libssh2_sftp_shutdown(s->sftp);
> +        sftp_free(s->sftp);
>      }
>      if (s->session) {
> -        libssh2_session_disconnect(s->session,
> -                                   "from qemu ssh client: "
> -                                   "user closed the connection");
> -        libssh2_session_free(s->session);
> -    }
> -    if (s->sock >= 0) {
> -        close(s->sock);
> +        ssh_disconnect(s->session);
> +        ssh_free(s->session);

Maybe:

           ssh_free(s->session); /* This frees s->sock */

>      }
> +    /* s->sock is owned by the ssh_session, which frees it. */

And drop this comment.

>  }
>  
>  static void GCC_FMT_ATTR(3, 4)
> @@ -125,13 +118,13 @@ session_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
>      va_end(args);
>  
>      if (s->session) {
> -        char *ssh_err;
> +        const char *ssh_err;
>          int ssh_err_code;

You can drop these,

>  
> -        /* This is not an errno.  See <libssh2.h>. */
> -        ssh_err_code = libssh2_session_last_error(s->session,
> -                                                  &ssh_err, NULL, 0);
> -        error_setg(errp, "%s: %s (libssh2 error code: %d)",
> +        /* This is not an errno.  See <libssh/libssh.h>. */
> +        ssh_err = ssh_get_error(s->session);
> +        ssh_err_code = ssh_get_error_code(s->session);
> +        error_setg(errp, "%s: %s (libssh error code: %d)",

using directly as arguments here. However this might be easier for the
libssh2/libssh switch to do as you did, and clean this later.

>                     msg, ssh_err, ssh_err_code);
>      } else {
>          error_setg(errp, "%s", msg);
> @@ -150,18 +143,18 @@ sftp_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
>      va_end(args);
>  
>      if (s->sftp) {
> -        char *ssh_err;
> +        const char *ssh_err;
>          int ssh_err_code;
> -        unsigned long sftp_err_code;
> +        int sftp_err_code;
>  
> -        /* This is not an errno.  See <libssh2.h>. */
> -        ssh_err_code = libssh2_session_last_error(s->session,
> -                                                  &ssh_err, NULL, 0);
> -        /* See <libssh2_sftp.h>. */
> -        sftp_err_code = libssh2_sftp_last_error((s)->sftp);
> +        /* This is not an errno.  See <libssh/libssh.h>. */
> +        ssh_err = ssh_get_error(s->session);
> +        ssh_err_code = ssh_get_error_code(s->session);
> +        /* See <libssh/sftp.h>. */
> +        sftp_err_code = sftp_get_error(s->sftp);
>  
>          error_setg(errp,
> -                   "%s: %s (libssh2 error code: %d, sftp error code: %lu)",
> +                   "%s: %s (libssh error code: %d, sftp error code: %d)",
>                     msg, ssh_err, ssh_err_code, sftp_err_code);

Ditto, etc.

>      } else {
>          error_setg(errp, "%s", msg);
> @@ -171,15 +164,15 @@ sftp_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
>  
>  static void sftp_error_trace(BDRVSSHState *s, const char *op)
>  {
> -    char *ssh_err;
> +    const char *ssh_err;
>      int ssh_err_code;
> -    unsigned long sftp_err_code;
> +    int sftp_err_code;
>  
> -    /* This is not an errno.  See <libssh2.h>. */
> -    ssh_err_code = libssh2_session_last_error(s->session,
> -                                              &ssh_err, NULL, 0);
> -    /* See <libssh2_sftp.h>. */
> -    sftp_err_code = libssh2_sftp_last_error((s)->sftp);
> +    /* This is not an errno.  See <libssh/libssh.h>. */
> +    ssh_err = ssh_get_error(s->session);
> +    ssh_err_code = ssh_get_error_code(s->session);
> +    /* See <libssh/sftp.h>. */
> +    sftp_err_code = sftp_get_error(s->sftp);
>  
>      trace_sftp_error(op, ssh_err, ssh_err_code, sftp_err_code);
>  }
> @@ -280,82 +273,89 @@ static void ssh_parse_filename(const char *filename, QDict *options,
>      parse_uri(filename, options, errp);
>  }
>  
> -static int check_host_key_knownhosts(BDRVSSHState *s,
> -                                     const char *host, int port, Error **errp)
> +static int check_host_key_knownhosts(BDRVSSHState *s, Error **errp)
>  {
> -    const char *home;
> -    char *knh_file = NULL;
> -    LIBSSH2_KNOWNHOSTS *knh = NULL;
> -    struct libssh2_knownhost *found;
> -    int ret, r;
> -    const char *hostkey;
> -    size_t len;
> -    int type;
> +    int ret;
> +#if HAVE_LIBSSH_0_8

[1] See previous comment about HAVE_LIBSSH_0_8.

> +    enum ssh_known_hosts_e state;
>  
> -    hostkey = libssh2_session_hostkey(s->session, &len, &type);
> -    if (!hostkey) {
> +    state = ssh_session_is_known_server(s->session);
> +    trace_ssh_server_status(state);
> +
> +    switch (state) {
> +    case SSH_KNOWN_HOSTS_OK:
> +        /* OK */
> +        trace_ssh_check_host_key_knownhosts();
> +        break;
> +    case SSH_KNOWN_HOSTS_CHANGED:
>          ret = -EINVAL;
> -        session_error_setg(errp, s, "failed to read remote host key");
> +        error_setg(errp, "host key does not match the one in known_hosts");
>          goto out;
> -    }
> -
> -    knh = libssh2_knownhost_init(s->session);
> -    if (!knh) {
> +    case SSH_KNOWN_HOSTS_OTHER:
>          ret = -EINVAL;
> -        session_error_setg(errp, s,
> -                           "failed to initialize known hosts support");
> +        error_setg(errp,
> +                   "host key for this server not found, another type exists");
> +        goto out;
> +    case SSH_KNOWN_HOSTS_UNKNOWN:
> +        ret = -ENOENT;
> +        error_setg(errp, "no host key was found in known_hosts");
> +        goto out;
> +    case SSH_KNOWN_HOSTS_NOT_FOUND:
> +        ret = -EINVAL;
> +        error_setg(errp, "known_hosts file not found");
> +        goto out;
> +    case SSH_KNOWN_HOSTS_ERROR:
> +        ret = -EINVAL;
> +        error_setg(errp, "error while checking the host");
> +        goto out;
> +    default:

I'd rather not use a default case, so if libssh get more
ssh_known_hosts_e, we get a build failure and add the new cases.

> +        ret = -EINVAL;
> +        error_setg(errp, "error while checking for known server");
>          goto out;
>      }
> +#else /* !HAVE_LIBSSH_0_8 */
> +    int state;
>  
> -    home = getenv("HOME");
> -    if (home) {
> -        knh_file = g_strdup_printf("%s/.ssh/known_hosts", home);
> -    } else {
> -        knh_file = g_strdup_printf("/root/.ssh/known_hosts");
> -    }
> -
> -    /* Read all known hosts from OpenSSH-style known_hosts file. */
> -    libssh2_knownhost_readfile(knh, knh_file, LIBSSH2_KNOWNHOST_FILE_OPENSSH);
> +    state = ssh_is_server_known(s->session);
> +    trace_ssh_server_status(state);
>  
> -    r = libssh2_knownhost_checkp(knh, host, port, hostkey, len,
> -                                 LIBSSH2_KNOWNHOST_TYPE_PLAIN|
> -                                 LIBSSH2_KNOWNHOST_KEYENC_RAW,
> -                                 &found);
> -    switch (r) {
> -    case LIBSSH2_KNOWNHOST_CHECK_MATCH:
> +    switch (state) {
> +    case SSH_SERVER_KNOWN_OK:
>          /* OK */
> -        trace_ssh_check_host_key_knownhosts(found->key);
> +        trace_ssh_check_host_key_knownhosts();
>          break;
> -    case LIBSSH2_KNOWNHOST_CHECK_MISMATCH:
> +    case SSH_SERVER_KNOWN_CHANGED:
> +        ret = -EINVAL;
> +        error_setg(errp, "host key does not match the one in known_hosts");
> +        goto out;
> +    case SSH_SERVER_FOUND_OTHER:
>          ret = -EINVAL;
> -        session_error_setg(errp, s,
> -                      "host key does not match the one in known_hosts"
> -                      " (found key %s)", found->key);
> +        error_setg(errp,
> +                   "host key for this server not found, another type exists");
> +        goto out;
> +    case SSH_SERVER_FILE_NOT_FOUND:
> +        ret = -ENOENT;
> +        error_setg(errp, "known_hosts file not found");
>          goto out;
> -    case LIBSSH2_KNOWNHOST_CHECK_NOTFOUND:
> +    case SSH_SERVER_NOT_KNOWN:
>          ret = -EINVAL;
> -        session_error_setg(errp, s, "no host key was found in known_hosts");
> +        error_setg(errp, "no host key was found in known_hosts");
>          goto out;
> -    case LIBSSH2_KNOWNHOST_CHECK_FAILURE:
> +    case SSH_SERVER_ERROR:
>          ret = -EINVAL;
> -        session_error_setg(errp, s,
> -                      "failure matching the host key with known_hosts");
> +        error_setg(errp, "server error");
>          goto out;
>      default:
>          ret = -EINVAL;
> -        session_error_setg(errp, s, "unknown error matching the host key"
> -                      " with known_hosts (%d)", r);
> +        error_setg(errp, "error while checking for known server");
>          goto out;

Here the default is dead code, I'd remove it too.

>      }
> +#endif /* !HAVE_LIBSSH_0_8 */
>  
>      /* known_hosts checking successful. */
>      ret = 0;
>  
>   out:
> -    if (knh != NULL) {
> -        libssh2_knownhost_free(knh);
> -    }
> -    g_free(knh_file);
>      return ret;
>  }
>  
> @@ -399,18 +399,34 @@ static int compare_fingerprint(const unsigned char *fingerprint, size_t len,
>  
>  static int
>  check_host_key_hash(BDRVSSHState *s, const char *hash,
> -                    int hash_type, size_t fingerprint_len, Error **errp)
> +                    enum ssh_publickey_hash_type type, Error **errp)
>  {
> -    const char *fingerprint;
> +    int r;
> +    ssh_key pubkey;
> +    unsigned char *server_hash;
> +    size_t server_hash_len;
>  
> -    fingerprint = libssh2_hostkey_hash(s->session, hash_type);
> -    if (!fingerprint) {
> +#if HAVE_LIBSSH_0_8
> +    r = ssh_get_server_publickey(s->session, &pubkey);
> +#else
> +    r = ssh_get_publickey(s->session, &pubkey);
> +#endif
> +    if (r != SSH_OK) {
>          session_error_setg(errp, s, "failed to read remote host key");
>          return -EINVAL;
>      }
>  
> -    if(compare_fingerprint((unsigned char *) fingerprint, fingerprint_len,
> -                           hash) != 0) {
> +    r = ssh_get_publickey_hash(pubkey, type, &server_hash, &server_hash_len);
> +    ssh_key_free(pubkey);
> +    if (r != 0) {
> +        session_error_setg(errp, s,
> +                           "failed reading the hash of the server SSH key");
> +        return -EINVAL;
> +    }
> +
> +    r = compare_fingerprint(server_hash, server_hash_len, hash);
> +    ssh_clean_pubkey_hash(&server_hash);
> +    if (r != 0) {
>          error_setg(errp, "remote host key does not match host_key_check '%s'",
>                     hash);
>          return -EPERM;
> @@ -419,8 +435,7 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
>      return 0;
>  }
>  
> -static int check_host_key(BDRVSSHState *s, const char *host, int port,
> -                          SshHostKeyCheck *hkc, Error **errp)
> +static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
>  {
>      SshHostKeyCheckMode mode;
>  
> @@ -436,15 +451,15 @@ static int check_host_key(BDRVSSHState *s, const char *host, int port,
>      case SSH_HOST_KEY_CHECK_MODE_HASH:
>          if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_MD5) {
>              return check_host_key_hash(s, hkc->u.hash.hash,
> -                                       LIBSSH2_HOSTKEY_HASH_MD5, 16, errp);
> +                                       SSH_PUBLICKEY_HASH_MD5, errp);
>          } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA1) {
>              return check_host_key_hash(s, hkc->u.hash.hash,
> -                                       LIBSSH2_HOSTKEY_HASH_SHA1, 20, errp);
> +                                       SSH_PUBLICKEY_HASH_SHA1, errp);
>          }
>          g_assert_not_reached();

At least Fedora 29 uses SSH_PUBLICKEY_HASH_SHA256.

>          break;
>      case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
> -        return check_host_key_knownhosts(s, host, port, errp);
> +        return check_host_key_knownhosts(s, errp);
>      default:
>          g_assert_not_reached();
>      }
> @@ -452,60 +467,42 @@ static int check_host_key(BDRVSSHState *s, const char *host, int port,
>      return -EINVAL;
>  }
>  
> -static int authenticate(BDRVSSHState *s, const char *user, Error **errp)
> +static int authenticate(BDRVSSHState *s, Error **errp)
>  {
>      int r, ret;
> -    const char *userauthlist;
> -    LIBSSH2_AGENT *agent = NULL;
> -    struct libssh2_agent_publickey *identity;
> -    struct libssh2_agent_publickey *prev_identity = NULL;
> +    int method;
>  
> -    userauthlist = libssh2_userauth_list(s->session, user, strlen(user));
> -    if (strstr(userauthlist, "publickey") == NULL) {
> +    /* Try to authenticate with the "none" method. */
> +    r = ssh_userauth_none(s->session, NULL);
> +    if (r == SSH_AUTH_ERROR) {
>          ret = -EPERM;
> -        error_setg(errp,
> -                "remote server does not support \"publickey\" authentication");
> +        session_error_setg(errp, s, "failed to authenticate using none "
> +                                    "authentication");
>          goto out;
> -    }
> -
> -    /* Connect to ssh-agent and try each identity in turn. */
> -    agent = libssh2_agent_init(s->session);
> -    if (!agent) {
> -        ret = -EINVAL;
> -        session_error_setg(errp, s, "failed to initialize ssh-agent support");
> -        goto out;
> -    }
> -    if (libssh2_agent_connect(agent)) {
> -        ret = -ECONNREFUSED;
> -        session_error_setg(errp, s, "failed to connect to ssh-agent");
> -        goto out;
> -    }
> -    if (libssh2_agent_list_identities(agent)) {
> -        ret = -EINVAL;
> -        session_error_setg(errp, s,
> -                           "failed requesting identities from ssh-agent");
> +    } else if (r == SSH_AUTH_SUCCESS) {
> +        /* Authenticated! */
> +        ret = 0;
>          goto out;
>      }
>  
> -    for(;;) {
> -        r = libssh2_agent_get_identity(agent, &identity, prev_identity);
> -        if (r == 1) {           /* end of list */
> -            break;
> -        }
> -        if (r < 0) {
> +    method = ssh_userauth_list(s->session, NULL);
> +    trace_ssh_auth_methods(method);
> +
> +    /* Try to authenticate with publickey, using the ssh-agent
> +     * if available.
> +     */
> +    if (method & SSH_AUTH_METHOD_PUBLICKEY) {
> +        r = ssh_userauth_publickey_auto(s->session, NULL, NULL);
> +        if (r == SSH_AUTH_ERROR) {
>              ret = -EINVAL;
> -            session_error_setg(errp, s,
> -                               "failed to obtain identity from ssh-agent");
> +            session_error_setg(errp, s, "failed to authenticate using "
> +                                        "publickey authentication");
>              goto out;
> -        }
> -        r = libssh2_agent_userauth(agent, user, identity);
> -        if (r == 0) {
> +        } else if (r == SSH_AUTH_SUCCESS) {
>              /* Authenticated! */
>              ret = 0;
>              goto out;
>          }
> -        /* Failed to authenticate with this identity, try the next one. */
> -        prev_identity = identity;
>      }
>  
>      ret = -EPERM;
> @@ -513,13 +510,6 @@ static int authenticate(BDRVSSHState *s, const char *user, Error **errp)
>                 "and the identities held by your ssh-agent");
>  
>   out:
> -    if (agent != NULL) {
> -        /* Note: libssh2 implementation implicitly calls
> -         * libssh2_agent_disconnect if necessary.
> -         */
> -        libssh2_agent_free(agent);
> -    }
> -
>      return ret;
>  }
>  
> @@ -638,7 +628,8 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOptionsSsh *opts,
>                            int ssh_flags, int creat_mode, Error **errp)
>  {
>      int r, ret;
> -    long port = 0;
> +    unsigned int port = 0;
> +    int new_sock = -1;
>  
>      if (opts->has_user) {
>          s->user = g_strdup(opts->user);
> @@ -655,71 +646,145 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOptionsSsh *opts,
>      s->inet = opts->server;
>      opts->server = NULL;
>  
> -    if (qemu_strtol(s->inet->port, NULL, 10, &port) < 0) {
> +    if (qemu_strtoui(s->inet->port, NULL, 10, &port) < 0) {
>          error_setg(errp, "Use only numeric port value");
>          ret = -EINVAL;
>          goto err;
>      }
>  
>      /* Open the socket and connect. */
> -    s->sock = inet_connect_saddr(s->inet, errp);
> -    if (s->sock < 0) {
> +    new_sock = inet_connect_saddr(s->inet, errp);
> +    if (new_sock < 0) {
>          ret = -EIO;
>          goto err;
>      }
>  
> +    /* Try to disable the Nagle algorithm on TCP sockets to reduce latency,
> +     * but do not fail if it cannot be disabled.
> +     */
> +    r = socket_set_nodelay(new_sock);
> +    if (r < 0) {
> +        warn_report("setting NODELAY for the ssh server %s failed: %m",
> +                    s->inet->host);
> +    }
> +
>      /* Create SSH session. */
> -    s->session = libssh2_session_init();
> +    s->session = ssh_new();
>      if (!s->session) {
>          ret = -EINVAL;
> -        session_error_setg(errp, s, "failed to initialize libssh2 session");
> +        session_error_setg(errp, s, "failed to initialize libssh session");
>          goto err;
>      }
>  
> -#if TRACE_LIBSSH2 != 0
> -    libssh2_trace(s->session, TRACE_LIBSSH2);
> -#endif
> +    /* Make sure we are in blocking mode during the connection and
> +     * authentication phases.
> +     */
> +    ssh_set_blocking(s->session, 1);
>  
> -    r = libssh2_session_handshake(s->session, s->sock);
> -    if (r != 0) {
> +    r = ssh_options_set(s->session, SSH_OPTIONS_USER, s->user);
> +    if (r < 0) {
> +        ret = -EINVAL;
> +        session_error_setg(errp, s,
> +                           "failed to set the user in the libssh session");
> +        goto err;
> +    }
> +
> +    r = ssh_options_set(s->session, SSH_OPTIONS_HOST, s->inet->host);
> +    if (r < 0) {
> +        ret = -EINVAL;
> +        session_error_setg(errp, s,
> +                           "failed to set the host in the libssh session");
> +        goto err;
> +    }
> +
> +    if (port > 0) {
> +        r = ssh_options_set(s->session, SSH_OPTIONS_PORT, &port);
> +        if (r < 0) {
> +            ret = -EINVAL;
> +            session_error_setg(errp, s,
> +                               "failed to set the port in the libssh session");
> +            goto err;
> +        }
> +    }
> +
> +    r = ssh_options_set(s->session, SSH_OPTIONS_COMPRESSION, "none");
> +    if (r < 0) {
> +        ret = -EINVAL;
> +        session_error_setg(errp, s,
> +                           "failed to disable the compression in the libssh "
> +                           "session");
> +        goto err;
> +    }
> +
> +    /* Read ~/.ssh/config. */
> +    r = ssh_options_parse_config(s->session, NULL);
> +    if (r < 0) {
> +        ret = -EINVAL;
> +        session_error_setg(errp, s, "failed to parse ~/.ssh/config");
> +        goto err;
> +    }
> +
> +    r = ssh_options_set(s->session, SSH_OPTIONS_FD, &new_sock);
> +    if (r < 0) {
> +        ret = -EINVAL;
> +        session_error_setg(errp, s,
> +                           "failed to set the socket in the libssh session");
> +        goto err;
> +    }
> +    /* libssh took ownership of the socket. */
> +    s->sock = new_sock;
> +    new_sock = -1;
> +
> +    /* Connect. */
> +    r = ssh_connect(s->session);
> +    if (r != SSH_OK) {
>          ret = -EINVAL;
>          session_error_setg(errp, s, "failed to establish SSH session");
>          goto err;
>      }
>  
>      /* Check the remote host's key against known_hosts. */
> -    ret = check_host_key(s, s->inet->host, port, opts->host_key_check, errp);
> +    ret = check_host_key(s, opts->host_key_check, errp);
>      if (ret < 0) {
>          goto err;
>      }
>  
>      /* Authenticate. */
> -    ret = authenticate(s, s->user, errp);
> +    ret = authenticate(s, errp);
>      if (ret < 0) {
>          goto err;
>      }
>  
>      /* Start SFTP. */
> -    s->sftp = libssh2_sftp_init(s->session);
> +    s->sftp = sftp_new(s->session);
>      if (!s->sftp) {
> -        session_error_setg(errp, s, "failed to initialize sftp handle");
> +        session_error_setg(errp, s, "failed to create sftp handle");
> +        ret = -EINVAL;
> +        goto err;
> +    }
> +
> +    r = sftp_init(s->sftp);
> +    if (r < 0) {
> +        sftp_error_setg(errp, s, "failed to initialize sftp handle");
>          ret = -EINVAL;
>          goto err;
>      }
>  
>      /* Open the remote file. */
>      trace_ssh_connect_to_ssh(opts->path, ssh_flags, creat_mode);
> -    s->sftp_handle = libssh2_sftp_open(s->sftp, opts->path, ssh_flags,
> -                                       creat_mode);
> +    s->sftp_handle = sftp_open(s->sftp, opts->path, ssh_flags, creat_mode);
>      if (!s->sftp_handle) {
> -        session_error_setg(errp, s, "failed to open remote file '%s'",
> -                           opts->path);
> +        sftp_error_setg(errp, s, "failed to open remote file '%s'",
> +                        opts->path);
>          ret = -EINVAL;
>          goto err;
>      }
>  
> -    r = libssh2_sftp_fstat(s->sftp_handle, &s->attrs);
> -    if (r < 0) {
> +    /* Make sure the SFTP file is handled in blocking mode. */
> +    sftp_file_set_blocking(s->sftp_handle);
> +
> +    s->attrs = sftp_fstat(s->sftp_handle);
> +    if (!s->attrs) {
>          sftp_error_setg(errp, s, "failed to read file attributes");
>          return -EINVAL;
>      }
> @@ -727,21 +792,26 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOptionsSsh *opts,
>      return 0;
>  
>   err:
> +    if (s->attrs) {
> +        sftp_attributes_free(s->attrs);
> +    }
> +    s->attrs = NULL;
>      if (s->sftp_handle) {
> -        libssh2_sftp_close(s->sftp_handle);
> +        sftp_close(s->sftp_handle);
>      }
>      s->sftp_handle = NULL;
>      if (s->sftp) {
> -        libssh2_sftp_shutdown(s->sftp);
> +        sftp_free(s->sftp);
>      }
>      s->sftp = NULL;
>      if (s->session) {
> -        libssh2_session_disconnect(s->session,
> -                                   "from qemu ssh client: "
> -                                   "error opening connection");
> -        libssh2_session_free(s->session);
> +        ssh_disconnect(s->session);
> +        ssh_free(s->session);
>      }
>      s->session = NULL;
> +    if (new_sock >= 0) {
> +        close(new_sock);
> +    }
>  
>      return ret;
>  }
> @@ -756,9 +826,11 @@ static int ssh_file_open(BlockDriverState *bs, QDict *options, int bdrv_flags,
>  
>      ssh_state_init(s);
>  
> -    ssh_flags = LIBSSH2_FXF_READ;
> +    ssh_flags = 0;
>      if (bdrv_flags & BDRV_O_RDWR) {
> -        ssh_flags |= LIBSSH2_FXF_WRITE;
> +        ssh_flags |= O_RDWR;
> +    } else {
> +        ssh_flags |= O_RDONLY;
>      }
>  
>      opts = ssh_parse_options(options, errp);
> @@ -773,16 +845,13 @@ static int ssh_file_open(BlockDriverState *bs, QDict *options, int bdrv_flags,
>      }
>  
>      /* Go non-blocking. */
> -    libssh2_session_set_blocking(s->session, 0);
> +    ssh_set_blocking(s->session, 0);
>  
>      qapi_free_BlockdevOptionsSsh(opts);
>  
>      return 0;
>  
>   err:
> -    if (s->sock >= 0) {
> -        close(s->sock);
> -    }
>      s->sock = -1;
>  
>      qapi_free_BlockdevOptionsSsh(opts);
> @@ -795,25 +864,25 @@ static int ssh_grow_file(BDRVSSHState *s, int64_t offset, Error **errp)
>  {
>      ssize_t ret;
>      char c[1] = { '\0' };
> -    int was_blocking = libssh2_session_get_blocking(s->session);
> +    int was_blocking = ssh_is_blocking(s->session);
>  
>      /* offset must be strictly greater than the current size so we do
>       * not overwrite anything */
> -    assert(offset > 0 && offset > s->attrs.filesize);
> +    assert(offset > 0 && offset > s->attrs->size);
>  
> -    libssh2_session_set_blocking(s->session, 1);
> +    ssh_set_blocking(s->session, 1);
>  
> -    libssh2_sftp_seek64(s->sftp_handle, offset - 1);
> -    ret = libssh2_sftp_write(s->sftp_handle, c, 1);
> +    sftp_seek64(s->sftp_handle, offset - 1);
> +    ret = sftp_write(s->sftp_handle, c, 1);
>  
> -    libssh2_session_set_blocking(s->session, was_blocking);
> +    ssh_set_blocking(s->session, was_blocking);
>  
>      if (ret < 0) {
>          sftp_error_setg(errp, s, "Failed to grow file");
>          return -EIO;
>      }
>  
> -    s->attrs.filesize = offset;
> +    s->attrs->size = offset;
>      return 0;
>  }
>  
> @@ -841,8 +910,7 @@ static int ssh_co_create(BlockdevCreateOptions *options, Error **errp)
>      ssh_state_init(&s);
>  
>      ret = connect_to_ssh(&s, opts->location,
> -                         LIBSSH2_FXF_READ|LIBSSH2_FXF_WRITE|
> -                         LIBSSH2_FXF_CREAT|LIBSSH2_FXF_TRUNC,
> +                         O_RDWR | O_CREAT | O_TRUNC,
>                           0644, errp);
>      if (ret < 0) {
>          goto fail;
> @@ -911,10 +979,8 @@ static int ssh_has_zero_init(BlockDriverState *bs)
>      /* Assume false, unless we can positively prove it's true. */
>      int has_zero_init = 0;
>  
> -    if (s->attrs.flags & LIBSSH2_SFTP_ATTR_PERMISSIONS) {
> -        if (s->attrs.permissions & LIBSSH2_SFTP_S_IFREG) {
> -            has_zero_init = 1;
> -        }
> +    if (s->attrs->type == SSH_FILEXFER_TYPE_REGULAR) {
> +        has_zero_init = 1;
>      }
>  
>      return has_zero_init;
> @@ -951,12 +1017,12 @@ static coroutine_fn void co_yield(BDRVSSHState *s, BlockDriverState *bs)
>          .co = qemu_coroutine_self()
>      };
>  
> -    r = libssh2_session_block_directions(s->session);
> +    r = ssh_get_poll_flags(s->session);
>  
> -    if (r & LIBSSH2_SESSION_BLOCK_INBOUND) {
> +    if (r & SSH_READ_PENDING) {
>          rd_handler = restart_coroutine;
>      }
> -    if (r & LIBSSH2_SESSION_BLOCK_OUTBOUND) {
> +    if (r & SSH_WRITE_PENDING) {
>          wr_handler = restart_coroutine;
>      }
>  
> @@ -968,33 +1034,6 @@ static coroutine_fn void co_yield(BDRVSSHState *s, BlockDriverState *bs)
>      trace_ssh_co_yield_back(s->sock);
>  }
>  
> -/* SFTP has a function `libssh2_sftp_seek64' which seeks to a position
> - * in the remote file.  Notice that it just updates a field in the
> - * sftp_handle structure, so there is no network traffic and it cannot
> - * fail.
> - *
> - * However, `libssh2_sftp_seek64' does have a catastrophic effect on
> - * performance since it causes the handle to throw away all in-flight
> - * reads and buffered readahead data.  Therefore this function tries
> - * to be intelligent about when to call the underlying libssh2 function.
> - */
> -#define SSH_SEEK_WRITE 0
> -#define SSH_SEEK_READ  1
> -#define SSH_SEEK_FORCE 2
> -
> -static void ssh_seek(BDRVSSHState *s, int64_t offset, int flags)
> -{
> -    bool op_read = (flags & SSH_SEEK_READ) != 0;
> -    bool force = (flags & SSH_SEEK_FORCE) != 0;
> -
> -    if (force || op_read != s->offset_op_read || offset != s->offset) {
> -        trace_ssh_seek(offset);
> -        libssh2_sftp_seek64(s->sftp_handle, offset);
> -        s->offset = offset;
> -        s->offset_op_read = op_read;
> -    }
> -}
> -
>  static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>                                   int64_t offset, size_t size,
>                                   QEMUIOVector *qiov)
> @@ -1006,7 +1045,8 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>  
>      trace_ssh_read(offset, size);
>  
> -    ssh_seek(s, offset, SSH_SEEK_READ);
> +    trace_ssh_seek(offset);
> +    sftp_seek64(s->sftp_handle, offset);
>  
>      /* This keeps track of the current iovec element ('i'), where we
>       * will write to next ('buf'), and the end of the current iovec
> @@ -1016,35 +1056,33 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>      buf = i->iov_base;
>      end_of_vec = i->iov_base + i->iov_len;
>  
> -    /* libssh2 has a hard-coded limit of 2000 bytes per request,
> -     * although it will also do readahead behind our backs.  Therefore
> -     * we may have to do repeated reads here until we have read 'size'
> -     * bytes.
> -     */
>      for (got = 0; got < size; ) {
>      again:

I'd use:

    const ptrdiff_t request_read_size = MIN(end_of_vec - buf, 16 * KiB);

> -        trace_ssh_read_buf(buf, end_of_vec - buf);
> -        r = libssh2_sftp_read(s->sftp_handle, buf, end_of_vec - buf);
> -        trace_ssh_read_return(r);
> +        trace_ssh_read_buf(buf, end_of_vec - buf, MIN(end_of_vec - buf, 16384));

and use 'request_read_size' here,

> +        /* The size of SFTP packets is limited to 32K bytes, so limit
> +         * the amount of data requested to 16K, as libssh currently
> +         * does not handle multiple requests on its own:
> +         * https://red.libssh.org/issues/58
> +         */
> +        r = sftp_read(s->sftp_handle, buf, MIN(end_of_vec - buf, 16384));

and here.

> +        trace_ssh_read_return(r, sftp_get_error(s->sftp));
>  
> -        if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
> +        if (r == SSH_AGAIN) {
>              co_yield(s, bs);
>              goto again;
>          }
> -        if (r < 0) {
> -            sftp_error_trace(s, "read");
> -            s->offset = -1;
> -            return -EIO;
> -        }
> -        if (r == 0) {
> +        if (r == SSH_EOF || (r == 0 && sftp_get_error(s->sftp) == SSH_FX_EOF)) {
>              /* EOF: Short read so pad the buffer with zeroes and return it. */
>              qemu_iovec_memset(qiov, got, 0, size - got);
>              return 0;
>          }
> +        if (r <= 0) {
> +            sftp_error_trace(s, "read");
> +            return -EIO;
> +        }
>  
>          got += r;
>          buf += r;
> -        s->offset += r;
>          if (buf >= end_of_vec && got < size) {
>              i++;
>              buf = i->iov_base;
> @@ -1081,7 +1119,8 @@ static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
>  
>      trace_ssh_write(offset, size);
>  
> -    ssh_seek(s, offset, SSH_SEEK_WRITE);
> +    trace_ssh_seek(offset);
> +    sftp_seek64(s->sftp_handle, offset);
>  
>      /* This keeps track of the current iovec element ('i'), where we
>       * will read from next ('buf'), and the end of the current iovec
> @@ -1093,45 +1132,34 @@ static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
>  
>      for (written = 0; written < size; ) {
>      again:

Ditto 'request_write_size = MIN(..., 128 * KiB)'.

> -        trace_ssh_write_buf(buf, end_of_vec - buf);
> -        r = libssh2_sftp_write(s->sftp_handle, buf, end_of_vec - buf);
> -        trace_ssh_write_return(r);
> +        trace_ssh_write_buf(buf, end_of_vec - buf, MIN(end_of_vec - buf, 131072));
> +        /* Avoid too large data packets, as libssh currently does not
> +         * handle multiple requests on its own:
> +         * https://red.libssh.org/issues/58
> +         */
> +        r = sftp_write(s->sftp_handle, buf, MIN(end_of_vec - buf, 131072));
> +        trace_ssh_write_return(r, sftp_get_error(s->sftp));
>  
> -        if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
> +        if (r == SSH_AGAIN) {
>              co_yield(s, bs);
>              goto again;
>          }
>          if (r < 0) {
>              sftp_error_trace(s, "write");
> -            s->offset = -1;
>              return -EIO;
>          }
> -        /* The libssh2 API is very unclear about this.  A comment in
> -         * the code says "nothing was acked, and no EAGAIN was
> -         * received!" which apparently means that no data got sent
> -         * out, and the underlying channel didn't return any EAGAIN
> -         * indication.  I think this is a bug in either libssh2 or
> -         * OpenSSH (server-side).  In any case, forcing a seek (to
> -         * discard libssh2 internal buffers), and then trying again
> -         * works for me.
> -         */
> -        if (r == 0) {
> -            ssh_seek(s, offset + written, SSH_SEEK_WRITE|SSH_SEEK_FORCE);
> -            co_yield(s, bs);
> -            goto again;
> -        }
>  
>          written += r;
>          buf += r;
> -        s->offset += r;
>          if (buf >= end_of_vec && written < size) {
>              i++;
>              buf = i->iov_base;
>              end_of_vec = i->iov_base + i->iov_len;
>          }
>  
> -        if (offset + written > s->attrs.filesize)
> -            s->attrs.filesize = offset + written;
> +        if (offset + written > s->attrs->size) {
> +            s->attrs->size = offset + written;
> +        }
>      }
>  
>      return 0;
> @@ -1166,24 +1194,24 @@ static void unsafe_flush_warning(BDRVSSHState *s, const char *what)
>      }
>  }
>  
> -#ifdef HAS_LIBSSH2_SFTP_FSYNC
> +#if HAVE_LIBSSH_0_8
>  
>  static coroutine_fn int ssh_flush(BDRVSSHState *s, BlockDriverState *bs)
>  {
>      int r;
>  
>      trace_ssh_flush();
> +
> +    if (!sftp_extension_supported(s->sftp, "fsync@openssh.com", "1")) {
> +        unsafe_flush_warning(s, "OpenSSH >= 6.3");
> +        return 0;
> +    }
>   again:
> -    r = libssh2_sftp_fsync(s->sftp_handle);
> -    if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
> +    r = sftp_fsync(s->sftp_handle);
> +    if (r == SSH_AGAIN) {
>          co_yield(s, bs);
>          goto again;
>      }
> -    if (r == LIBSSH2_ERROR_SFTP_PROTOCOL &&
> -        libssh2_sftp_last_error(s->sftp) == LIBSSH2_FX_OP_UNSUPPORTED) {
> -        unsafe_flush_warning(s, "OpenSSH >= 6.3");
> -        return 0;
> -    }
>      if (r < 0) {
>          sftp_error_trace(s, "fsync");
>          return -EIO;
> @@ -1204,25 +1232,25 @@ static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
>      return ret;
>  }
>  
> -#else /* !HAS_LIBSSH2_SFTP_FSYNC */
> +#else /* !HAVE_LIBSSH_0_8 */
>  
>  static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
>  {
>      BDRVSSHState *s = bs->opaque;
>  
> -    unsafe_flush_warning(s, "libssh2 >= 1.4.4");
> +    unsafe_flush_warning(s, "libssh >= 0.8.0");
>      return 0;
>  }
>  
> -#endif /* !HAS_LIBSSH2_SFTP_FSYNC */
> +#endif /* !HAVE_LIBSSH_0_8 */
>  
>  static int64_t ssh_getlength(BlockDriverState *bs)
>  {
>      BDRVSSHState *s = bs->opaque;
>      int64_t length;
>  
> -    /* Note we cannot make a libssh2 call here. */
> -    length = (int64_t) s->attrs.filesize;
> +    /* Note we cannot make a libssh call here. */
> +    length = (int64_t) s->attrs->size;
>      trace_ssh_getlength(length);
>  
>      return length;
> @@ -1239,12 +1267,12 @@ static int coroutine_fn ssh_co_truncate(BlockDriverState *bs, int64_t offset,
>          return -ENOTSUP;
>      }
>  
> -    if (offset < s->attrs.filesize) {
> +    if (offset < s->attrs->size) {
>          error_setg(errp, "ssh driver does not support shrinking files");
>          return -ENOTSUP;
>      }
>  
> -    if (offset == s->attrs.filesize) {
> +    if (offset == s->attrs->size) {
>          return 0;
>      }
>  
> @@ -1339,12 +1367,16 @@ static void bdrv_ssh_init(void)
>  {
>      int r;
>  
> -    r = libssh2_init(0);
> +    r = ssh_init();
>      if (r != 0) {
> -        fprintf(stderr, "libssh2 initialization failed, %d\n", r);
> +        fprintf(stderr, "libssh initialization failed, %d\n", r);
>          exit(EXIT_FAILURE);
>      }
>  
> +#if TRACE_LIBSSH != 0
> +    ssh_set_log_level(TRACE_LIBSSH);
> +#endif
> +
>      bdrv_register(&bdrv_ssh);
>  }
>  
> diff --git a/block/trace-events b/block/trace-events
> index eab51497fc..0d2126e840 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -169,19 +169,21 @@ nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags
>  # ssh.c
>  ssh_restart_coroutine(void *co) "co=%p"
>  ssh_flush(void) "fsync"
> -ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
> +ssh_check_host_key_knownhosts(void) "host key OK"
>  ssh_connect_to_ssh(char *path, int flags, int mode) "opening file %s flags=0x%x creat_mode=0%o"
>  ssh_co_yield(int sock, void *rd_handler, void *wr_handler) "s->sock=%d rd_handler=%p wr_handler=%p"
>  ssh_co_yield_back(int sock) "s->sock=%d - back"
>  ssh_getlength(int64_t length) "length=%" PRIi64
>  ssh_co_create_opts(uint64_t size) "total_size=%" PRIu64
>  ssh_read(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
> -ssh_read_buf(void *buf, size_t size) "sftp_read buf=%p size=%zu"
> -ssh_read_return(ssize_t ret) "sftp_read returned %zd"
> +ssh_read_buf(void *buf, size_t size, size_t actual_size) "sftp_read buf=%p size=%zu (actual size=%zu)"
> +ssh_read_return(ssize_t ret, int sftp_err) "sftp_read returned %zd (sftp error=%d)"
>  ssh_write(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
> -ssh_write_buf(void *buf, size_t size) "sftp_write buf=%p size=%zu"
> -ssh_write_return(ssize_t ret) "sftp_write returned %zd"
> +ssh_write_buf(void *buf, size_t size, size_t actual_size) "sftp_write buf=%p size=%zu (actual size=%zu)"
> +ssh_write_return(ssize_t ret, int sftp_err) "sftp_write returned %zd (sftp error=%d)"
>  ssh_seek(int64_t offset) "seeking to offset=%" PRIi64
> +ssh_auth_methods(int methods) "auth methods=%x"

Please use 0x prefix.

> +ssh_server_status(int status) "server status=%d"
>  
>  # curl.c
>  curl_timer_cb(long timeout_ms) "timer callback timeout_ms %ld"
> @@ -214,4 +216,4 @@ sheepdog_snapshot_create(const char *sn_name, const char *id) "%s %s"
>  sheepdog_snapshot_create_inode(const char *name, uint32_t snap, uint32_t vdi) "s->inode: name %s snap_id 0x%" PRIx32 " vdi 0x%" PRIx32
>  
>  # ssh.c
> -sftp_error(const char *op, const char *ssh_err, int ssh_err_code, unsigned long sftp_err_code) "%s failed: %s (libssh2 error code: %d, sftp error code: %lu)"
> +sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
> diff --git a/configure b/configure
> index b091b82cb3..bfdd70c40a 100755
> --- a/configure
> +++ b/configure
> @@ -472,7 +472,7 @@ auth_pam=""
>  vte=""
>  virglrenderer=""
>  tpm=""
> -libssh2=""
> +libssh=""
>  live_block_migration="yes"
>  numa=""
>  tcmalloc="no"
> @@ -1439,9 +1439,9 @@ for opt do
>    ;;
>    --enable-tpm) tpm="yes"
>    ;;
> -  --disable-libssh2) libssh2="no"
> +  --disable-libssh) libssh="no"
>    ;;
> -  --enable-libssh2) libssh2="yes"
> +  --enable-libssh) libssh="yes"
>    ;;
>    --disable-live-block-migration) live_block_migration="no"
>    ;;
> @@ -1810,7 +1810,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>    coroutine-pool  coroutine freelist (better performance)
>    glusterfs       GlusterFS backend
>    tpm             TPM support
> -  libssh2         ssh block device support
> +  libssh          ssh block device support
>    numa            libnuma support
>    libxml2         for Parallels image format
>    tcmalloc        tcmalloc support
> @@ -3914,43 +3914,17 @@ EOF
>  fi
>  
>  ##########################################
> -# libssh2 probe
> -min_libssh2_version=1.2.8
> -if test "$libssh2" != "no" ; then
> -  if $pkg_config --atleast-version=$min_libssh2_version libssh2; then
> -    libssh2_cflags=$($pkg_config libssh2 --cflags)
> -    libssh2_libs=$($pkg_config libssh2 --libs)
> -    libssh2=yes
> +# libssh probe
> +if test "$libssh" != "no" ; then
> +  if $pkg_config --exists libssh; then
> +    libssh_cflags=$($pkg_config libssh --cflags)
> +    libssh_libs=$($pkg_config libssh --libs)
> +    libssh=yes
>    else
> -    if test "$libssh2" = "yes" ; then
> -      error_exit "libssh2 >= $min_libssh2_version required for --enable-libssh2"
> +    if test "$libssh" = "yes" ; then
> +      error_exit "libssh required for --enable-libssh"
>      fi
> -    libssh2=no
> -  fi
> -fi
> -
> -##########################################
> -# libssh2_sftp_fsync probe
> -
> -if test "$libssh2" = "yes"; then
> -  cat > $TMPC <<EOF
> -#include <stdio.h>
> -#include <libssh2.h>
> -#include <libssh2_sftp.h>
> -int main(void) {
> -    LIBSSH2_SESSION *session;
> -    LIBSSH2_SFTP *sftp;
> -    LIBSSH2_SFTP_HANDLE *sftp_handle;
> -    session = libssh2_session_init ();
> -    sftp = libssh2_sftp_init (session);
> -    sftp_handle = libssh2_sftp_open (sftp, "/", 0, 0);
> -    libssh2_sftp_fsync (sftp_handle);
> -    return 0;
> -}
> -EOF
> -  # libssh2_cflags/libssh2_libs defined in previous test.
> -  if compile_prog "$libssh2_cflags" "$libssh2_libs" ; then
> -    QEMU_CFLAGS="-DHAS_LIBSSH2_SFTP_FSYNC $QEMU_CFLAGS"
> +    libssh=no
>    fi
>  fi
>  
> @@ -6451,7 +6425,7 @@ echo "GlusterFS support $glusterfs"
>  echo "gcov              $gcov_tool"
>  echo "gcov enabled      $gcov"
>  echo "TPM support       $tpm"
> -echo "libssh2 support   $libssh2"
> +echo "libssh support    $libssh"
>  echo "QOM debugging     $qom_cast_debug"
>  echo "Live block migration $live_block_migration"
>  echo "lzo support       $lzo"
> @@ -7144,10 +7118,10 @@ if test "$glusterfs_iocb_has_stat" = "yes" ; then
>    echo "CONFIG_GLUSTERFS_IOCB_HAS_STAT=y" >> $config_host_mak
>  fi
>  
> -if test "$libssh2" = "yes" ; then
> -  echo "CONFIG_LIBSSH2=m" >> $config_host_mak
> -  echo "LIBSSH2_CFLAGS=$libssh2_cflags" >> $config_host_mak
> -  echo "LIBSSH2_LIBS=$libssh2_libs" >> $config_host_mak
> +if test "$libssh" = "yes" ; then
> +  echo "CONFIG_LIBSSH=m" >> $config_host_mak
> +  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
> +  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
>  fi
>  
>  if test "$live_block_migration" = "yes" ; then
> diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
> index ec9823793a..1239d9d648 100644
> --- a/tests/qemu-iotests/207.out
> +++ b/tests/qemu-iotests/207.out
> @@ -68,7 +68,7 @@ virtual size: 4 MiB (4194304 bytes)
>  
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "path": "/this/is/not/an/existing/path", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
>  {"return": {}}
> -Job failed: failed to open remote file '/this/is/not/an/existing/path': Failed opening remote file (libssh2 error code: -31)
> +Job failed: failed to open remote file '/this/is/not/an/existing/path': SFTP server: No such file (libssh error code: 1, sftp error code: 2)
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
>  
> 

Pino, this is the list of changes I did, as I commented on IRC:

1/ Build on Ubuntu:

./block/ssh.c:417:10: note: each undeclared identifier is reported only
once for each function it appears in
./block/ssh.c: In function 'check_host_key_hash':
./block/ssh.c:440:5: error: 'ssh_get_publickey' is deprecated
[-Werror=deprecated-declarations]
     r = ssh_get_publickey(s->session, &pubkey);
     ^
In file included from ./block/ssh.c:27:0:
/usr/include/libssh/libssh.h:489:31: note: declared here
 SSH_DEPRECATED LIBSSH_API int ssh_get_publickey(ssh_session session,
ssh_key *key);
                               ^~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

-- >8 --diff --git a/block/ssh.c b/block/ssh.c
index e62f9ee3b5..cb6fe0b17d 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -408,7 +408,7 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
     unsigned char *server_hash;
     size_t server_hash_len;

-#if HAVE_LIBSSH_0_8
+#ifdef HAVE_SSH_GET_SERVER_PUBLICKEY
     r = ssh_get_server_publickey(s->session, &pubkey);
 #else
     r = ssh_get_publickey(s->session, &pubkey);
diff --git a/configure b/configure
index bfdd70c40a..93547b4958 100755
--- a/configure
+++ b/configure
@@ -3928,6 +3928,18 @@ if test "$libssh" != "no" ; then
   fi
 fi

+# check for ssh_get_server_publickey
+if test "$libssh" = "yes" ; then
+  cat > $TMPC << EOF
+#include <libssh/libssh.h>
+int main(void) { return ssh_get_server_publickey(NULL, NULL);}
+EOF
+  if compile_prog "$libssh_cflags" "$libssh_libs"; then
+    libssh_cflags="-DHAVE_SSH_GET_SERVER_PUBLICKEY $libssh_cflags"
+  fi
+fi
+
+
 ##########################################
 # linux-aio probe---

See https://www.redhat.com/archives/libvir-list/2018-May/msg00597.html

2/ Checkpatch (you already fixed the style issues)

-- >8 --
diff --git a/block/trace-events b/block/trace-events
index 0d2126e840..cb91787bd9 100644
@@ -182,7 +182,7 @@ ssh_write(int64_t offset, size_t size) "offset=%"
PRIi64 " size=%zu"
 ssh_write_buf(void *buf, size_t size, size_t actual_size) "sftp_write
buf=%p size=%zu (actual size=%zu)"
 ssh_write_return(ssize_t ret, int sftp_err) "sftp_write returned %zd
(sftp error=%d)"
 ssh_seek(int64_t offset) "seeking to offset=%" PRIi64
-ssh_auth_methods(int methods) "auth methods=%x"
+ssh_auth_methods(int methods) "auth methods=0x%04x"
 ssh_server_status(int status) "server status=%d"
---

3/ Travis

-- >8 --
diff --git a/.travis.yml b/.travis.yml
index b053a836a3..a2dac8b7c9 100644
@@ -31,7 +31,7 @@ addons:
       - libseccomp-dev
       - libspice-protocol-dev
       - libspice-server-dev
-      - libssh2-1-dev
+      - libssh-dev
       - liburcu-dev
       - libusb-1.0-0-dev
       - libvte-2.91-dev
@@ -261,7 +261,7 @@ matrix:
             - libseccomp-dev
             - libspice-protocol-dev
             - libspice-server-dev
-            - libssh2-1-dev
+            - libssh-dev
             - liburcu-dev
             - libusb-1.0-0-dev
             - libvte-2.91-dev
---

4/ Docker

-- >8 --
diff --git a/tests/docker/dockerfiles/fedora.docker
b/tests/docker/dockerfiles/fedora.docker
index afbba29ada..8893c1b957 100644
@@ -35,7 +35,7 @@ ENV PACKAGES \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
-    libssh2-devel \
+    libssh-devel \
     libubsan \
     libusbx-devel \
     libxml2-devel \
@@ -50,7 +50,6 @@ ENV PACKAGES \
     mingw32-gtk3 \
     mingw32-libjpeg-turbo \
     mingw32-libpng \
-    mingw32-libssh2 \
     mingw32-libtasn1 \
     mingw32-nettle \
     mingw32-pixman \
@@ -64,7 +63,6 @@ ENV PACKAGES \
     mingw64-gtk3 \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
-    mingw64-libssh2 \
     mingw64-libtasn1 \
     mingw64-nettle \
     mingw64-pixman \
diff --git a/tests/docker/dockerfiles/ubuntu.docker
b/tests/docker/dockerfiles/ubuntu.docker
index 36e2b17de5..1bbb7f9598 100644
@@ -44,7 +44,7 @@ ENV PACKAGES flex bison \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
-    libssh2-1-dev \
+    libssh-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker
b/tests/docker/dockerfiles/ubuntu1804.docker
index 2e2900150b..9d80b11500 100644
@@ -40,7 +40,7 @@ ENV PACKAGES flex bison \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
-    libssh2-1-dev \
+    libssh-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
---

Note, libssh is not available on MinGW.

5/ Documentation

-- >8 --
diff --git a/docs/qemu-block-drivers.texi b/docs/qemu-block-drivers.texi
index da06a9bc83..91ab0eceae 100644
@@ -782,7 +782,7 @@ print a warning when @code{fsync} is not supported:

 warning: ssh server @code{ssh.example.com:22} does not support fsync

-With sufficiently new versions of libssh2 and OpenSSH, @code{fsync} is
+With sufficiently new versions of libssh and OpenSSH, @code{fsync} is
 supported.

---

Overall looks OK.

Since iotest #207 is quick, it would be nice to have it in our CI.

I guess a Docker Compose setup should work, I'll see what I can do.

Regards,

Phil.

