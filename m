Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E694A406503
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 03:20:35 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOVDW-0000QB-HA
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 21:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOVCU-0008At-F1
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:19:30 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOVCO-0001Bv-Vl
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:19:30 -0400
Received: by mail-io1-xd2f.google.com with SMTP id m11so311862ioo.6
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 18:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dAATg6bvCYWY7VDbWBkFRPcQsfvjgUp5UlGW7A/K4ow=;
 b=hasvLchrOx0ODoHjWX7IEbpyeJvYNiH1z80kd6nLe12wzrC3dQp//S35NNw82J2DkR
 IaRXR7TEjvbxnoGWpRJXCVg9yXbOWmmFdtSpEa0bJqlWsKEIaBfogzr2JCa7ptv4YFRV
 tIBFv2YSBSlGDM6tJKtNVMaZMcdlogar2PfHdq548WrWmeUSwT6CUBLcV4V7ZtXikDg1
 ps5F/PrDn0dQLv+eAkDCH0PomC258VOSKwFgsiM16VIErZexYHjsV7WVdmeBufIIE/LF
 VJBcqTTvZkG0C0mjskFZ4WuaW6a8xisZVs0m3MMR2vNSrfP1LvUZMH9voM13LnOE+lwD
 1Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dAATg6bvCYWY7VDbWBkFRPcQsfvjgUp5UlGW7A/K4ow=;
 b=tIu1R96C5hAG3WAbq460Lj4dfWVBgfbRjpzR1Tm9n3Y7dMJPnip5Wrvj1dp38wrzrP
 ohaOhkYQXiQuRPPuaM3xH9xBTLDjqvq5b3gUwL54AATHPyPar66WyPhh8EStgAQyLF5h
 csQR/cpQPCp9KK2rbmP9deoXo3cKv6ZAIL1VW8UBkr7UDZBhLC46nXRgGnC/DSt2EJSJ
 rm8GGOWVK2pz93YT2DOmjIJZcD1tcwOe306WPbuwi68PlY9Zk1AGYOFtiBn5N18BtvnN
 J+RNuZQHRK6Qt2LriFxcCniZiHudOIsqqroTF3Q5LWkkzFqFxUoBGn1p9E4cVLX7B+bg
 qPhg==
X-Gm-Message-State: AOAM531W2SQAk3Jnv2zaiwraN1SIKn04HvxknI+jKDzqF1NWoGSajmI9
 e/V14yc5vBjGCdDlGj62yJkwfFJ6UnY8FHstgzg46mNOp5cE8w==
X-Google-Smtp-Source: ABdhPJzBIrMbDOPq6oTD4UwX8ThqSg07FBnf4d9cVBrXoswH+Tc/qoTg7pW9CGve+MfAgsHmo9ay5MwKva1mhgevqZE=
X-Received: by 2002:a6b:2b43:: with SMTP id r64mr4850733ior.187.1631236763046; 
 Thu, 09 Sep 2021 18:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-13-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-13-marcandre.lureau@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Sep 2021 11:18:55 +1000
