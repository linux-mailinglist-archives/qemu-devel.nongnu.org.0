Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF54CD4DE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:10:46 +0100 (CET)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7hk-000396-7c
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.b.czarnota@gmail.com>)
 id 1nQ7fm-0002R4-Nd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:08:43 -0500
Received: from [2607:f8b0:4864:20::830] (port=34722
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominik.b.czarnota@gmail.com>)
 id 1nQ7fj-0004v3-SY
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:08:42 -0500
Received: by mail-qt1-x830.google.com with SMTP id c4so7305096qtx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j6KzSo6HHExmqsJ0dThDDSheGhNogM4BaLb5C+kBPYE=;
 b=hW7m5hxlH4jPa3wOTzqrQWKIube3MITtMzvtpQIrHCEXm2pG+67hRN+Yp5Ou///MeV
 kGydEgC8OTaA9y10X8ndaWsBU54ThJPfonfAhEU2pEUTv8LbHrDsyuoFLb9j7cgYIxjR
 vQAR+UAnT3/dqx1gCg+RIGSxsCyrzzJDX2aCnkUM9PdHfRGaEnxzTR9O1iXBKJiyHm7f
 O2Ll3MMIZfH761nzzy2QWlLJedu6XTQFR02933KbA1orhHYswpKxxgF8djBwi6JYEoYl
 48bgyqzQkvt9HOGoKaG2UXUUArYTI3OulzZptGgFa+oWQfqgFGWYtCU2aFnmNl4vjxWd
 0wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j6KzSo6HHExmqsJ0dThDDSheGhNogM4BaLb5C+kBPYE=;
 b=joJ5kGehap8Fa2Baj1ZNeSFnNOn5FnH5G9klO4zBGIHwVhUBQ/RheyypVfvDXr5DZc
 6Mfkcg4gJloNWJuMw5bWNrVrkhPAGS0FKsDvCQPYV/VvIORDdoPd+5KHTO69Jrd/Qp+y
 rJAU5j034ChUgYurHLDUU1NYEAlHb+OkIXt2EYuqK2VTDOZJ3lfPRyWUbgvxhZ6nLS/r
 mYuynRoBL5d4HJAkRP19aPIYUSR3hdxSwTVjBJF+O+wISUyHLsz51bB+2TC8pqmT7e+S
 LN6s73WdiURda5IaAFCmkl+sNjNQX4kq57PKHhU7FecrNU11RmYz44K9SLOM1ZK8jzDf
 sHfA==
X-Gm-Message-State: AOAM5305iob6iZNEjTXmyK2Ie+P4PPwrtRp1vTGKqPMW5FispNkyV/N/
 k2KweaOiGyUFuBY/OVlGagry6Q5DUfaG5QCdz7ojdp1V
X-Google-Smtp-Source: ABdhPJwKge8I/tYYnM8eDuCrmxfbUXASMIQfhvEva7bPPcwI3eoRaT6r7kuXW5GSMj918GKJbJO7EdgXcVpIwdirNeI=
X-Received: by 2002:ac8:574f:0:b0:2dd:8aa5:b2c6 with SMTP id
 15-20020ac8574f000000b002dd8aa5b2c6mr31686431qtx.615.1646399317817; Fri, 04
 Mar 2022 05:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20220221030910.3203063-1-dominik.b.czarnota@gmail.com>
 <87ilsvi5a7.fsf@linaro.org>
In-Reply-To: <87ilsvi5a7.fsf@linaro.org>
From: Dominik Czarnota <dominik.b.czarnota@gmail.com>
Date: Fri, 4 Mar 2022 14:08:01 +0100
Message-ID: <CABEVAa3-JrLpNgYo0yhKPJ7h-P9u_x-K035MrjOJ=nO57HH8Zw@mail.gmail.com>
Subject: Re: [PATCH] gdbstub.c: add support for info proc mappings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dominik.b.czarnota@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

