Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0F4028AC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:22:46 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNa7h-0000Hp-0x
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5A-00064V-Jx
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa55-0005ln-3g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QDWRRkyGJAJjkqR7RAAYhPavAxqBOAkUMu1FBZi8bFY=;
 b=gKF+uZjhYim/4o4AXyuCEedbwCwavak2Roe5hUQ3FtDP3mi06FCNcM86Wu81DAuKz+Mw9d
 ZISMMzjxOvr4/OO7m8ritRYCs/blyTsaKzcixFBEjwYEaWZQhLQYmW1y/krlX86Hsa+RkW
 nr7Ft4G5T1wUDa1w5HQgo8cEsq+PW4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-kwbcGhokM-6zb5FgHlKLiA-1; Tue, 07 Sep 2021 08:19:57 -0400
X-MC-Unique: kwbcGhokM-6zb5FgHlKLiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EBA480124F
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:19:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05A915D9CA;
 Tue,  7 Sep 2021 12:19:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 00/32] Rust binding for QAPI and qemu-ga QMP handler examples
Date: Tue,  7 Sep 2021 16:19:11 +0400
Message-Id: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Among the QEMU developers, there is a desire to use Rust. (see previous=0D
thread from Stefan "Why QEMU should move from C to Rust", the rust-vmm=0D
related projects and other experiments).=0D
=0D
Thanks to our QAPI type system and the associate code generator, it is poss=
ible=0D
to create Rust bindings for the generated C types (also called FFI binding)=
 and=0D
functions (rust-bindgen could probably do a similar job, but it is unnecess=
ary=0D
given the FFI generator is quite straightforward).=0D
=0D
More interesting (but more complicated) is to expose a Rust API, and provid=
e=0D
convenient conversions FFI<->Rust. Taking inspiration from glib-rs binding,=
 I=0D
implemented a simplified version of the FromGlib/ToGlib traits, with simple=
r=0D
ownership model, sufficient for QAPI needs.=0D
=0D
The usage is as such:=0D
=0D
- from_qemu_none(ptr: *const sys::P) -> T=0D
  Return a Rust type T for a const ffi pointer P.=0D
=0D
- from_qemu_full(ptr: *mut sys::P) -> T=0D
  Return a Rust type T for a ffi pointer P, taking ownership.=0D
=0D
- T::to_qemu_none() -> Stash<P>=0D
  Returns a borrowed ffi pointer P (using a Stash to destroy "glue"=0D
  storage data, if any).=0D
=0D
- T::to_qemu_full() -> P=0D
  Returns a ffi pointer P. (P resources are leaked/passed to C/ffi)=0D
=0D
With the Rust QAPI bindings, we can implement QMP callbacks in idiomatic Ru=
st.=0D
With the translation traits, we can also bind manually more types and imple=
ment=0D
other functions (QOM is my next target).=0D
=0D
Since Rust doesn't cover all the platforms QEMU supports (see first patch a=
nd=0D
https://doc.rust-lang.org/nightly/rustc/platform-support.html), the Rust co=
de=0D
should be optional. Nevertheless, it is desirable to write sensitive code i=
n=0D
Rust first, and a C version if the code/feature is not optional and not spe=
cific=0D
to a platform where Rust is Tier-1 or 2.=0D
=0D
v3 (RFC):=0D
 - rebased (was waiting for qapi 'if' conditions to be merged)=0D
 - now covers the various QEMU QAPI schemas (QEMU schema is left out of thi=
s=0D
   series, but test schema is the complete)=0D
 - numerous improvements, patch reorgnisation, cleanups etc=0D
=0D
v2 (PoC):=0D
 - split the original patch in smaller patches and more digestable form=0D
 - dropped the DBus interface experiment from this series=0D
 - various build-sys improvements, new configure options --with-rust(-targe=
t)=0D
 - various attempts at better meson integration, finally satisfied enough w=
ith the=0D
   current solution, which handles getting link flags from Rust sanely.=0D
   (more meson stuff to come to handle config-host/features mapping etc).=