Message-ID: <CAKmqyKP3+rh+vxq=Ci1xiZx7N0Pzyx2Dy8zgp4EsM0UUHizrkw@mail.gmail.com>
Subject: Re: [RFC v3 12/32] rust: provide a common crate for QEMU
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 10:41 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This crates provides common bindings and facilities for QEMU C API
> shared by various projects.
>
> Most importantly, it defines the conversion traits used to convert from
> C to Rust types. Those traits are largely adapted from glib-rs, since
> those have proved to be very flexible, and should guide us to bind
> further QEMU types such as QOM. If glib-rs becomes a dependency, we
> should consider adopting glib translate traits. For QAPI, we need a
> smaller subset.
>
> Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and it
> is desirable to track the exact set of packages that are involved in
> managed builds.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  Cargo.lock                   |  63 +++++
>  Cargo.toml                   |   4 +-
>  rust/common/Cargo.toml       |  11 +
>  rust/common/src/error.rs     | 113 ++++++++
>  rust/common/src/ffi.rs       |  93 +++++++
>  rust/common/src/lib.rs       |  21 ++
>  rust/common/src/qemu.rs      | 101 ++++++++
>  rust/common/src/qmp.rs       |   0
>  rust/common/src/translate.rs | 482 +++++++++++++++++++++++++++++++++++
>  9 files changed, 887 insertions(+), 1 deletion(-)
>  create mode 100644 Cargo.lock
>  create mode 100644 rust/common/Cargo.toml
>  create mode 100644 rust/common/src/error.rs
>  create mode 100644 rust/common/src/ffi.rs
>  create mode 100644 rust/common/src/lib.rs
>  create mode 100644 rust/common/src/qemu.rs
>  create mode 100644 rust/common/src/qmp.rs
>  create mode 100644 rust/common/src/translate.rs
>
> diff --git a/Cargo.lock b/Cargo.lock
> new file mode 100644
> index 0000000000..8dc2dd9da7
> --- /dev/null
> +++ b/Cargo.lock
> @@ -0,0 +1,63 @@
> +# This file is automatically @generated by Cargo.
> +# It is not intended for manual editing.
> +version =3D 3
> +
> +[[package]]
> +name =3D "autocfg"
> +version =3D "1.0.1"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f=
8a464a"
> +
> +[[package]]
> +name =3D "bitflags"
> +version =3D "1.2.1"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d=
691693"
> +
> +[[package]]
> +name =3D "cc"
> +version =3D "1.0.70"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "d26a6ce4b6a484fa3edb70f7efa6fc430fd2b87285fe8b84304fd0936f=
aa0dc0"
> +
> +[[package]]
> +name =3D "cfg-if"
> +version =3D "1.0.0"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2=
da40fd"
> +
> +[[package]]
> +name =3D "common"
> +version =3D "0.1.0"
> +dependencies =3D [
> + "libc",
> + "nix",
> +]
> +
> +[[package]]
> +name =3D "libc"
> +version =3D "0.2.101"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "3cb00336871be5ed2c8ed44b60ae9959dc5b9f08539422ed43f09e34ec=
aeba21"
> +
> +[[package]]
> +name =3D "memoffset"
> +version =3D "0.6.4"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "59accc507f1338036a0477ef61afdae33cde60840f4dfe481319ce3ad1=
16ddf9"
> +dependencies =3D [
> + "autocfg",
> +]
> +
> +[[package]]
> +name =3D "nix"
> +version =3D "0.20.1"
> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +checksum =3D "df8e5e343312e7fbeb2a52139114e9e702991ef9c2aea6817ff2440b35=
647d56"
> +dependencies =3D [
> + "bitflags",
> + "cc",
> + "cfg-if",
> + "libc",
> + "memoffset",
> +]
> diff --git a/Cargo.toml b/Cargo.toml
> index c4b464ff15..14131eed3c 100644
> --- a/Cargo.toml
> +++ b/Cargo.toml
> @@ -1,2 +1,4 @@
>  [workspace]
> -members =3D []
> +members =3D [
> +  "rust/common",
> +]
> diff --git a/rust/common/Cargo.toml b/rust/common/Cargo.toml
> new file mode 100644
> index 0000000000..6c240447f3
> --- /dev/null
> +++ b/rust/common/Cargo.toml
> @@ -0,0 +1,11 @@
> +[package]
> +name =3D "common"
> +version =3D "0.1.0"
> +edition =3D "2018"
> +publish =3D false
> +
> +[dependencies]
> +libc =3D "0.2.92"
> +
> +[target."cfg(unix)".dependencies]
> +nix =3D "0.20.0"
> diff --git a/rust/common/src/error.rs b/rust/common/src/error.rs
> new file mode 100644
> index 0000000000..f166ac42ea
> --- /dev/null
> +++ b/rust/common/src/error.rs
> @@ -0,0 +1,113 @@
> +use std::{self, ffi::CString, fmt, io, ptr};
> +
> +use crate::translate::*;

It's not uncommon to ban wildcard imports that aren't preludes as it
can make it confusing to read. Does QEMU have a stance on that type of
thing?

