Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80A42BB10
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:04:29 +0200 (CEST)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaBY-0006Wx-18
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1maa77-0003ir-2l
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:59:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1maa6z-0005OX-6c
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:59:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e3so5723047wrc.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qkszNe6XotvLo9WebSFrxFaa2azbdP3eVfudXYLYe0=;
 b=YJDvS6Uks6OSKNnvr0z/vX84vTIzvYfKuo7AIfUlk5Z2FXtxDWYfb7yxpsHY2GGX0v
 9+LlAYb9pdUD4rxhzr6vP0KP8NRnn012VqgP8R82DjALzLqpyW3OxDxxv0BoXV7gZhLp
 qTFPTpemrFnnmLREEyHUszyr/kthjJa/YWZX57X8HkdtyE9sn89cooZ3QCR4kBtx87Fm
 q2wDvmgikCF5oEC2LOxkt8vMlyo+gWsx4yfW8YnqR159zxOQstlA04UjeaSGhVKEj8xd
 guI4kDmGtxeIFXuwdtwteTLg2xNDAa/wwjFe6gkN3/sZ+5yrAeybSpH3S1Mv+FesO8wZ
 3hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qkszNe6XotvLo9WebSFrxFaa2azbdP3eVfudXYLYe0=;
 b=Oi9bvMEMHpVINPCwUaZoBhZ5CIjoIqcFZleYiFddTZrJ1ej0sX25Pb+ts7HkqoiYJp
 TqvgPuFiHHc0nYfuM6jma8nU3LclSwqMUs5oVmoZYWpqjGNtEBov9sJ+3jU3B0NJNUm5
 e4vHjWK8Lf0/wA6MrVK8n3JFLBRcvpSc78CPmDn8qyshYjeMDxHItW//c7UFFABW5L/y
 SR8wf/zVuo1/FtvygXcoYo4PYiNebxBwAuZUjochhBLOwvaMz9/C7S8l7bN4o5B3GBex
 bWadsAl6qmdT4VibtV8kajw5rif1g7nK380fHXtVeM7ZGX6KXNg2MiW0L9L0Nngf9Afy
 MaAA==
X-Gm-Message-State: AOAM530KKFjqdevxotbswfLQkpykzPbXNLGvkx4CuVRnoFeuoF+ruqOg
 Tkgl+DhIh95qdDH3Av9SrLZHvsUGcX5IWlrIXwCEtzlm
X-Google-Smtp-Source: ABdhPJxpbbW8faduMHwg33nJ7EylrTmMcgYuVv5Kk7bR8U9OVd5MgnYlYrslypVtCgV3VcBYWo8/iWdnMtYp92NdnzE=
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr11366841wme.42.1634115580144; 
 Wed, 13 Oct 2021 01:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-27-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-27-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 13 Oct 2021 12:59:26 +0400
Message-ID: <CAJ+F1CLEzdy=S13m1xH-fO0HkiZt2mNbuXd7ZmdHdVXrNBhKOA@mail.gmail.com>
Subject: Re: [PATCH v2 26/37] ui: add a D-Bus display backend
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ad32e805ce382eb0"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad32e805ce382eb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Oct 10, 2021 at 1:30 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The "dbus" display backend exports the QEMU consoles and other
> UI-related interfaces over D-Bus.
>
> By default, the connection is established on the session bus, but you
> can specify a different bus with the "addr" option.
>
> The backend takes the "org.qemu" service name, while still allowing
> further instances to queue on the same name (so you can lookup all the
> available instances too). It accepts any number of clients at this
> point, although this is expected to evolve with options to restrict
> clients, or only accept p2p via fd passing.
>
> The interface is intentionally very close to the internal QEMU API,
> and can be introspected or interacted with busctl/dfeet etc:
>
> $ ./qemu-system-x86_64 -name MyVM -display dbus
> $ busctl --user introspect org.qemu /org/qemu/Display1/Console_0
>
> org.qemu.Display1.Console           interface -         -               -
> .RegisterListener                   method    h         -               -
> .SetUIInfo                          method    qqiiuu    -               -
> .DeviceAddress                      property  s         "pci/0000/01.0"
> emits-change
> .Head                               property  u         0
>  emits-change
> .Height                             property  u         480
>  emits-change
> .Label                              property  s         "VGA"
>  emits-change
> .Type                               property  s         "Graphic"
>  emits-change
> .Width                              property  u         640
>  emits-change
> [...]
>
> See the interfaces XML source file and Sphinx docs for the generated API
> documentations.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build          |  12 +-
>  qapi/ui.json         |  27 ++-
>  include/qemu/dbus.h  |  19 ++
>  ui/dbus.h            |  83 ++++++++
>  ui/dbus-console.c    | 497 +++++++++++++++++++++++++++++++++++++++++++
>  ui/dbus-error.c      |  48 +++++
>  ui/dbus-listener.c   | 486 ++++++++++++++++++++++++++++++++++++++++++
>  ui/dbus.c            | 262 +++++++++++++++++++++++
>  meson_options.txt    |   2 +
>  qemu-options.hx      |  15 ++
>  ui/dbus-display1.xml | 378 ++++++++++++++++++++++++++++++++
>  ui/meson.build       |  22 ++
>  ui/trace-events      |  11 +
>  13 files changed, 1859 insertions(+), 3 deletions(-)
>  create mode 100644 ui/dbus.h
>  create mode 100644 ui/dbus-console.c
>  create mode 100644 ui/dbus-error.c
>  create mode 100644 ui/dbus-listener.c
>  create mode 100644 ui/dbus.c
>
> diff --git a/meson.build b/meson.build
> index 9494590aa2..b571fde310 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1198,6 +1198,15 @@ endif
>  have_host_block_device =3D (targetos !=3D 'darwin' or
>      cc.has_header('IOKit/storage/IOMedia.h'))
>
> +dbus_display =3D false
> +if not get_option('dbus_display').disabled()
> +  # FIXME enable_modules shouldn't be necessary, but:
> https://github.com/mesonbuild/meson/issues/8333
> +  dbus_display =3D gio.version().version_compare('>=3D2.64') and
> config_host.has_key('GDBUS_CODEGEN') and enable_modules
> +  if get_option('dbus_display').enabled() and not dbus_display
> +    error('Requirements missing to enable -display dbus')
> +  endif
> +endif
>

I should add a --enable-dbus-display configure flag too.

+
>  #################
>  # config-host.h #
>  #################
> @@ -1299,7 +1308,7 @@ config_host_data.set('CONFIG_SPICE_PROTOCOL_MINOR',
> spice_protocol.version().spl
>  config_host_data.set('CONFIG_SPICE_PROTOCOL_MICRO',
> spice_protocol.version().split('.')[2])
>  endif
>  config_host_data.set('CONFIG_SPICE', spice.found())
> -config_host_data.set('CONFIG_X11', x11.found())
> +config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
>

oops, bad rebase here. will fix it in v3

 config_host_data.set('CONFIG_CFI', get_option('cfi'))
>  config_host_data.set('QEMU_VERSION', '"@0@
> "'.format(meson.project_version()))
>  config_host_data.set('QEMU_VERSION_MAJOR',
> meson.project_version().split('.')[0])
> @@ -2892,6 +2901,7 @@ summary_info +=3D {'fuzzing support':
>  config_host.has_key('CONFIG_FUZZ')}
>  if have_system
>    summary_info +=3D {'Audio drivers':
>  config_host['CONFIG_AUDIO_DRIVERS']}
>  endif
> +summary_info +=3D {'D-Bus display':     dbus_display}
>  summary_info +=3D {'Trace backends':    config_host['TRACE_BACKENDS']}
>  if config_host['TRACE_BACKENDS'].split().contains('simple')
>    summary_info +=3D {'Trace output file': config_host['CONFIG_TRACE_FILE=
']
> + '-<pid>'}
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..5ca604bd90 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1121,6 +1121,23 @@
>  { 'struct'  : 'DisplayEGLHeadless',
>    'data'    : { '*rendernode' : 'str' } }
>
> +##
> +# @DisplayDBus:
> +#
> +# DBus display options.
> +#
> +# @addr: The D-Bus bus address (default to the session bus).
> +#
> +# @rendernode: Which DRM render node should be used. Default is the firs=
t
> +#              available node on the host.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct'  : 'DisplayDBus',
> +  'data'    : { '*rendernode' : 'str',
> +                '*addr': 'str' } }
> +
>   ##
>   # @DisplayGLMode:
>   #
> @@ -1186,6 +1203,8 @@
>  #             application to connect to it. The server will redirect
>  #             the serial console and QEMU monitors. (Since 4.0)
>  #
> +# @dbus: Start a D-Bus service for the display. (Since 6.2)
> +#
>  # Since: 2.12
>  #
>  ##
> @@ -1199,7 +1218,10 @@
>                'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
>      { 'name': 'curses', 'if': 'CONFIG_CURSES' },
>      { 'name': 'cocoa', 'if': 'CONFIG_COCOA' },
> -    { 'name': 'spice-app', 'if': 'CONFIG_SPICE'} ] }
> +    { 'name': 'spice-app', 'if': 'CONFIG_SPICE' },
> +    { 'name': 'dbus', 'if': 'CONFIG_DBUS_DISPLAY' }
> +  ]
> +}
>
>  ##
>  # @DisplayOptions:
> @@ -1227,7 +1249,8 @@
>        'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
>        'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>        'egl-headless': { 'type': 'DisplayEGLHeadless',
> -                        'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] }=
 }
