Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC748A21BB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 19:04:43 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Nqk-0006RK-Fc
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 13:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i3Nhc-0006MD-9r
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:55:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i3NhY-0001Ys-LN
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:55:16 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i3NhY-0001Xg-9R
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:55:12 -0400
Received: by mail-wm1-x341.google.com with SMTP id k2so3028895wmj.4
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=lV7ny6VdRwZaSQE/CcoR9i+FdWjSPuo2nCcBovdFcEI=;
 b=NI70RfSXR5Kypfe+DWZDSlBVzpc2p3VaI56/Nq4SWBImgz/ubcW0ItuWHEYW6WX9A9
 6r8pNpriVpdCO37X8Yu9a5PmiokR9fW9vk5Wqa78ncYoBJ2RaJy8WlCbNB466A6uIcOJ
 BGVTRpWDaDsHGwHLmQ8jttz4MA0GMVQ8jFtyXD5oSrxUijwBxFOdE5zY/YJ312Bs1RfZ
 M3DlePAO9umPX/m5ldYnZAvm2CsoxUOXRTICd31HK2xGGy9mz/yeRUQesSYEUTImP9mX
 GnahSwZtBOPAZ2WISf9wiT4gyQ84IIDg6/eHwqwLqb8MFJD/Ja0cGjnHpHU49jce4KVl
 IGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=lV7ny6VdRwZaSQE/CcoR9i+FdWjSPuo2nCcBovdFcEI=;
 b=RqD+iFgnridk/mpjGSm6t9a5fF8G8N9eUZKw1KBDo3P3vaZhnSkdkkh/Xp2iAnO0jv
 vIjkr0pT5eDAjbG+Ib9iDcQVF6wE1PRjH77AcrOYwtSLiupnQOdWrEHx8d8Ytpeg8O3d
 nyrv+B4RHTRat6zMFDFEh0HLAG9WocVSUda2E54lha4yrteLlex5eU6+ar7OKUmQDbEr
 dC5HgAjNBKqHnXGin3PnVHDuntU4Ob6nOR6ArqjUnSpVjcHTnkqwP5D4EMLoNBotBFe7
 aoKr7Cyc6UaNSRG8HHtAN+UR9qMP7ZF1wuvkqu0XEFCW6wPic3RIa0s5haXkFvSWQdlR
 Ia5A==
X-Gm-Message-State: APjAAAUZXZwr0+u14bpjF0k8PwThjMBU6r14yYBTitcL+gVlSMFbLXOZ
 fyzKAMMq99Thm1Lof5OFDsjTWQ==
X-Google-Smtp-Source: APXvYqyf7nWV4WtCPBS8jaVvC6atnOuRUfZr/53Guk3ZjNiKYVD5M6S/mObWpaFRLxFc2v/B0lxQzA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr12519867wmi.170.1567097710765; 
 Thu, 29 Aug 2019 09:55:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm479823wro.32.2019.08.29.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:55:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC5201FF87;
 Thu, 29 Aug 2019 17:55:09 +0100 (BST)
References: <20190829160710.8792-1-berrange@redhat.com>
 <20190829160710.8792-3-berrange@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