> +use crate::{ffi, qemu};
> +
> +/// Common error type for QEMU and related projects.
> +#[derive(Debug)]
> +pub enum Error {
> +    /// A generic error with file and line location.
> +    FailedAt(String, &'static str, u32),
> +    /// An IO error.
> +    Io(io::Error),
> +    #[cfg(unix)]
> +    /// A nix error.
> +    Nix(nix::Error),
> +}
> +
> +/// Alias for a `Result` with the error type for QEMU.
> +pub type Result<T> =3D std::result::Result<T, Error>;

I think this is very confusing. Rust developers expect `Result` to be
the one from `std::result`, it would be better to call this
`QEMUResult`

> +
> +impl Error {
> +    fn message(&self) -> String {
> +        use Error::*;

Do we need this here? Why not put it at the top of the file?

> +        match self {
> +            FailedAt(msg, _, _) =3D> msg.into(),
> +            Io(io) =3D> format!("IO error: {}", io),
> +            #[cfg(unix)]
> +            Nix(nix) =3D> format!("Nix error: {}", nix),
> +        }
> +    }
> +
> +    fn location(&self) -> Option<(&'static str, u32)> {
> +        use Error::*;
> +        match self {
> +            FailedAt(_, file, line) =3D> Some((file, *line)),
> +            Io(_) =3D> None,
> +            #[cfg(unix)]
> +            Nix(_) =3D> None,
> +        }
> +    }
> +}
> +
> +impl fmt::Display for Error {
> +    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
> +        use Error::*;
> +        match self {
> +            FailedAt(msg, file, line) =3D> write!(f, "{} ({}:{})", msg, =
file, line),
> +            _ =3D> write!(f, "{}", self.message()),
> +        }
> +    }
> +}
> +
> +impl From<io::Error> for Error {
> +    fn from(val: io::Error) -> Self {
> +        Error::Io(val)
> +    }
> +}
> +
> +#[cfg(unix)]
> +impl From<nix::Error> for Error {
> +    fn from(val: nix::Error) -> Self {
> +        Error::Nix(val)
> +    }
> +}
> +
> +impl QemuPtrDefault for Error {
> +    type QemuType =3D *mut ffi::Error;
> +}
> +
> +impl<'a> ToQemuPtr<'a, *mut ffi::Error> for Error {
> +    type Storage =3D qemu::CError;
> +
> +    fn to_qemu_none(&'a self) -> Stash<'a, *mut ffi::Error, Self> {
> +        let err =3D self.to_qemu_full();
> +
> +        Stash(err, unsafe { from_qemu_full(err) })
> +    }
> +
> +    fn to_qemu_full(&self) -> *mut ffi::Error {
> +        let cmsg =3D
> +            CString::new(self.message()).expect("ToQemuPtr<Error>: unexp=
ected '\0' character");
> +        let mut csrc =3D CString::new("").unwrap();
> +        let (src, line) =3D self.location().map_or((ptr::null(), 0_i32),=
 |loc| {
> +            csrc =3D CString::new(loc.0).expect("ToQemuPtr<Error>:: unex=
pected '\0' character");
> +            (csrc.as_ptr() as *const libc::c_char, loc.1 as i32)
> +        });
> +        let func =3D ptr::null();
> +
> +        let mut err: *mut ffi::Error =3D ptr::null_mut();
> +        unsafe {
> +            ffi::error_setg_internal(
> +                &mut err as *mut *mut _,
> +                src,
> +                line,
> +                func,
> +                cmsg.as_ptr() as *const libc::c_char,
> +            );
> +            err
> +        }
> +    }
> +}
> +
> +/// Convenience macro to build a [`Error::FailedAt`] error.
> +///
> +/// Returns a `Result::Err` with the file:line location.
> +/// (the error can then be converted to a QEMU `ffi::Error`)
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! err {
> +    ($msg:expr) =3D> {
> +        Err(Error::FailedAt($msg.into(), file!(), line!()))
> +    };
> +}
> diff --git a/rust/common/src/ffi.rs b/rust/common/src/ffi.rs
> new file mode 100644
> index 0000000000..82818d503a
> --- /dev/null
> +++ b/rust/common/src/ffi.rs
> @@ -0,0 +1,93 @@
> +//! Bindings to the raw low-level C API commonly provided by QEMU projec=
ts.
> +//!
> +//! Manual bindings to C API availabe when linking QEMU projects.

s/availabe/available/g

> +//! It includes minimal glib allocation functions too, since it's the de=
fault
> +//! allocator used by QEMU, and we don't depend on glib-rs crate yet).
> +//!
> +//! Higher-level Rust-friendly bindings are provided by different module=
s.
> +
> +use libc::{c_char, c_void, size_t};
> +
> +extern "C" {
> +    pub fn g_malloc0(n_bytes: size_t) -> *mut c_void;
> +    pub fn g_free(ptr: *mut c_void);
> +    pub fn g_strndup(str: *const c_char, n: size_t) -> *mut c_char;
> +}

We can get there from the glib/glib_sys crate:
https://gtk-rs.org/gtk-rs-core/stable/latest/docs/glib_sys/fn.g_malloc0.htm=
l

If we only plan on using these 3 I think this approach is fine, but
something to keep in mind if we use more glib functions.

> +
> +#[repr(C)]
> +pub struct QObject(c_void);
> +
> +impl ::std::fmt::Debug for QObject {
> +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
> +        f.debug_struct(&format!("QObject @ {:?}", self as *const _))
> +            .finish()
> +    }
> +}
> +
> +#[repr(C)]
> +pub struct QNull(c_void);
> +
> +impl ::std::fmt::Debug for QNull {
> +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
> +        f.debug_struct(&format!("QNull @ {:?}", self as *const _))
> +            .finish()
> +    }
> +}
> +
> +#[repr(C)]
> +pub struct Error(c_void);
> +
> +impl ::std::fmt::Debug for Error {
> +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
> +        f.debug_struct(&format!("Error @ {:?}", self as *const _))
> +            .finish()
> +    }
> +}
> +
> +extern "C" {
> +    pub fn error_setg_internal(
> +        errp: *mut *mut Error,
> +        src: *const c_char,
> +        line: i32,
> +        func: *const c_char,
> +        fmt: *const c_char,
> +        ...
> +    );
> +    pub fn error_get_pretty(err: *const Error) -> *const c_char;
> +    pub fn error_free(err: *mut Error);
> +}
> +
> +/// Wrap a QMP hanlder.