> +                        'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] }
> },
> +      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
>    }
>  }
>
> diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
> index 9d591f9ee4..c0cbb1ca44 100644
> --- a/include/qemu/dbus.h
> +++ b/include/qemu/dbus.h
> @@ -12,6 +12,25 @@
>
>  #include <gio/gio.h>
>
> +/* glib/gio 2.68 */
> +#define DBUS_METHOD_INVOCATION_HANDLED TRUE
> +#define DBUS_METHOD_INVOCATION_UNHANDLED FALSE
> +
> +/* in msec */
> +#define DBUS_DEFAULT_TIMEOUT 1000
> +
> +#define DBUS_DISPLAY1_ROOT "/org/qemu/Display1"
> +
> +#define DBUS_DISPLAY_ERROR (dbus_display_error_quark())
> +GQuark dbus_display_error_quark(void);
> +
> +typedef enum {
> +    DBUS_DISPLAY_ERROR_FAILED,
> +    DBUS_DISPLAY_ERROR_INVALID,
> +    DBUS_DISPLAY_ERROR_UNSUPPORTED,
> +    DBUS_DISPLAY_N_ERRORS,
> +} DBusDisplayError;
> +
>  GStrv qemu_dbus_get_queued_owners(GDBusConnection *connection,
>                                    const char *name,
>                                    Error **errp);
> diff --git a/ui/dbus.h b/ui/dbus.h
> new file mode 100644
> index 0000000000..d3c9598dd1
> --- /dev/null
> +++ b/ui/dbus.h
> @@ -0,0 +1,83 @@
> +/*
> + * QEMU DBus display
> + *
> + * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +#ifndef UI_DBUS_H_
> +#define UI_DBUS_H_
> +
> +#include "qemu/dbus.h"
> +#include "qom/object.h"
> +#include "ui/console.h"
> +
> +#include "dbus-display1.h"
> +
> +struct DBusDisplay {
> +    Object parent;
> +
> +    DisplayGLMode gl_mode;
> +    char *dbus_addr;
> +    DisplayGLCtx glctx;
> +
> +    GDBusConnection *bus;
> +    GDBusObjectManagerServer *server;
> +    QemuDBusDisplay1VM *iface;
> +    GPtrArray *consoles;
> +};
> +
> +#define TYPE_DBUS_DISPLAY "dbus-display"
> +OBJECT_DECLARE_SIMPLE_TYPE(DBusDisplay, DBUS_DISPLAY)
> +
> +#define DBUS_DISPLAY_TYPE_CONSOLE dbus_display_console_get_type()
> +G_DECLARE_FINAL_TYPE(DBusDisplayConsole,
> +                     dbus_display_console,
> +                     DBUS_DISPLAY,
> +                     CONSOLE,
> +                     GDBusObjectSkeleton)
> +
> +DBusDisplayConsole *
> +dbus_display_console_new(DBusDisplay *display, QemuConsole *con);
> +
> +int
> +dbus_display_console_get_index(DBusDisplayConsole *ddc);
> +
> +#define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()
> +G_DECLARE_FINAL_TYPE(DBusDisplayListener,
> +                     dbus_display_listener,
> +                     DBUS_DISPLAY,
> +                     LISTENER,
> +                     GObject)
> +
> +DBusDisplayListener *
> +dbus_display_listener_new(const char *bus_name,
> +                          GDBusConnection *conn,
> +                          DBusDisplayConsole *console);
> +
> +DBusDisplayConsole *
> +dbus_display_listener_get_console(DBusDisplayListener *ddl);
> +
> +const char *
> +dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);
> +
> +extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
> +extern const DisplayChangeListenerOps dbus_dcl_ops;
> +
> +#endif /* UI_DBUS_H_ */
> diff --git a/ui/dbus-console.c b/ui/dbus-console.c
> new file mode 100644
> index 0000000000..1ccf638c10
> --- /dev/null
> +++ b/ui/dbus-console.c
> @@ -0,0 +1,497 @@
> +/*
> + * QEMU DBus display console
> + *
> + * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "ui/input.h"
> +#include "ui/kbd-state.h"
> +#include "trace.h"
> +
> +#include <gio/gunixfdlist.h>
> +
> +#include "dbus.h"
> +
> +struct _DBusDisplayConsole {
> +    GDBusObjectSkeleton parent_instance;
> +    DisplayChangeListener dcl;
> +
> +    DBusDisplay *display;
> +    QemuConsole *con;
> +    GHashTable *listeners;
> +    QemuDBusDisplay1Console *iface;
> +
> +    QemuDBusDisplay1Keyboard *iface_kbd;
> +    QKbdState *kbd;
> +
> +    QemuDBusDisplay1Mouse *iface_mouse;
> +    gboolean last_set;
> +    guint last_x;
> +    guint last_y;
> +    Notifier mouse_mode_notifier;
> +};
> +
> +G_DEFINE_TYPE(DBusDisplayConsole,
> +              dbus_display_console,
> +              G_TYPE_DBUS_OBJECT_SKELETON)
> +
> +static void
> +dbus_display_console_set_size(DBusDisplayConsole *ddc,
> +                              uint32_t width, uint32_t height)
> +{
> +    g_object_set(ddc->iface,
> +                 "width", width,
> +                 "height", height,
> +                 NULL);
> +}
> +
> +static void
> +dbus_gfx_switch(DisplayChangeListener *dcl,
> +                struct DisplaySurface *new_surface)
> +{
> +    DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayConsole, dc=
l);
> +
> +    dbus_display_console_set_size(ddc,
> +                                  surface_width(new_surface),
> +                                  surface_height(new_surface));
> +}
> +
> +static void
> +dbus_gfx_update(DisplayChangeListener *dcl,
> +                int x, int y, int w, int h)
> +{
> +}
> +
> +static void
> +dbus_gl_scanout_disable(DisplayChangeListener *dcl)
> +{
> +}
> +
> +static void
> +dbus_gl_scanout_texture(DisplayChangeListener *dcl,
> +                        uint32_t tex_id,
> +                        bool backing_y_0_top,
> +                        uint32_t backing_width,
> +                        uint32_t backing_height,
> +                        uint32_t x, uint32_t y,
> +                        uint32_t w, uint32_t h)
> +{
> +    DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayConsole, dc=
l);
> +
> +    dbus_display_console_set_size(ddc, w, h);
> +}
> +
> +static void
> +dbus_gl_scanout_dmabuf(DisplayChangeListener *dcl,
> +                       QemuDmaBuf *dmabuf)
> +{
> +    DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayConsole, dc=
l);
> +
> +    dbus_display_console_set_size(ddc,
> +                                  dmabuf->width,
> +                                  dmabuf->height);
> +}
> +
> +static void
> +dbus_gl_scanout_update(DisplayChangeListener *dcl,
> +                       uint32_t x, uint32_t y,
> +                       uint32_t w, uint32_t h)
> +{
> +}
> +
> +static const DisplayChangeListenerOps dbus_console_dcl_ops =3D {
> +    .dpy_name                =3D "dbus-console",
> +    .dpy_gfx_switch          =3D dbus_gfx_switch,
> +    .dpy_gfx_update          =3D dbus_gfx_update,
> +    .dpy_gl_scanout_disable  =3D dbus_gl_scanout_disable,
> +    .dpy_gl_scanout_texture  =3D dbus_gl_scanout_texture,
> +    .dpy_gl_scanout_dmabuf   =3D dbus_gl_scanout_dmabuf,
> +    .dpy_gl_update           =3D dbus_gl_scanout_update,
> +};
> +
> +static void
> +dbus_display_console_init(DBusDisplayConsole *object)
> +{
> +    DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(object);
> +
> +    ddc->listeners =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> +                                            NULL, g_object_unref);
> +    ddc->dcl.ops =3D &dbus_console_dcl_ops;
> +}
> +
> +static void
> +dbus_display_console_dispose(GObject *object)
> +{
> +    DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(object);
> +
> +    unregister_displaychangelistener(&ddc->dcl);
> +    g_clear_object(&ddc->iface_kbd);
> +    g_clear_object(&ddc->iface);
> +    g_clear_pointer(&ddc->listeners, g_hash_table_unref);
> +    g_clear_pointer(&ddc->kbd, qkbd_state_free);
> +
> +    G_OBJECT_CLASS(dbus_display_console_parent_class)->dispose(object);
> +}
> +
> +static void
> +dbus_display_console_class_init(DBusDisplayConsoleClass *klass)
> +{
> +    GObjectClass *gobject_class =3D G_OBJECT_CLASS(klass);
> +
> +    gobject_class->dispose =3D dbus_display_console_dispose;
> +}
> +
> +static void
> +listener_vanished_cb(DBusDisplayListener *listener)
> +{
> +    DBusDisplayConsole *ddc =3D dbus_display_listener_get_console(listen=
er);
> +    const char *name =3D dbus_display_listener_get_bus_name(listener);
> +
> +    trace_dbus_listener_vanished(name);
> +
> +    g_hash_table_remove(ddc->listeners, name);
> +    qkbd_state_lift_all_keys(ddc->kbd);
> +}
> +
> +static gboolean
> +dbus_console_set_ui_info(DBusDisplayConsole *ddc,
> +                         GDBusMethodInvocation *invocation,
> +                         guint16 arg_width_mm,
> +                         guint16 arg_height_mm,
> +                         gint arg_xoff,
> +                         gint arg_yoff,
> +                         guint arg_width,
> +                         guint arg_height)
> +{
> +    QemuUIInfo info =3D {
> +        .width_mm =3D arg_width_mm,
> +        .height_mm =3D arg_height_mm,
> +        .xoff =3D arg_xoff,
> +        .yoff =3D arg_yoff,
> +        .width =3D arg_width,
> +        .height =3D arg_height,
> +    };
> +
> +    if (!dpy_ui_info_supported(ddc->con)) {
> +        g_dbus_method_invocation_return_error(invocation,
> +                                              DBUS_DISPLAY_ERROR,
> +
> DBUS_DISPLAY_ERROR_UNSUPPORTED,
> +                                              "SetUIInfo is not
> supported");
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    dpy_set_ui_info(ddc->con, &info, false);
> +    qemu_dbus_display1_console_complete_set_uiinfo(ddc->iface,
> invocation);
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_console_register_listener(DBusDisplayConsole *ddc,
> +                               GDBusMethodInvocation *invocation,
> +                               GUnixFDList *fd_list,
> +                               GVariant *arg_listener)
> +{
> +    const char *sender =3D g_dbus_method_invocation_get_sender(invocatio=
n);
> +    GDBusConnection *listener_conn;
> +    g_autoptr(GError) err =3D NULL;
> +    g_autoptr(GSocket) socket =3D NULL;
> +    g_autoptr(GSocketConnection) socket_conn =3D NULL;
> +    g_autofree char *guid =3D g_dbus_generate_guid();
> +    DBusDisplayListener *listener;
> +    int fd;
> +
> +    if (g_hash_table_contains(ddc->listeners, sender)) {
> +        g_dbus_method_invocation_return_error(
> +            invocation,
> +            DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_INVALID,
> +            "`%s` is already registered!",
> +            sender);
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    fd =3D g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_listener=
),
> &err);
> +    if (err) {
> +        g_dbus_method_invocation_return_error(
> +            invocation,
> +            DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_FAILED,
> +            "Couldn't get peer fd: %s", err->message);
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    socket =3D g_socket_new_from_fd(fd, &err);
> +    if (err) {
> +        g_dbus_method_invocation_return_error(
> +            invocation,
> +            DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_FAILED,
> +            "Couldn't make a socket: %s", err->message);
> +        close(fd);
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +    socket_conn =3D g_socket_connection_factory_create_connection(socket=
);
> +
> +    qemu_dbus_display1_console_complete_register_listener(
> +        ddc->iface, invocation, NULL);
> +
> +    listener_conn =3D g_dbus_connection_new_sync(
> +        G_IO_STREAM(socket_conn),
> +        guid,
> +        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
> +        NULL, NULL, &err);
> +    if (err) {
> +        error_report("Failed to setup peer connection: %s", err->message=
);
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    listener =3D dbus_display_listener_new(sender, listener_conn, ddc);
> +    if (!listener) {
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    g_hash_table_insert(ddc->listeners,
> +
> (gpointer)dbus_display_listener_get_bus_name(listener),
> +                        listener);
> +    g_object_connect(listener_conn,
> +                     "swapped-signal::closed", listener_vanished_cb,
> listener,
> +                     NULL);
> +
> +    trace_dbus_registered_listener(sender);
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_kbd_press(DBusDisplayConsole *ddc,
> +               GDBusMethodInvocation *invocation,
> +               guint arg_keycode)
> +{
> +    QKeyCode qcode =3D qemu_input_key_number_to_qcode(arg_keycode);
> +
> +    trace_dbus_kbd_press(arg_keycode);
> +
> +    qkbd_state_key_event(ddc->kbd, qcode, true);
> +
> +    qemu_dbus_display1_keyboard_complete_press(ddc->iface_kbd,
> invocation);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_kbd_release(DBusDisplayConsole *ddc,
> +                 GDBusMethodInvocation *invocation,
> +                 guint arg_keycode)
> +{
> +    QKeyCode qcode =3D qemu_input_key_number_to_qcode(arg_keycode);
> +
> +    trace_dbus_kbd_release(arg_keycode);
> +
> +    qkbd_state_key_event(ddc->kbd, qcode, false);
> +
> +    qemu_dbus_display1_keyboard_complete_release(ddc->iface_kbd,
> invocation);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static void
> +dbus_kbd_qemu_leds_updated(void *data, int ledstate)
> +{
> +    DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(data);
> +
> +    qemu_dbus_display1_keyboard_set_modifiers(ddc->iface_kbd, ledstate);
> +}
> +
> +static gboolean
> +dbus_mouse_rel_motion(DBusDisplayConsole *ddc,
> +                      GDBusMethodInvocation *invocation,
> +                      int dx, int dy)
> +{
> +    trace_dbus_mouse_rel_motion(dx, dy);
> +
> +    if (qemu_input_is_absolute()) {
> +        g_dbus_method_invocation_return_error(
> +            invocation, DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_INVALID,
> +            "Mouse is not relative");
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    qemu_input_queue_rel(ddc->con, INPUT_AXIS_X, dx);
> +    qemu_input_queue_rel(ddc->con, INPUT_AXIS_Y, dy);
> +    qemu_input_event_sync();
> +
> +    qemu_dbus_display1_mouse_complete_rel_motion(ddc->iface_mouse,
> +                                                    invocation);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_mouse_set_pos(DBusDisplayConsole *ddc,
> +                   GDBusMethodInvocation *invocation,
> +                   guint x, guint y)
> +{
> +    int width, height;
> +
> +    trace_dbus_mouse_set_pos(x, y);
> +
> +    if (!qemu_input_is_absolute()) {
> +        g_dbus_method_invocation_return_error(
> +            invocation, DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_INVALID,
> +            "Mouse is not absolute");
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +
> +    width =3D qemu_console_get_width(ddc->con, 0);
> +    height =3D qemu_console_get_height(ddc->con, 0);
> +    if (x >=3D width || y >=3D height) {
> +        g_dbus_method_invocation_return_error(
> +            invocation, DBUS_DISPLAY_ERROR,
> +            DBUS_DISPLAY_ERROR_INVALID,
> +            "Invalid mouse position");
> +        return DBUS_METHOD_INVOCATION_HANDLED;
> +    }
> +    qemu_input_queue_abs(ddc->con, INPUT_AXIS_X, x, 0, width);
> +    qemu_input_queue_abs(ddc->con, INPUT_AXIS_Y, y, 0, height);
> +    qemu_input_event_sync();
> +
> +    qemu_dbus_display1_mouse_complete_set_abs_position(ddc->iface_mouse,
> +                                                          invocation);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_mouse_press(DBusDisplayConsole *ddc,
> +                 GDBusMethodInvocation *invocation,
> +                 guint button)
> +{
> +    trace_dbus_mouse_press(button);
> +
> +    qemu_input_queue_btn(ddc->con, button, true);
> +    qemu_input_event_sync();
> +
> +    qemu_dbus_display1_mouse_complete_press(ddc->iface_mouse, invocation=
);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static gboolean
> +dbus_mouse_release(DBusDisplayConsole *ddc,
> +                   GDBusMethodInvocation *invocation,
> +                   guint button)
> +{
> +    trace_dbus_mouse_release(button);
> +
> +    qemu_input_queue_btn(ddc->con, button, false);
> +    qemu_input_event_sync();
> +
> +    qemu_dbus_display1_mouse_complete_release(ddc->iface_mouse,
> invocation);
> +
> +    return DBUS_METHOD_INVOCATION_HANDLED;
> +}
> +
> +static void
> +dbus_mouse_mode_change(Notifier *notify, void *data)
> +{
> +    DBusDisplayConsole *ddc =3D
> +        container_of(notify, DBusDisplayConsole, mouse_mode_notifier);
> +
> +    g_object_set(ddc->iface_mouse,
> +                 "is-absolute", qemu_input_is_absolute(),
> +                 NULL);
> +}
> +
> +int dbus_display_console_get_index(DBusDisplayConsole *ddc)
> +{
> +    return qemu_console_get_index(ddc->con);
> +}
> +
> +DBusDisplayConsole *
> +dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
> +{
> +    g_autofree char *path =3D NULL;
> +    g_autofree char *label =3D NULL;
> +    char device_addr[256] =3D "";
> +    DBusDisplayConsole *ddc;
> +    int idx;
> +
> +    assert(display);
> +    assert(con);
> +
> +    label =3D qemu_console_get_label(con);
> +    idx =3D qemu_console_get_index(con);
> +    path =3D g_strdup_printf(DBUS_DISPLAY1_ROOT "/Console_%d", idx);
> +    ddc =3D g_object_new(DBUS_DISPLAY_TYPE_CONSOLE,
> +                        "g-object-path", path,
> +                        NULL);
> +    ddc->display =3D display;
> +    ddc->con =3D con;
> +    /* handle errors, and skip non graphics? */
> +    qemu_console_fill_device_address(
> +        con, device_addr, sizeof(device_addr), NULL);
> +
> +    ddc->iface =3D qemu_dbus_display1_console_skeleton_new();
> +    g_object_set(ddc->iface,
> +        "label", label,
> +        "type", qemu_console_is_graphic(con) ? "Graphic" : "Text",
> +        "head", qemu_console_get_head(con),
> +        "width", qemu_console_get_width(con, 0),
> +        "height", qemu_console_get_height(con, 0),
> +        "device-address", device_addr,
> +        NULL);
> +    g_object_connect(ddc->iface,
> +        "swapped-signal::handle-register-listener",
> +        dbus_console_register_listener, ddc,
> +        "swapped-signal::handle-set-uiinfo",
> +        dbus_console_set_ui_info, ddc,
> +        NULL);
> +    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
> +        G_DBUS_INTERFACE_SKELETON(ddc->iface));
> +
> +    ddc->kbd =3D qkbd_state_init(con);
> +    ddc->iface_kbd =3D qemu_dbus_display1_keyboard_skeleton_new();
> +    qemu_add_led_event_handler(dbus_kbd_qemu_leds_updated, ddc);
> +    g_object_connect(ddc->iface_kbd,
> +        "swapped-signal::handle-press", dbus_kbd_press, ddc,
> +        "swapped-signal::handle-release", dbus_kbd_release, ddc,
> +        NULL);
> +    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
> +        G_DBUS_INTERFACE_SKELETON(ddc->iface_kbd));
> +
> +    ddc->iface_mouse =3D qemu_dbus_display1_mouse_skeleton_new();
> +    g_object_connect(ddc->iface_mouse,
> +        "swapped-signal::handle-set-abs-position", dbus_mouse_set_pos,
> ddc,
> +        "swapped-signal::handle-rel-motion", dbus_mouse_rel_motion, ddc,
> +        "swapped-signal::handle-press", dbus_mouse_press, ddc,
> +        "swapped-signal::handle-release", dbus_mouse_release, ddc,
> +        NULL);
> +    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
> +        G_DBUS_INTERFACE_SKELETON(ddc->iface_mouse));
> +
> +    register_displaychangelistener(&ddc->dcl);
> +    ddc->mouse_mode_notifier.notify =3D dbus_mouse_mode_change;
> +    qemu_add_mouse_mode_change_notifier(&ddc->mouse_mode_notifier);
> +
> +    return ddc;
> +}
> diff --git a/ui/dbus-error.c b/ui/dbus-error.c
> new file mode 100644
> index 0000000000..85a9194d57
> --- /dev/null
> +++ b/ui/dbus-error.c
> @@ -0,0 +1,48 @@
> +/*
> + * QEMU DBus display errors
> + *
> + * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "dbus.h"
> +
> +static const GDBusErrorEntry dbus_display_error_entries[] =3D {
> +    { DBUS_DISPLAY_ERROR_FAILED, "org.qemu.Display1.Error.Failed" },
> +    { DBUS_DISPLAY_ERROR_INVALID, "org.qemu.Display1.Error.Invalid" },
> +    { DBUS_DISPLAY_ERROR_UNSUPPORTED,
> "org.qemu.Display1.Error.Unsupported" },
> +};
> +
> +G_STATIC_ASSERT(G_N_ELEMENTS(dbus_display_error_entries) =3D=3D
> +                DBUS_DISPLAY_N_ERRORS);
> +
> +GQuark
> +dbus_display_error_quark(void)
> +{
> +    static gsize quark;
> +
> +    g_dbus_error_register_error_domain(
> +        "dbus-display-error-quark",
> +        &quark,
> +        dbus_display_error_entries,
> +        G_N_ELEMENTS(dbus_display_error_entries));
> +
> +    return (GQuark)quark;
> +}
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> new file mode 100644
> index 0000000000..20094fc18a
> --- /dev/null
> +++ b/ui/dbus-listener.c
> @@ -0,0 +1,486 @@
> +/*
> + * QEMU DBus display console
> + *
> + * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "sysemu/sysemu.h"
> +#include "dbus.h"
> +#include <gio/gunixfdlist.h>
> +
> +#include "ui/shader.h"
> +#include "ui/egl-helpers.h"
> +#include "ui/egl-context.h"
> +#include "trace.h"
> +
> +struct _DBusDisplayListener {
> +    GObject parent;
> +
> +    char *bus_name;
> +    DBusDisplayConsole *console;
> +    GDBusConnection *conn;
> +
> +    QemuDBusDisplay1Listener *proxy;
> +
> +    DisplayChangeListener dcl;
> +    DisplaySurface *ds;
> +    QemuGLShader *gls;
> +    int gl_updates;
> +};
> +
> +G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
> +
> +static void dbus_update_gl_cb(GObject *source_object,
> +                           GAsyncResult *res,
> +                           gpointer user_data)
> +{
> +    g_autoptr(GError) err =3D NULL;
> +    DBusDisplayListener *ddl =3D user_data;
> +
> +    if (!qemu_dbus_display1_listener_call_update_dmabuf_finish(ddl->prox=
y,
> +                                                               res,
> &err)) {
> +        error_report("Failed to call update: %s", err->message);
> +    }
> +
> +    graphic_hw_gl_block(ddl->dcl.con, false);
> +    g_object_unref(ddl);
> +}
> +
> +static void dbus_call_update_gl(DBusDisplayListener *ddl,
> +                                int x, int y, int w, int h)
> +{
> +    graphic_hw_gl_block(ddl->dcl.con, true);
> +    glFlush();
> +    qemu_dbus_display1_listener_call_update_dmabuf(ddl->proxy,
> +        x, y, w, h,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        DBUS_DEFAULT_TIMEOUT, NULL,
> +        dbus_update_gl_cb,
> +        g_object_ref(ddl));
> +}
> +
> +static void dbus_scanout_disable(DisplayChangeListener *dcl)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    ddl->ds =3D NULL;
> +    qemu_dbus_display1_listener_call_disable(
> +        ddl->proxy, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
> +}
> +
> +static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,
> +                                QemuDmaBuf *dmabuf)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +    g_autoptr(GError) err =3D NULL;
> +    g_autoptr(GUnixFDList) fd_list =3D NULL;
> +
> +    fd_list =3D g_unix_fd_list_new();
> +    if (g_unix_fd_list_append(fd_list, dmabuf->fd, &err) !=3D 0) {
> +        error_report("Failed to setup dmabuf fdlist: %s", err->message);
> +        return;
> +    }
> +
> +    qemu_dbus_display1_listener_call_scanout_dmabuf(
> +        ddl->proxy,
> +        g_variant_new_handle(0),
> +        dmabuf->width,
> +        dmabuf->height,
> +        dmabuf->stride,
> +        dmabuf->fourcc,
> +        dmabuf->modifier,
> +        dmabuf->y0_top,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        -1,
> +        fd_list,
> +        NULL, NULL, NULL);
> +}
> +
> +static void dbus_scanout_texture(DisplayChangeListener *dcl,
> +                                 uint32_t tex_id,
> +                                 bool backing_y_0_top,
> +                                 uint32_t backing_width,
> +                                 uint32_t backing_height,
> +                                 uint32_t x, uint32_t y,
> +                                 uint32_t w, uint32_t h)
> +{
> +    QemuDmaBuf dmabuf =3D {
> +        .width =3D backing_width,
> +        .height =3D backing_height,
> +        .y0_top =3D backing_y_0_top,
> +    };
> +
> +    assert(tex_id);
> +    dmabuf.fd =3D egl_get_fd_for_texture(
> +        tex_id, (EGLint *)&dmabuf.stride,
> +        (EGLint *)&dmabuf.fourcc,
> +        &dmabuf.modifier);
> +    if (dmabuf.fd < 0) {
> +        error_report("%s: failed to get fd for texture", __func__);
> +        return;
> +    }
> +
> +    dbus_scanout_dmabuf(dcl, &dmabuf);
> +    close(dmabuf.fd);
> +}
> +
> +static void dbus_cursor_dmabuf(DisplayChangeListener *dcl,
> +                               QemuDmaBuf *dmabuf, bool have_hot,
> +                               uint32_t hot_x, uint32_t hot_y)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +    DisplaySurface *ds;
> +    GVariant *v_data =3D NULL;
> +    egl_fb cursor_fb;
> +
> +    if (!dmabuf) {
> +        qemu_dbus_display1_listener_call_mouse_set(
> +            ddl->proxy, 0, 0, false,
> +            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
> +        return;
> +    }
> +
> +    egl_dmabuf_import_texture(dmabuf);
> +    if (!dmabuf->texture) {
> +        return;
> +    }
> +    egl_fb_setup_for_tex(&cursor_fb, dmabuf->width, dmabuf->height,
> +                         dmabuf->texture, false);
> +    ds =3D qemu_create_displaysurface(dmabuf->width, dmabuf->height);
> +    egl_fb_read(ds, &cursor_fb);
> +
> +    v_data =3D g_variant_new_from_data(
> +        G_VARIANT_TYPE("ay"),
> +        surface_data(ds),
> +        surface_width(ds) * surface_height(ds) * 4,
> +        TRUE,
> +        (GDestroyNotify)qemu_free_displaysurface,
> +        ds);
> +    qemu_dbus_display1_listener_call_cursor_define(
> +        ddl->proxy,
> +        surface_width(ds),
> +        surface_height(ds),
> +        hot_x,
> +        hot_y,
> +        v_data,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        -1,
> +        NULL,
> +        NULL,
> +        NULL);
> +}
> +
> +static void dbus_cursor_position(DisplayChangeListener *dcl,
> +                                 uint32_t pos_x, uint32_t pos_y)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    qemu_dbus_display1_listener_call_mouse_set(
> +        ddl->proxy, pos_x, pos_y, true,
> +        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
> +}
> +
> +static void dbus_release_dmabuf(DisplayChangeListener *dcl,
> +                                QemuDmaBuf *dmabuf)
> +{
> +    dbus_scanout_disable(dcl);
> +}
> +
> +static void dbus_scanout_update(DisplayChangeListener *dcl,
> +                                uint32_t x, uint32_t y,
> +                                uint32_t w, uint32_t h)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    dbus_call_update_gl(ddl, x, y, w, h);
> +}
> +
> +static void dbus_gl_refresh(DisplayChangeListener *dcl)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    graphic_hw_update(dcl->con);
> +
> +    if (!ddl->ds || qemu_console_is_gl_blocked(ddl->dcl.con)) {
> +        return;
> +    }
> +
> +    if (ddl->gl_updates) {
> +        dbus_call_update_gl(ddl, 0, 0,
> +                            surface_width(ddl->ds),
> surface_height(ddl->ds));
> +        ddl->gl_updates =3D 0;
> +    }
> +}
> +
> +static void dbus_refresh(DisplayChangeListener *dcl)
> +{
> +    graphic_hw_update(dcl->con);
> +}
> +
> +static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
> +                               int x, int y, int w, int h)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    if (ddl->ds) {
> +        surface_gl_update_texture(ddl->gls, ddl->ds, x, y, w, h);
> +    }
> +
> +    ddl->gl_updates++;
> +}
> +
> +static void dbus_gfx_update(DisplayChangeListener *dcl,
> +                            int x, int y, int w, int h)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +    pixman_image_t *img;
> +    GVariant *v_data;
> +    size_t stride;
> +
> +    assert(ddl->ds);
> +    stride =3D w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(ddl->ds=
)),
> 8);
> +
> +    trace_dbus_update(x, y, w, h);
> +
> +    /* make a copy, since gvariant only handles linear data */
> +    img =3D pixman_image_create_bits(surface_format(ddl->ds),
> +                                   w, h, NULL, stride);
> +    pixman_image_composite(PIXMAN_OP_SRC, ddl->ds->image, NULL, img,
> +                           x, y, 0, 0, 0, 0, w, h);
> +
> +    v_data =3D g_variant_new_from_data(
> +        G_VARIANT_TYPE("ay"),
> +        pixman_image_get_data(img),
> +        pixman_image_get_stride(img) * h,
> +        TRUE,
> +        (GDestroyNotify)pixman_image_unref,
> +        img);
> +    qemu_dbus_display1_listener_call_update(ddl->proxy,
> +        x, y, w, h, pixman_image_get_stride(img),
> pixman_image_get_format(img),
> +        v_data,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
> +}
> +
> +static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
> +                               struct DisplaySurface *new_surface)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    if (ddl->ds) {
> +        surface_gl_destroy_texture(ddl->gls, ddl->ds);
> +    }
> +    ddl->ds =3D new_surface;
> +    if (ddl->ds) {
> +        int width =3D surface_width(ddl->ds);
> +        int height =3D surface_height(ddl->ds);
> +
> +        surface_gl_create_texture(ddl->gls, ddl->ds);
> +        /* TODO: lazy send dmabuf (there are unnecessary sent otherwise)
> */
> +        dbus_scanout_texture(&ddl->dcl, ddl->ds->texture, false,
> +                             width, height, 0, 0, width, height);
> +    }
> +}
> +
> +static void dbus_gfx_switch(DisplayChangeListener *dcl,
> +                            struct DisplaySurface *new_surface)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +    GVariant *v_data =3D NULL;
> +
> +    ddl->ds =3D new_surface;
> +    if (!ddl->ds) {
> +        /* why not call disable instead? */
> +        return;
> +    }
> +
> +    v_data =3D g_variant_new_from_data(
> +        G_VARIANT_TYPE("ay"),
> +        surface_data(ddl->ds),
> +        surface_stride(ddl->ds) * surface_height(ddl->ds),
> +        TRUE,
> +        (GDestroyNotify)pixman_image_unref,
> +        pixman_image_ref(ddl->ds->image));
> +    qemu_dbus_display1_listener_call_scanout(ddl->proxy,
> +        surface_width(ddl->ds),
> +        surface_height(ddl->ds),
> +        surface_stride(ddl->ds),
> +        surface_format(ddl->ds),
> +        v_data,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
> +}
> +
> +static void dbus_mouse_set(DisplayChangeListener *dcl,
> +                           int x, int y, int on)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +
> +    qemu_dbus_display1_listener_call_mouse_set(
> +        ddl->proxy, x, y, on, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL,
> NULL);
> +}
> +
> +static void dbus_cursor_define(DisplayChangeListener *dcl,
> +                               QEMUCursor *c)
> +{
> +    DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
> +    GVariant *v_data =3D NULL;
> +
> +    cursor_get(c);
> +    v_data =3D g_variant_new_from_data(
> +        G_VARIANT_TYPE("ay"),
> +        c->data,
> +        c->width * c->height * 4,
> +        TRUE,
> +        (GDestroyNotify)cursor_put,
> +        c);
> +
> +    qemu_dbus_display1_listener_call_cursor_define(
> +        ddl->proxy,
> +        c->width,
> +        c->height,
> +        c->hot_x,
> +        c->hot_y,
> +        v_data,
> +        G_DBUS_CALL_FLAGS_NONE,
> +        -1,
> +        NULL,
> +        NULL,
> +        NULL);
> +}
> +
> +const DisplayChangeListenerOps dbus_gl_dcl_ops =3D {
> +    .dpy_name                =3D "dbus-gl",
> +    .dpy_gfx_update          =3D dbus_gl_gfx_update,
> +    .dpy_gfx_switch          =3D dbus_gl_gfx_switch,
> +    .dpy_gfx_check_format    =3D console_gl_check_format,
> +    .dpy_refresh             =3D dbus_gl_refresh,
> +    .dpy_mouse_set           =3D dbus_mouse_set,
> +    .dpy_cursor_define       =3D dbus_cursor_define,
> +
> +    .dpy_gl_scanout_disable  =3D dbus_scanout_disable,
> +    .dpy_gl_scanout_texture  =3D dbus_scanout_texture,
> +    .dpy_gl_scanout_dmabuf   =3D dbus_scanout_dmabuf,
> +    .dpy_gl_cursor_dmabuf    =3D dbus_cursor_dmabuf,
> +    .dpy_gl_cursor_position  =3D dbus_cursor_position,
> +    .dpy_gl_release_dmabuf   =3D dbus_release_dmabuf,
> +    .dpy_gl_update           =3D dbus_scanout_update,
> +};
> +
> +const DisplayChangeListenerOps dbus_dcl_ops =3D {
> +    .dpy_name                =3D "dbus",
> +    .dpy_gfx_update          =3D dbus_gfx_update,
> +    .dpy_gfx_switch          =3D dbus_gfx_switch,
> +    .dpy_refresh             =3D dbus_refresh,
> +    .dpy_mouse_set           =3D dbus_mouse_set,
> +    .dpy_cursor_define       =3D dbus_cursor_define,
> +};
> +
> +static void
> +dbus_display_listener_dispose(GObject *object)
> +{
> +    DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);
> +
> +    unregister_displaychangelistener(&ddl->dcl);
> +    g_clear_object(&ddl->conn);
> +    g_clear_pointer(&ddl->bus_name, g_free);
> +    g_clear_object(&ddl->proxy);
> +    g_clear_pointer(&ddl->gls, qemu_gl_fini_shader);
> +
> +    G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
> +}
> +
> +static void
> +dbus_display_listener_constructed(GObject *object)
> +{
> +    DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);
> +
> +    if (display_opengl) {
> +        ddl->gls =3D qemu_gl_init_shader();
> +        ddl->dcl.ops =3D &dbus_gl_dcl_ops;
> +    } else {
> +        ddl->dcl.ops =3D &dbus_dcl_ops;
> +    }
> +
> +
> G_OBJECT_CLASS(dbus_display_listener_parent_class)->constructed(object);
> +}
> +
> +static void
> +dbus_display_listener_class_init(DBusDisplayListenerClass *klass)
> +{
> +    GObjectClass *object_class =3D G_OBJECT_CLASS(klass);
> +
> +    object_class->dispose =3D dbus_display_listener_dispose;
> +    object_class->constructed =3D dbus_display_listener_constructed;
> +}
> +
> +static void
> +dbus_display_listener_init(DBusDisplayListener *ddl)
> +{
> +}
> +
> +const char *
> +dbus_display_listener_get_bus_name(DBusDisplayListener *ddl)
> +{
> +    return ddl->bus_name;
> +}
> +
> +DBusDisplayConsole *
> +dbus_display_listener_get_console(DBusDisplayListener *ddl)
> +{
> +    return ddl->console;
> +}
> +
> +DBusDisplayListener *
> +dbus_display_listener_new(const char *bus_name,
> +                          GDBusConnection *conn,
> +                          DBusDisplayConsole *console)
> +{
> +    DBusDisplayListener *ddl;
> +    QemuConsole *con;
> +    g_autoptr(GError) err =3D NULL;
> +
> +    ddl =3D g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);
> +    ddl->proxy =3D
> +        qemu_dbus_display1_listener_proxy_new_sync(conn,
> +            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
> +            NULL,
> +            "/org/qemu/Display1/Listener",
> +            NULL,
> +            &err);
> +    if (!ddl->proxy) {
> +        error_report("Failed to setup proxy: %s", err->message);
> +        g_object_unref(conn);
> +        g_object_unref(ddl);
> +        return NULL;
> +    }
> +
> +    ddl->bus_name =3D g_strdup(bus_name);
> +    ddl->conn =3D conn;
> +    ddl->console =3D console;
> +
> +    con =3D
> qemu_console_lookup_by_index(dbus_display_console_get_index(console));
> +    assert(con);
> +    ddl->dcl.con =3D con;
> +    register_displaychangelistener(&ddl->dcl);
> +
> +    return ddl;
> +}
> diff --git a/ui/dbus.c b/ui/dbus.c
> new file mode 100644
> index 0000000000..12da8ffe31
> --- /dev/null
> +++ b/ui/dbus.c
> @@ -0,0 +1,262 @@
> +/*
> + * QEMU DBus display
> + *
> + * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/dbus.h"
> +#include "qemu/option.h"
> +#include "qom/object_interfaces.h"
> +#include "sysemu/sysemu.h"
> +#include "ui/egl-helpers.h"
> +#include "ui/egl-context.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +
> +#include "dbus.h"
> +
> +static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
> +                                         QEMUGLParams *params)
> +{
> +    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
> +                   qemu_egl_rn_ctx);
> +    return qemu_egl_create_context(dgc, params);
> +}
> +
> +static const DisplayGLCtxOps dbus_gl_ops =3D {
> +    .compatible_dcl          =3D &dbus_gl_dcl_ops,
> +    .dpy_gl_ctx_create       =3D dbus_create_context,
> +    .dpy_gl_ctx_destroy      =3D qemu_egl_destroy_context,
> +    .dpy_gl_ctx_make_current =3D qemu_egl_make_context_current,
> +};
> +
> +static void
> +dbus_display_init(Object *o)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +    g_autoptr(GDBusObjectSkeleton) vm =3D NULL;
> +
> +    dd->glctx.ops =3D &dbus_gl_ops;
> +    dd->iface =3D qemu_dbus_display1_vm_skeleton_new();
> +    dd->consoles =3D g_ptr_array_new_with_free_func(g_object_unref);
> +
> +    dd->server =3D g_dbus_object_manager_server_new(DBUS_DISPLAY1_ROOT);
> +
> +    vm =3D g_dbus_object_skeleton_new(DBUS_DISPLAY1_ROOT "/VM");
> +    g_dbus_object_skeleton_add_interface(
> +        vm, G_DBUS_INTERFACE_SKELETON(dd->iface));
> +    g_dbus_object_manager_server_export(dd->server, vm);
> +}
> +
> +static void
> +dbus_display_finalize(Object *o)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +
> +    g_clear_object(&dd->server);
> +    g_clear_pointer(&dd->consoles, g_ptr_array_unref);
> +    g_clear_object(&dd->bus);
> +    g_clear_object(&dd->iface);
> +    g_free(dd->dbus_addr);
> +}
> +
> +static bool
> +dbus_display_add_console(DBusDisplay *dd, int idx, Error **errp)
> +{
> +    QemuConsole *con;
> +    DBusDisplayConsole *dbus_console;
> +
> +    con =3D qemu_console_lookup_by_index(idx);
> +    assert(con);
> +
> +    if (qemu_console_is_graphic(con) &&
> +        dd->gl_mode !=3D DISPLAYGL_MODE_OFF) {
> +        qemu_console_set_display_gl_ctx(con, &dd->glctx);
> +    }
> +
> +    dbus_console =3D dbus_display_console_new(dd, con);
> +    g_ptr_array_insert(dd->consoles, idx, dbus_console);
> +    g_dbus_object_manager_server_export(dd->server,
> +
> G_DBUS_OBJECT_SKELETON(dbus_console));
> +    return true;
> +}
> +
> +static void
> +dbus_display_complete(UserCreatable *uc, Error **errp)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(uc);
> +    g_autoptr(GError) err =3D NULL;
> +    g_autofree char *uuid =3D qemu_uuid_unparse_strdup(&qemu_uuid);
> +    g_autoptr(GArray) consoles =3D NULL;
> +    GVariant *console_ids;
> +    int idx;
> +
> +    if (!object_resolve_path_type("", TYPE_DBUS_DISPLAY, NULL)) {
> +        error_setg(errp, "There is already an instance of %s",
> +                   TYPE_DBUS_DISPLAY);
> +        return;
> +    }
> +
> +    if (dd->dbus_addr && *dd->dbus_addr) {
> +        dd->bus =3D g_dbus_connection_new_for_address_sync(dd->dbus_addr=
,
> +                        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
> +                        G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
> +                        NULL, NULL, &err);
> +    } else {
> +        dd->bus =3D g_bus_get_sync(G_BUS_TYPE_SESSION, NULL, &err);
> +    }
> +    if (err) {
> +        error_setg(errp, "failed to connect to DBus: %s", err->message);
> +        return;
> +    }
> +
> +
> +    consoles =3D g_array_new(FALSE, FALSE, sizeof(guint32));
> +    for (idx =3D 0;; idx++) {
> +        if (!qemu_console_lookup_by_index(idx)) {
> +            break;
> +        }
> +        if (!dbus_display_add_console(dd, idx, errp)) {
> +            return;
> +        }
> +        g_array_append_val(consoles, idx);
> +    }
> +
> +    console_ids =3D g_variant_new_from_data(
> +        G_VARIANT_TYPE("au"),
> +        consoles->data, consoles->len * sizeof(guint32), TRUE,
> +        (GDestroyNotify)g_array_unref, consoles);
> +    g_steal_pointer(&consoles);
> +    g_object_set(dd->iface,
> +                 "name", qemu_name ?: "QEMU " QEMU_VERSION,
> +                 "uuid", uuid,
> +                 "console-ids", console_ids,
> +                 NULL);
> +
> +    g_dbus_object_manager_server_set_connection(dd->server, dd->bus);
> +    g_bus_own_name_on_connection(dd->bus, "org.qemu",
> +                                 G_BUS_NAME_OWNER_FLAGS_NONE,
> +                                 NULL, NULL, NULL, NULL);
> +}
> +
> +static char *
> +get_dbus_addr(Object *o, Error **errp)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +
> +    return g_strdup(dd->dbus_addr);
> +}
> +
> +static void
> +set_dbus_addr(Object *o, const char *str, Error **errp)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +
> +    g_free(dd->dbus_addr);
> +    dd->dbus_addr =3D g_strdup(str);
> +}
> +
> +static int
> +get_gl_mode(Object *o, Error **errp)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +
> +    return dd->gl_mode;
> +}
> +
> +static void
> +set_gl_mode(Object *o, int val, Error **errp)
> +{
> +    DBusDisplay *dd =3D DBUS_DISPLAY(o);
> +
> +    dd->gl_mode =3D val;
> +}
> +
> +static void
> +dbus_display_class_init(ObjectClass *oc, void *data)
> +{
> +    UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);
> +
> +    ucc->complete =3D dbus_display_complete;
> +    object_class_property_add_str(oc, "addr", get_dbus_addr,
> set_dbus_addr);
> +    object_class_property_add_enum(oc, "gl-mode",
> +                                   "DisplayGLMode", &DisplayGLMode_looku=
p,
> +                                   get_gl_mode, set_gl_mode);
> +}
> +
> +static void
> +early_dbus_init(DisplayOptions *opts)
> +{
> +    DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
> +
> +    if (mode !=3D DISPLAYGL_MODE_OFF) {
> +        if (egl_rendernode_init(opts->u.dbus.rendernode, mode) < 0) {
> +            error_report("dbus: render node init failed");
> +            exit(1);
> +        }
> +
> +        display_opengl =3D 1;
> +    }
> +}
> +
> +static void
> +dbus_init(DisplayState *ds, DisplayOptions *opts)
> +{
> +    DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
> +
> +    object_new_with_props(TYPE_DBUS_DISPLAY,
> +                          object_get_objects_root(),
> +                          "dbus-display", &error_fatal,
> +                          "addr", opts->u.dbus.addr ?: "",
> +                          "gl-mode", DisplayGLMode_str(mode),
> +                          NULL);
> +}
> +
> +static const TypeInfo dbus_display_info =3D {
> +    .name =3D TYPE_DBUS_DISPLAY,
> +    .parent =3D TYPE_OBJECT,
> +    .instance_size =3D sizeof(DBusDisplay),
> +    .instance_init =3D dbus_display_init,
> +    .instance_finalize =3D dbus_display_finalize,
> +    .class_init =3D dbus_display_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_USER_CREATABLE },
> +        { }
> +    }
> +};
> +
> +static QemuDisplay qemu_display_dbus =3D {
> +    .type       =3D DISPLAY_TYPE_DBUS,
> +    .early_init =3D early_dbus_init,
> +    .init       =3D dbus_init,
> +};
> +
> +static void register_dbus(void)
> +{
> +    type_register_static(&dbus_display_info);
> +    qemu_display_register(&qemu_display_dbus);
> +}
> +
> +type_init(register_dbus);
> +
> +#ifdef CONFIG_OPENGL
> +module_dep("ui-opengl");
> +#endif
> diff --git a/meson_options.txt b/meson_options.txt
> index b064b0b46c..0a6abb311e 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -49,6 +49,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
>         description: 'Verbose errors in case of CFI violation')
>  option('multiprocess', type: 'feature', value: 'auto',
>         description: 'Out of process device emulation support')
> +option('dbus_display', type: 'feature', value: 'auto',
> +       description: '-display dbus support')
>
>  option('attr', type : 'feature', value : 'auto',
>         description: 'attr/xattr support')
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5f375bbfa6..1a927458e6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1862,6 +1862,10 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #endif
>  #if defined(CONFIG_OPENGL)
>      "-display egl-headless[,rendernode=3D<file>]\n"
> +#endif
> +#if defined(CONFIG_DBUS_DISPLAY)
> +    "-display dbus[,addr=3D<dbusaddr>]\n"
> +    "             [,gl=3Don|core|es|off][,rendernode=3D<file>]\n"
>  #endif
>      "-display none\n"
>      "                select display backend type\n"
> @@ -1889,6 +1893,17 @@ SRST
>          application. The Spice server will redirect the serial consoles
>          and QEMU monitors. (Since 4.0)
>
> +    ``dbus``
> +        Export the display over D-Bus interfaces. (Since 6.2)
> +
> +        The connection is registered with the "org.qemu" name (and queue=
d
> when
> +        already owned).
> +
> +        ``addr=3D<dbusaddr>`` : D-Bus bus address to connect to.
> +
> +        ``gl=3Don|off|core|es`` : Use OpenGL for rendering (the D-interf=
ace
> will
> +        share framebuffers with DMABUF file descriptors).
> +
>      ``sdl``
>          Display video output via SDL (usually in a separate graphics
>          window; see the SDL documentation for other possibilities).
> diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
> index e69de29bb2..0f0ae92e4d 100644
> --- a/ui/dbus-display1.xml
> +++ b/ui/dbus-display1.xml
> @@ -0,0 +1,378 @@
> +<?xml version=3D"1.0" encoding=3D"utf-8"?>
> +<node>
> +  <!--
> +      org.qemu.Display1.VM:
> +
> +      This interface is implemented on ``/org/qemu/Display1/VM``.
> +  -->
> +  <interface name=3D"org.qemu.Display1.VM">
> +    <!--
> +        Name:
> +
> +        The name of the VM.
> +    -->
> +    <property name=3D"Name" type=3D"s" access=3D"read"/>
> +
> +    <!--
> +        UUID:
> +
> +        The UUID of the VM.
> +    -->
> +    <property name=3D"UUID" type=3D"s" access=3D"read"/>
> +
> +    <!--
> +        ConsoleIDs:
> +
> +        The list of consoles available on
> ``/org/qemu/Display1/Console_$id``.
> +    -->
> +    <property name=3D"ConsoleIDs" type=3D"au" access=3D"read"/>
> +  </interface>
> +
> +  <!--
> +      org.qemu.Display1.Console:
> +
> +      This interface is implemented on
> ``/org/qemu/Display1/Console_$id``. You
> +      may discover available consoles through introspection or with the
> +      :dbus:prop:`org.qemu.Display1.VM.ConsoleIDs` property.
> +
> +      A console is attached to a video device head. It may be "Graphic" =
or
> +      "Text" (see :dbus:prop:`Type` and other properties).
> +
> +      Interactions with a console may be done with
> +      :dbus:iface:`org.qemu.Display1.Keyboard` and
> +      :dbus:iface:`org.qemu.Display1.Mouse` interfaces when available.
> +  -->
> +  <interface name=3D"org.qemu.Display1.Console">
> +    <!--
> +        RegisterListener:
> +        @listener: a Unix socket FD, for peer-to-peer D-Bus communicatio=
n.
> +
> +        Register a console listener, which will receive display updates,
> until
> +        it is disconnected.
> +
> +        Multiple listeners may be registered simultaneously.
> +
> +        The listener is expected to implement the
> +        :dbus:iface:`org.qemu.Display1.Listener` interface.
> +    -->
> +    <method name=3D"RegisterListener">
> +      <arg type=3D"h" name=3D"listener" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        SetUIInfo:
> +        @width_mm: the physical display width in millimeters.
> +        @height_mm: the physical display height in millimeters.
> +        @xoff: horizontal offset, in pixels.
> +        @yoff: vertical offset, in pixels.
> +        @width: console width, in pixels.
> +        @height: console height, in pixels.
> +
> +        Modify the dimensions and display settings.
> +    -->
> +    <method name=3D"SetUIInfo">
> +      <arg name=3D"width_mm" type=3D"q" direction=3D"in"/>
> +      <arg name=3D"height_mm" type=3D"q" direction=3D"in"/>
> +      <arg name=3D"xoff" type=3D"i" direction=3D"in"/>
> +      <arg name=3D"yoff" type=3D"i" direction=3D"in"/>
> +      <arg name=3D"width" type=3D"u" direction=3D"in"/>
> +      <arg name=3D"height" type=3D"u" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        Label:
> +
> +        A user-friendly name for the console (for ex: "VGA").
> +    -->
> +    <property name=3D"Label" type=3D"s" access=3D"read"/>
> +
> +    <!--
> +        Head:
> +
> +        Graphical device head number.
> +    -->
> +    <property name=3D"Head" type=3D"u" access=3D"read"/>
> +
> +    <!--
> +        Type:
> +
> +        Console type ("Graphic" or "Text").
> +    -->
> +    <property name=3D"Type" type=3D"s" access=3D"read"/>
> +
> +    <!--
> +        Width:
> +
> +        Console width, in pixels.
> +    -->
> +    <property name=3D"Width" type=3D"u" access=3D"read"/>
> +
> +    <!--
> +        Height:
> +
> +        Console height, in pixels.
> +    -->
> +    <property name=3D"Height" type=3D"u" access=3D"read"/>
> +
> +    <!--
> +        DeviceAddress:
> +
> +        The device address (ex: "pci/0000/02.0").
> +    -->
> +    <property name=3D"DeviceAddress" type=3D"s" access=3D"read"/>
> +  </interface>
> +
> +  <!--
> +      org.qemu.Display1.Keyboard:
> +
> +      This interface in implemented on ``/org/qemu/Display1/Console_$id`=
`
> (see
> +      :dbus:iface:`~org.qemu.Display1.Console`).
> +  -->
> +  <interface name=3D"org.qemu.Display1.Keyboard">
> +    <!--
> +        Press:
> +        @keycode: QEMU key number (xtkbd + special re-encoding of high
> bit)
> +
> +        Send a key press event.
> +    -->
> +    <method name=3D"Press">
> +      <arg type=3D"u" name=3D"keycode" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        Release:
> +        @keycode: QEMU key number (xtkbd + special re-encoding of high
> bit)
> +
> +        Send a key release event.
> +    -->
> +    <method name=3D"Release">
> +      <arg type=3D"u" name=3D"keycode" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        Modifiers:
> +
> +        The active keyboard modifiers::
> +
> +          Scroll =3D 1 << 0
> +          Num    =3D 1 << 1
> +          Caps   =3D 1 << 2
> +    -->
> +    <property name=3D"Modifiers" type=3D"u" access=3D"read"/>
> +  </interface>
> +
> +  <!--
> +      org.qemu.Display1.Mouse:
> +
> +      This interface in implemented on ``/org/qemu/Display1/Console_$id`=
`
> (see
> +      :dbus:iface:`~org.qemu.Display1.Console` documentation).
> +
> +      .. _dbus-button-values:
> +
> +      **Button values**::
> +
> +        Left       =3D 0
> +        Middle     =3D 1
> +        Right      =3D 2
> +        Wheel-up   =3D 3
> +        Wheel-down =3D 4
> +        Side       =3D 5
> +        Extra      =3D 6
> +  -->
> +  <interface name=3D"org.qemu.Display1.Mouse">
> +    <!--
> +        Press:
> +        @button: :ref:`button value<dbus-button-values>`.
> +
> +        Send a mouse button press event.
> +    -->
> +    <method name=3D"Press">
> +      <arg type=3D"u" name=3D"button" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        Release:
> +        @button: :ref:`button value<dbus-button-values>`.
> +
> +        Send a mouse button release event.
> +    -->
> +    <method name=3D"Release">
> +      <arg type=3D"u" name=3D"button" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        SetAbsPosition:
> +        @x: X position, in pixels.
> +        @y: Y position, in pixels.
> +
> +        Set the mouse pointer position.
> +
> +        Returns an error if not :dbus:prop:`IsAbsolute`.
> +    -->
> +    <method name=3D"SetAbsPosition">
> +      <arg type=3D"u" name=3D"x" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"y" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        RelMotion:
> +        @dx: X-delta, in pixels.
> +        @dy: Y-delta, in pixels.
> +
> +        Move the mouse pointer position, relative to the current positio=
n.
> +
> +        Returns an error if :dbus:prop:`IsAbsolute`.
> +    -->
> +    <method name=3D"RelMotion">
> +      <arg type=3D"i" name=3D"dx" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"dy" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        IsAbsolute:
> +
> +        Whether the mouse is using absolute movements.
> +    -->
> +    <property name=3D"IsAbsolute" type=3D"b" access=3D"read"/>
> +  </interface>
> +
> +  <!--
> +      org.qemu.Display1.Listener:
> +
> +      This client-side interface must be available on
> +      ``/org/qemu/Display1/Listener`` when registering the peer-to-peer
> +      connection with :dbus:meth:`~org.qemu.Display1.Console.Register`.
> +  -->
> +  <interface name=3D"org.qemu.Display1.Listener">
> +    <!--
> +        Scanout:
> +        @width: display width, in pixels.
> +        @height: display height, in pixels.
> +        @stride: data stride, in bytes.
> +        @pixman_format: image format (ex: ``PIXMAN_X8R8G8B8``).
> +        @data: image data.
> +
> +        Resize and update the display content.
> +
> +        The data to transfer for the display update may be large. The
> preferred
> +        scanout method is :dbus:meth:`ScanoutDMABUF`, used whenever
> possible.
> +    -->
> +    <method name=3D"Scanout">
> +      <arg type=3D"u" name=3D"width" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"height" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"stride" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"pixman_format" direction=3D"in"/>
> +      <arg type=3D"ay" name=3D"data" direction=3D"in">
> +        <annotation name=3D"org.gtk.GDBus.C.ForceGVariant" value=3D"true=
"/>
> +      </arg>
> +    </method>
> +
> +    <!--
> +        Update:
> +        @x: X update position, in pixels.
> +        @y: Y update position, in pixels.
> +        @width: update width, in pixels.
> +        @height: update height, in pixels.
> +        @stride: data stride, in bytes.
> +        @pixman_format: image format (ex: ``PIXMAN_X8R8G8B8``).
> +        @data: display image data.
> +
> +        Update the display content.
> +
> +        This method is only called after a :dbus:meth:`Scanout` call.
> +    -->
> +    <method name=3D"Update">
> +      <arg type=3D"i" name=3D"x" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"y" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"width" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"height" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"stride" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"pixman_format" direction=3D"in"/>
> +      <arg type=3D"ay" name=3D"data" direction=3D"in">
> +        <annotation name=3D"org.gtk.GDBus.C.ForceGVariant" value=3D"true=
"/>
> +      </arg>
> +    </method>
> +
> +    <!--
> +        ScanoutDMABUF:
> +        @dmabuf: the DMABUF file descriptor.
> +        @width: display width, in pixels.
> +        @height: display height, in pixels.
> +        @stride: stride, in bytes.
> +        @fourcc: DMABUF fourcc.
> +        @modifier: DMABUF modifier.
> +        @y0_top: whether Y position 0 is the top or not.
> +
> +        Resize and update the display content with a DMABUF.
> +    -->
> +    <method name=3D"ScanoutDMABUF">
> +      <arg type=3D"h" name=3D"dmabuf" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"width" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"height" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"stride" direction=3D"in"/>
> +      <arg type=3D"u" name=3D"fourcc" direction=3D"in"/>
> +      <!-- xywh? -->
> +      <arg type=3D"t" name=3D"modifier" direction=3D"in"/>
> +      <arg type=3D"b" name=3D"y0_top" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        UpdateDMABUF:
> +        @x: the X update position, in pixels.
> +        @y: the Y update position, in pixels.
> +        @width: the update width, in pixels.
> +        @height: the update height, in pixels.
> +
> +        Update the display content with the current DMABUF and the given
> region.
> +    -->
> +    <method name=3D"UpdateDMABUF">
> +      <arg type=3D"i" name=3D"x" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"y" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"width" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"height" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        Disable:
> +
> +        Disable the display (turn it off).
> +    -->
> +    <method name=3D"Disable">
> +    </method>
> +
> +    <!--
> +        MouseSet:
> +        @x: X mouse position, in pixels.
> +        @y: Y mouse position, in pixels.
> +        @on: whether the mouse is visible or not.
> +
> +        Set the mouse position and visibility.
> +    -->
> +    <method name=3D"MouseSet">
> +      <arg type=3D"i" name=3D"x" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"y" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"on" direction=3D"in"/>
> +    </method>
> +
> +    <!--
> +        CursorDefine:
> +        @width: cursor width, in pixels.
> +        @height: cursor height, in pixels.
> +        @hot_x: hot-spot X position, in pixels.
> +        @hot_y: hot-spot Y position, in pixels.
> +        @data: the cursor data.
> +
> +        Set the mouse cursor shape and hot-spot. The "data" must be ARGB=
,
> 32-bit
> +        per pixel.
> +    -->
> +    <method name=3D"CursorDefine">
> +      <arg type=3D"i" name=3D"width" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"height" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"hot_x" direction=3D"in"/>
> +      <arg type=3D"i" name=3D"hot_y" direction=3D"in"/>
> +      <arg type=3D"ay" name=3D"data" direction=3D"in">
> +        <annotation name=3D"org.gtk.GDBus.C.ForceGVariant" value=3D"true=
"/>
> +      </arg>
> +    </method>
> +  </interface>
> +</node>
> diff --git a/ui/meson.build b/ui/meson.build
> index a9df5b911e..6270aa768b 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -65,6 +65,28 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found(=
)
>    ui_modules +=3D {'egl-headless' : egl_headless_ss}
>  endif
>
> +if dbus_display
> +  dbus_ss =3D ss.source_set()
> +  dbus_display1 =3D custom_target('dbus-display gdbus-codegen',
> +                                output: ['dbus-display1.h',
> 'dbus-display1.c'],
> +                                input: files('dbus-display1.xml'),
> +                                command: [config_host['GDBUS_CODEGEN'],
> +                                          '@INPUT@',
> +                                          '--glib-min-required', '2.64',
> +                                          '--output-directory',
> meson.current_build_dir(),
> +                                          '--interface-prefix',
> 'org.qemu.',
> +                                          '--c-namespace', 'QemuDBus',
> +                                          '--generate-c-code', '@BASENAM=
E@
> '])
> +  dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
> +              if_true: [files(
> +                'dbus-console.c',
> +                'dbus-error.c',
> +                'dbus-listener.c',
> +                'dbus.c',
> +              ), dbus_display1])
> +  ui_modules +=3D {'dbus' : dbus_ss}
> +endif
> +
>  if gtk.found()
>    softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'=
))
>
> diff --git a/ui/trace-events b/ui/trace-events
> index e832c3e365..b1ae30159a 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -136,3 +136,14 @@ vdagent_peer_cap(const char *name) "cap %s"
>  vdagent_cb_grab_selection(const char *name) "selection %s"
>  vdagent_cb_grab_type(const char *name) "type %s"
>  vdagent_cb_serial_discard(uint32_t current, uint32_t received)
> "current=3D%u, received=3D%u"
> +
> +# dbus.c
> +dbus_registered_listener(const char *bus_name) "peer %s"
> +dbus_listener_vanished(const char *bus_name) "peer %s"
> +dbus_kbd_press(unsigned int keycode) "keycode %u"
> +dbus_kbd_release(unsigned int keycode) "keycode %u"
> +dbus_mouse_press(unsigned int button) "button %u"
> +dbus_mouse_release(unsigned int button) "button %u"
> +dbus_mouse_set_pos(unsigned int x, unsigned int y) "x=3D%u, y=3D%u"
> +dbus_mouse_rel_motion(int dx, int dy) "dx=3D%d, dy=3D%d"
> +dbus_update(int x, int y, int w, int h) "x=3D%d, y=3D%d, w=3D%d, h=3D%d"
> --
> 2.33.0.721.g106298f7f9
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ad32e805ce382eb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 10, 2021 at 1:30 AM &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The &quot;dbus&quot; display backend exports the QEMU consoles and other<br=
>
UI-related interfaces over D-Bus.<br>
<br>
By default, the connection is established on the session bus, but you<br>
can specify a different bus with the &quot;addr&quot; option.<br>
<br>
The backend takes the &quot;org.qemu&quot; service name, while still allowi=
ng<br>
further instances to queue on the same name (so you can lookup all the<br>
available instances too). It accepts any number of clients at this<br>
point, although this is expected to evolve with options to restrict<br>
clients, or only accept p2p via fd passing.<br>
<br>
The interface is intentionally very close to the internal QEMU API,<br>
and can be introspected or interacted with busctl/dfeet etc:<br>
<br>
$ ./qemu-system-x86_64 -name MyVM -display dbus<br>
$ busctl --user introspect org.qemu /org/qemu/Display1/Console_0<br>
<br>
org.qemu.Display1.Console=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface=
 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-<br>
.RegisterListener=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0method=C2=A0 =C2=A0 h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
.SetUIInfo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 qqiiuu=C2=A0 =C2=A0 -=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
.DeviceAddress=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 property=C2=A0 s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;p=
ci/0000/01.0&quot; emits-change<br>
.Head=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property=C2=A0 u=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0em=
its-change<br>
.Height=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property=C2=A0 u=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0480=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emits-chang=
e<br>
.Label=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 property=C2=A0 s=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;VGA&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emits-=
change<br>
.Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property=C2=A0 s=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Graphic&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0emits-change=
<br>
.Width=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 property=C2=A0 u=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0640=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emits-chang=
e<br>
[...]<br>
<br>
See the interfaces XML source file and Sphinx docs for the generated API<br=
>
documentations.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 ++-<br>
=C2=A0include/qemu/dbus.h=C2=A0 |=C2=A0 19 ++<br>
=C2=A0ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 83 +++++++=
+<br>
=C2=A0ui/dbus-console.c=C2=A0 =C2=A0 | 497 ++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0ui/dbus-error.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 48 +++++<br>
=C2=A0ui/dbus-listener.c=C2=A0 =C2=A0| 486 ++++++++++++++++++++++++++++++++=
++++++++++<br>
=C2=A0ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 262 ++++++++++++=
+++++++++++<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 ++<br>
=C2=A0ui/dbus-display1.xml | 378 ++++++++++++++++++++++++++++++++<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 ++<br>
=C2=A0ui/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A013 files changed, 1859 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 ui/dbus.h<br>
=C2=A0create mode 100644 ui/dbus-console.c<br>
=C2=A0create mode 100644 ui/dbus-error.c<br>
=C2=A0create mode 100644 ui/dbus-listener.c<br>
=C2=A0create mode 100644 ui/dbus.c<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 9494590aa2..b571fde310 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1198,6 +1198,15 @@ endif<br>
=C2=A0have_host_block_device =3D (targetos !=3D &#39;darwin&#39; or<br>
=C2=A0 =C2=A0 =C2=A0cc.has_header(&#39;IOKit/storage/IOMedia.h&#39;))<br>
<br>
+dbus_display =3D false<br>
+if not get_option(&#39;dbus_display&#39;).disabled()<br>
+=C2=A0 # FIXME enable_modules shouldn&#39;t be necessary, but: <a href=3D"=
https://github.com/mesonbuild/meson/issues/8333" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mesonbuild/meson/issues/8333</a><br>
+=C2=A0 dbus_display =3D gio.version().version_compare(&#39;&gt;=3D2.64&#39=
;) and config_host.has_key(&#39;GDBUS_CODEGEN&#39;) and enable_modules<br>
+=C2=A0 if get_option(&#39;dbus_display&#39;).enabled() and not dbus_displa=
y<br>
+=C2=A0 =C2=A0 error(&#39;Requirements missing to enable -display dbus&#39;=
)<br>
+=C2=A0 endif<br>
+endif<br></blockquote><div><br></div><div>I should add a --enable-dbus-dis=
play configure flag too.</div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+<br>
=C2=A0#################<br>
=C2=A0# config-host.h #<br>
=C2=A0#################<br>
@@ -1299,7 +1308,7 @@ config_host_data.set(&#39;CONFIG_SPICE_PROTOCOL_MINOR=
&#39;, spice_protocol.version().spl<br>
=C2=A0config_host_data.set(&#39;CONFIG_SPICE_PROTOCOL_MICRO&#39;, spice_pro=
tocol.version().split(&#39;.&#39;)[2])<br>
=C2=A0endif<br>
=C2=A0config_host_data.set(&#39;CONFIG_SPICE&#39;, spice.found())<br>
-config_host_data.set(&#39;CONFIG_X11&#39;, x11.found())<br>
+config_host_data.set(&#39;CONFIG_DBUS_DISPLAY&#39;, dbus_display)<br></blo=
ckquote><div><br></div><div>oops, bad rebase here. will fix it in v3<br></d=
iv><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0config_host_data.set(&#39;CONFIG_CFI&#39;, get_option(&#39;cfi&#39;))=
<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION&#39;, &#39;&quot;@0@&quot;&#39=
;.format(meson.project_version()))<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION_MAJOR&#39;, meson.project_vers=
ion().split(&#39;.&#39;)[0])<br>
@@ -2892,6 +2901,7 @@ summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =
=C2=A0config_host.has_key(&#39;CONFIG_FUZZ&#39;)}<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=
=A0config_host[&#39;CONFIG_AUDIO_DRIVERS&#39;]}<br>
=C2=A0endif<br>
+summary_info +=3D {&#39;D-Bus display&#39;:=C2=A0 =C2=A0 =C2=A0dbus_displa=
y}<br>
=C2=A0summary_info +=3D {&#39;Trace backends&#39;:=C2=A0 =C2=A0 config_host=
[&#39;TRACE_BACKENDS&#39;]}<br>
=C2=A0if config_host[&#39;TRACE_BACKENDS&#39;].split().contains(&#39;simple=
&#39;)<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;Trace output file&#39;: config_host[&#=
39;CONFIG_TRACE_FILE&#39;] + &#39;-&lt;pid&gt;&#39;}<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index d7567ac866..5ca604bd90 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -1121,6 +1121,23 @@<br>
=C2=A0{ &#39;struct&#39;=C2=A0 : &#39;DisplayEGLHeadless&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;=C2=A0 =C2=A0 : { &#39;*rendernode&#39; : &#39;s=
tr&#39; } }<br>
<br>
+##<br>
+# @DisplayDBus:<br>
+#<br>
+# DBus display options.<br>
+#<br>
+# @addr: The D-Bus bus address (default to the session bus).<br>
+#<br>
+# @rendernode: Which DRM render node should be used. Default is the first<=
br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available node on the ho=
st.<br>
+#<br>
+# Since: 6.2<br>
+#<br>
+##<br>
+{ &#39;struct&#39;=C2=A0 : &#39;DisplayDBus&#39;,<br>
+=C2=A0 &#39;data&#39;=C2=A0 =C2=A0 : { &#39;*rendernode&#39; : &#39;str&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*addr&#39;: &=
#39;str&#39; } }<br>
+<br>
=C2=A0 ##<br>
=C2=A0 # @DisplayGLMode:<br>
=C2=A0 #<br>
@@ -1186,6 +1203,8 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0application to conne=
ct to it. The server will redirect<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the serial console a=
nd QEMU monitors. (Since 4.0)<br>
=C2=A0#<br>
+# @dbus: Start a D-Bus service for the display. (Since 6.2)<br>
+#<br>
=C2=A0# Since: 2.12<br>
=C2=A0#<br>
=C2=A0##<br>
@@ -1199,7 +1218,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: { &#39=
;all&#39;: [&#39;CONFIG_OPENGL&#39;, &#39;CONFIG_GBM&#39;] } },<br>
=C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;curses&#39;, &#39;if&#39;: &#39;=
CONFIG_CURSES&#39; },<br>
=C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;cocoa&#39;, &#39;if&#39;: &#39;C=
ONFIG_COCOA&#39; },<br>
-=C2=A0 =C2=A0 { &#39;name&#39;: &#39;spice-app&#39;, &#39;if&#39;: &#39;CO=
NFIG_SPICE&#39;} ] }<br>
+=C2=A0 =C2=A0 { &#39;name&#39;: &#39;spice-app&#39;, &#39;if&#39;: &#39;CO=
NFIG_SPICE&#39; },<br>
+=C2=A0 =C2=A0 { &#39;name&#39;: &#39;dbus&#39;, &#39;if&#39;: &#39;CONFIG_=
DBUS_DISPLAY&#39; }<br>
+=C2=A0 ]<br>
+}<br>
<br>
=C2=A0##<br>
=C2=A0# @DisplayOptions:<br>
@@ -1227,7 +1249,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gtk&#39;: { &#39;type&#39;: &#39;DisplayGTK=
&#39;, &#39;if&#39;: &#39;CONFIG_GTK&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;curses&#39;: { &#39;type&#39;: &#39;Display=
Curses&#39;, &#39;if&#39;: &#39;CONFIG_CURSES&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;egl-headless&#39;: { &#39;type&#39;: &#39;D=
isplayEGLHeadless&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;CONFIG_OPENGL&#39;, &#39;CO=
NFIG_GBM&#39;] } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;CONFIG_OPENGL&#39;, &#39;CO=
NFIG_GBM&#39;] } },<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;dbus&#39;: { &#39;type&#39;: &#39;DisplayDBus&#3=
9;, &#39;if&#39;: &#39;CONFIG_DBUS_DISPLAY&#39; }<br>
=C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h<br>
index 9d591f9ee4..c0cbb1ca44 100644<br>
--- a/include/qemu/dbus.h<br>
+++ b/include/qemu/dbus.h<br>
@@ -12,6 +12,25 @@<br>
<br>
=C2=A0#include &lt;gio/gio.h&gt;<br>
<br>
+/* glib/gio 2.68 */<br>
+#define DBUS_METHOD_INVOCATION_HANDLED TRUE<br>
+#define DBUS_METHOD_INVOCATION_UNHANDLED FALSE<br>
+<br>
+/* in msec */<br>
+#define DBUS_DEFAULT_TIMEOUT 1000<br>
+<br>
+#define DBUS_DISPLAY1_ROOT &quot;/org/qemu/Display1&quot;<br>
+<br>
+#define DBUS_DISPLAY_ERROR (dbus_display_error_quark())<br>
+GQuark dbus_display_error_quark(void);<br>
+<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_FAILED,<br>
+=C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_INVALID,<br>
+=C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_UNSUPPORTED,<br>
+=C2=A0 =C2=A0 DBUS_DISPLAY_N_ERRORS,<br>
+} DBusDisplayError;<br>
+<br>
=C2=A0GStrv qemu_dbus_get_queued_owners(GDBusConnection *connection,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br>
diff --git a/ui/dbus.h b/ui/dbus.h<br>
new file mode 100644<br>
index 0000000000..d3c9598dd1<br>
--- /dev/null<br>
+++ b/ui/dbus.h<br>
@@ -0,0 +1,83 @@<br>
+/*<br>
+ * QEMU DBus display<br>
+ *<br>
+ * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+#ifndef UI_DBUS_H_<br>
+#define UI_DBUS_H_<br>
+<br>
+#include &quot;qemu/dbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;ui/console.h&quot;<br>
+<br>
+#include &quot;dbus-display1.h&quot;<br>
+<br>
+struct DBusDisplay {<br>
+=C2=A0 =C2=A0 Object parent;<br>
+<br>
+=C2=A0 =C2=A0 DisplayGLMode gl_mode;<br>
+=C2=A0 =C2=A0 char *dbus_addr;<br>
+=C2=A0 =C2=A0 DisplayGLCtx glctx;<br>
+<br>
+=C2=A0 =C2=A0 GDBusConnection *bus;<br>
+=C2=A0 =C2=A0 GDBusObjectManagerServer *server;<br>
+=C2=A0 =C2=A0 QemuDBusDisplay1VM *iface;<br>
+=C2=A0 =C2=A0 GPtrArray *consoles;<br>
+};<br>
+<br>
+#define TYPE_DBUS_DISPLAY &quot;dbus-display&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(DBusDisplay, DBUS_DISPLAY)<br>
+<br>
+#define DBUS_DISPLAY_TYPE_CONSOLE dbus_display_console_get_type()<br>
+G_DECLARE_FINAL_TYPE(DBusDisplayConsole,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dbus_display_console,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DBUS_DISPLAY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0CONSOLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GDBusObjectSkeleton)<br>
+<br>
+DBusDisplayConsole *<br>
+dbus_display_console_new(DBusDisplay *display, QemuConsole *con);<br>
+<br>
+int<br>
+dbus_display_console_get_index(DBusDisplayConsole *ddc);<br>
+<br>
+#define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()<br>
+G_DECLARE_FINAL_TYPE(DBusDisplayListener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dbus_display_listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DBUS_DISPLAY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0LISTENER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GObject)<br>
+<br>
+DBusDisplayListener *<br>
+dbus_display_listener_new(const char *bus_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GDBusConnection *conn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DBusDisplayConsole *console);<br>
+<br>
+DBusDisplayConsole *<br>
+dbus_display_listener_get_console(DBusDisplayListener *ddl);<br>
+<br>
+const char *<br>
+dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);<br>
+<br>
+extern const DisplayChangeListenerOps dbus_gl_dcl_ops;<br>
+extern const DisplayChangeListenerOps dbus_dcl_ops;<br>
+<br>
+#endif /* UI_DBUS_H_ */<br>
diff --git a/ui/dbus-console.c b/ui/dbus-console.c<br>
new file mode 100644<br>
index 0000000000..1ccf638c10<br>
--- /dev/null<br>
+++ b/ui/dbus-console.c<br>
@@ -0,0 +1,497 @@<br>
+/*<br>
+ * QEMU DBus display console<br>
+ *<br>
+ * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;ui/input.h&quot;<br>
+#include &quot;ui/kbd-state.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#include &lt;gio/gunixfdlist.h&gt;<br>
+<br>
+#include &quot;dbus.h&quot;<br>
+<br>
+struct _DBusDisplayConsole {<br>
+=C2=A0 =C2=A0 GDBusObjectSkeleton parent_instance;<br>
+=C2=A0 =C2=A0 DisplayChangeListener dcl;<br>
+<br>
+=C2=A0 =C2=A0 DBusDisplay *display;<br>
+=C2=A0 =C2=A0 QemuConsole *con;<br>
+=C2=A0 =C2=A0 GHashTable *listeners;<br>
+=C2=A0 =C2=A0 QemuDBusDisplay1Console *iface;<br>
+<br>
+=C2=A0 =C2=A0 QemuDBusDisplay1Keyboard *iface_kbd;<br>
+=C2=A0 =C2=A0 QKbdState *kbd;<br>
+<br>
+=C2=A0 =C2=A0 QemuDBusDisplay1Mouse *iface_mouse;<br>
+=C2=A0 =C2=A0 gboolean last_set;<br>
+=C2=A0 =C2=A0 guint last_x;<br>
+=C2=A0 =C2=A0 guint last_y;<br>
+=C2=A0 =C2=A0 Notifier mouse_mode_notifier;<br>
+};<br>
+<br>
+G_DEFINE_TYPE(DBusDisplayConsole,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_display_console,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_TYPE_DBUS_OBJECT_SKELET=
ON)<br>
+<br>
+static void<br>
+dbus_display_console_set_size(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t width, uint32_t height)<br>
+{<br>
+=C2=A0 =C2=A0 g_object_set(ddc-&gt;iface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;width&=
quot;, width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;height=
&quot;, height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
+}<br>
+<br>
+static void<br>
+dbus_gfx_switch(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct DisplaySurf=
ace *new_surface)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayCon=
sole, dcl);<br>
+<br>
+=C2=A0 =C2=A0 dbus_display_console_set_size(ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(new_surface),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(new_surface));=
<br>
+}<br>
+<br>
+static void<br>
+dbus_gfx_update(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int x, int y, int =
w, int h)<br>
+{<br>
+}<br>
+<br>
+static void<br>
+dbus_gl_scanout_disable(DisplayChangeListener *dcl)<br>
+{<br>
+}<br>
+<br>
+static void<br>
+dbus_gl_scanout_texture(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t tex_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool backing_y_0_top,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t backing_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t backing_height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t x, uint32_t y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t w, uint32_t h)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayCon=
sole, dcl);<br>
+<br>
+=C2=A0 =C2=A0 dbus_display_console_set_size(ddc, w, h);<br>
+}<br>
+<br>
+static void<br>
+dbus_gl_scanout_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0QemuDmaBuf *dmabuf)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D container_of(dcl, DBusDisplayCon=
sole, dcl);<br>
+<br>
+=C2=A0 =C2=A0 dbus_display_console_set_size(ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;height);<br>
+}<br>
+<br>
+static void<br>
+dbus_gl_scanout_update(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t x, uint32_t y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t w, uint32_t h)<br>
+{<br>
+}<br>
+<br>
+static const DisplayChangeListenerOps dbus_console_dcl_ops =3D {<br>
+=C2=A0 =C2=A0 .dpy_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;dbus-console&quot;,<br>
+=C2=A0 =C2=A0 .dpy_gfx_switch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
fx_switch,<br>
+=C2=A0 =C2=A0 .dpy_gfx_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
fx_update,<br>
+=C2=A0 =C2=A0 .dpy_gl_scanout_disable=C2=A0 =3D dbus_gl_scanout_disable,<b=
r>
+=C2=A0 =C2=A0 .dpy_gl_scanout_texture=C2=A0 =3D dbus_gl_scanout_texture,<b=
r>
+=C2=A0 =C2=A0 .dpy_gl_scanout_dmabuf=C2=A0 =C2=A0=3D dbus_gl_scanout_dmabu=
f,<br>
+=C2=A0 =C2=A0 .dpy_gl_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
bus_gl_scanout_update,<br>
+};<br>
+<br>
+static void<br>
+dbus_display_console_init(DBusDisplayConsole *object)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(object);<br=
>
+<br>
+=C2=A0 =C2=A0 ddc-&gt;listeners =3D g_hash_table_new_full(g_str_hash, g_st=
r_equal,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL, g_object_unref);<br>
+=C2=A0 =C2=A0 ddc-&gt;dcl.ops =3D &amp;dbus_console_dcl_ops;<br>
+}<br>
+<br>
+static void<br>
+dbus_display_console_dispose(GObject *object)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(object);<br=
>
+<br>
+=C2=A0 =C2=A0 unregister_displaychangelistener(&amp;ddc-&gt;dcl);<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;ddc-&gt;iface_kbd);<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;ddc-&gt;iface);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;ddc-&gt;listeners, g_hash_table_unref);=
<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;ddc-&gt;kbd, qkbd_state_free);<br>
+<br>
+=C2=A0 =C2=A0 G_OBJECT_CLASS(dbus_display_console_parent_class)-&gt;dispos=
e(object);<br>
+}<br>
+<br>
+static void<br>
+dbus_display_console_class_init(DBusDisplayConsoleClass *klass)<br>
+{<br>
+=C2=A0 =C2=A0 GObjectClass *gobject_class =3D G_OBJECT_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 gobject_class-&gt;dispose =3D dbus_display_console_dispose;<=
br>
+}<br>
+<br>
+static void<br>
+listener_vanished_cb(DBusDisplayListener *listener)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D dbus_display_listener_get_consol=
e(listener);<br>
+=C2=A0 =C2=A0 const char *name =3D dbus_display_listener_get_bus_name(list=
ener);<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_listener_vanished(name);<br>
+<br>
+=C2=A0 =C2=A0 g_hash_table_remove(ddc-&gt;listeners, name);<br>
+=C2=A0 =C2=A0 qkbd_state_lift_all_keys(ddc-&gt;kbd);<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_console_set_ui_info(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GDBusMethodInvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0guint16 arg_width_mm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0guint16 arg_height_mm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gint arg_xoff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gint arg_yoff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0guint arg_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0guint arg_height)<br>
+{<br>
+=C2=A0 =C2=A0 QemuUIInfo info =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width_mm =3D arg_width_mm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .height_mm =3D arg_height_mm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .xoff =3D arg_xoff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .yoff =3D arg_yoff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width =3D arg_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .height =3D arg_height,<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 if (!dpy_ui_info_supported(ddc-&gt;con)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(invocati=
on,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 DBUS_DISPLAY_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_UNSUPPORTED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;SetUIInfo is not supported&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dpy_set_ui_info(ddc-&gt;con, &amp;info, false);<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_console_complete_set_uiinfo(ddc-&gt;iface=
, invocation);<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_console_register_listener(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBusMethodInvocation *invocation,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUnixFDList *fd_list,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GVariant *arg_listener)<br>
+{<br>
+=C2=A0 =C2=A0 const char *sender =3D g_dbus_method_invocation_get_sender(i=
nvocation);<br>
+=C2=A0 =C2=A0 GDBusConnection *listener_conn;<br>
+=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
+=C2=A0 =C2=A0 g_autoptr(GSocket) socket =3D NULL;<br>
+=C2=A0 =C2=A0 g_autoptr(GSocketConnection) socket_conn =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *guid =3D g_dbus_generate_guid();<br>
+=C2=A0 =C2=A0 DBusDisplayListener *listener;<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 if (g_hash_table_contains(ddc-&gt;listeners, sender)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_INVALID,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`%s` is already registered=
!&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sender);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fd =3D g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_=
listener), &amp;err);<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_FAILED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Couldn&#39;t get peer fd: =
%s&quot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 socket =3D g_socket_new_from_fd(fd, &amp;err);<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_FAILED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Couldn&#39;t make a socket=
: %s&quot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 socket_conn =3D g_socket_connection_factory_create_connectio=
n(socket);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_console_complete_register_listener(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddc-&gt;iface, invocation, NULL);<br>
+<br>
+=C2=A0 =C2=A0 listener_conn =3D g_dbus_connection_new_sync(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_IO_STREAM(socket_conn),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 guid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, &amp;err);<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Failed to setup peer connec=
tion: %s&quot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 listener =3D dbus_display_listener_new(sender, listener_conn=
, ddc);<br>
+=C2=A0 =C2=A0 if (!listener) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_hash_table_insert(ddc-&gt;listeners,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (gpointer)dbus_display_listener_get_bus_name(listener),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 listener);<br>
+=C2=A0 =C2=A0 g_object_connect(listener_conn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;swapped-signal::closed&quot;, listener_vanished_cb, listener,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL);<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_registered_listener(sender);<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_kbd_press(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBusMethodInvocati=
on *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint arg_keycode)<=
br>
+{<br>
+=C2=A0 =C2=A0 QKeyCode qcode =3D qemu_input_key_number_to_qcode(arg_keycod=
e);<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_kbd_press(arg_keycode);<br>
+<br>
+=C2=A0 =C2=A0 qkbd_state_key_event(ddc-&gt;kbd, qcode, true);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_keyboard_complete_press(ddc-&gt;iface_kbd=
, invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_kbd_release(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBusMethodI=
nvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint arg_ke=
ycode)<br>
+{<br>
+=C2=A0 =C2=A0 QKeyCode qcode =3D qemu_input_key_number_to_qcode(arg_keycod=
e);<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_kbd_release(arg_keycode);<br>
+<br>
+=C2=A0 =C2=A0 qkbd_state_key_event(ddc-&gt;kbd, qcode, false);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_keyboard_complete_release(ddc-&gt;iface_k=
bd, invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static void<br>
+dbus_kbd_qemu_leds_updated(void *data, int ledstate)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D DBUS_DISPLAY_CONSOLE(data);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_keyboard_set_modifiers(ddc-&gt;iface_kbd,=
 ledstate);<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_mouse_rel_motion(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GDBusMethodInvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int dx, int dy)<br>
+{<br>
+=C2=A0 =C2=A0 trace_dbus_mouse_rel_motion(dx, dy);<br>
+<br>
+=C2=A0 =C2=A0 if (qemu_input_is_absolute()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation, DBUS_DISPLAY_ERROR,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_INVALID,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Mouse is not relative&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_input_queue_rel(ddc-&gt;con, INPUT_AXIS_X, dx);<br>
+=C2=A0 =C2=A0 qemu_input_queue_rel(ddc-&gt;con, INPUT_AXIS_Y, dy);<br>
+=C2=A0 =C2=A0 qemu_input_event_sync();<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_mouse_complete_rel_motion(ddc-&gt;iface_m=
ouse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_mouse_set_pos(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBus=
MethodInvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint=
 x, guint y)<br>
+{<br>
+=C2=A0 =C2=A0 int width, height;<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_mouse_set_pos(x, y);<br>
+<br>
+=C2=A0 =C2=A0 if (!qemu_input_is_absolute()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation, DBUS_DISPLAY_ERROR,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_INVALID,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Mouse is not absolute&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 width =3D qemu_console_get_width(ddc-&gt;con, 0);<br>
+=C2=A0 =C2=A0 height =3D qemu_console_get_height(ddc-&gt;con, 0);<br>
+=C2=A0 =C2=A0 if (x &gt;=3D width || y &gt;=3D height) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dbus_method_invocation_return_error(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation, DBUS_DISPLAY_ERROR,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_ERROR_INVALID,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Invalid mouse position&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_input_queue_abs(ddc-&gt;con, INPUT_AXIS_X, x, 0, width)=
;<br>
+=C2=A0 =C2=A0 qemu_input_queue_abs(ddc-&gt;con, INPUT_AXIS_Y, y, 0, height=
);<br>
+=C2=A0 =C2=A0 qemu_input_event_sync();<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_mouse_complete_set_abs_position(ddc-&gt;i=
face_mouse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_mouse_press(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBusMethodI=
nvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint button=
)<br>
+{<br>
+=C2=A0 =C2=A0 trace_dbus_mouse_press(button);<br>
+<br>
+=C2=A0 =C2=A0 qemu_input_queue_btn(ddc-&gt;con, button, true);<br>
+=C2=A0 =C2=A0 qemu_input_event_sync();<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_mouse_complete_press(ddc-&gt;iface_mouse,=
 invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static gboolean<br>
+dbus_mouse_release(DBusDisplayConsole *ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBus=
MethodInvocation *invocation,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint=
 button)<br>
+{<br>
+=C2=A0 =C2=A0 trace_dbus_mouse_release(button);<br>
+<br>
+=C2=A0 =C2=A0 qemu_input_queue_btn(ddc-&gt;con, button, false);<br>
+=C2=A0 =C2=A0 qemu_input_event_sync();<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_mouse_complete_release(ddc-&gt;iface_mous=
e, invocation);<br>
+<br>
+=C2=A0 =C2=A0 return DBUS_METHOD_INVOCATION_HANDLED;<br>
+}<br>
+<br>
+static void<br>
+dbus_mouse_mode_change(Notifier *notify, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(notify, DBusDisplayConsole, mouse=
_mode_notifier);<br>
+<br>
+=C2=A0 =C2=A0 g_object_set(ddc-&gt;iface_mouse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;is-abs=
olute&quot;, qemu_input_is_absolute(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
+}<br>
+<br>
+int dbus_display_console_get_index(DBusDisplayConsole *ddc)<br>
+{<br>
+=C2=A0 =C2=A0 return qemu_console_get_index(ddc-&gt;con);<br>
+}<br>
+<br>
+DBusDisplayConsole *<br>
+dbus_display_console_new(DBusDisplay *display, QemuConsole *con)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree char *path =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *label =3D NULL;<br>
+=C2=A0 =C2=A0 char device_addr[256] =3D &quot;&quot;;<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *ddc;<br>
+=C2=A0 =C2=A0 int idx;<br>
+<br>
+=C2=A0 =C2=A0 assert(display);<br>
+=C2=A0 =C2=A0 assert(con);<br>
+<br>
+=C2=A0 =C2=A0 label =3D qemu_console_get_label(con);<br>
+=C2=A0 =C2=A0 idx =3D qemu_console_get_index(con);<br>
+=C2=A0 =C2=A0 path =3D g_strdup_printf(DBUS_DISPLAY1_ROOT &quot;/Console_%=
d&quot;, idx);<br>
+=C2=A0 =C2=A0 ddc =3D g_object_new(DBUS_DISPLAY_TYPE_CONSOLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;g-object-path&quot;, path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 ddc-&gt;display =3D display;<br>
+=C2=A0 =C2=A0 ddc-&gt;con =3D con;<br>
+=C2=A0 =C2=A0 /* handle errors, and skip non graphics? */<br>
+=C2=A0 =C2=A0 qemu_console_fill_device_address(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 con, device_addr, sizeof(device_addr), NULL);<=
br>
+<br>
+=C2=A0 =C2=A0 ddc-&gt;iface =3D qemu_dbus_display1_console_skeleton_new();=
<br>
+=C2=A0 =C2=A0 g_object_set(ddc-&gt;iface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;label&quot;, label,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;, qemu_console_is_graphic(con)=
 ? &quot;Graphic&quot; : &quot;Text&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;head&quot;, qemu_console_get_head(con),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;width&quot;, qemu_console_get_width(con,=
 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;height&quot;, qemu_console_get_height(co=
n, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;device-address&quot;, device_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 g_object_connect(ddc-&gt;iface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-register-listener=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_console_register_listener, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-set-uiinfo&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_console_set_ui_info, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(=
ddc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_INTERFACE_SKELETON(ddc-&gt;iface));<br>
+<br>
+=C2=A0 =C2=A0 ddc-&gt;kbd =3D qkbd_state_init(con);<br>
+=C2=A0 =C2=A0 ddc-&gt;iface_kbd =3D qemu_dbus_display1_keyboard_skeleton_n=
ew();<br>
+=C2=A0 =C2=A0 qemu_add_led_event_handler(dbus_kbd_qemu_leds_updated, ddc);=
<br>
+=C2=A0 =C2=A0 g_object_connect(ddc-&gt;iface_kbd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-press&quot;, dbus=
_kbd_press, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-release&quot;, db=
us_kbd_release, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(=
ddc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_INTERFACE_SKELETON(ddc-&gt;iface_kbd));=
<br>
+<br>
+=C2=A0 =C2=A0 ddc-&gt;iface_mouse =3D qemu_dbus_display1_mouse_skeleton_ne=
w();<br>
+=C2=A0 =C2=A0 g_object_connect(ddc-&gt;iface_mouse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-set-abs-position&=
quot;, dbus_mouse_set_pos, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-rel-motion&quot;,=
 dbus_mouse_rel_motion, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-press&quot;, dbus=
_mouse_press, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapped-signal::handle-release&quot;, db=
us_mouse_release, ddc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+=C2=A0 =C2=A0 g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(=
ddc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_INTERFACE_SKELETON(ddc-&gt;iface_mouse)=
);<br>
+<br>
+=C2=A0 =C2=A0 register_displaychangelistener(&amp;ddc-&gt;dcl);<br>
+=C2=A0 =C2=A0 ddc-&gt;mouse_mode_notifier.notify =3D dbus_mouse_mode_chang=
e;<br>
+=C2=A0 =C2=A0 qemu_add_mouse_mode_change_notifier(&amp;ddc-&gt;mouse_mode_=
notifier);<br>
+<br>
+=C2=A0 =C2=A0 return ddc;<br>
+}<br>
diff --git a/ui/dbus-error.c b/ui/dbus-error.c<br>
new file mode 100644<br>
index 0000000000..85a9194d57<br>
--- /dev/null<br>
+++ b/ui/dbus-error.c<br>
@@ -0,0 +1,48 @@<br>
+/*<br>
+ * QEMU DBus display errors<br>
+ *<br>
+ * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;dbus.h&quot;<br>
+<br>
+static const GDBusErrorEntry dbus_display_error_entries[] =3D {<br>
+=C2=A0 =C2=A0 { DBUS_DISPLAY_ERROR_FAILED, &quot;org.qemu.Display1.Error.F=
ailed&quot; },<br>
+=C2=A0 =C2=A0 { DBUS_DISPLAY_ERROR_INVALID, &quot;org.qemu.Display1.Error.=
Invalid&quot; },<br>
+=C2=A0 =C2=A0 { DBUS_DISPLAY_ERROR_UNSUPPORTED, &quot;org.qemu.Display1.Er=
ror.Unsupported&quot; },<br>
+};<br>
+<br>
+G_STATIC_ASSERT(G_N_ELEMENTS(dbus_display_error_entries) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DISPLAY_N_ERR=
ORS);<br>
+<br>
+GQuark<br>
+dbus_display_error_quark(void)<br>
+{<br>
+=C2=A0 =C2=A0 static gsize quark;<br>
+<br>
+=C2=A0 =C2=A0 g_dbus_error_register_error_domain(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dbus-display-error-quark&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;quark,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_display_error_entries,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_N_ELEMENTS(dbus_display_error_entries));<br>
+<br>
+=C2=A0 =C2=A0 return (GQuark)quark;<br>
+}<br>
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c<br>
new file mode 100644<br>
index 0000000000..20094fc18a<br>
--- /dev/null<br>
+++ b/ui/dbus-listener.c<br>
@@ -0,0 +1,486 @@<br>
+/*<br>
+ * QEMU DBus display console<br>
+ *<br>
+ * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;dbus.h&quot;<br>
+#include &lt;gio/gunixfdlist.h&gt;<br>
+<br>
+#include &quot;ui/shader.h&quot;<br>
+#include &quot;ui/egl-helpers.h&quot;<br>
+#include &quot;ui/egl-context.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+struct _DBusDisplayListener {<br>
+=C2=A0 =C2=A0 GObject parent;<br>
+<br>
+=C2=A0 =C2=A0 char *bus_name;<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *console;<br>
+=C2=A0 =C2=A0 GDBusConnection *conn;<br>
+<br>
+=C2=A0 =C2=A0 QemuDBusDisplay1Listener *proxy;<br>
+<br>
+=C2=A0 =C2=A0 DisplayChangeListener dcl;<br>
+=C2=A0 =C2=A0 DisplaySurface *ds;<br>
+=C2=A0 =C2=A0 QemuGLShader *gls;<br>
+=C2=A0 =C2=A0 int gl_updates;<br>
+};<br>
+<br>
+G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)<b=
r>
+<br>
+static void dbus_update_gl_cb(GObject *source_object,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GAsyncResult *res,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gpointer user_data)<br>
+{<br>
+=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D user_data;<br>
+<br>
+=C2=A0 =C2=A0 if (!qemu_dbus_display1_listener_call_update_dmabuf_finish(d=
dl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0res, &amp;err)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Failed to call update: %s&q=
uot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 graphic_hw_gl_block(ddl-&gt;dcl.con, false);<br>
+=C2=A0 =C2=A0 g_object_unref(ddl);<br>
+}<br>
+<br>
+static void dbus_call_update_gl(DBusDisplayListener *ddl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int x, int y, int w, int h)<br>
+{<br>
+=C2=A0 =C2=A0 graphic_hw_gl_block(ddl-&gt;dcl.con, true);<br>
+=C2=A0 =C2=A0 glFlush();<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_update_dmabuf(ddl-&gt;proxy=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 x, y, w, h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DEFAULT_TIMEOUT, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_update_gl_cb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_ref(ddl));<br>
+}<br>
+<br>
+static void dbus_scanout_disable(DisplayChangeListener *dcl)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 ddl-&gt;ds =3D NULL;<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_disable(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy, G_DBUS_CALL_FLAGS_NONE, -1, NUL=
L, NULL, NULL);<br>
+}<br>
+<br>
+static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuDmaBuf *dmabuf)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
+=C2=A0 =C2=A0 g_autoptr(GUnixFDList) fd_list =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 fd_list =3D g_unix_fd_list_new();<br>
+=C2=A0 =C2=A0 if (g_unix_fd_list_append(fd_list, dmabuf-&gt;fd, &amp;err) =
!=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Failed to setup dmabuf fdli=
st: %s&quot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_scanout_dmabuf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_variant_new_handle(0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;stride,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;fourcc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;modifier,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;y0_top,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_list,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL);<br>
+}<br>
+<br>
+static void dbus_scanout_texture(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t tex_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool backing_y_0_top,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t backing_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t backing_height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t x, uint32_t y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t w, uint32_t h)<br>
+{<br>
+=C2=A0 =C2=A0 QemuDmaBuf dmabuf =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width =3D backing_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .height =3D backing_height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .y0_top =3D backing_y_0_top,<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 assert(tex_id);<br>
+=C2=A0 =C2=A0 dmabuf.fd =3D egl_get_fd_for_texture(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tex_id, (EGLint *)&amp;dmabuf.stride,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (EGLint *)&amp;dmabuf.fourcc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dmabuf.modifier);<br>
+=C2=A0 =C2=A0 if (dmabuf.fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: failed to get fd for te=
xture&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dbus_scanout_dmabuf(dcl, &amp;dmabuf);<br>
+=C2=A0 =C2=A0 close(dmabuf.fd);<br>
+}<br>
+<br>
+static void dbus_cursor_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuDmaBuf *dmabuf, bool have_hot,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hot_x, uint32_t hot_y)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+=C2=A0 =C2=A0 DisplaySurface *ds;<br>
+=C2=A0 =C2=A0 GVariant *v_data =3D NULL;<br>
+=C2=A0 =C2=A0 egl_fb cursor_fb;<br>
+<br>
+=C2=A0 =C2=A0 if (!dmabuf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_dbus_display1_listener_call_mouse_set(<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy, 0, 0, false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE, -1, NULL=
, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 egl_dmabuf_import_texture(dmabuf);<br>
+=C2=A0 =C2=A0 if (!dmabuf-&gt;texture) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 egl_fb_setup_for_tex(&amp;cursor_fb, dmabuf-&gt;width, dmabu=
f-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dmabuf-&gt;texture, false);<br>
+=C2=A0 =C2=A0 ds =3D qemu_create_displaysurface(dmabuf-&gt;width, dmabuf-&=
gt;height);<br>
+=C2=A0 =C2=A0 egl_fb_read(ds, &amp;cursor_fb);<br>
+<br>
+=C2=A0 =C2=A0 v_data =3D g_variant_new_from_data(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_VARIANT_TYPE(&quot;ay&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_data(ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(ds) * surface_height(ds) * 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TRUE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GDestroyNotify)qemu_free_displaysurface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ds);<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_cursor_define(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hot_x,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hot_y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+}<br>
+<br>
+static void dbus_cursor_position(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pos_x, uint32_t pos_y=
)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_mouse_set(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy, pos_x, pos_y, true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);=
<br>
+}<br>
+<br>
+static void dbus_release_dmabuf(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuDmaBuf *dmabuf)<br>
+{<br>
+=C2=A0 =C2=A0 dbus_scanout_disable(dcl);<br>
+}<br>
+<br>
+static void dbus_scanout_update(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t x, uint32_t y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t w, uint32_t h)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 dbus_call_update_gl(ddl, x, y, w, h);<br>
+}<br>
+<br>
+static void dbus_gl_refresh(DisplayChangeListener *dcl)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 graphic_hw_update(dcl-&gt;con);<br>
+<br>
+=C2=A0 =C2=A0 if (!ddl-&gt;ds || qemu_console_is_gl_blocked(ddl-&gt;dcl.co=
n)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ddl-&gt;gl_updates) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_call_update_gl(ddl, 0, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(ddl-&gt;ds), surface_height(ddl-&gt;=
ds));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;gl_updates =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void dbus_refresh(DisplayChangeListener *dcl)<br>
+{<br>
+=C2=A0 =C2=A0 graphic_hw_update(dcl-&gt;con);<br>
+}<br>
+<br>
+static void dbus_gl_gfx_update(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int x, int y, int w, int h)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 if (ddl-&gt;ds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_gl_update_texture(ddl-&gt;gls, ddl-&gt=
;ds, x, y, w, h);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ddl-&gt;gl_updates++;<br>
+}<br>
+<br>
+static void dbus_gfx_update(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int x, int y, int w, int h)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+=C2=A0 =C2=A0 pixman_image_t *img;<br>
+=C2=A0 =C2=A0 GVariant *v_data;<br>
+=C2=A0 =C2=A0 size_t stride;<br>
+<br>
+=C2=A0 =C2=A0 assert(ddl-&gt;ds);<br>
+=C2=A0 =C2=A0 stride =3D w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format=
(ddl-&gt;ds)), 8);<br>
+<br>
+=C2=A0 =C2=A0 trace_dbus_update(x, y, w, h);<br>
+<br>
+=C2=A0 =C2=A0 /* make a copy, since gvariant only handles linear data */<b=
r>
+=C2=A0 =C2=A0 img =3D pixman_image_create_bits(surface_format(ddl-&gt;ds),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w, h, NULL, stride);<br=
>
+=C2=A0 =C2=A0 pixman_image_composite(PIXMAN_OP_SRC, ddl-&gt;ds-&gt;image, =
NULL, img,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0x, y, 0, 0, 0, 0, w, h);<br>
+<br>
+=C2=A0 =C2=A0 v_data =3D g_variant_new_from_data(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_VARIANT_TYPE(&quot;ay&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pixman_image_get_data(img),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pixman_image_get_stride(img) * h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TRUE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GDestroyNotify)pixman_image_unref,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 img);<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_update(ddl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 x, y, w, h, pixman_image_get_stride(img), pixm=
an_image_get_format(img),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);<br>
+}<br>
+<br>
+static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct DisplaySurface *new_surface)<b=
r>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 if (ddl-&gt;ds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_gl_destroy_texture(ddl-&gt;gls, ddl-&g=
t;ds);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ddl-&gt;ds =3D new_surface;<br>
+=C2=A0 =C2=A0 if (ddl-&gt;ds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int width =3D surface_width(ddl-&gt;ds);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int height =3D surface_height(ddl-&gt;ds);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_gl_create_texture(ddl-&gt;gls, ddl-&gt=
;ds);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: lazy send dmabuf (there are unnecessa=
ry sent otherwise) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_scanout_texture(&amp;ddl-&gt;dcl, ddl-&gt=
;ds-&gt;texture, false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0width, height, 0, 0, width, height);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void dbus_gfx_switch(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct DisplaySurface *new_surface)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+=C2=A0 =C2=A0 GVariant *v_data =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 ddl-&gt;ds =3D new_surface;<br>
+=C2=A0 =C2=A0 if (!ddl-&gt;ds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* why not call disable instead? */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 v_data =3D g_variant_new_from_data(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_VARIANT_TYPE(&quot;ay&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_data(ddl-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_stride(ddl-&gt;ds) * surface_height(dd=
l-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TRUE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GDestroyNotify)pixman_image_unref,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pixman_image_ref(ddl-&gt;ds-&gt;image));<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_scanout(ddl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(ddl-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(ddl-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_stride(ddl-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_format(ddl-&gt;ds),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);<br>
+}<br>
+<br>
+static void dbus_mouse_set(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int x, int y, int on)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_mouse_set(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy, x, y, on, G_DBUS_CALL_FLAGS_NON=
E, -1, NULL, NULL, NULL);<br>
+}<br>
+<br>
+static void dbus_cursor_define(DisplayChangeListener *dcl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUCursor *c)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayLi=
stener, dcl);<br>
+=C2=A0 =C2=A0 GVariant *v_data =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 cursor_get(c);<br>
+=C2=A0 =C2=A0 v_data =3D g_variant_new_from_data(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_VARIANT_TYPE(&quot;ay&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;width * c-&gt;height * 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TRUE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GDestroyNotify)cursor_put,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c);<br>
+<br>
+=C2=A0 =C2=A0 qemu_dbus_display1_listener_call_cursor_define(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;proxy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;hot_x,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;hot_y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_CALL_FLAGS_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+}<br>
+<br>
+const DisplayChangeListenerOps dbus_gl_dcl_ops =3D {<br>
+=C2=A0 =C2=A0 .dpy_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;dbus-gl&quot;,<br>
+=C2=A0 =C2=A0 .dpy_gfx_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
l_gfx_update,<br>
+=C2=A0 =C2=A0 .dpy_gfx_switch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
l_gfx_switch,<br>
+=C2=A0 =C2=A0 .dpy_gfx_check_format=C2=A0 =C2=A0 =3D console_gl_check_form=
at,<br>
+=C2=A0 =C2=A0 .dpy_refresh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D dbus_gl_refresh,<br>
+=C2=A0 =C2=A0 .dpy_mouse_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
bus_mouse_set,<br>
+=C2=A0 =C2=A0 .dpy_cursor_define=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dbus_cursor=
_define,<br>
+<br>
+=C2=A0 =C2=A0 .dpy_gl_scanout_disable=C2=A0 =3D dbus_scanout_disable,<br>
+=C2=A0 =C2=A0 .dpy_gl_scanout_texture=C2=A0 =3D dbus_scanout_texture,<br>
+=C2=A0 =C2=A0 .dpy_gl_scanout_dmabuf=C2=A0 =C2=A0=3D dbus_scanout_dmabuf,<=
br>
+=C2=A0 =C2=A0 .dpy_gl_cursor_dmabuf=C2=A0 =C2=A0 =3D dbus_cursor_dmabuf,<b=
r>
+=C2=A0 =C2=A0 .dpy_gl_cursor_position=C2=A0 =3D dbus_cursor_position,<br>
+=C2=A0 =C2=A0 .dpy_gl_release_dmabuf=C2=A0 =C2=A0=3D dbus_release_dmabuf,<=
br>
+=C2=A0 =C2=A0 .dpy_gl_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
bus_scanout_update,<br>
+};<br>
+<br>
+const DisplayChangeListenerOps dbus_dcl_ops =3D {<br>
+=C2=A0 =C2=A0 .dpy_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;dbus&quot;,<br>
+=C2=A0 =C2=A0 .dpy_gfx_update=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
fx_update,<br>
+=C2=A0 =C2=A0 .dpy_gfx_switch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dbus_g=
fx_switch,<br>
+=C2=A0 =C2=A0 .dpy_refresh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D dbus_refresh,<br>
+=C2=A0 =C2=A0 .dpy_mouse_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
bus_mouse_set,<br>
+=C2=A0 =C2=A0 .dpy_cursor_define=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dbus_cursor=
_define,<br>
+};<br>
+<br>
+static void<br>
+dbus_display_listener_dispose(GObject *object)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);<=
br>
+<br>
+=C2=A0 =C2=A0 unregister_displaychangelistener(&amp;ddl-&gt;dcl);<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;ddl-&gt;conn);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;ddl-&gt;bus_name, g_free);<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;ddl-&gt;proxy);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;ddl-&gt;gls, qemu_gl_fini_shader);<br>
+<br>
+=C2=A0 =C2=A0 G_OBJECT_CLASS(dbus_display_listener_parent_class)-&gt;dispo=
se(object);<br>
+}<br>
+<br>
+static void<br>
+dbus_display_listener_constructed(GObject *object)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl =3D DBUS_DISPLAY_LISTENER(object);<=
br>
+<br>
+=C2=A0 =C2=A0 if (display_opengl) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;gls =3D qemu_gl_init_shader();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;dcl.ops =3D &amp;dbus_gl_dcl_ops;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;dcl.ops =3D &amp;dbus_dcl_ops;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 G_OBJECT_CLASS(dbus_display_listener_parent_class)-&gt;const=
ructed(object);<br>
+}<br>
+<br>
+static void<br>
+dbus_display_listener_class_init(DBusDisplayListenerClass *klass)<br>
+{<br>
+=C2=A0 =C2=A0 GObjectClass *object_class =3D G_OBJECT_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 object_class-&gt;dispose =3D dbus_display_listener_dispose;<=
br>
+=C2=A0 =C2=A0 object_class-&gt;constructed =3D dbus_display_listener_const=
ructed;<br>
+}<br>
+<br>
+static void<br>
+dbus_display_listener_init(DBusDisplayListener *ddl)<br>
+{<br>
+}<br>
+<br>
+const char *<br>
+dbus_display_listener_get_bus_name(DBusDisplayListener *ddl)<br>
+{<br>
+=C2=A0 =C2=A0 return ddl-&gt;bus_name;<br>
+}<br>
+<br>
+DBusDisplayConsole *<br>
+dbus_display_listener_get_console(DBusDisplayListener *ddl)<br>
+{<br>
+=C2=A0 =C2=A0 return ddl-&gt;console;<br>
+}<br>
+<br>
+DBusDisplayListener *<br>
+dbus_display_listener_new(const char *bus_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GDBusConnection *conn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DBusDisplayConsole *console)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplayListener *ddl;<br>
+=C2=A0 =C2=A0 QemuConsole *con;<br>
+=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 ddl =3D g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);<br>
+=C2=A0 =C2=A0 ddl-&gt;proxy =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_dbus_display1_listener_proxy_new_sync(con=
n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_S=
TART,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/org/qemu/Display1/Listene=
r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;err);<br>
+=C2=A0 =C2=A0 if (!ddl-&gt;proxy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Failed to setup proxy: %s&q=
uot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref(conn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref(ddl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ddl-&gt;bus_name =3D g_strdup(bus_name);<br>
+=C2=A0 =C2=A0 ddl-&gt;conn =3D conn;<br>
+=C2=A0 =C2=A0 ddl-&gt;console =3D console;<br>
+<br>
+=C2=A0 =C2=A0 con =3D qemu_console_lookup_by_index(dbus_display_console_ge=
t_index(console));<br>
+=C2=A0 =C2=A0 assert(con);<br>
+=C2=A0 =C2=A0 ddl-&gt;dcl.con =3D con;<br>
+=C2=A0 =C2=A0 register_displaychangelistener(&amp;ddl-&gt;dcl);<br>
+<br>
+=C2=A0 =C2=A0 return ddl;<br>
+}<br>
diff --git a/ui/dbus.c b/ui/dbus.c<br>
new file mode 100644<br>
index 0000000000..12da8ffe31<br>
--- /dev/null<br>
+++ b/ui/dbus.c<br>
@@ -0,0 +1,262 @@<br>
+/*<br>
+ * QEMU DBus display<br>
+ *<br>
+ * Copyright (c) 2021 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;=
<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/dbus.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
+#include &quot;qom/object_interfaces.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;ui/egl-helpers.h&quot;<br>
+#include &quot;ui/egl-context.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#include &quot;dbus.h&quot;<br>
+<br>
+static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QE=
MUGLParams *params)<br>
+{<br>
+=C2=A0 =C2=A0 eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURF=
ACE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_=
egl_rn_ctx);<br>
+=C2=A0 =C2=A0 return qemu_egl_create_context(dgc, params);<br>
+}<br>
+<br>
+static const DisplayGLCtxOps dbus_gl_ops =3D {<br>
+=C2=A0 =C2=A0 .compatible_dcl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;d=
bus_gl_dcl_ops,<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_create=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dbus_create=
_context,<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_destroy=C2=A0 =C2=A0 =C2=A0 =3D qemu_egl_destroy=
_context,<br>
+=C2=A0 =C2=A0 .dpy_gl_ctx_make_current =3D qemu_egl_make_context_current,<=
br>
+};<br>
+<br>
+static void<br>
+dbus_display_init(Object *o)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+=C2=A0 =C2=A0 g_autoptr(GDBusObjectSkeleton) vm =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 dd-&gt;glctx.ops =3D &amp;dbus_gl_ops;<br>
+=C2=A0 =C2=A0 dd-&gt;iface =3D qemu_dbus_display1_vm_skeleton_new();<br>
+=C2=A0 =C2=A0 dd-&gt;consoles =3D g_ptr_array_new_with_free_func(g_object_=
unref);<br>
+<br>
+=C2=A0 =C2=A0 dd-&gt;server =3D g_dbus_object_manager_server_new(DBUS_DISP=
LAY1_ROOT);<br>
+<br>
+=C2=A0 =C2=A0 vm =3D g_dbus_object_skeleton_new(DBUS_DISPLAY1_ROOT &quot;/=
VM&quot;);<br>
+=C2=A0 =C2=A0 g_dbus_object_skeleton_add_interface(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm, G_DBUS_INTERFACE_SKELETON(dd-&gt;iface));<=
br>
+=C2=A0 =C2=A0 g_dbus_object_manager_server_export(dd-&gt;server, vm);<br>
+}<br>
+<br>
+static void<br>
+dbus_display_finalize(Object *o)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;dd-&gt;server);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;dd-&gt;consoles, g_ptr_array_unref);<br=
>
+=C2=A0 =C2=A0 g_clear_object(&amp;dd-&gt;bus);<br>
+=C2=A0 =C2=A0 g_clear_object(&amp;dd-&gt;iface);<br>
+=C2=A0 =C2=A0 g_free(dd-&gt;dbus_addr);<br>
+}<br>
+<br>
+static bool<br>
+dbus_display_add_console(DBusDisplay *dd, int idx, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 QemuConsole *con;<br>
+=C2=A0 =C2=A0 DBusDisplayConsole *dbus_console;<br>
+<br>
+=C2=A0 =C2=A0 con =3D qemu_console_lookup_by_index(idx);<br>
+=C2=A0 =C2=A0 assert(con);<br>
+<br>
+=C2=A0 =C2=A0 if (qemu_console_is_graphic(con) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dd-&gt;gl_mode !=3D DISPLAYGL_MODE_OFF) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_console_set_display_gl_ctx(con, &amp;dd-&=
gt;glctx);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dbus_console =3D dbus_display_console_new(dd, con);<br>
+=C2=A0 =C2=A0 g_ptr_array_insert(dd-&gt;consoles, idx, dbus_console);<br>
+=C2=A0 =C2=A0 g_dbus_object_manager_server_export(dd-&gt;server,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_DBUS_O=
BJECT_SKELETON(dbus_console));<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static void<br>
+dbus_display_complete(UserCreatable *uc, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(uc);<br>
+=C2=A0 =C2=A0 g_autoptr(GError) err =3D NULL;<br>
+=C2=A0 =C2=A0 g_autofree char *uuid =3D qemu_uuid_unparse_strdup(&amp;qemu=
_uuid);<br>
+=C2=A0 =C2=A0 g_autoptr(GArray) consoles =3D NULL;<br>
+=C2=A0 =C2=A0 GVariant *console_ids;<br>
+=C2=A0 =C2=A0 int idx;<br>
+<br>
+=C2=A0 =C2=A0 if (!object_resolve_path_type(&quot;&quot;, TYPE_DBUS_DISPLA=
Y, NULL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;There is already an ins=
tance of %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_=
DBUS_DISPLAY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (dd-&gt;dbus_addr &amp;&amp; *dd-&gt;dbus_addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dd-&gt;bus =3D g_dbus_connection_new_for_addre=
ss_sync(dd-&gt;dbus_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, &amp;err);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dd-&gt;bus =3D g_bus_get_sync(G_BUS_TYPE_SESSI=
ON, NULL, &amp;err);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to connect to DB=
us: %s&quot;, err-&gt;message);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+<br>
+=C2=A0 =C2=A0 consoles =3D g_array_new(FALSE, FALSE, sizeof(guint32));<br>
+=C2=A0 =C2=A0 for (idx =3D 0;; idx++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qemu_console_lookup_by_index(idx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dbus_display_add_console(dd, idx, errp)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_append_val(consoles, idx);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 console_ids =3D g_variant_new_from_data(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_VARIANT_TYPE(&quot;au&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 consoles-&gt;data, consoles-&gt;len * sizeof(g=
uint32), TRUE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GDestroyNotify)g_array_unref, consoles);<br>
+=C2=A0 =C2=A0 g_steal_pointer(&amp;consoles);<br>
+=C2=A0 =C2=A0 g_object_set(dd-&gt;iface,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;name&q=
uot;, qemu_name ?: &quot;QEMU &quot; QEMU_VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uuid&q=
uot;, uuid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;consol=
e-ids&quot;, console_ids,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
+<br>
+=C2=A0 =C2=A0 g_dbus_object_manager_server_set_connection(dd-&gt;server, d=
d-&gt;bus);<br>
+=C2=A0 =C2=A0 g_bus_own_name_on_connection(dd-&gt;bus, &quot;org.qemu&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_BUS_NAME_OWNER_FLAGS_NONE,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, NULL, NULL);<br>
+}<br>
+<br>
+static char *<br>
+get_dbus_addr(Object *o, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+<br>
+=C2=A0 =C2=A0 return g_strdup(dd-&gt;dbus_addr);<br>
+}<br>
+<br>
+static void<br>
+set_dbus_addr(Object *o, const char *str, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+<br>
+=C2=A0 =C2=A0 g_free(dd-&gt;dbus_addr);<br>
+=C2=A0 =C2=A0 dd-&gt;dbus_addr =3D g_strdup(str);<br>
+}<br>
+<br>
+static int<br>
+get_gl_mode(Object *o, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+<br>
+=C2=A0 =C2=A0 return dd-&gt;gl_mode;<br>
+}<br>
+<br>
+static void<br>
+set_gl_mode(Object *o, int val, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DBusDisplay *dd =3D DBUS_DISPLAY(o);<br>
+<br>
+=C2=A0 =C2=A0 dd-&gt;gl_mode =3D val;<br>
+}<br>
+<br>
+static void<br>
+dbus_display_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 ucc-&gt;complete =3D dbus_display_complete;<br>
+=C2=A0 =C2=A0 object_class_property_add_str(oc, &quot;addr&quot;, get_dbus=
_addr, set_dbus_addr);<br>
+=C2=A0 =C2=A0 object_class_property_add_enum(oc, &quot;gl-mode&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;DisplayGLMode&quo=
t;, &amp;DisplayGLMode_lookup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_gl_mode, set_gl_mod=
e);<br>
+}<br>
+<br>
+static void<br>
+early_dbus_init(DisplayOptions *opts)<br>
+{<br>
+=C2=A0 =C2=A0 DisplayGLMode mode =3D opts-&gt;has_gl ? opts-&gt;gl : DISPL=
AYGL_MODE_OFF;<br>
+<br>
+=C2=A0 =C2=A0 if (mode !=3D DISPLAYGL_MODE_OFF) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (egl_rendernode_init(opts-&gt;u.dbus.render=
node, mode) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;dbus: render =
node init failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 display_opengl =3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void<br>
+dbus_init(DisplayState *ds, DisplayOptions *opts)<br>
+{<br>
+=C2=A0 =C2=A0 DisplayGLMode mode =3D opts-&gt;has_gl ? opts-&gt;gl : DISPL=
AYGL_MODE_OFF;<br>
+<br>
+=C2=A0 =C2=A0 object_new_with_props(TYPE_DBUS_DISPLAY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 object_get_objects_root(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;dbus-display&quot;, &amp;error_fatal,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;addr&quot;, opts-&gt;u.dbus.addr ?: &quot;&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;gl-mode&quot;, DisplayGLMode_str(mode),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NULL);<br>
+}<br>
+<br>
+static const TypeInfo dbus_display_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_DBUS_DISPLAY,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_OBJECT,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(DBusDisplay),<br>
+=C2=A0 =C2=A0 .instance_init =3D dbus_display_init,<br>
+=C2=A0 =C2=A0 .instance_finalize =3D dbus_display_finalize,<br>
+=C2=A0 =C2=A0 .class_init =3D dbus_display_class_init,<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_USER_CREATABLE },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static QemuDisplay qemu_display_dbus =3D {<br>
+=C2=A0 =C2=A0 .type=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DISPLAY_TYPE_DBUS,<br>
+=C2=A0 =C2=A0 .early_init =3D early_dbus_init,<br>
+=C2=A0 =C2=A0 .init=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dbus_init,<br>
+};<br>
+<br>
+static void register_dbus(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;dbus_display_info);<br>
+=C2=A0 =C2=A0 qemu_display_register(&amp;qemu_display_dbus);<br>
+}<br>
+<br>
+type_init(register_dbus);<br>
+<br>
+#ifdef CONFIG_OPENGL<br>
+module_dep(&quot;ui-opengl&quot;);<br>
+#endif<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index b064b0b46c..0a6abb311e 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -49,6 +49,8 @@ option(&#39;cfi_debug&#39;, type: &#39;boolean&#39;, valu=
e: &#39;false&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Verbose errors in case of CFI=
 violation&#39;)<br>
=C2=A0option(&#39;multiprocess&#39;, type: &#39;feature&#39;, value: &#39;a=
uto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Out of process device emulati=
on support&#39;)<br>
+option(&#39;dbus_display&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;-display dbus support&#39;)<b=
r>
<br>
=C2=A0option(&#39;attr&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;attr/xattr support&#39;)<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 5f375bbfa6..1a927458e6 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -1862,6 +1862,10 @@ DEF(&quot;display&quot;, HAS_ARG, QEMU_OPTION_displa=
y,<br>
=C2=A0#endif<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display egl-headless[,rendernode=3D&lt;file&gt;]=
\n&quot;<br>
+#endif<br>
+#if defined(CONFIG_DBUS_DISPLAY)<br>
+=C2=A0 =C2=A0 &quot;-display dbus[,addr=3D&lt;dbusaddr&gt;]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[,gl=
=3Don|core|es|off][,rendernode=3D&lt;file&gt;]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display none\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 select display backend type\n&quot;<br>
@@ -1889,6 +1893,17 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0application. The Spice server will redire=
ct the serial consoles<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and QEMU monitors. (Since 4.0)<br>
<br>
+=C2=A0 =C2=A0 ``dbus``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Export the display over D-Bus interfaces. (Sin=
ce 6.2)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The connection is registered with the &quot;or=
g.qemu&quot; name (and queued when<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 already owned).<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``addr=3D&lt;dbusaddr&gt;`` : D-Bus bus addres=
s to connect to.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``gl=3Don|off|core|es`` : Use OpenGL for rende=
ring (the D-interface will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 share framebuffers with DMABUF file descriptor=
s).<br>
+<br>
=C2=A0 =C2=A0 =C2=A0``sdl``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Display video output via SDL (usually in =
a separate graphics<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0window; see the SDL documentation for oth=
er possibilities).<br>
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml<br>
index e69de29bb2..0f0ae92e4d 100644<br>
--- a/ui/dbus-display1.xml<br>
+++ b/ui/dbus-display1.xml<br>
@@ -0,0 +1,378 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;utf-8&quot;?&gt;<br>
+&lt;node&gt;<br>
+=C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 org.qemu.Display1.VM:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This interface is implemented on ``/org/qemu/Display1=
/VM``.<br>
+=C2=A0 --&gt;<br>
+=C2=A0 &lt;interface name=3D&quot;org.qemu.Display1.VM&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Name:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The name of the VM.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Name&quot; type=3D&quot;s&quot; ac=
cess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UUID:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The UUID of the VM.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;UUID&quot; type=3D&quot;s&quot; ac=
cess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ConsoleIDs:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The list of consoles available on ``/org/qemu/=
Display1/Console_$id``.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;ConsoleIDs&quot; type=3D&quot;au&q=
uot; access=3D&quot;read&quot;/&gt;<br>
+=C2=A0 &lt;/interface&gt;<br>
+<br>
+=C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 org.qemu.Display1.Console:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This interface is implemented on ``/org/qemu/Display1=
/Console_$id``. You<br>
+=C2=A0 =C2=A0 =C2=A0 may discover available consoles through introspection=
 or with the<br>
+=C2=A0 =C2=A0 =C2=A0 :dbus:prop:`org.qemu.Display1.VM.ConsoleIDs` property=
.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 A console is attached to a video device head. It may =
be &quot;Graphic&quot; or<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;Text&quot; (see :dbus:prop:`Type` and other pro=
perties).<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 Interactions with a console may be done with<br>
+=C2=A0 =C2=A0 =C2=A0 :dbus:iface:`org.qemu.Display1.Keyboard` and<br>
+=C2=A0 =C2=A0 =C2=A0 :dbus:iface:`org.qemu.Display1.Mouse` interfaces when=
 available.<br>
+=C2=A0 --&gt;<br>
+=C2=A0 &lt;interface name=3D&quot;org.qemu.Display1.Console&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RegisterListener:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @listener: a Unix socket FD, for peer-to-peer =
D-Bus communication.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Register a console listener, which will receiv=
e display updates, until<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 it is disconnected.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Multiple listeners may be registered simultane=
ously.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The listener is expected to implement the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :dbus:iface:`org.qemu.Display1.Listener` inter=
face.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;RegisterListener&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;h&quot; name=3D&quot;listener&qu=
ot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SetUIInfo:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width_mm: the physical display width in milli=
meters.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height_mm: the physical display height in mil=
limeters.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @xoff: horizontal offset, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @yoff: vertical offset, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: console width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: console height, in pixels.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Modify the dimensions and display settings.<br=
>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;SetUIInfo&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;width_mm&quot; type=3D&quot;q&qu=
ot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;height_mm&quot; type=3D&quot;q&q=
uot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;xoff&quot; type=3D&quot;i&quot; =
direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;yoff&quot; type=3D&quot;i&quot; =
direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;width&quot; type=3D&quot;u&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg name=3D&quot;height&quot; type=3D&quot;u&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Label:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 A user-friendly name for the console (for ex: =
&quot;VGA&quot;).<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Label&quot; type=3D&quot;s&quot; a=
ccess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Head:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Graphical device head number.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Head&quot; type=3D&quot;u&quot; ac=
cess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Type:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Console type (&quot;Graphic&quot; or &quot;Tex=
t&quot;).<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Type&quot; type=3D&quot;s&quot; ac=
cess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Width:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Console width, in pixels.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Width&quot; type=3D&quot;u&quot; a=
ccess=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Height:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Console height, in pixels.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Height&quot; type=3D&quot;u&quot; =
access=3D&quot;read&quot;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceAddress:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The device address (ex: &quot;pci/0000/02.0&qu=
ot;).<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;DeviceAddress&quot; type=3D&quot;s=
&quot; access=3D&quot;read&quot;/&gt;<br>
+=C2=A0 &lt;/interface&gt;<br>
+<br>
+=C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 org.qemu.Display1.Keyboard:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This interface in implemented on ``/org/qemu/Display1=
/Console_$id`` (see<br>
+=C2=A0 =C2=A0 =C2=A0 :dbus:iface:`~org.qemu.Display1.Console`).<br>
+=C2=A0 --&gt;<br>
+=C2=A0 &lt;interface name=3D&quot;org.qemu.Display1.Keyboard&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Press:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @keycode: QEMU key number (xtkbd + special re-=
encoding of high bit)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Send a key press event.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Press&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;keycode&quo=
t; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Release:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @keycode: QEMU key number (xtkbd + special re-=
encoding of high bit)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Send a key release event.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Release&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;keycode&quo=
t; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Modifiers:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The active keyboard modifiers::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Scroll =3D 1 &lt;&lt; 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Num=C2=A0 =C2=A0 =3D 1 &lt;&lt; 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Caps=C2=A0 =C2=A0=3D 1 &lt;&lt; 2<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;Modifiers&quot; type=3D&quot;u&quo=
t; access=3D&quot;read&quot;/&gt;<br>
+=C2=A0 &lt;/interface&gt;<br>
+<br>
+=C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 org.qemu.Display1.Mouse:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This interface in implemented on ``/org/qemu/Display1=
/Console_$id`` (see<br>
+=C2=A0 =C2=A0 =C2=A0 :dbus:iface:`~org.qemu.Display1.Console` documentatio=
n).<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 .. _dbus-button-values:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 **Button values**::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Left=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Middle=C2=A0 =C2=A0 =C2=A0=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Right=C2=A0 =C2=A0 =C2=A0 =3D 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Wheel-up=C2=A0 =C2=A0=3D 3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Wheel-down =3D 4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Side=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Extra=C2=A0 =C2=A0 =C2=A0 =3D 6<br>
+=C2=A0 --&gt;<br>
+=C2=A0 &lt;interface name=3D&quot;org.qemu.Display1.Mouse&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Press:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @button: :ref:`button value&lt;dbus-button-val=
ues&gt;`.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Send a mouse button press event.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Press&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;button&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Release:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @button: :ref:`button value&lt;dbus-button-val=
ues&gt;`.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Send a mouse button release event.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Release&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;button&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SetAbsPosition:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @x: X position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @y: Y position, in pixels.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Set the mouse pointer position.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns an error if not :dbus:prop:`IsAbsolute=
`.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;SetAbsPosition&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;x&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;y&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RelMotion:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @dx: X-delta, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @dy: Y-delta, in pixels.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Move the mouse pointer position, relative to t=
he current position.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns an error if :dbus:prop:`IsAbsolute`.<b=
r>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;RelMotion&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;dx&quot; di=
rection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;dy&quot; di=
rection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IsAbsolute:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Whether the mouse is using absolute movements.=
<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;property name=3D&quot;IsAbsolute&quot; type=3D&quot;b&qu=
ot; access=3D&quot;read&quot;/&gt;<br>
+=C2=A0 &lt;/interface&gt;<br>
+<br>
+=C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 org.qemu.Display1.Listener:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This client-side interface must be available on<br>
+=C2=A0 =C2=A0 =C2=A0 ``/org/qemu/Display1/Listener`` when registering the =
peer-to-peer<br>
+=C2=A0 =C2=A0 =C2=A0 connection with :dbus:meth:`~org.qemu.Display1.Consol=
e.Register`.<br>
+=C2=A0 --&gt;<br>
+=C2=A0 &lt;interface name=3D&quot;org.qemu.Display1.Listener&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Scanout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: display width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: display height, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @stride: data stride, in bytes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @pixman_format: image format (ex: ``PIXMAN_X8R=
8G8B8``).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @data: image data.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Resize and update the display content.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The data to transfer for the display update ma=
y be large. The preferred<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 scanout method is :dbus:meth:`ScanoutDMABUF`, =
used whenever possible.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Scanout&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;width&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;height&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;stride&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;pixman_form=
at&quot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;ay&quot; name=3D&quot;data&quot;=
 direction=3D&quot;in&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;annotation name=3D&quot;org.gtk.GDBus.C.Fo=
rceGVariant&quot; value=3D&quot;true&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;/arg&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Update:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @x: X update position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @y: Y update position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: update width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: update height, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @stride: data stride, in bytes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @pixman_format: image format (ex: ``PIXMAN_X8R=
8G8B8``).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @data: display image data.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Update the display content.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This method is only called after a :dbus:meth:=
`Scanout` call.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Update&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;x&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;y&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;width&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;height&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;stride&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;pixman_form=
at&quot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;ay&quot; name=3D&quot;data&quot;=
 direction=3D&quot;in&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;annotation name=3D&quot;org.gtk.GDBus.C.Fo=
rceGVariant&quot; value=3D&quot;true&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;/arg&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ScanoutDMABUF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @dmabuf: the DMABUF file descriptor.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: display width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: display height, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @stride: stride, in bytes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @fourcc: DMABUF fourcc.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @modifier: DMABUF modifier.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @y0_top: whether Y position 0 is the top or no=
t.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Resize and update the display content with a D=
MABUF.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;ScanoutDMABUF&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;h&quot; name=3D&quot;dmabuf&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;width&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;height&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;stride&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;u&quot; name=3D&quot;fourcc&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;!-- xywh? --&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;t&quot; name=3D&quot;modifier&qu=
ot; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;b&quot; name=3D&quot;y0_top&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UpdateDMABUF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @x: the X update position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @y: the Y update position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: the update width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: the update height, in pixels.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Update the display content with the current DM=
ABUF and the given region.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;UpdateDMABUF&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;x&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;y&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;width&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;height&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Disable:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Disable the display (turn it off).<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;Disable&quot;&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MouseSet:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @x: X mouse position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @y: Y mouse position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @on: whether the mouse is visible or not.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Set the mouse position and visibility.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;MouseSet&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;x&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;y&quot; dir=
ection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;on&quot; di=
rection=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;!--<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CursorDefine:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @width: cursor width, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @height: cursor height, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @hot_x: hot-spot X position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @hot_y: hot-spot Y position, in pixels.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @data: the cursor data.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Set the mouse cursor shape and hot-spot. The &=
quot;data&quot; must be ARGB, 32-bit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 per pixel.<br>
+=C2=A0 =C2=A0 --&gt;<br>
+=C2=A0 =C2=A0 &lt;method name=3D&quot;CursorDefine&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;width&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;height&quot=
; direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;hot_x&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;i&quot; name=3D&quot;hot_y&quot;=
 direction=3D&quot;in&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;arg type=3D&quot;ay&quot; name=3D&quot;data&quot;=
 direction=3D&quot;in&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;annotation name=3D&quot;org.gtk.GDBus.C.Fo=
rceGVariant&quot; value=3D&quot;true&quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;/arg&gt;<br>
+=C2=A0 =C2=A0 &lt;/method&gt;<br>
+=C2=A0 &lt;/interface&gt;<br>
+&lt;/node&gt;<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index a9df5b911e..6270aa768b 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -65,6 +65,28 @@ if config_host.has_key(&#39;CONFIG_OPENGL&#39;) and gbm.=
found()<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;egl-headless&#39; : egl_headless_ss}<br>
=C2=A0endif<br>
<br>
+if dbus_display<br>
+=C2=A0 dbus_ss =3D ss.source_set()<br>
+=C2=A0 dbus_display1 =3D custom_target(&#39;dbus-display gdbus-codegen&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: [&#39;dbus-display1.h&#39;, =
&#39;dbus-display1.c&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: files(&#39;dbus-display1.xml&=
#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [config_host[&#39;GDBUS_COD=
EGEN&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;@INPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;--glib-min-required&#39;, &#39;2.64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;--output-directory&#39;, meson.current_build_dir(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;--interface-prefix&#39;, &#39;org.qemu.&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;--c-namespace&#39;, &#39;QemuDBus&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;--generate-c-code&#39;, &#39;@BASENAME@&#39;])<br>
+=C2=A0 dbus_ss.add(when: [gio, pixman, opengl, &#39;CONFIG_GIO&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_true: [files(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;dbus-console.=
c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;dbus-error.c&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;dbus-listener=
.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;dbus.c&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ), dbus_display1])<br>
+=C2=A0 ui_modules +=3D {&#39;dbus&#39; : dbus_ss}<br>
+endif<br>
+<br>
=C2=A0if gtk.found()<br>
=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#=
39;win32-kbd-hook.c&#39;))<br>
<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index e832c3e365..b1ae30159a 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -136,3 +136,14 @@ vdagent_peer_cap(const char *name) &quot;cap %s&quot;<=
br>
=C2=A0vdagent_cb_grab_selection(const char *name) &quot;selection %s&quot;<=
br>
=C2=A0vdagent_cb_grab_type(const char *name) &quot;type %s&quot;<br>
=C2=A0vdagent_cb_serial_discard(uint32_t current, uint32_t received) &quot;=
current=3D%u, received=3D%u&quot;<br>
+<br>
+# dbus.c<br>
+dbus_registered_listener(const char *bus_name) &quot;peer %s&quot;<br>
+dbus_listener_vanished(const char *bus_name) &quot;peer %s&quot;<br>
+dbus_kbd_press(unsigned int keycode) &quot;keycode %u&quot;<br>
+dbus_kbd_release(unsigned int keycode) &quot;keycode %u&quot;<br>
+dbus_mouse_press(unsigned int button) &quot;button %u&quot;<br>
+dbus_mouse_release(unsigned int button) &quot;button %u&quot;<br>
+dbus_mouse_set_pos(unsigned int x, unsigned int y) &quot;x=3D%u, y=3D%u&qu=
ot;<br>
+dbus_mouse_rel_motion(int dx, int dy) &quot;dx=3D%d, dy=3D%d&quot;<br>
+dbus_update(int x, int y, int w, int h) &quot;x=3D%d, y=3D%d, w=3D%d, h=3D=
%d&quot;<br>
-- <br>
2.33.0.721.g106298f7f9<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ad32e805ce382eb0--

