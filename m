Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23D397B80
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:03:06 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBXV-0004vI-Aq
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joakim.bech@linaro.org>)
 id 1loBVj-0003q2-AV
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:01:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joakim.bech@linaro.org>)
 id 1loBVe-0007z5-Cl
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:01:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id ci15so468080ejc.10
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=05+ARAja/jxqdAM6EzOu2mHPYFrtXuK5S33WwJov2Uw=;
 b=W0jY6ykqw5jPq2nl9LkDo8n3rRkb+hNIy9L5zu7m3xy8jI8DxeQ8ejLX9Xoj0+xnMp
 3UYy67NxJ5bXzkwR252b6An46BkKNnJqx3T0MrDtfc0h1k0rFZptR7Yg6V0/0dfT8U71
 zkBkarU6U5JlOIm7bce9a3/pWEhMnM0aWImadWGbhL6bd0AkAB0YcDAoQB2IJJQ4ajwX
 c4a3rSCvb2d+xixgX4bPUlmdcY8gwYB9mE0se07PMsMYR3GMBS4yNX6Iytbdv1wgSSIT
 3tf/dK46pvfnI3M5ySpKt1mrtpOmHg9yx9XJkiNRVSuF0DPa0sDr2s9OdVuZIZjP8/o+
 NEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=05+ARAja/jxqdAM6EzOu2mHPYFrtXuK5S33WwJov2Uw=;
 b=hhyQnd4UiZBQHRvkUQFPWCrk4oL0r4kDU98dpnVFVvQRcujq6WXZZMQzBU6zQCXRpL
 sNMrrfXCWJ1Gs8US2nqGP5vhe8YtOOBjbjNN3LSTOYI8CtF78cj3WrTpzt14OSCOn4l/
 7y4zcnreyqgY7mydkC4PtDTj3oOIK2kgDMoRxQxZxr44IhdmSJMYqyd25Ynn8MaFQ/Lf
 LunpF2alhSA+3aD2nKGeYW1iXz/eqZDmEfEH17Ao1z0rKHlp7T0UQPlU/ZHxc8gDuu7n
 afE+w6cwxx80RP04yTUpVR0pCXLCD5a75S+OzJj0Jx8KAz6mmXz2kBV2AoLMQiI7PuI2
 YFHg==
X-Gm-Message-State: AOAM532YjL6iVKKulEbDCuw8hahPOVD4zbnJeldVQLepXEcAzDSsTGbw
 QdZZ7HZ4oJp2hdGQv/2hvJHmuw==
X-Google-Smtp-Source: ABdhPJxjM77LVTFQr1ThuUbaqUZmPMzQ2yCy3/gEsTisERaPW0SPVuM9oHgXPMpKXYFZRAixilIoyg==
X-Received: by 2002:a17:906:f0cd:: with SMTP id
 dk13mr31096143ejb.11.1622581266166; 
 Tue, 01 Jun 2021 14:01:06 -0700 (PDT)