handler

> +#[macro_export]
> +macro_rules! qmp {
> +    // the basic return value variant
> +    ($e:expr, $errp:ident, $errval:expr) =3D> {{
> +        assert!(!$errp.is_null());
> +        unsafe {
> +            *$errp =3D std::ptr::null_mut();
> +        }
> +
> +        match $e {
> +            Ok(val) =3D> val,
> +            Err(err) =3D> unsafe {
> +                *$errp =3D err.to_qemu_full();
> +                $errval
> +            },
> +        }
> +    }};
> +    // the ptr return value variant
> +    ($e:expr, $errp:ident) =3D> {{
> +        assert!(!$errp.is_null());
> +        unsafe {
> +            *$errp =3D std::ptr::null_mut();
> +        }
> +
> +        match $e {
> +            Ok(val) =3D> val.to_qemu_full().into(),
> +            Err(err) =3D> unsafe {
> +                *$errp =3D err.to_qemu_full();
> +                std::ptr::null_mut()
> +            },
> +        }
> +    }};
> +}

It would be a good idea to document why this code is safe

Alistair

> diff --git a/rust/common/src/lib.rs b/rust/common/src/lib.rs
> new file mode 100644
> index 0000000000..4de826bc2e
> --- /dev/null
> +++ b/rust/common/src/lib.rs
> @@ -0,0 +1,21 @@
> +//! Common code for QEMU
> +//!
> +//! This crates provides common bindings and facilities for QEMU C API s=
hared by
> +//! various projects. Most importantly, it defines the conversion traits=
 used to
> +//! convert from C to Rust types. Those traits are largely adapted from =
glib-rs,
> +//! since those have prooven to be very flexible, and should guide us to=
 bind
> +//! further QEMU types such as QOM. If glib-rs becomes a dependency, we =
should
> +//! consider adopting glib translate traits. For QAPI, we need a smaller=
 subset.
> +
> +pub use libc;
> +
> +mod error;
> +pub use error::*;
> +
> +mod qemu;
> +pub use qemu::*;
> +
> +mod translate;
> +pub use translate::*;
> +
> +pub mod ffi;
> diff --git a/rust/common/src/qemu.rs b/rust/common/src/qemu.rs
> new file mode 100644
> index 0000000000..dd01c6d92d
> --- /dev/null
> +++ b/rust/common/src/qemu.rs
> @@ -0,0 +1,101 @@
> +use std::{ffi::CStr, ptr, str};
> +
> +use crate::{ffi, translate};
> +use translate::{FromQemuPtrFull, FromQemuPtrNone, QemuPtrDefault, Stash,=
 ToQemuPtr};