I may work on this next week but I will probably not make it until the 8th =
:(.

On Thu, 3 Mar 2022 at 13:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Disconnect3d <dominik.b.czarnota@gmail.com> writes:
>
> > This commit adds support for `info proc mappings` and a few other comma=
nds into
> > the QEMU user-mode emulation gdbstub.
> >
> > For that, support for the following GDB remote protocol commands has be=
en added:
> > * vFile:setfs: pid
> > * vFile:open: filename, flags, mode
> > * vFile:pread: fd, count, offset
> > * vFile:close: fd
> > * qXfer:exec-file:read:annex:offset,length
> >
> > Additionally, a `REMOTE_DEBUG_PRINT` macro has been added for printing =
remote debug logs.
> > To enable it, set the `ENABLE_REMOTE_DEBUG` definition to 1.
> >
> > All this can be tested with the following steps (commands from Ubuntu 2=
0.04):
> > 1. Compiling an example program, e.g. for ARM:
> >     echo 'int main() {puts("Hello world");}' | arm-linux-gnueabihf-gcc =
-xc -
> > 2. Running qemu-arm with gdbstub:
> >     qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./a.out
> > 3. Connecting to the gdbstub with GDB:
> >     gdb-multiarch -ex 'target remote localhost:1234'
> > 4. Executing `info proc mappings` in GDB.
>
> It would be useful to add this to the check-tcg tests we do (there are
> already other examples (see run-gdbstub-FOO tests in
> tests/tcg/multiarch/Makefile.target)).
>

Thanks, I will check it out.

> >
> > The opening of files is done on behalf of the inferior by reusing the d=
o_openat syscall.
> > Note that the current solution is still imperfect: while it allows us t=
o fetch procfs
> > files like /proc/$pid/maps in the same way as the inferior is seeing th=
em, there are
> > two downsides to it. First of all, it is indeed performed on behalf of =
the inferior.
> > Second of all, there are some files that the GDB tries to request like =
/lib/libc.so.6,
> > but they are usually not available as they do not exist in those paths =
and may need to
> > be served from the prefix provided in the -L flag to the qemu-user bina=
ry. I may try
> > to add a support for this in another patch and maybe refactor the solut=
ion to not use
> > the do_openat function directly.
> >
> > Before this commit, one would get (except of amd64, but not i386 target=
s):
> >
> > ```
> > (gdb) info proc mappings
> > process 1
> > warning: unable to open /proc file '/proc/1/maps'
> > ```
> >
> >
> > And after this commit, we should get something like:
> >
> > ```
> > (gdb) info proc mappings
> > process 3167519
> > Mapped address spaces:
> >
> >       Start Addr   End Addr       Size     Offset objfile
> >       0x3f7d0000 0x3f7d1000     0x1000        0x0
> >       0x3f7d1000 0x3f7ed000    0x1c000        0x0 /usr/arm-linux-gnueab=
ihf/lib/ld-2.33.so
> >       0x3f7ed000 0x3f7fd000    0x10000        0x0
> >       0x3f7fd000 0x3f7ff000     0x2000    0x1c000 /usr/arm-linux-gnueab=
ihf/lib/ld-2.33.so
> >       0x3f7ff000 0x3f800000     0x1000        0x0
> >       0x3f800000 0x40000000   0x800000        0x0 [stack]
> >       0x40000000 0x40001000     0x1000        0x0 /home/dc/src/qemu/a.o=
ut
> >       0x40001000 0x40010000     0xf000        0x0
> >       0x40010000 0x40012000     0x2000        0x0 /home/dc/src/qemu/a.o=
ut
> > ```
> >
> >
> > However, on amd64 targets we would get and still get the following on t=
he GDB side
> > (even after this commit):
> >
> > ```
> > (gdb) info proc mappings
> > Not supported on this target.
> > ```
> >
> > The x64 behavior is related to the fact that the GDB client does not in=
itialize
> > some of its remote handlers properly when the gdbstub does not send an =
"orig_rax"
> > register in the target.xml file that describes the target. This happens=
 in GDB in the
> > amd64_linux_init_abi function in the amd64-linux-tdep.c file [0]. The G=
DB tries to find
> > the "org.gnu.gdb.i386.linux" feature and the "orig_rax" register in it =
and if it is not
> > present, then it does not proceed with the `amd64_linux_init_abi_common=
 (info, gdbarch, 2);` call
> > which initializes whatever is needed so that GDB fetches `info proc map=
pings` properly.
> >
> > I tried to fix this but just adding the orig_rax registry into the targ=
et.xml did not work
> > (there was some mismatch between the expected and sent register values;=
 I guess the QEMU stub
> > would need to know how to send this register's value). On the other han=
d, this could also be
> > fixed on the GDB side. I will discuss this with GDB maintainers or/and =
propose a patch to GDB
> > related to this.
>
> Yeah there is debate about sticking to the "official" XML for certain
> arches vs just generating our own custom register XML which GDB doesn't
> deal with the special cases.
>
> >
> > [0] https://github.com/bminor/binutils-gdb/blob/dc5483c989f29fc9c793496=
5071ae1bb80cff902/gdb/amd64-linux-tdep.c#L1863-L1873
> >
> > Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmai=
l.com>
> > ---
> >  gdbstub.c            | 272 +++++++++++++++++++++++++++++++++++++++++++
> >  linux-user/qemu.h    |   2 +
> >  linux-user/syscall.c |   2 +-
> >  3 files changed, 275 insertions(+), 1 deletion(-)
> >
> > diff --git a/gdbstub.c b/gdbstub.c
> > index 3c14c6a038..69cf8bbb0c 100644
> > --- a/gdbstub.c
> > +++ b/gdbstub.c
> > @@ -34,6 +34,10 @@
> >  #include "exec/gdbstub.h"
> >  #ifdef CONFIG_USER_ONLY
> >  #include "qemu.h"
> > +#ifdef CONFIG_LINUX
> > +#include "linux-user/qemu.h"
> > +#include "linux-user/loader.h"
> > +#endif
> >  #else
> >  #include "monitor/monitor.h"
> >  #include "chardev/char.h"
> > @@ -62,6 +66,21 @@
> >  static int phy_memory_mode;
> >  #endif
> >
> > +/*
> > + *  Set to 1 to enable remote protocol debugging output. This output i=
s similar
> > + *  to the one produced by the gdbserver's --remote-debug flag with so=
me
> > + *  additions. Anyway, the main debug prints are:
> > + * - getpkt ("...") which refers to received data (or, send by the GDB=
 client)
> > + * - putpkt ("...") which refers to sent data
> > + */
> > +#define ENABLE_REMOTE_DEBUG 0
> > +
> > +#if ENABLE_REMOTE_DEBUG
> > +#define REMOTE_DEBUG_PRINT printf
> > +#else
> > +#define REMOTE_DEBUG_PRINT(...)
> > +#endif
>
> We don't need this. The rest of the gdbstub has been instrumented with
> tracepoints (try -d trace:gdbstub\* in your command line). See trace-even=
ts.
>

It would be convenient to support the gddbserver's --remote-debug flag
but I understand it may not be wanted as it also means additional &
unnecessary code in a production binary.
I will remove this.

> > +
> >  static inline int target_memory_rw_debug(CPUState *cpu, target_ulong a=
ddr,
> >                                           uint8_t *buf, int len, bool i=
s_write)
> >  {
> > @@ -554,6 +573,7 @@ static int gdb_continue_partial(char *newstates)
> >
> >  static void put_buffer(const uint8_t *buf, int len)
> >  {
> > +    REMOTE_DEBUG_PRINT("putpkt (\"%.*s\");\n", len, buf);
> >  #ifdef CONFIG_USER_ONLY
> >      int ret;
> >
> > @@ -1982,6 +2002,157 @@ static void handle_v_kill(GArray *params, void =
*user_ctx)
> >      exit(0);
> >  }
> >
> > +#ifdef CONFIG_USER_ONLY
> > +/*
> > + * Handles the `vFile:setfs: pid` command
> > + *
> > + * Example call: vFile:setfs:0
> > + *
> > + * --- From the GDB remote protocol documentation ---
> > + * Select the filesystem on which vFile operations with filename argum=
ents
> > + * will operate. This is required for GDB to be able to access files o=
n
> > + * remote targets where the remote stub does not share a common filesy=
stem with
> > + * the inferior(s). If pid is nonzero, select the filesystem as seen b=
y process
> > + * pid. If pid is zero, select the filesystem as seen by the remote st=
ub.
> > + * Return 0 on success, or -1 if an error occurs. If vFile:setfs: indi=
cates
> > + * success, the selected filesystem remains selected until the next su=
ccessful
> > + * vFile:setfs: operation.
> > +*/
> > +static void handle_v_setfs(GArray *params, void *user_ctx)
> > +{
> > +    /*
> > +     * We do not support different filesystem view for different pids
> > +     * Return that all is OK, so that GDB can proceed
> > +     */
> > +    put_packet("F0");
> > +}
> > +
> > +/*
> > + * Handle the `vFile:open: filename, flags, mode` command
> > + *
> > + * We try to serve the filesystem here from the inferior point of view
> > +
> > + * Example call: vFile:open:6a7573742070726f62696e67,0,1c0
> > + * (tries to open "just probing" with flags=3D0 mode=3D448)
> > + *
> > + * --- From the GDB remote protocol documentation ---
> > + * Open a file at filename and return a file descriptor for it, or ret=
urn
> > + * -1 if an error occurs. The filename is a string, flags is an intege=
r
> > + * indicating a mask of open flags (see Open Flags), and mode is an in=
teger
> > + * indicating a mask of mode bits to use if the file is created
> > + * (see mode_t Values). See open, for details of the open flags and mo=
de
> > + * values.
> > + */
> > +static void handle_v_file_open(GArray *params, void *user_ctx)
> > +{
> > +    uint64_t flags =3D get_param(params, 1)->val_ull;
> > +    uint64_t mode =3D get_param(params, 2)->val_ull;
> > +    const char *hex_filename =3D get_param(params, 0)->data;
> > +
> > +    /* Decode the filename & append a null byte so we can use it later=
 on */
> > +    hextomem(gdbserver_state.mem_buf, hex_filename, strlen(hex_filenam=
e));
> > +    const char *null_byte =3D "\0";
> > +    g_byte_array_append(gdbserver_state.mem_buf, (const guint8 *)null_=
byte, 1);
> > +
> > +    const char *filename =3D (const char *)gdbserver_state.mem_buf->da=
ta;
> > +
> > +    REMOTE_DEBUG_PRINT("vFile:open: filename=3D\"%s\" flags=3D%ld mode=
=3D%ld\n",
> > +                       filename, flags, mode);
> > +
> > +    /*
> > +     * On Linux we call the do_openat syscall on behalf of the inferio=
r as it
> > +     * handles special filepaths properly like the /proc/$pid files, w=
hich are
> > +     * fetched by GDB for certain info (such as `info proc mappings`).
> > +     */
>
> This sounds like a massive security hole to introduce without a
> specific flag the user can explicitly enable. Semihosting has a similar
> facility but also needs explicit configuration. Can we add a property to
> the -gdb command line option to enable this:
>
>   -gdb tcp::1234,hostio=3Don
>
> ?

It is, but should we really care? Both the execution and debugging of
qemu-user emulation
does not protect the host from arbitrary code execution and the
proposed hostio=3Don flag will
only make things less convenient and many people will just not use it
due to not knowing that
it exists.

The program below shows an example that the qemu-user emulation
doesn't protect the host at all:
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define QEMU_BIN_PATH "/usr/bin/qemu-x86_64"

char* find_qemu_map(FILE* fp) {
    ssize_t read =3D 0;
    size_t len =3D 0;
    char* line =3D NULL;
    while ((read =3D getline(&line, &len, fp)) !=3D -1) {
        printf("[maps] read line (%lu) =3D %s\n", len, line);
        if (strstr(line, QEMU_BIN_PATH) !=3D NULL) {
            return line;
        }
    }
    return NULL;
}

#define ENSURE(cond) if (!(cond)) { printf("%d: !" #cond "\n",
__LINE__); exit(1); }

int main() {
    char cat_maps[128] =3D {0};
    sprintf(cat_maps, "/bin/cat /proc/%d/maps", getpid());
    printf("Will read maps from %s\n", cat_maps);
    FILE* fp =3D popen(cat_maps, "r");
    ENSURE(fp);

    char* line =3D find_qemu_map(fp);
    ENSURE(line);

/* Examples:
555555554000-555555701000 r-xp 00000000 fc:01 667422
  /usr/bin/qemu-x86_64
555555901000-555555934000 r--p 001ad000 fc:01 667422
  /usr/bin/qemu-x86_64
555555934000-555555940000 rw-p 001e0000 fc:01 667422
  /usr/bin/qemu-x86_64
*/
    void* qemu_base;
    sscanf(line, "%llx-", (unsigned long long*)&qemu_base);
    printf("qemu base =3D %p\n", qemu_base);
    free(line); // getline allocates line in find_qemu_map
    fclose(fp);
}
```

If you run it, you will see that the debugged process can access the
original maps of the qemu
(and not debugged) process by spawning a cat process that will be
executed out of the emulation.

In a similar way, the emulated process can then write to
/proc/$pid/mem to overwrite the QEMU's
process executable memory to execute arbitrary code (outside of
emulated context).
Actually, for this the emulated process does not even need to use
popen as I believe the current
do_openat implementation does not fake the /proc/$pid/mem file at all.

Of course the same could be done in GDB, as the GDB client could
invoke commands to overwrite the
emulated process code to trigger the same actions as described above.

To sum up, a security hole already exists in the QEMU user emulation
which is that the emulated
process can spawn any other processes and that not all of the /proc/
paths are emulated. Given this
I am not sure if it is worth introducing a new flag just because we
want to add a feature that may likely be
expected to work as-is by GDB<->QEMU users.

On the other hand it's generally bad that GDB fetches memory maps
information by requesting a file from
the gdbstub and then parsing it. It would be great to have a command
that returns only this data and also
in a format that could be deserialized 'as-is' to the native GDB
structures (but then, different architectures,
endianess etc would be problematic).

>
>
> > +#ifdef CONFIG_LINUX
> > +    int fd =3D do_openat(gdbserver_state.g_cpu->env_ptr,
> > +                       /* dirfd */ 0, filename, flags, mode);
>
>
>
> > +    REMOTE_DEBUG_PRINT("do_openat =3D %d\n", fd);
> > +#else
> > +    int fd =3D open(filename, flags, mode);
> > +    REMOTE_DEBUG_PRINT("open =3D %d\n", fd);
> > +#endif
> > +
> > +    g_string_printf(gdbserver_state.str_buf, "F%d", fd);
> > +    if (fd < 0) {
> > +        /* Append ENOENT result.
> > +         * TODO/FIXME: Can we retrieve errno from do_openat/open and r=
eturn it here?
> > +         */
> > +        g_string_append(gdbserver_state.str_buf, ",2");
> > +    }
> > +    put_strbuf();
> > +}
> > +
> > +/*
> > + * Handles the `vFile:pread: fd, count, offset` command
> > + *
> > + * Example call: vFile:pread:7,47ff,0
> > + *
> > + * --- From the GDB remote protocol documentation ---
> > + * Read data from the open file corresponding to fd.
> > + * Up to count bytes will be read from the file, starting at offset re=
lative to
> > + * the start of the file. The target may read fewer bytes; common reas=
ons
> > + * include packet size limits and an end-of-file condition. The number=
 of bytes
> > + * read is returned. Zero should only be returned for a successful rea=
d at the
> > + * end of the file, or if count was zero.
> > + *
> > + * The data read should be returned as a binary attachment on success.=
 If zero
> > + * bytes were read, the response should include an empty binary attach=
ment
> > + * (i.e. a trailing semicolon). The return value is the number of targ=
et bytes
> > + * read; the binary attachment may be longer if some characters were e=
scaped.
> > + */
> > +static void handle_v_file_pread(GArray *params, void *user_ctx)
> > +{
> > +    int fd =3D get_param(params, 0)->val_ul;
> > +    uint64_t count =3D get_param(params, 1)->val_ull;
> > +    uint64_t offset =3D get_param(params, 2)->val_ull;
> > +
> > +    g_autoptr(GString) file_content =3D g_string_new(NULL);
> > +
> > +    REMOTE_DEBUG_PRINT("vFile:read: fd=3D%d, count=3D%lu, offset=3D%lu=
\n",
> > +                       fd, count, offset);
> > +
> > +    while (count > 0) {
> > +        char buf[1024] =3D {0};
> > +        ssize_t n =3D pread(fd, buf, sizeof(buf), offset);
>
> I think for this size of buffer I'd rather allocate it on the heap.
>

+1

> > +        if (n <=3D 0) {
> > +            break;
> > +        }
> > +        g_string_append_len(file_content, buf, n);
> > +        count -=3D n;
> > +        offset +=3D n;
> > +    }
> > +    g_string_printf(gdbserver_state.str_buf, "F%lx;", file_content->le=
n);
> > +    /* Encode special chars */
> > +    memtox(gdbserver_state.str_buf, file_content->str, file_content->l=
en);
> > +    put_packet_binary(gdbserver_state.str_buf->str,
> > +                      gdbserver_state.str_buf->len, true);
> > +}
> > +
> > +/*
> > + * Handles the `vFile:close: fd` command
> > + *
> > + * Example call: vFile:close:7
> > + *
> > + * --- From the GDB remote protocol documentation ---
> > + * Close the open file corresponding to fd and return 0, or -1 if an e=
rror occurs.
> > + */
> > +static void handle_v_file_close(GArray *params, void *user_ctx)
> > +{
> > +    int fd =3D get_param(params, 0)->val_ul;
> > +    int res =3D close(fd);
> > +    if (res =3D=3D 0) {
> > +        put_packet("F00");
> > +    } else {
> > +        /* This may happen only with a bugged GDB client or a bugged i=
nferior */
> > +        REMOTE_DEBUG_PRINT("Warning: the vFile:close(fd=3D%d) operatio=
n returned %d\n",
> > +                           fd, res);
>
> If you really wanted this could be qemu_log_mask(LOG_GUEST_ERROR, ...)
>

+1

> > +        g_string_printf(gdbserver_state.str_buf, "F%d,%d", res, errno)=
;
> > +        put_strbuf();
> > +    }
> > +}
> > +#endif /* CONFIG_USER_ONLY */
> > +
> >  static const GdbCmdParseEntry gdb_v_commands_table[] =3D {
> >      /* Order is important if has same prefix */
> >      {
> > @@ -2001,6 +2172,32 @@ static const GdbCmdParseEntry gdb_v_commands_tab=
le[] =3D {
> >          .cmd_startswith =3D 1,
> >          .schema =3D "l0"
> >      },
> > +    #ifdef CONFIG_USER_ONLY
> > +    {
> > +        .handler =3D handle_v_setfs,
> > +        .cmd =3D "File:setfs:",
> > +        .cmd_startswith =3D 1,
> > +        .schema =3D "l0"
> > +    },
> > +    {
> > +        .handler =3D handle_v_file_open,
> > +        .cmd =3D "File:open:",
> > +        .cmd_startswith =3D 1,
> > +        .schema =3D "s,L,L0"
> > +    },
> > +    {
> > +        .handler =3D handle_v_file_pread,
> > +        .cmd =3D "File:pread:",
> > +        .cmd_startswith =3D 1,
> > +        .schema =3D "l,L,L0"
> > +    },
> > +    {
> > +        .handler =3D handle_v_file_close,
> > +        .cmd =3D "File:close:",
> > +        .cmd_startswith =3D 1,
> > +        .schema =3D "l0"
> > +    },
> > +    #endif
> >      {
> >          .handler =3D handle_v_kill,
> >          .cmd =3D "Kill;",
> > @@ -2197,6 +2394,8 @@ static void handle_query_supported(GArray *params=
, void *user_ctx)
> >      if (gdbserver_state.c_cpu->opaque) {
> >          g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
> >      }
> > +
> > +    g_string_append(gdbserver_state.str_buf, ";qXfer:exec-file:read+")=
;
> >  #endif
> >
> >      if (params->len &&
> > @@ -2305,6 +2504,63 @@ static void handle_query_xfer_auxv(GArray *param=
s, void *user_ctx)
> >      put_packet_binary(gdbserver_state.str_buf->str,
> >                        gdbserver_state.str_buf->len, true);
> >  }
> > +
> > +/*
> > + * Handle the `qXfer:exec-file:read:annex:offset,length` command
> > + *
> > + * Example call: qXfer:exec-file:read:241022:0,ffb
> > + *
> > + * --- From the GDB remote protocol documentation ---
> > + * Return the full absolute name of the file that was executed to crea=
te a process
> > + * running on the remote system. The annex specifies the numeric proce=
ss ID of the
> > + * process to query, encoded as a hexadecimal number. If the annex par=
t is empty the
> > + * remote stub should return the filename corresponding to the current=
ly executing
> > + * process.
> > + *
> > + * This packet is not probed by default; the remote stub must request =
it, by supplying
> > + * an appropriate =E2=80=98qSupported=E2=80=99 response (see qSupporte=
d).
> > + */
> > +static void handle_query_xfer_exec_file(GArray *params, void *user_ctx=
)
> > +{
> > +    uint32_t pid =3D get_param(params, 0)->val_ul;
> > +    uint32_t offset =3D get_param(params, 1)->val_ul;
> > +    uint32_t length =3D get_param(params, 2)->val_ul;
> > +
> > +    GDBProcess *process =3D gdb_get_process(pid);
> > +    if (!process) {
> > +        put_packet("E01");
> > +        return;
> > +    }
> > +
> > +    CPUState *cpu =3D get_first_cpu_in_process(process);
> > +    if (!cpu) {
> > +        put_packet("E02");
> > +        return;
> > +    }
> > +
> > +    TaskState *ts =3D cpu->opaque;
> > +    /* Those should be there but lets sanity check them */
> > +    if (!ts || !ts->bprm || !ts->bprm->filename) {
> > +        put_packet("E03");
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * This filename is an absolute path even when QEMU user-mode emul=
ation is called
> > +     * with a symlink path so we do not have to resolve it with readli=
nk(2)
> > +     */
> > +    const char *filename =3D ts->bprm->filename;
> > +
> > +    /* It does not make sense to return anything after the filename */
> > +    if (offset > strlen(filename)) {
> > +        put_packet("E04");
> > +        return;
> > +    }
> > +
> > +    g_string_printf(gdbserver_state.str_buf, "l%.*s", length, filename=
 + offset);
> > +    put_strbuf();
> > +    return;
> > +}
> >  #endif
> >
> >  static void handle_query_attached(GArray *params, void *user_ctx)
> > @@ -2419,6 +2675,12 @@ static const GdbCmdParseEntry gdb_gen_query_tabl=
e[] =3D {
> >          .cmd_startswith =3D 1,
> >          .schema =3D "l,l0"
> >      },
> > +    {
> > +        .handler =3D handle_query_xfer_exec_file,
> > +        .cmd =3D "Xfer:exec-file:read:",
> > +        .cmd_startswith =3D 1,
> > +        .schema =3D "l:l,l0"
> > +    },
> >  #endif
> >      {
> >          .handler =3D handle_query_attached,
> > @@ -2516,6 +2778,7 @@ static int gdb_handle_packet(const char *line_buf=
)
> >      const GdbCmdParseEntry *cmd_parser =3D NULL;
> >
> >      trace_gdbstub_io_command(line_buf);
> > +    REMOTE_DEBUG_PRINT("getpkt (\"%s\");\n", line_buf);
> >
> >      switch (line_buf[0]) {
> >      case '!':
> > @@ -3133,6 +3396,15 @@ static void create_default_process(GDBState *s)
> >      GDBProcess *process;
> >      int max_pid =3D 0;
> >
> > +#if defined(CONFIG_USER_ONLY)
> > +    /*
> > +     * In QEMU user-mode emulation we want to return the real PID of t=
he proces
> > +     * as this allows us to return proper view of /proc/$pid files as =
seen by
> > +     * the inferior
> > +     */
> > +    max_pid =3D getpid() - 1;
> > +#endif
> > +
> >      if (gdbserver_state.process_num) {
> >          max_pid =3D s->processes[s->process_num - 1].pid;
> >      }
> > diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> > index 98dfbf2096..44a71b9740 100644
> > --- a/linux-user/qemu.h
> > +++ b/linux-user/qemu.h
> > @@ -182,6 +182,8 @@ static inline bool access_ok(CPUState *cpu, int typ=
e,
> >      return access_ok_untagged(type, cpu_untagged_addr(cpu, addr), size=
);
> >  }
> >
> > +int do_openat(void *cpu_env, int dirfd, const char *pathname, int flag=
s, mode_t mode);
> > +
> >  /* NOTE __get_user and __put_user use host pointers and don't check ac=
cess.
> >     These are usually used to access struct data members once the struc=
t has
> >     been locked - usually with lock_user_struct.  */
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index b9b18a7eaf..bfc271b568 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8233,7 +8233,7 @@ static int open_hardware(void *cpu_env, int fd)
> >  }
> >  #endif
> >
> > -static int do_openat(void *cpu_env, int dirfd, const char *pathname, i=
nt flags, mode_t mode)
> > +int do_openat(void *cpu_env, int dirfd, const char *pathname, int
> > flags, mode_t mode)
>
>
> I wonder if this should be renamed to make the sense more clear?
>
> do_guest_openat? do_filtered_openat?
>

We can do, but its already in linux-user/syscall.c and I believe all
syscalls there are executed
"on behalf of guest".

> >  {
> >      struct fake_open {
> >          const char *filename;
>
> Otherwise it looks fine. Do you have time to re-spin? I would need to
> post a pull request with it by the 8th to make 7.0.
>
> --
> Alex Benn=C3=A9e

Thanks,
Dominik 'disconnect3d' Czarnota