In-reply-to: <20190829160710.8792-3-berrange@redhat.com>
Date: Thu, 29 Aug 2019 17:55:09 +0100
Message-ID: <87y2zb52tu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2 2/4] docs: merge HACKING.rst contents
 into CODING_STYLE.rst
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The split of information between the two docs is rather arbitary and
> unclear. It is simpler for contributors if all the information is in
> one file.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  CODING_STYLE.rst | 296 ++++++++++++++++++++++++++++++++++++++++++++++
>  HACKING.rst      | 300 -----------------------------------------------
>  README.rst       |   2 +-
>  3 files changed, 297 insertions(+), 301 deletions(-)
>  delete mode 100644 HACKING.rst
>
> diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
> index 713357cb80..4501d87352 100644
> --- a/CODING_STYLE.rst
> +++ b/CODING_STYLE.rst
> @@ -205,6 +205,302 @@ comment anyway.)
>  Rationale: Consistency, and ease of visually picking out a multiline
>  comment from the surrounding code.
>
> +Preprocessor
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Variadic macros
> +---------------
> +
> +For variadic macros, stick with this C99-like syntax:
> +
> +.. code-block:: c
> +
> +    #define DPRINTF(fmt, ...)                                       \
> +        do { printf("IRQ: " fmt, ## __VA_ARGS__); } while (0)
> +
> +Include directives
> +------------------
> +
> +Order include directives as follows:
> +
> +.. code-block:: c
> +
> +    #include "qemu/osdep.h"  /* Always first... */
> +    #include <...>           /* then system headers... */
> +    #include "..."           /* and finally QEMU headers. */
> +
> +The "qemu/osdep.h" header contains preprocessor macros that affect the b=
ehavior
> +of core system headers like <stdint.h>.  It must be the first include so=
 that
> +core system headers included by external libraries get the preprocessor =
macros
> +that QEMU depends on.
> +
> +Do not include "qemu/osdep.h" from header files since the .c file will h=
ave
> +already included it.
> +
> +C types
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +It should be common sense to use the right type, but we have collected
> +a few useful guidelines here.
> +
> +Scalars
> +-------
> +
> +If you're using "int" or "long", odds are good that there's a better typ=
e.
> +If a variable is counting something, it should be declared with an
> +unsigned type.
> +
> +If it's host memory-size related, size_t should be a good choice (use
> +ssize_t only if required). Guest RAM memory offsets must use ram_addr_t,
> +but only for RAM, it may not cover whole guest address space.
> +
> +If it's file-size related, use off_t.
> +If it's file-offset related (i.e., signed), use off_t.
> +If it's just counting small numbers use "unsigned int";
> +(on all but oddball embedded systems, you can assume that that
> +type is at least four bytes wide).
> +
> +In the event that you require a specific width, use a standard type
> +like int32_t, uint32_t, uint64_t, etc.  The specific types are
> +mandatory for VMState fields.
> +
> +Don't use Linux kernel internal types like u32, __u32 or __le32.
> +
> +Use hwaddr for guest physical addresses except pcibus_t
> +for PCI addresses.  In addition, ram_addr_t is a QEMU internal address
> +space that maps guest RAM physical addresses into an intermediate
> +address space that can map to host virtual address spaces.  Generally
> +speaking, the size of guest memory can always fit into ram_addr_t but
> +it would not be correct to store an actual guest physical address in a
> +ram_addr_t.
> +
> +For CPU virtual addresses there are several possible types.
> +vaddr is the best type to use to hold a CPU virtual address in
> +target-independent code. It is guaranteed to be large enough to hold a
> +virtual address for any target, and it does not change size from target
> +to target. It is always unsigned.
> +target_ulong is a type the size of a virtual address on the CPU; this me=
ans
> +it may be 32 or 64 bits depending on which target is being built. It sho=
uld
> +therefore be used only in target-specific code, and in some
> +performance-critical built-per-target core code such as the TLB code.
> +There is also a signed version, target_long.
> +abi_ulong is for the ``*``-user targets, and represents a type the size =
of
> +'void ``*``' in that target's ABI. (This may not be the same as the size=
 of a
> +full CPU virtual address in the case of target ABIs which use 32 bit poi=
nters
> +on 64 bit CPUs, like sparc32plus.) Definitions of structures that must m=
atch
> +the target's ABI must use this type for anything that on the target is d=
efined
> +to be an 'unsigned long' or a pointer type.
> +There is also a signed version, abi_long.
> +
> +Of course, take all of the above with a grain of salt.  If you're about
> +to use some system interface that requires a type like size_t, pid_t or
> +off_t, use matching types for any corresponding variables.
> +
> +Also, if you try to use e.g., "unsigned int" as a type, and that
> +conflicts with the signedness of a related variable, sometimes
> +it's best just to use the *wrong* type, if "pulling the thread"
> +and fixing all related variables would be too invasive.
> +
> +Finally, while using descriptive types is important, be careful not to
> +go overboard.  If whatever you're doing causes warnings, or requires
> +casts, then reconsider or ask for help.
> +
> +Pointers
> +--------
> +
> +Ensure that all of your pointers are "const-correct".
> +Unless a pointer is used to modify the pointed-to storage,
> +give it the "const" attribute.  That way, the reader knows
> +up-front that this is a read-only pointer.  Perhaps more
> +importantly, if we're diligent about this, when you see a non-const
> +pointer, you're guaranteed that it is used to modify the storage
> +it points to, or it is aliased to another pointer that is.
> +
> +Typedefs
> +--------
> +
> +Typedefs are used to eliminate the redundant 'struct' keyword, since type
> +names have a different style than other identifiers ("CamelCase" versus
> +"snake_case").  Each named struct type should have a CamelCase name and a
> +corresponding typedef.
> +
> +Since certain C compilers choke on duplicated typedefs, you should avoid
> +them and declare a typedef only in one header file.  For common types,
> +you can use "include/qemu/typedefs.h" for example.  However, as a matter
> +of convenience it is also perfectly fine to use forward struct
> +definitions instead of typedefs in headers and function prototypes; this
> +avoids problems with duplicated typedefs and reduces the need to include
> +headers from other headers.
> +
> +Reserved namespaces in C and POSIX
> +----------------------------------
> +
> +Underscore capital, double underscore, and underscore 't' suffixes shoul=
d be
> +avoided.
> +
> +Low level memory management
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
> +APIs is not allowed in the QEMU codebase. Instead of these routines,
> +use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
> +g_new0/g_realloc/g_free or QEMU's qemu_memalign/qemu_blockalign/qemu_vfr=
ee
> +APIs.
> +
> +Please note that g_malloc will exit on allocation failure, so there
> +is no need to test for failure (as you would have to with malloc).
> +Calling g_malloc with a zero size is valid and will return NULL.
> +
> +Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the follow=
ing
> +reasons:
> +
> +* It catches multiplication overflowing size_t;
> +* It returns T ``*`` instead of void ``*``, letting compiler catch more =
type errors.
> +
> +Declarations like
> +
> +.. code-block:: c
> +
> +    T *v =3D g_malloc(sizeof(*v))
> +
> +are acceptable, though.
> +
> +Memory allocated by qemu_memalign or qemu_blockalign must be freed with
> +qemu_vfree, since breaking this will cause problems on Win32.
> +
> +String manipulation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Do not use the strncpy function.  As mentioned in the man page, it does =
*not*
> +guarantee a NULL-terminated buffer, which makes it extremely dangerous t=
o use.
> +It also zeros trailing destination bytes out to the specified length.  I=
nstead,
> +use this similar function when possible, but note its different signatur=
e:
> +
> +.. code-block:: c
> +
> +    void pstrcpy(char *dest, int dest_buf_size, const char *src)
> +
> +Don't use strcat because it can't check for buffer overflows, but:
> +
> +.. code-block:: c
> +
> +    char *pstrcat(char *buf, int buf_size, const char *s)
> +
> +The same limitation exists with sprintf and vsprintf, so use snprintf and
> +vsnprintf.
> +
> +QEMU provides other useful string functions:
> +
> +.. code-block:: c
> +
> +    int strstart(const char *str, const char *val, const char **ptr)
> +    int stristart(const char *str, const char *val, const char **ptr)
> +    int qemu_strnlen(const char *s, int max_len)
> +
> +There are also replacement character processing macros for isxyz and tox=
yz,
> +so instead of e.g. isalnum you should use qemu_isalnum.
> +
> +Because of the memory management rules, you must use g_strdup/g_strndup
> +instead of plain strdup/strndup.
> +
> +Printf-style functions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Whenever you add a new printf-style function, i.e., one with a format
> +string argument and following "..." in its prototype, be sure to use
> +gcc's printf attribute directive in the prototype.
> +
> +This makes it so gcc's -Wformat and -Wformat-security options can do
> +their jobs and cross-check format strings with the number and types
> +of arguments.
> +
> +C standard, implementation defined and undefined behaviors
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +C code in QEMU should be written to the C99 language specification. A co=
py
> +of the final version of the C99 standard with corrigenda TC1, TC2, and T=
C3
> +included, formatted as a draft, can be downloaded from:
> +
> +    `<http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf>`_
> +
> +The C language specification defines regions of undefined behavior and
> +implementation defined behavior (to give compiler authors enough leeway =
to
> +produce better code).  In general, code in QEMU should follow the langua=
ge
> +specification and avoid both undefined and implementation defined
> +constructs. ("It works fine on the gcc I tested it with" is not a valid
> +argument...) However there are a few areas where we allow ourselves to
> +assume certain behaviors because in practice all the platforms we care a=
bout
> +behave in the same way and writing strictly conformant code would be
> +painful. These are:
> +
> +* you may assume that integers are 2s complement representation
> +* you may assume that right shift of a signed integer duplicates
> +  the sign bit (ie it is an arithmetic shift, not a logical shift)
> +
> +In addition, QEMU assumes that the compiler does not use the latitude
> +given in C99 and C11 to treat aspects of signed '<<' as undefined, as
> +documented in the GNU Compiler Collection manual starting at version 4.0.
> +
> +Error handling and reporting
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Reporting errors to the human user
> +----------------------------------
> +
> +Do not use printf(), fprintf() or monitor_printf().  Instead, use
> +error_report() or error_vreport() from error-report.h.  This ensures the
> +error is reported in the right place (current monitor or stderr), and in
> +a uniform format.
> +
> +Use error_printf() & friends to print additional information.
> +
> +error_report() prints the current location.  In certain common cases
> +like command line parsing, the current location is tracked
> +automatically.  To manipulate it manually, use the loc_``*``() from
> +error-report.h.
> +
> +Propagating errors
> +------------------
> +
> +An error can't always be reported to the user right where it's detected,
> +but often needs to be propagated up the call chain to a place that can
> +handle it.  This can be done in various ways.
> +
> +The most flexible one is Error objects.  See error.h for usage
> +information.
> +
> +Use the simplest suitable method to communicate success / failure to
> +callers.  Stick to common methods: non-negative on success / -1 on
> +error, non-negative / -errno, non-null / null, or Error objects.
> +
> +Example: when a function returns a non-null pointer on success, and it
> +can fail only in one way (as far as the caller is concerned), returning
> +null on failure is just fine, and certainly simpler and a lot easier on
> +the eyes than propagating an Error object through an Error ``*````*`` pa=
rameter.
> +
> +Example: when a function's callers need to report details on failure
> +only the function really knows, use Error ``*````*``, and set suitable e=
rrors.
> +
> +Do not report an error to the user when you're also returning an error
> +for somebody else to handle.  Leave the reporting to the place that
> +consumes the error returned.
> +
> +Handling errors
> +---------------
> +
> +Calling exit() is fine when handling configuration errors during
> +startup.  It's problematic during normal operation.  In particular,
> +monitor commands should never exit().
> +
> +Do not call exit() or abort() to handle an error that can be triggered
> +by the guest (e.g., some unimplemented corner case in guest code
> +translation or device emulation).  Guests should not be able to
> +terminate QEMU.
> +
> +Note that &error_fatal is just another way to exit(1), and &error_abort
> +is just another way to abort().
> +
> +
>  trace-events style
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/HACKING.rst b/HACKING.rst
> deleted file mode 100644
> index 668fc420c3..0000000000
> --- a/HACKING.rst
> +++ /dev/null
> @@ -1,300 +0,0 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -QEMU Hacking
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -.. contents:: Table of Contents
> -
> -Preprocessor
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Variadic macros
> ----------------
> -
> -For variadic macros, stick with this C99-like syntax:
> -
> -.. code-block:: c
> -
> -    #define DPRINTF(fmt, ...)                                       \
> -        do { printf("IRQ: " fmt, ## __VA_ARGS__); } while (0)
> -
> -Include directives
> -------------------
> -
> -Order include directives as follows:
> -
> -.. code-block:: c
> -
> -    #include "qemu/osdep.h"  /* Always first... */
> -    #include <...>           /* then system headers... */
> -    #include "..."           /* and finally QEMU headers. */
> -
> -The "qemu/osdep.h" header contains preprocessor macros that affect the b=
ehavior
> -of core system headers like <stdint.h>.  It must be the first include so=
 that
> -core system headers included by external libraries get the preprocessor =
macros
> -that QEMU depends on.
> -
> -Do not include "qemu/osdep.h" from header files since the .c file will h=
ave
> -already included it.
> -
> -C types
> -=3D=3D=3D=3D=3D=3D=3D
> -
> -It should be common sense to use the right type, but we have collected
> -a few useful guidelines here.
> -
> -Scalars
> --------
> -
> -If you're using "int" or "long", odds are good that there's a better typ=
e.
> -If a variable is counting something, it should be declared with an
> -unsigned type.
> -
> -If it's host memory-size related, size_t should be a good choice (use
> -ssize_t only if required). Guest RAM memory offsets must use ram_addr_t,
> -but only for RAM, it may not cover whole guest address space.
> -
> -If it's file-size related, use off_t.
> -If it's file-offset related (i.e., signed), use off_t.
> -If it's just counting small numbers use "unsigned int";
> -(on all but oddball embedded systems, you can assume that that
> -type is at least four bytes wide).
> -
> -In the event that you require a specific width, use a standard type
> -like int32_t, uint32_t, uint64_t, etc.  The specific types are
> -mandatory for VMState fields.
> -
> -Don't use Linux kernel internal types like u32, __u32 or __le32.
> -
> -Use hwaddr for guest physical addresses except pcibus_t
> -for PCI addresses.  In addition, ram_addr_t is a QEMU internal address
> -space that maps guest RAM physical addresses into an intermediate
> -address space that can map to host virtual address spaces.  Generally
> -speaking, the size of guest memory can always fit into ram_addr_t but
> -it would not be correct to store an actual guest physical address in a
> -ram_addr_t.
> -
> -For CPU virtual addresses there are several possible types.
> -vaddr is the best type to use to hold a CPU virtual address in
> -target-independent code. It is guaranteed to be large enough to hold a
> -virtual address for any target, and it does not change size from target
> -to target. It is always unsigned.
> -target_ulong is a type the size of a virtual address on the CPU; this me=
ans
> -it may be 32 or 64 bits depending on which target is being built. It sho=
uld
> -therefore be used only in target-specific code, and in some
> -performance-critical built-per-target core code such as the TLB code.
> -There is also a signed version, target_long.
> -abi_ulong is for the ``*``-user targets, and represents a type the size =
of
> -'void ``*``' in that target's ABI. (This may not be the same as the size=
 of a
> -full CPU virtual address in the case of target ABIs which use 32 bit poi=
nters
> -on 64 bit CPUs, like sparc32plus.) Definitions of structures that must m=
atch
> -the target's ABI must use this type for anything that on the target is d=
efined
> -to be an 'unsigned long' or a pointer type.
> -There is also a signed version, abi_long.
> -
> -Of course, take all of the above with a grain of salt.  If you're about
> -to use some system interface that requires a type like size_t, pid_t or
> -off_t, use matching types for any corresponding variables.
> -
> -Also, if you try to use e.g., "unsigned int" as a type, and that
> -conflicts with the signedness of a related variable, sometimes
> -it's best just to use the *wrong* type, if "pulling the thread"
> -and fixing all related variables would be too invasive.
> -
> -Finally, while using descriptive types is important, be careful not to
> -go overboard.  If whatever you're doing causes warnings, or requires
> -casts, then reconsider or ask for help.
> -
> -Pointers
> ---------
> -
> -Ensure that all of your pointers are "const-correct".
> -Unless a pointer is used to modify the pointed-to storage,
> -give it the "const" attribute.  That way, the reader knows
> -up-front that this is a read-only pointer.  Perhaps more
> -importantly, if we're diligent about this, when you see a non-const
> -pointer, you're guaranteed that it is used to modify the storage
> -it points to, or it is aliased to another pointer that is.
> -
> -Typedefs
> ---------
> -
> -Typedefs are used to eliminate the redundant 'struct' keyword, since type
> -names have a different style than other identifiers ("CamelCase" versus
> -"snake_case").  Each named struct type should have a CamelCase name and a
> -corresponding typedef.
> -
> -Since certain C compilers choke on duplicated typedefs, you should avoid
> -them and declare a typedef only in one header file.  For common types,
> -you can use "include/qemu/typedefs.h" for example.  However, as a matter
> -of convenience it is also perfectly fine to use forward struct
> -definitions instead of typedefs in headers and function prototypes; this
> -avoids problems with duplicated typedefs and reduces the need to include
> -headers from other headers.
> -
> -Reserved namespaces in C and POSIX
> -----------------------------------
> -
> -Underscore capital, double underscore, and underscore 't' suffixes shoul=
d be
> -avoided.
> -
> -Low level memory management
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -
> -Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
> -APIs is not allowed in the QEMU codebase. Instead of these routines,
> -use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
> -g_new0/g_realloc/g_free or QEMU's qemu_memalign/qemu_blockalign/qemu_vfr=
ee
> -APIs.
> -
> -Please note that g_malloc will exit on allocation failure, so there
> -is no need to test for failure (as you would have to with malloc).
> -Calling g_malloc with a zero size is valid and will return NULL.
> -
> -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the follow=
ing
> -reasons:
> -
> -* It catches multiplication overflowing size_t;
> -* It returns T ``*`` instead of void ``*``, letting compiler catch more =
type errors.
> -
> -Declarations like
> -
> -.. code-block:: c
> -
> -    T *v =3D g_malloc(sizeof(*v))
> -
> -are acceptable, though.
> -
> -Memory allocated by qemu_memalign or qemu_blockalign must be freed with
> -qemu_vfree, since breaking this will cause problems on Win32.
> -
> -String manipulation
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Do not use the strncpy function.  As mentioned in the man page, it does =
*not*
> -guarantee a NULL-terminated buffer, which makes it extremely dangerous t=
o use.
> -It also zeros trailing destination bytes out to the specified length.  I=
nstead,
> -use this similar function when possible, but note its different signatur=
e:
> -
> -.. code-block:: c
> -
> -    void pstrcpy(char *dest, int dest_buf_size, const char *src)
> -
> -Don't use strcat because it can't check for buffer overflows, but:
> -
> -.. code-block:: c
> -
> -    char *pstrcat(char *buf, int buf_size, const char *s)
> -
> -The same limitation exists with sprintf and vsprintf, so use snprintf and
> -vsnprintf.
> -
> -QEMU provides other useful string functions:
> -
> -.. code-block:: c
> -
> -    int strstart(const char *str, const char *val, const char **ptr)
> -    int stristart(const char *str, const char *val, const char **ptr)
> -    int qemu_strnlen(const char *s, int max_len)
> -
> -There are also replacement character processing macros for isxyz and tox=
yz,
> -so instead of e.g. isalnum you should use qemu_isalnum.
> -
> -Because of the memory management rules, you must use g_strdup/g_strndup
> -instead of plain strdup/strndup.
> -
> -Printf-style functions
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Whenever you add a new printf-style function, i.e., one with a format
> -string argument and following "..." in its prototype, be sure to use
> -gcc's printf attribute directive in the prototype.
> -
> -This makes it so gcc's -Wformat and -Wformat-security options can do
> -their jobs and cross-check format strings with the number and types
> -of arguments.
> -
> -C standard, implementation defined and undefined behaviors
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -C code in QEMU should be written to the C99 language specification. A co=
py
> -of the final version of the C99 standard with corrigenda TC1, TC2, and T=
C3
> -included, formatted as a draft, can be downloaded from:
> -
> -    `<http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf>`_
> -
> -The C language specification defines regions of undefined behavior and
> -implementation defined behavior (to give compiler authors enough leeway =
to
> -produce better code).  In general, code in QEMU should follow the langua=
ge
> -specification and avoid both undefined and implementation defined
> -constructs. ("It works fine on the gcc I tested it with" is not a valid
> -argument...) However there are a few areas where we allow ourselves to
> -assume certain behaviors because in practice all the platforms we care a=
bout
> -behave in the same way and writing strictly conformant code would be
> -painful. These are:
> -
> -* you may assume that integers are 2s complement representation
> -* you may assume that right shift of a signed integer duplicates
> -  the sign bit (ie it is an arithmetic shift, not a logical shift)
> -
> -In addition, QEMU assumes that the compiler does not use the latitude
> -given in C99 and C11 to treat aspects of signed '<<' as undefined, as
> -documented in the GNU Compiler Collection manual starting at version 4.0.
> -
> -Error handling and reporting
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -
> -Reporting errors to the human user
> -----------------------------------
> -
> -Do not use printf(), fprintf() or monitor_printf().  Instead, use
> -error_report() or error_vreport() from error-report.h.  This ensures the
> -error is reported in the right place (current monitor or stderr), and in
> -a uniform format.
> -
> -Use error_printf() & friends to print additional information.
> -
> -error_report() prints the current location.  In certain common cases
> -like command line parsing, the current location is tracked
> -automatically.  To manipulate it manually, use the loc_``*``() from
> -error-report.h.
> -
> -Propagating errors
> -------------------
> -
> -An error can't always be reported to the user right where it's detected,
> -but often needs to be propagated up the call chain to a place that can
> -handle it.  This can be done in various ways.
> -
> -The most flexible one is Error objects.  See error.h for usage
> -information.
> -
> -Use the simplest suitable method to communicate success / failure to
> -callers.  Stick to common methods: non-negative on success / -1 on
> -error, non-negative / -errno, non-null / null, or Error objects.
> -
> -Example: when a function returns a non-null pointer on success, and it
> -can fail only in one way (as far as the caller is concerned), returning
> -null on failure is just fine, and certainly simpler and a lot easier on
> -the eyes than propagating an Error object through an Error ``*````*`` pa=
rameter.
> -
> -Example: when a function's callers need to report details on failure
> -only the function really knows, use Error ``*````*``, and set suitable e=
rrors.
> -
> -Do not report an error to the user when you're also returning an error
> -for somebody else to handle.  Leave the reporting to the place that
> -consumes the error returned.
> -
> -Handling errors
> ----------------
> -
> -Calling exit() is fine when handling configuration errors during
> -startup.  It's problematic during normal operation.  In particular,
> -monitor commands should never exit().
> -
> -Do not call exit() or abort() to handle an error that can be triggered
> -by the guest (e.g., some unimplemented corner case in guest code
> -translation or device emulation).  Guests should not be able to
> -terminate QEMU.
> -
> -Note that &error_fatal is just another way to exit(1), and &error_abort
> -is just another way to abort().
> diff --git a/README.rst b/README.rst
> index 9ff2877416..7497709291 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -66,7 +66,7 @@ When submitting patches, one common approach is to use =
'git
>  format-patch' and/or 'git send-email' to format & send the mail to the
>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>  a 'Signed-off-by' line from the author. Patches should follow the
> -guidelines set out in the HACKING.rst and CODING_STYLE.rst files.
> +guidelines set out in the CODING_STYLE.rst file.
>
>  Additional information on submitting patches can be found online via
>  the QEMU website


--
Alex Benn=C3=A9e