> +
> +/// A type representing an owned C QEMU Error.
> +pub struct CError(ptr::NonNull<ffi::Error>);
> +
> +impl translate::FromQemuPtrFull<*mut ffi::Error> for CError {
> +    unsafe fn from_qemu_full(ptr: *mut ffi::Error) -> Self {
> +        assert!(!ptr.is_null());
> +        Self(ptr::NonNull::new_unchecked(ptr))
> +    }
> +}
> +
> +impl CError {
> +    pub fn pretty(&self) -> &str {
> +        unsafe {
> +            let pretty =3D ffi::error_get_pretty(self.0.as_ptr());
> +            let bytes =3D CStr::from_ptr(pretty).to_bytes();
> +            str::from_utf8(bytes)
> +                .unwrap_or_else(|err| str::from_utf8(&bytes[..err.valid_=
up_to()]).unwrap())
> +        }
> +    }
> +}
> +
> +impl Drop for CError {
> +    fn drop(&mut self) {
> +        unsafe { ffi::error_free(self.0.as_ptr()) }
> +    }
> +}
> +
> +/// QObject (JSON object)
> +#[derive(Clone, Debug)]
> +pub struct QObject;
> +
> +impl QemuPtrDefault for QObject {
> +    type QemuType =3D *mut ffi::QObject;
> +}
> +
> +impl FromQemuPtrFull<*mut ffi::QObject> for QObject {
> +    #[inline]
> +    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
> +        unimplemented!()
> +    }
> +}
> +
> +impl FromQemuPtrNone<*const ffi::QObject> for QObject {
> +    #[inline]
> +    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
> +        unimplemented!()
> +    }
> +}
> +
> +impl<'a> ToQemuPtr<'a, *mut ffi::QObject> for QObject {
> +    type Storage =3D ();
> +
> +    #[inline]
> +    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QObject, QObject> {
> +        unimplemented!()
> +    }
> +    #[inline]
> +    fn to_qemu_full(&self) -> *mut ffi::QObject {
> +        unimplemented!()
> +    }
> +}
> +
> +/// QNull (JSON null)
> +#[derive(Clone, Debug)]
> +pub struct QNull;
> +
> +impl QemuPtrDefault for QNull {
> +    type QemuType =3D *mut ffi::QNull;
> +}
> +
> +impl FromQemuPtrFull<*mut ffi::QObject> for QNull {
> +    #[inline]
> +    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
> +        unimplemented!()
> +    }
> +}
> +
> +impl FromQemuPtrNone<*const ffi::QObject> for QNull {
> +    #[inline]
> +    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
> +        unimplemented!()
> +    }
> +}
> +
> +impl<'a> ToQemuPtr<'a, *mut ffi::QNull> for QNull {
> +    type Storage =3D ();
> +
> +    #[inline]
> +    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QNull, QNull> {
> +        unimplemented!()
> +    }
> +    #[inline]
> +    fn to_qemu_full(&self) -> *mut ffi::QNull {
> +        unimplemented!()
> +    }
> +}
> diff --git a/rust/common/src/qmp.rs b/rust/common/src/qmp.rs
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/rust/common/src/translate.rs b/rust/common/src/translate.rs
> new file mode 100644
> index 0000000000..315e14fa25
> --- /dev/null
> +++ b/rust/common/src/translate.rs
> @@ -0,0 +1,482 @@
> +// largely adapted from glib-rs
> +// we don't depend on glib-rs as this brings a lot more code that we may=
 not need
> +// and also because there are issues with the conversion traits for our =
ffi::*mut.
> +use libc::{c_char, size_t};
> +use std::ffi::{CStr, CString};
> +use std::ptr;
> +
> +use crate::ffi;
> +
> +/// A pointer.
> +pub trait Ptr: Copy + 'static {
> +    fn is_null(&self) -> bool;
> +    fn from<X>(ptr: *mut X) -> Self;
> +    fn to<X>(self) -> *mut X;
> +}
> +
> +impl<T: 'static> Ptr for *const T {
> +    #[inline]
> +    fn is_null(&self) -> bool {
> +        (*self).is_null()
> +    }
> +
> +    #[inline]
> +    fn from<X>(ptr: *mut X) -> *const T {
> +        ptr as *const T
> +    }
> +
> +    #[inline]
> +    fn to<X>(self) -> *mut X {
> +        self as *mut X
> +    }
> +}
> +
> +impl<T: 'static> Ptr for *mut T {
> +    #[inline]
> +    fn is_null(&self) -> bool {
> +        (*self).is_null()
> +    }
> +
> +    #[inline]
> +    fn from<X>(ptr: *mut X) -> *mut T {
> +        ptr as *mut T
> +    }
> +
> +    #[inline]
> +    fn to<X>(self) -> *mut X {
> +        self as *mut X
> +    }
> +}
> +
> +/// Macro to declare a `NewPtr` struct.
> +///
> +/// A macro to declare a newtype for pointers, to workaround that *T are=
 not
> +/// defined in our binding crates, and allow foreign traits implementati=
ons.
> +/// (this is used by qapi-gen bindings)
> +#[allow(unused_macros)]
> +#[macro_export]
> +#[doc(hidden)]
> +macro_rules! new_ptr {
> +    () =3D> {
> +        #[derive(Copy, Clone)]
> +        pub struct NewPtr<P: Ptr>(pub P);
> +
> +        impl<P: Ptr> Ptr for NewPtr<P> {
> +            #[inline]
> +            fn is_null(&self) -> bool {
> +                self.0.is_null()
> +            }
> +
> +            #[inline]
> +            fn from<X>(ptr: *mut X) -> Self {
> +                NewPtr(P::from(ptr))
> +            }
> +
> +            #[inline]
> +            fn to<X>(self) -> *mut X {
> +                self.0.to()
> +            }
> +        }
> +    };
> +}
> +
> +/// Provides the default pointer type to be used in some container conve=
rsions.
> +///
> +/// It's `*mut c_char` for `String`, `*mut ffi::GuestInfo` for `GuestInf=
o`...
> +pub trait QemuPtrDefault {
> +    type QemuType: Ptr;
> +}
> +
> +impl QemuPtrDefault for String {
> +    type QemuType =3D *mut c_char;
> +}
> +
> +/// A Stash contains the temporary storage and a pointer into it.
> +///
> +/// The pointer is valid for the lifetime of the `Stash`. As the lifetim=
e of the
> +/// `Stash` returned from `to_qemu_none` is at least the enclosing state=
ment,
> +/// you can avoid explicitly binding the stash in most cases and just ta=
ke the
> +/// pointer out of it:
> +///
> +/// ```ignore
> +///     pub fn set_device_name(&self, name: &str) {
> +///         unsafe {
> +///             ffi::qemu_device_set_name(self.pointer, name.to_qemu_non=
e().0)
> +///         }
> +///     }
> +/// ```
> +pub struct Stash<'a, P: Copy, T: ?Sized + ToQemuPtr<'a, P>>(
> +    pub P,
> +    pub <T as ToQemuPtr<'a, P>>::Storage,
> +);
> +
> +/// Translate to a pointer.
> +pub trait ToQemuPtr<'a, P: Copy> {
> +    type Storage;
> +
> +    /// The pointer in the `Stash` is only valid for the lifetime of the=
 `Stash`.