Received: from tuxedo (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
 by smtp.gmail.com with ESMTPSA id q9sm105299edw.51.2021.06.01.14.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 14:01:05 -0700 (PDT)
Date: Tue, 1 Jun 2021 23:01:02 +0200
From: Joakim Bech <joakim.bech@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [Stratos-dev] [PATCH 3/5] vhost-user-rng: backend: Add RNG
 vhost-user daemon implementation
Message-ID: <20210601210102.sntkt5hpozcc3k4w@tuxedo>
References: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
 <01000179c92c63a9-e6d77d99-cf4e-4474-9829-740b8c66e282-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01000179c92c63a9-e6d77d99-cf4e-4474-9829-740b8c66e282-000000@email.amazonses.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=joakim.bech@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: stratos-dev@op-lists.linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 08:03:20PM +0000, Mathieu Poirier via Stratos-dev wrote:
> This patch provides the vhost-user backend implementation to work
> in tandem with the vhost-user-rng implementation of the QEMU VMM.
> 
> It uses the vhost-user API so that other VMM can re-use the interface
> without having to write the driver again.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  tools/meson.build                        |   8 +
>  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
>  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
>  tools/vhost-user-rng/meson.build         |  10 +
>  4 files changed, 426 insertions(+)
>  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
>  create mode 100644 tools/vhost-user-rng/main.c
>  create mode 100644 tools/vhost-user-rng/meson.build
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 3e5a0abfa29f..66b0a11fbb45 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,3 +24,11 @@ endif
>  if have_virtiofsd
>    subdir('virtiofsd')
>  endif
> +
> +have_virtiorng = (have_system and
> +    have_tools and
> +    'CONFIG_LINUX' in config_host)
> +
> +if have_virtiorng
> +  subdir('vhost-user-rng')
> +endif
> diff --git a/tools/vhost-user-rng/50-qemu-rng.json.in b/tools/vhost-user-rng/50-qemu-rng.json.in
> new file mode 100644
> index 000000000000..9186c3c6fe1d
> --- /dev/null
> +++ b/tools/vhost-user-rng/50-qemu-rng.json.in
> @@ -0,0 +1,5 @@
> +{
> +  "description": "QEMU vhost-user-rng",
> +  "type": "bridge",
> +  "binary": "@libexecdir@/vhost-user-rng"
> +}
> diff --git a/tools/vhost-user-rng/main.c b/tools/vhost-user-rng/main.c
> new file mode 100644
> index 000000000000..ba7380b12659
> --- /dev/null
> +++ b/tools/vhost-user-rng/main.c
> @@ -0,0 +1,403 @@
> +/*
> + * VIRTIO RNG Emulation via vhost-user
> + *
> + * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#define G_LOG_DOMAIN "vhost-user-rng"
> +#define G_LOG_USE_STRUCTURED 1
> +
> +#include <glib.h>
> +#include <gio/gio.h>
> +#include <gio/gunixsocketaddress.h>
> +#include <glib-unix.h>
> +#include <glib/gstdio.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <inttypes.h>
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +#include <time.h>
> +#include <unistd.h>
> +#include <endian.h>
> +#include <assert.h>
> +
> +#include "qemu/cutils.h"
> +#include "subprojects/libvhost-user/libvhost-user-glib.h"
> +#include "subprojects/libvhost-user/libvhost-user.h"
> +
> +#ifndef container_of
> +#define container_of(ptr, type, member) ({                      \
> +        const typeof(((type *) 0)->member) * __mptr = (ptr);     \
> +        (type *) ((char *) __mptr - offsetof(type, member)); })
> +#endif
> +
> +typedef struct {
> +    VugDev dev;
> +    struct itimerspec ts;
> +    timer_t rate_limit_timer;
> +    pthread_mutex_t rng_mutex;
> +    pthread_cond_t rng_cond;
> +    int64_t quota_remaining;
> +    bool activate_timer;
> +    GMainLoop *loop;
> +} VuRNG;
> +
> +static gboolean print_cap, verbose;
> +static gchar *source_path, *socket_path;
> +static gint source_fd, socket_fd = -1;
> +
> +/* Defaults tailored on virtio-rng.c */
> +static uint32_t period_ms = 1 << 16;
> +static uint64_t max_bytes = INT64_MAX;
> +
> +static void check_rate_limit(union sigval sv)
> +{
> +    VuRNG *rng = sv.sival_ptr;
> +    bool wakeup = false;
> +
> +    pthread_mutex_lock(&rng->rng_mutex);
> +    /*
> +     * The timer has expired and the guest has used all available
> +     * antropy, which means function vu_rng_handle_request() is waiting
s/antropy/entropy/

I also found 'antropy' at two more locations in this patch (that made me
wonder).

> +     * on us.  As such wake it up once we're done here.
> +     */
> +    if (rng->quota_remaining == 0) {
> +        wakeup = true;
> +    }
> +
> +    /*
> +     * Reset the antropy available to the guest and tell function
> +     * vu_rng_handle_requests() to start the timer before using it.
> +     */
> +    rng->quota_remaining = max_bytes;
> +    rng->activate_timer = true;
> +    pthread_mutex_unlock(&rng->rng_mutex);
> +
> +    if (wakeup) {
> +        pthread_cond_signal(&rng->rng_cond);
> +    }
> +}
> +
> +static void setup_timer(VuRNG *rng)
> +{
> +    struct sigevent sev;
> +    int ret;
> +
> +    memset(&rng->ts, 0, sizeof(struct itimerspec));
> +    rng->ts.it_value.tv_sec = period_ms / 1000;
> +    rng->ts.it_value.tv_nsec = (period_ms % 1000) * 1000000;
> +
> +    /*
> +     * Call function check_rate_limit() as if it was the start of
> +     * a new thread when the timer expires.
> +     */
> +    sev.sigev_notify = SIGEV_THREAD;
> +    sev.sigev_notify_function = check_rate_limit;
> +    sev.sigev_value.sival_ptr = rng;
> +    /* Needs to be NULL if defaults attributes are to be used. */
> +    sev.sigev_notify_attributes = NULL;
> +    ret = timer_create(CLOCK_MONOTONIC, &sev, &rng->rate_limit_timer);
> +    if (ret < 0) {
> +        fprintf(stderr, "timer_create() failed\n");
> +    }
> +
> +}
> +
> +
> +/* Virtio helpers */
> +static uint64_t rng_get_features(VuDev *dev)
> +{
> +    if (verbose) {
> +        g_info("%s: replying", __func__);
> +    }
> +    return 0;
> +}
> +
> +static void rng_set_features(VuDev *dev, uint64_t features)
> +{
> +    if (verbose && features) {
> +        g_autoptr(GString) s = g_string_new("Requested un-handled feature");
> +        g_string_append_printf(s, " 0x%" PRIx64 "", features);
> +        g_info("%s: %s", __func__, s->str);
> +    }
> +}
> +
> +static void vu_rng_handle_requests(VuDev *dev, int qidx)
> +{
> +    VuRNG *rng = container_of(dev, VuRNG, dev.parent);
> +    VuVirtq *vq = vu_get_queue(dev, qidx);
> +    VuVirtqElement *elem;
> +    size_t to_read;
> +    int len, ret;
> +
> +    for (;;) {
> +        /* Get element in the vhost virtqueue */
> +        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> +        if (!elem) {
> +            break;
> +        }
> +
> +        /* Get the amount of antropy to read from the vhost server */
> +        to_read = elem->in_sg[0].iov_len;
> +
> +        pthread_mutex_lock(&rng->rng_mutex);
> +
> +        /*
> +         * We have consumed all entropy available for this time slice.
> +         * Wait for the timer (check_rate_limit()) to tell us about the
> +         * start of a new time slice.
> +         */
> +        if (rng->quota_remaining == 0) {
> +            pthread_cond_wait(&rng->rng_cond, &rng->rng_mutex);
> +        }
> +
> +        /* Start the timer if the last time slice has expired */
> +        if (rng->activate_timer == true) {
> +            rng->activate_timer = false;
> +            ret = timer_settime(rng->rate_limit_timer, 0, &rng->ts, NULL);
> +            if (ret < 0) {
> +                fprintf(stderr, "timer_settime() failed\n");
> +            }
> +        }
> +
> +        /* Make sure we don't read more than it's available */
> +        if (rng->quota_remaining < to_read) {
> +            to_read = rng->quota_remaining;
> +        }
> +
> +        len = read(source_fd, elem->in_sg[0].iov_base, to_read);
> +
> +        /* Simply return 0 if an error occurs */
> +        if (len < 0) {
> +            len = 0;
> +        }
> +
> +        rng->quota_remaining -= len;
> +
> +        pthread_mutex_unlock(&rng->rng_mutex);
> +
> +        vu_queue_push(dev, vq, elem, len);
> +        free(elem);
> +    }
> +
> +    vu_queue_notify(dev, vq);
> +}
> +
> +static void
> +vu_rng_queue_set_started(VuDev *dev, int qidx, bool started)
> +{
> +    VuVirtq *vq = vu_get_queue(dev, qidx);
> +
> +    g_debug("queue started %d:%d\n", qidx, started);
> +
> +    if (!qidx) {
> +        vu_set_queue_handler(dev, vq, started ? vu_rng_handle_requests : NULL);
> +    }
> +}
> +
> +/*
> + * Any messages not handled here are processed by the libvhost library
> + * itself.
> + */
> +static int rng_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
> +{
> +    VuRNG *rng = container_of(dev, VuRNG, dev.parent);
> +
> +    if (msg->request == VHOST_USER_NONE) {
> +        g_main_loop_quit(rng->loop);
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static const VuDevIface vuiface = {
> +    .set_features = rng_set_features,
> +    .get_features = rng_get_features,
> +    .queue_set_started = vu_rng_queue_set_started,
> +    .process_msg = rng_process_msg,
> +};
> +
> +static gboolean hangup(gpointer user_data)
> +{
> +    GMainLoop *loop = (GMainLoop *) user_data;
> +
> +    g_printerr("%s: caught hangup/quit signal, quitting", __func__);
> +    g_main_loop_quit(loop);
> +    return true;
> +}
> +
> +static void panic(VuDev *dev, const char *msg)
> +{
> +    g_critical("%s\n", msg);
> +    exit(EXIT_FAILURE);
> +}
> +
> +/* Print vhost-user.json backend program capabilities */
> +static void print_capabilities(void)
> +{
> +    printf("{\n");
> +    printf("  \"type\": \"RNG\"\n");
> +    printf("  \"filename\": [ RNG source ]\n");
> +    printf("}\n");
> +}
> +
> +static GOptionEntry options[] = {
> +    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &socket_path,
> +      "Location of vhost-user Unix domain socket, incompatible with --fd",
> +      "PATH" },
> +    { "fd", 'f', 0, G_OPTION_ARG_INT, &socket_fd,
> +      "Specify the backend file-descriptor, incompatible with --socket-path",
> +      "FD" },
> +    { "period", 'p', 0, G_OPTION_ARG_INT, &period_ms,
> +      "Time needed (in ms) to transfer a maximum amount of byte", NULL },
> +    { "max-bytes", 'm', 0, G_OPTION_ARG_INT64, &max_bytes,
> +      "Maximum amount of byte that can be transferred in a period", NULL },
> +    { "filename", 'n', 0, G_OPTION_ARG_FILENAME, &source_path,
> +      "RNG source, defaults to /dev/urandom", "PATH" },
> +    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &print_cap,
> +      "Output to stdout the backend capabilities in JSON format and exit",
> +      NULL},
> +    { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose,
> +      "Be more verbose in output", NULL},
> +    { NULL }
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +    GError *error = NULL;
> +    GOptionContext *context;
> +    g_autoptr(GSocket) socket = NULL;
> +    char default_source[] = "/dev/urandom";
> +    char *source = default_source;
> +    VuRNG rng;
> +
> +    context = g_option_context_new("vhost-user emulation of RNG device");
> +    g_option_context_add_main_entries(context, options, "vhost-user-rng");
> +    if (!g_option_context_parse(context, &argc, &argv, &error)) {
> +        g_printerr("option parsing failed: %s\n", error->message);
> +        exit(1);
> +    }
> +
> +    if (print_cap) {
> +        print_capabilities();
> +        exit(0);
> +    }
> +
> +    if (!socket_path && socket_fd < 0) {
> +        g_printerr("Please specify either --fd or --socket-path\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (socket_path && socket_fd > 0) {
> +        g_printerr("Either --fd or --socket-path, not both\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (max_bytes > INT64_MAX) {
> +        g_printerr("'max-bytes' parameter must be non-negative, "
> +                   "and less than 2^63\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (period_ms <= 0) {
> +        g_printerr("'period' parameter expects a positive integer\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * Now create a vhost-user socket that we will receive messages
> +     * on. Once we have our handler set up we can enter the glib main
> +     * loop.
> +     */
> +    if (socket_path) {
> +        g_autoptr(GSocketAddress) addr = g_unix_socket_address_new(socket_path);
> +        g_autoptr(GSocket) bind_socket = g_socket_new(G_SOCKET_FAMILY_UNIX,
> +                                                      G_SOCKET_TYPE_STREAM,
> +                                                      G_SOCKET_PROTOCOL_DEFAULT,
> +                                                      &error);
> +
> +        if (!g_socket_bind(bind_socket, addr, false, &error)) {
> +            g_printerr("Failed to bind to socket at %s (%s).\n",
> +                       socket_path, error->message);
> +            exit(EXIT_FAILURE);
> +        }
> +        if (!g_socket_listen(bind_socket, &error)) {
> +            g_printerr("Failed to listen on socket %s (%s).\n",
> +                       socket_path, error->message);
> +        }
> +        g_message("awaiting connection to %s", socket_path);
> +        socket = g_socket_accept(bind_socket, NULL, &error);
> +        if (!socket) {
> +            g_printerr("Failed to accept on socket %s (%s).\n",
> +                       socket_path, error->message);
> +        }
> +    } else {
> +        socket = g_socket_new_from_fd(socket_fd, &error);
> +        if (!socket) {
> +            g_printerr("Failed to connect to FD %d (%s).\n",
> +                       socket_fd, error->message);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +
> +    /* Overwrite default RNG source with what user provided, if any */
> +    if (source_path) {
> +        source = source_path;
> +    }
> +
> +    source_fd = open(source, O_RDWR);
> +    if (source_fd < 0) {
> +        g_printerr("Failed to open RNG source %s\n", source);
> +        g_socket_close(socket, &error);
> +        unlink(socket_path);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* catch exit signals */
> +    g_unix_signal_add(SIGHUP, hangup, rng.loop);
> +    g_unix_signal_add(SIGINT, hangup, rng.loop);
> +
> +    /*
> +     * Create the main loop first so all the various sources can be
> +     * added. As well as catching signals we need to ensure vug_init
> +     * can add it's GSource watches.
> +     */
> +    rng.loop = g_main_loop_new(NULL, FALSE);
> +
> +    if (!vug_init(&rng.dev, 1, g_socket_get_fd(socket),
> +                  panic, &vuiface)) {
> +        g_printerr("Failed to initialize libvhost-user-glib.\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    rng.quota_remaining = max_bytes;
> +    rng.activate_timer = true;
> +    pthread_mutex_init(&rng.rng_mutex, NULL);
> +    pthread_cond_init(&rng.rng_cond, NULL);
> +    setup_timer(&rng);
> +
> +    if (verbose) {
> +        g_info("period_ms: %d tv_sec: %ld tv_nsec: %lu\n",
> +               period_ms, rng.ts.it_value.tv_sec, rng.ts.it_value.tv_nsec);
> +    }
> +
> +    g_message("entering main loop, awaiting messages");
> +    g_main_loop_run(rng.loop);
> +    g_message("finished main loop, cleaning up");
> +
> +    g_main_loop_unref(rng.loop);
> +    vug_deinit(&rng.dev);
> +    timer_delete(rng.rate_limit_timer);
> +    close(source_fd);
> +    unlink(socket_path);
> +}
> diff --git a/tools/vhost-user-rng/meson.build b/tools/vhost-user-rng/meson.build
> new file mode 100644
> index 000000000000..4dc386daf335
> --- /dev/null
> +++ b/tools/vhost-user-rng/meson.build
> @@ -0,0 +1,10 @@
> +executable('vhost-user-rng', files(
> +  'main.c'),
> +  dependencies: [qemuutil, glib, gio, rt],
> +  install: true,
> +  install_dir: get_option('libexecdir'))
> +
> +configure_file(input: '50-qemu-rng.json.in',
> +               output: '50-qemu-rng.json',
> +               configuration: config_host,
> +               install_dir: qemu_datadir / 'vhost-user')
> -- 
> 2.25.1
> 
> -- 
> Stratos-dev mailing list
> Stratos-dev@op-lists.linaro.org
> https://op-lists.linaro.org/mailman/listinfo/stratos-dev