=0D
 - rebased, QGA QMP now uses unions, added support for it.=0D
 - start a common crate (which re-surfaced issues with foreign types and tr=
aits,=0D
   worked around with a NewPtr wrapper)=0D
 - explicit errors when ifcond are presents (after various unsucessful atte=
mpts,=0D
   I will try to tackle it in v3)=0D
 - mingw cross compilation support=0D
 - some attempts to add it to CI=0D
 - actually implement {get,set}-vcpus=0D
 - vendor the external crates=0D
=0D
Marc-Andr=C3=A9 Lureau (32):=0D
  RFC: docs: add supported host CPUs section=0D
  build-sys: add HAVE_IPPROTO_MPTCP=0D
  scripts/qapi: teach c_param_type() to return const argument type=0D
  glib-compat: add G_SIZEOF_MEMBER=0D
  scripts/qapi: add QAPISchemaVisitor.visit_module_end=0D
  scripts/qapi: add a CABI module=0D
  scripts/qapi: generate CABI dump for C types=0D
  tests: build qapi-cabi (C ABI dump)=0D
  build-sys: add i686 cpu target=0D
  build-sys: add --with-rust{-target} & basic build infrastructure=0D
  build-sys: add a cargo-wrapper script=0D
  rust: provide a common crate for QEMU=0D
  rust: use vendored-sources=0D
  scripts/qapi: add QAPISchemaIfCond.rsgen()=0D
  scripts/qapi: strip trailing whitespaces=0D
  scripts/qapi: add Rust FFI bindings generation=0D
  scripts/qapi: learn to generate ABI dump for Rust FFI=0D
  tests: generate Rust bindings=0D
  tests: check Rust and C CABI diffs=0D
  scripts/qapi: generate high-level Rust bindings=0D
  tests/rust: build a common library, checking bindings compile=0D
  qga: build qapi-cabi binary (ABI from C)=0D
  qga/rust: build and link an empty static library=0D
  qga/rust: generate QGA QAPI types FFI bindings=0D
  qga/rust: build a qga-cabi-rs executable (ABI from Rust)=0D
  qga/rust: check the Rust C binding=0D
  qga/rust: build high-level Rust QAPI types=0D
  qga/rust: implement get-host-name in Rust (example)=0D
  qga/rust: implement {get,set}-vcpus in Rust (example)=0D
  tests/vm: add Rust to FreeBSD VM=0D
  tests/vm: bump fedora VM to f32=0D
  tests/vm: add Rust to Fedora=0D