> +    fn to_qemu_none(&'a self) -> Stash<'a, P, Self>;
> +
> +    /// Transfer the ownership to the ffi.
> +    fn to_qemu_full(&self) -> P {
> +        unimplemented!();
> +    }
> +}
> +
> +impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Option<T> {
> +    type Storage =3D Option<<T as ToQemuPtr<'a, P>>::Storage>;
> +
> +    #[inline]
> +    fn to_qemu_none(&'a self) -> Stash<'a, P, Option<T>> {
> +        self.as_ref()
> +            .map_or(Stash(Ptr::from::<()>(ptr::null_mut()), None), |s| {
> +                let s =3D s.to_qemu_none();
> +                Stash(s.0, Some(s.1))
> +            })
> +    }
> +
> +    #[inline]
> +    fn to_qemu_full(&self) -> P {
> +        self.as_ref()
> +            .map_or(Ptr::from::<()>(ptr::null_mut()), ToQemuPtr::to_qemu=
_full)
> +    }
> +}
> +
> +impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Box<T> {
> +    type Storage =3D <T as ToQemuPtr<'a, P>>::Storage;
> +
> +    #[inline]
> +    fn to_qemu_none(&'a self) -> Stash<'a, P, Box<T>> {
> +        let s =3D self.as_ref().to_qemu_none();
> +        Stash(s.0, s.1)
> +    }
> +
> +    #[inline]
> +    fn to_qemu_full(&self) -> P {
> +        ToQemuPtr::to_qemu_full(self.as_ref())
> +    }
> +}
> +
> +impl<'a> ToQemuPtr<'a, *mut c_char> for String {
> +    type Storage =3D CString;
> +
> +    #[inline]
> +    fn to_qemu_none(&self) -> Stash<'a, *mut c_char, String> {
> +        let tmp =3D CString::new(&self[..])
> +            .expect("String::ToQemuPtr<*mut c_char>: unexpected '\0' cha=
racter");
> +        Stash(tmp.as_ptr() as *mut c_char, tmp)
> +    }
> +
> +    #[inline]
> +    fn to_qemu_full(&self) -> *mut c_char {
> +        unsafe { ffi::g_strndup(self.as_ptr() as *const c_char, self.len=
() as size_t) }
> +    }
> +}
> +
> +/// Translate from a pointer type, without taking ownership.
> +pub trait FromQemuPtrNone<P: Ptr>: Sized {
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer. It is not referenced after the ca=
ll.
> +    unsafe fn from_qemu_none(ptr: P) -> Self;
> +}
> +
> +/// Translate from a pointer type, taking ownership.
> +pub trait FromQemuPtrFull<P: Ptr>: Sized {
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer. Ownership is transferred.
> +    unsafe fn from_qemu_full(ptr: P) -> Self;
> +}
> +
> +/// See [`FromQemuPtrNone`](trait.FromQemuPtrNone.html).
> +#[inline]
> +#[allow(clippy::missing_safety_doc)]
> +pub unsafe fn from_qemu_none<P: Ptr, T: FromQemuPtrNone<P>>(ptr: P) -> T=
 {
> +    FromQemuPtrNone::from_qemu_none(ptr)
> +}
> +
> +/// See [`FromQemuPtrFull`](trait.FromQemuPtrFull.html).
> +#[inline]
> +#[allow(clippy::missing_safety_doc)]
> +pub unsafe fn from_qemu_full<P: Ptr, T: FromQemuPtrFull<P>>(ptr: P) -> T=
 {
> +    FromQemuPtrFull::from_qemu_full(ptr)
> +}
> +
> +impl<P: Ptr, T: FromQemuPtrNone<P>> FromQemuPtrNone<P> for Option<T> {
> +    #[inline]
> +    unsafe fn from_qemu_none(ptr: P) -> Option<T> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            Some(from_qemu_none(ptr))
> +        }
> +    }
> +}
> +
> +impl<P: Ptr, T: FromQemuPtrFull<P>> FromQemuPtrFull<P> for Option<T> {
> +    #[inline]
> +    unsafe fn from_qemu_full(ptr: P) -> Option<T> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            Some(from_qemu_full(ptr))
> +        }
> +    }
> +}
> +
> +impl FromQemuPtrNone<*const c_char> for String {
> +    #[inline]
> +    unsafe fn from_qemu_none(ptr: *const c_char) -> Self {
> +        assert!(!ptr.is_null());
> +        String::from_utf8_lossy(CStr::from_ptr(ptr).to_bytes()).into_own=
ed()
> +    }
> +}
> +
> +impl FromQemuPtrFull<*mut c_char> for String {
> +    #[inline]
> +    unsafe fn from_qemu_full(ptr: *mut c_char) -> Self {
> +        let res =3D from_qemu_none(ptr as *const _);
> +        ffi::g_free(ptr as *mut _);
> +        res
> +    }
> +}
> +
> +#[doc(hidden)]
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! vec_ffi_wrapper {
> +    ($ffi:ident) =3D> {
> +        #[allow(non_camel_case_types)]
> +        pub struct $ffi(*mut qapi_ffi::$ffi);
> +
> +        impl Drop for $ffi {
> +            fn drop(&mut self) {
> +                let mut list =3D self.0;
> +                unsafe {
> +                    while !list.is_null() {
> +                        let next =3D (*list).next;
> +                        Box::from_raw(list);
> +                        list =3D next;
> +                    }
> +                }
> +            }
> +        }
> +
> +        impl From<NewPtr<*mut qapi_ffi::$ffi>> for *mut qapi_ffi::$ffi {
> +            fn from(p: NewPtr<*mut qapi_ffi::$ffi>) -> Self {
> +                p.0
> +            }
> +        }
> +    };
> +}
> +
> +#[doc(hidden)]
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_vec_scalars_to_qemu {
> +    ($rs:ty, $ffi:ident) =3D> {
> +        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs>=
 {
> +            type Storage =3D $ffi;
> +
> +            #[inline]
> +            fn to_qemu_none(&self) -> Stash<NewPtr<*mut qapi_ffi::$ffi>,=
 Self> {
> +                let mut list: *mut qapi_ffi::$ffi =3D std::ptr::null_mut=
();
> +                for value in self.iter().rev() {
> +                    let b =3D Box::new(qapi_ffi::$ffi {
> +                        next: list,
> +                        value: *value,
> +                    });
> +                    list =3D Box::into_raw(b);
> +                }
> +                Stash(NewPtr(list), $ffi(list))
> +            }
> +
> +            #[inline]
> +            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
> +                let mut list: *mut qapi_ffi::$ffi =3D std::ptr::null_mut=
();
> +                unsafe {
> +                    for value in self.iter().rev() {
> +                        let l =3D ffi::g_malloc0(std::mem::size_of::<qap=
i_ffi::$ffi>())
> +                            as *mut qapi_ffi::$ffi;
> +                        (*l).next =3D list;
> +                        (*l).value =3D *value;
> +                        list =3D l;
> +                    }
> +                }
> +                NewPtr(list)
> +            }
> +        }
> +    };
> +}
> +
> +#[doc(hidden)]
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_vec_scalars_from_qemu {
> +    ($rs:ty, $ffi:ident, $free_ffi:ident) =3D> {
> +        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
> +            #[inline]
> +            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>) -=
> Self {
> +                let ret =3D from_qemu_none(NewPtr(ffi.0 as *const _));
> +                qapi_ffi::$free_ffi(ffi.0);
> +                ret
> +            }
> +        }
> +
> +        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for Vec<$rs>=
 {
> +            #[inline]
> +            unsafe fn from_qemu_none(ffi: NewPtr<*const qapi_ffi::$ffi>)=
 -> Self {
> +                let mut ret =3D vec![];
> +                let mut it =3D ffi.0;
> +                while !it.is_null() {
> +                    let e =3D &*it;
> +                    ret.push(e.value);
> +                    it =3D e.next;
> +                }
> +                ret
> +            }
> +        }
> +    };
> +}
> +
> +#[doc(hidden)]
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_vec_to_qemu {
> +    ($rs:ty, $ffi:ident) =3D> {
> +        // impl doesn't use only types from inside the current crate
> +        // impl QemuPtrDefault for Vec<$rs> {
> +        //     type QemuType =3D NewPtr<*mut qapi_ffi::$ffi>;
> +        // }
> +
> +        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs>=
 {
> +            type Storage =3D ($ffi, Vec<Stash<'a, <$rs as QemuPtrDefault=
>::QemuType, $rs>>);
> +
> +            #[inline]
> +            fn to_qemu_none(&self) -> Stash<NewPtr<*mut qapi_ffi::$ffi>,=
 Self> {
> +                let stash_vec: Vec<_> =3D self.iter().rev().map(ToQemuPt=
r::to_qemu_none).collect();
> +                let mut list: *mut qapi_ffi::$ffi =3D std::ptr::null_mut=
();
> +                for stash in &stash_vec {
> +                    let b =3D Box::new(qapi_ffi::$ffi {
> +                        next: list,
> +                        value: Ptr::to(stash.0),
> +                    });
> +                    list =3D Box::into_raw(b);
> +                }
> +                Stash(NewPtr(list), ($ffi(list), stash_vec))
> +            }
> +
> +            #[inline]
> +            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
> +                let v: Vec<_> =3D self.iter().rev().map(ToQemuPtr::to_qe=
mu_full).collect();
> +                let mut list: *mut qapi_ffi::$ffi =3D std::ptr::null_mut=
();
> +                unsafe {
> +                    for val in v {
> +                        let l =3D ffi::g_malloc0(std::mem::size_of::<qap=
i_ffi::$ffi>())
> +                            as *mut qapi_ffi::$ffi;
> +                        (*l).next =3D list;
> +                        (*l).value =3D val;
> +                        list =3D l;
> +                    }
> +                }
> +                NewPtr(list)
> +            }
> +        }
> +    };
> +}
> +
> +#[doc(hidden)]
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_vec_from_qemu {
> +    ($rs:ty, $ffi:ident, $free_ffi:ident) =3D> {
> +        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
> +            #[inline]
> +            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>) -=
> Self {
> +                let ret =3D from_qemu_none(NewPtr(ffi.0 as *const _));
> +                qapi_ffi::$free_ffi(ffi.0);
> +                ret
> +            }
> +        }
> +
> +        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for Vec<$rs>=
 {
> +            #[inline]
> +            unsafe fn from_qemu_none(ffi: NewPtr<*const qapi_ffi::$ffi>)=
 -> Self {
> +                let mut ret =3D vec![];
> +                let mut it =3D ffi.0;
> +                while !it.is_null() {
> +                    let e =3D &*it;
> +                    ret.push(from_qemu_none(e.value as *const _));
> +                    it =3D e.next;
> +                }
> +                ret
> +            }
> +        }
> +    };
> +}
> +
> +/// A macro to help the implementation of `Vec<T>` translations.
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! vec_type {
> +    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 0) =3D> {
> +        vec_ffi_wrapper!($ffi);
> +        impl_vec_from_qemu!($rs, $ffi, $free_ffi);
> +        impl_vec_to_qemu!($rs, $ffi);
> +    };
> +    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 1) =3D> {
> +        vec_ffi_wrapper!($ffi);
> +        impl_vec_scalars_from_qemu!($rs, $ffi, $free_ffi);
> +        impl_vec_scalars_to_qemu!($rs, $ffi);
> +    };
> +}
> +
> +/// A macro to implement [`ToQemuPtr`] as boxed scalars
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_to_qemu_scalar_boxed {
> +    ($ty:ty) =3D> {
> +        impl<'a> ToQemuPtr<'a, *mut $ty> for $ty {
> +            type Storage =3D Box<$ty>;
> +
> +            fn to_qemu_none(&'a self) -> Stash<'a, *mut $ty, Self> {
> +                let mut box_ =3D Box::new(*self);
> +                Stash(&mut *box_, box_)
> +            }
> +
> +            fn to_qemu_full(&self) -> *mut $ty {
> +                unsafe {
> +                    let ptr =3D ffi::g_malloc0(std::mem::size_of::<$ty>(=
)) as *mut _;
> +                    *ptr =3D *self;
> +                    ptr
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +/// A macro to implement [`FromQemuPtrNone`] for scalar pointers.
> +#[allow(unused_macros)]
> +#[macro_export]
> +macro_rules! impl_from_qemu_none_scalar {
> +    ($ty:ty) =3D> {
> +        impl FromQemuPtrNone<*const $ty> for $ty {
> +            unsafe fn from_qemu_none(ptr: *const $ty) -> Self {
> +                *ptr
> +            }
> +        }
> +    };
> +}
> +
> +macro_rules! impl_scalar_boxed {
> +    ($($t:ident)*) =3D> (
> +        $(
> +            impl_to_qemu_scalar_boxed!($t);
> +            impl_from_qemu_none_scalar!($t);
> +        )*
> +    )
> +}
> +
> +// the only built-in used so far, feel free to add more as needed
> +impl_scalar_boxed!(bool i64 f64);
> --
> 2.33.0.113.g6c40894d24
>
>