=0D
 docs/about/build-platforms.rst |  28 +=0D
 configure                      |  32 +-=0D
 meson.build                    |  49 +-=0D
 qapi/sockets.json              |   2 +-=0D
 include/glib-compat.h          |   7 +=0D
 include/qemu/osdep.h           |  10 -=0D
 io/dns-resolver.c              |   2 +-=0D
 qga/commands-posix.c           | 152 ------=0D
 qga/commands-win32.c           |  71 ---=0D
 qga/commands.c                 |  34 +-=0D
 qga/qapi-cabi.c                |   9 +=0D
 tests/qapi-cabi.c              |   9 +=0D
 tests/unit/test-qga.c          |   4 +=0D
 util/oslib-posix.c             |  35 --=0D
 util/oslib-win32.c             |  13 -=0D
 util/qemu-sockets.c            |   6 +-=0D
 .cargo/config.toml.in          |   5 +=0D
 .cargo/meson.build             |   5 +=0D
 .gitignore                     |   1 +=0D
 .gitmodules                    |   4 +=0D
 Cargo.lock                     | 119 ++++=0D
 Cargo.toml                     |   6 +=0D
 meson_options.txt              |   5 +=0D
 qga/Cargo.toml                 |  24 +=0D
 qga/lib.rs                     |   5 +=0D
 qga/meson.build                |  64 ++-=0D
 qga/qapi-cabi.rs               |   6 +=0D
 qga/qapi.rs                    |   6 +=0D
 qga/qapi_ffi.rs                |   8 +=0D
 qga/qmp/hostname.rs            |   9 +=0D
 qga/qmp/mod.rs                 |  28 +=0D
 qga/qmp/vcpus.rs               | 161 ++++++=0D
 rust/common/Cargo.toml         |  11 +=0D
 rust/common/src/error.rs       | 113 ++++=0D
 rust/common/src/ffi.rs         |  93 ++++=0D
 rust/common/src/lib.rs         |  21 +=0D
 rust/common/src/qemu.rs        | 101 ++++=0D
 rust/common/src/qmp.rs         |   0=0D
 rust/common/src/translate.rs   | 482 ++++++++++++++++=0D
 rust/vendored                  |   1 +=0D
 scripts/archive-source.sh      |   2 +-=0D
 scripts/cargo_wrapper.py       | 183 +++++++=0D
 scripts/configh_to_cfg.py      |  44 ++=0D
 scripts/diff_commands.py       |  40 ++=0D
 scripts/qapi/cabi.py           | 187 +++++++=0D
 scripts/qapi/common.py         |  16 +=0D
 scripts/qapi/gen.py            |   6 +-=0D
 scripts/qapi/main.py           |  25 +-=0D
 scripts/qapi/rs.py             | 262 +++++++++=0D
 scripts/qapi/rs_ffi.py         | 446 +++++++++++++++=0D
 scripts/qapi/rs_types.py       | 966 +++++++++++++++++++++++++++++++++=0D
 scripts/qapi/schema.py         |  23 +-=0D
 scripts/qapi/types.py          |  58 +-=0D
 tests/Cargo.toml               |  17 +=0D
 tests/lib.rs                   |   2 +=0D
 tests/meson.build              |  72 ++-=0D
 tests/qapi-cabi.rs             |   5 +=0D
 tests/qapi.rs                  |  11 +=0D
 tests/qapi_ffi.rs              |   8 +=0D
 tests/vm/fedora                |  12 +-=0D
 tests/vm/freebsd               |   1 +=0D
 61 files changed, 3794 insertions(+), 333 deletions(-)=0D
 create mode 100644 qga/qapi-cabi.c=0D
 create mode 100644 tests/qapi-cabi.c=0D
 create mode 100644 .cargo/config.toml.in=0D
 create mode 100644 .cargo/meson.build=0D
 create mode 100644 Cargo.lock=0D
 create mode 100644 Cargo.toml=0D
 create mode 100644 qga/Cargo.toml=0D
 create mode 100644 qga/lib.rs=0D
 create mode 100644 qga/qapi-cabi.rs=0D
 create mode 100644 qga/qapi.rs=0D
 create mode 100644 qga/qapi_ffi.rs=0D
 create mode 100644 qga/qmp/hostname.rs=0D
 create mode 100644 qga/qmp/mod.rs=0D
 create mode 100644 qga/qmp/vcpus.rs=0D
 create mode 100644 rust/common/Cargo.toml=0D
 create mode 100644 rust/common/src/error.rs=0D
 create mode 100644 rust/common/src/ffi.rs=0D
 create mode 100644 rust/common/src/lib.rs=0D
 create mode 100644 rust/common/src/qemu.rs=0D
 create mode 100644 rust/common/src/qmp.rs=0D
 create mode 100644 rust/common/src/translate.rs=0D
 create mode 160000 rust/vendored=0D
 create mode 100644 scripts/cargo_wrapper.py=0D
 create mode 100644 scripts/configh_to_cfg.py=0D
 create mode 100644 scripts/diff_commands.py=0D
 create mode 100644 scripts/qapi/cabi.py=0D
 create mode 100644 scripts/qapi/rs.py=0D
 create mode 100644 scripts/qapi/rs_ffi.py=0D
 create mode 100644 scripts/qapi/rs_types.py=0D
 create mode 100644 tests/Cargo.toml=0D
 create mode 100644 tests/lib.rs=0D
 create mode 100644 tests/qapi-cabi.rs=0D
 create mode 100644 tests/qapi.rs=0D
 create mode 100644 tests/qapi_ffi.rs=0D
=0D
--=20=0D
2.33.0.113.g6c40894d24=0D
=0D


