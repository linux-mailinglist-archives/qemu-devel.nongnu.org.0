Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A82B5AEA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:26:24 +0100 (CET)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewJj-0002w7-MR
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewHZ-00029J-BS
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:24:09 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewHW-0003dW-LJ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:24:09 -0500
Received: by mail-ed1-x543.google.com with SMTP id q3so21497593edr.12
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpnJAw3QU1oUA8aitXKYoms8SnObDZ95yXuATIkRv74=;
 b=RTBm/cjR459XJjghWqyFCvtJNh86ZPaOflcSa1ThGBMq0bWaxIoCI1XKJgmi+OsCG8
 lxhhYUehL1yCDb/FmWE3Bflzn0yZSHNN1dYZN/X+2fJJ4y+FYoiihd8PYEn1iLabFwpK
 VJXgRsnEqBhCjQV9YfZdVwtxZM6/gyKpAqf5wRGGtAMUBIK42T1fTNtrNtxuu8ITj9Xo
 E/uxJzzT5vNwCuI6oPaECQq6sCB8leRgJpyZk0hN3Fd5NlNoyt4zZIV21hKujjBt5aIW
 LbQ2XQJFHu3bvXhO5g7bmzFRZ2uc0GN/Pd/JWaQVcA+QJEFq/3tqtkHbODmxRzdmLKc0
 mqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpnJAw3QU1oUA8aitXKYoms8SnObDZ95yXuATIkRv74=;
 b=gI+NfDQzicO3e0kheS/O15V/LJYpcSwrSfpg91ZrPI4R30hGnGeqTw+H0FPvf/UoSP
 n4jN59CJ7TMxzmwcbBg4Ff0YDo0aAFXVfL+qDcbpoeN/dUc3PgVbt6uAX4JaQ5kVKVdO
 Veh9OG2MO+y6TW3wrIW74EaMWCDkYp/C6NhuALimDRlXI5/UdkLEO5ZbAuNWZOR2KuzL
 tUc5Sl0+Wv3Vc2oKV1X52AiqP9IVWt0Vg66SHBJfUzRIEMbA/BJUMfym/GpPzhvHutFs
 p0ee1B+m6InDHHi91Lc8fnJ3e6w6+TGALLJMmb42SxDqj8UG9FTQWFDCN1F/T4A5K/c+
 +oew==
X-Gm-Message-State: AOAM530p2iBlJLOpJNeoYzOCpS1kMTrwZ3GHwdq7/tpOufE+XUWUpPqv
 E0g4ywt4ZpnqnFFmVWxTsUNCzqOf3+i1VIL0rU8=
X-Google-Smtp-Source: ABdhPJxZJM23uv0JdfBUSZFjWh51ptRnHkYloYiP3fY3c8nATVrkVI/OLA0fjIbvoXUS7j4qoYAYaxnhIJaVHu/nWkk=
X-Received: by 2002:a50:bb26:: with SMTP id y35mr7925816ede.257.1605601444587; 
 Tue, 17 Nov 2020 00:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-2-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-2-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:23:52 +0400
Message-ID: <CAJ+F1C+uONEd7K1jeJ6PMYUDcC+QZd4OfRk1g6nZ-kbAYArRsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] qobject: Include API docs in
 docs/devel/qobject.html
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c16f5d05b449372c"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c16f5d05b449372c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Render existing doc comments at docs/devel/qobject.html.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  docs/devel/index.rst       |  1 +
>  docs/devel/qobject.rst     | 11 +++++++++
>  include/qapi/qmp/qnum.h    |  4 +++-
>  include/qapi/qmp/qobject.h | 48 +++++++++++++++++++++++++-------------
>  qobject/qnum.c             | 19 ++++++++++++---
>  5 files changed, 63 insertions(+), 20 deletions(-)
>  create mode 100644 docs/devel/qobject.rst
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index f10ed77e4c..1cb39a9384 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -35,3 +35,4 @@ Contents:
>     clocks
>     qom
>     block-coroutine-wrapper
> +   qobject
> diff --git a/docs/devel/qobject.rst b/docs/devel/qobject.rst
> new file mode 100644
> index 0000000000..4f192ced7c
> --- /dev/null
> +++ b/docs/devel/qobject.rst
> @@ -0,0 +1,11 @@
> +QObject API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/qapi/qmp/qobject.h
> +
> +QNum module
> +-----------
> +
> +.. kernel-doc:: include/qapi/qmp/qnum.h
> +
> +.. kernel-doc:: qobject/qnum.c
> diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> index bbae0a5ec8..25f4733efc 100644
> --- a/include/qapi/qmp/qnum.h
> +++ b/include/qapi/qmp/qnum.h
> @@ -23,7 +23,9 @@ typedef enum {
>      QNUM_DOUBLE
>  } QNumKind;
>
> -/*
> +/**
> + * DOC:
> + *
>   * QNum encapsulates how our dialect of JSON fills in the blanks left
>   * by the JSON specification (RFC 8259) regarding numbers.
>   *
> diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
> index fcfd549220..bdc33bdb65 100644
> --- a/include/qapi/qmp/qobject.h
> +++ b/include/qapi/qmp/qobject.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU Object Model.
> + * QObject API
>   *
>   * Based on ideas by Avi Kivity <avi@redhat.com>
>   *
> @@ -10,24 +10,31 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.1 or
> later.
>   * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +/**
> + * DOC: QObject Reference Counts Terminology
>   *
> - * QObject Reference Counts Terminology
> - * ------------------------------------
> + * Returning references
> + * --------------------
>   *
> - *  - Returning references: A function that returns an object may
> - *  return it as either a weak or a strong reference.  If the
> - *  reference is strong, you are responsible for calling
> - *  qobject_unref() on the reference when you are done.
> + * A function that returns an object may return it as either a
> + * weak or a strong reference.  If the reference is strong, you
> + * are responsible for calling qobject_unref() on the reference
> + * when you are done.
>   *
> - *  If the reference is weak, the owner of the reference may free it at
> - *  any time in the future.  Before storing the reference anywhere, you
> - *  should call qobject_ref() to make the reference strong.
> + * If the reference is weak, the owner of the reference may free it at
> + * any time in the future.  Before storing the reference anywhere, you
> + * should call qobject_ref() to make the reference strong.
>   *
> - *  - Transferring ownership: when you transfer ownership of a reference
> - *  by calling a function, you are no longer responsible for calling
> - *  qobject_unref() when the reference is no longer needed.  In other
> words,
> - *  when the function returns you must behave as if the reference to the
> - *  passed object was weak.
> + * Transferring ownership
> + * ----------------------
> + *
> + * When you transfer ownership of a reference by calling a
> + * function, you are no longer responsible for calling
> + * qobject_unref() when the reference is no longer needed.  In
> + * other words, when the function returns you must behave as if
> + * the reference to the passed object was weak.
>   */
>  #ifndef QOBJECT_H
>  #define QOBJECT_H
> @@ -81,6 +88,8 @@ static inline void qobject_ref_impl(QObject *obj)
>
>  /**
>   * qobject_is_equal(): Return whether the two objects are equal.
> + * @x: QObject pointer
> + * @y: QObject pointer
>   *
>   * Any of the pointers may be NULL; return true if both are.  Always
>   * return false if only one is (therefore a QNull object is not
> @@ -90,6 +99,7 @@ bool qobject_is_equal(const QObject *x, const QObject
> *y);
>
>  /**
>   * qobject_destroy(): Free resources used by the object
> + * @obj: QObject pointer
>   */
>  void qobject_destroy(QObject *obj);
>
> @@ -103,6 +113,7 @@ static inline void qobject_unref_impl(QObject *obj)
>
>  /**
>   * qobject_ref(): Increment QObject's reference count
> + * @obj: QObject pointer
>   *
>   * Returns: the same @obj. The type of @obj will be propagated to the
>   * return type.
> @@ -115,12 +126,14 @@ static inline void qobject_unref_impl(QObject *obj)
>
>  /**
>   * qobject_unref(): Decrement QObject's reference count, deallocate
> - * when it reaches zero
> + *                  when it reaches zero
> + * @obj: QObject pointer
>   */
>  #define qobject_unref(obj) qobject_unref_impl(QOBJECT(obj))
>
>  /**
>   * qobject_type(): Return the QObject's type
> + * @obj: QObject pointer
>   */
>  static inline QType qobject_type(const QObject *obj)
>  {
> @@ -130,6 +143,9 @@ static inline QType qobject_type(const QObject *obj)
>
>  /**
>   * qobject_check_type(): Helper function for the qobject_to() macro.
> + * @obj: QObject pointer
> + * @type: Expected type of QObject
> + *
>   * Return @obj, but only if @obj is not NULL and @type is equal to
>   * @obj's type.  Return NULL otherwise.
>   */
> diff --git a/qobject/qnum.c b/qobject/qnum.c
> index 7012fc57f2..017c8aa739 100644
> --- a/qobject/qnum.c
> +++ b/qobject/qnum.c
> @@ -17,6 +17,7 @@
>
>  /**
>   * qnum_from_int(): Create a new QNum from an int64_t
> + * @value: int64_t value
>   *
>   * Return strong reference.
>   */
> @@ -33,6 +34,7 @@ QNum *qnum_from_int(int64_t value)
>
>  /**
>   * qnum_from_uint(): Create a new QNum from an uint64_t
> + * @value: uint64_t value
>   *
>   * Return strong reference.
>   */
> @@ -49,6 +51,7 @@ QNum *qnum_from_uint(uint64_t value)
>
>  /**
>   * qnum_from_double(): Create a new QNum from a double
> + * @value: double value
>   *
>   * Return strong reference.
>   */
> @@ -65,6 +68,8 @@ QNum *qnum_from_double(double value)
>
>  /**
>   * qnum_get_try_int(): Get an integer representation of the number
> + * @qn: QNum object
> + * @val: pointer to value
>   *
>   * Return true on success.
>   */
> @@ -90,6 +95,7 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
>
>  /**
>   * qnum_get_int(): Get an integer representation of the number
> + * @qn: QNum object
>   *
>   * assert() on failure.
>   */
> @@ -102,7 +108,9 @@ int64_t qnum_get_int(const QNum *qn)
>  }
>
>  /**
> - * qnum_get_uint(): Get an unsigned integer from the number
> + * qnum_value_get_try_uint(): Get an unsigned integer from the number
> + * @qn: QNum object
> + * @val: pointer to value
>   *
>   * Return true on success.
>   */
> @@ -128,6 +136,7 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
>
>  /**
>   * qnum_get_uint(): Get an unsigned integer from the number
> + * @qn: QNum object
>   *
>   * assert() on failure.
>   */
> @@ -141,6 +150,7 @@ uint64_t qnum_get_uint(const QNum *qn)
>
>  /**
>   * qnum_get_double(): Get a float representation of the number
> + * @qn: QNum object
>   *
>   * qnum_get_double() loses precision for integers beyond 53 bits.
>   */
> @@ -200,6 +210,8 @@ char *qnum_to_string(QNum *qn)
>
>  /**
>   * qnum_is_equal(): Test whether the two QNums are equal
> + * @x: QNum object
> + * @y: QNum object
>   *
>   * Negative integers are never considered equal to unsigned integers,
>   * but positive integers in the range [0, INT64_MAX] are considered
> @@ -253,8 +265,9 @@ bool qnum_is_equal(const QObject *x, const QObject *y=
)
>  }
>
>  /**
> - * qnum_destroy_obj(): Free all memory allocated by a
> - * QNum object
> + * qnum_destroy_obj(): Free all memory allocated by a QNum object
> + *
> + * @obj: QNum object to be destroyed
>   */
>  void qnum_destroy_obj(QObject *obj)
>  {
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c16f5d05b449372c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:43 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Re=
nder existing doc comments at docs/devel/qobject.html.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/devel/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0docs/devel/qobject.rst=C2=A0 =C2=A0 =C2=A0| 11 +++++++++<br>
=C2=A0include/qapi/qmp/qnum.h=C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0include/qapi/qmp/qobject.h | 48 +++++++++++++++++++++++++------------=
-<br>
=C2=A0qobject/qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++=
++++++++++---<br>
=C2=A05 files changed, 63 insertions(+), 20 deletions(-)<br>
=C2=A0create mode 100644 docs/devel/qobject.rst<br>
<br>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
index f10ed77e4c..1cb39a9384 100644<br>
--- a/docs/devel/index.rst<br>
+++ b/docs/devel/index.rst<br>
@@ -35,3 +35,4 @@ Contents:<br>
=C2=A0 =C2=A0 clocks<br>
=C2=A0 =C2=A0 qom<br>
=C2=A0 =C2=A0 block-coroutine-wrapper<br>
+=C2=A0 =C2=A0qobject<br>
diff --git a/docs/devel/qobject.rst b/docs/devel/qobject.rst<br>
new file mode 100644<br>
index 0000000000..4f192ced7c<br>
--- /dev/null<br>
+++ b/docs/devel/qobject.rst<br>
@@ -0,0 +1,11 @@<br>
+QObject API<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+.. kernel-doc:: include/qapi/qmp/qobject.h<br>
+<br>
+QNum module<br>
+-----------<br>
+<br>
+.. kernel-doc:: include/qapi/qmp/qnum.h<br>
+<br>
+.. kernel-doc:: qobject/qnum.c<br>
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h<br>
index bbae0a5ec8..25f4733efc 100644<br>
--- a/include/qapi/qmp/qnum.h<br>
+++ b/include/qapi/qmp/qnum.h<br>
@@ -23,7 +23,9 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0QNUM_DOUBLE<br>
=C2=A0} QNumKind;<br>
<br>
-/*<br>
+/**<br>
+ * DOC:<br>
+ *<br>
=C2=A0 * QNum encapsulates how our dialect of JSON fills in the blanks left=
<br>
=C2=A0 * by the JSON specification (RFC 8259) regarding numbers.<br>
=C2=A0 *<br>
diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h<br>
index fcfd549220..bdc33bdb65 100644<br>
--- a/include/qapi/qmp/qobject.h<br>
+++ b/include/qapi/qmp/qobject.h<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- * QEMU Object Model.<br>
+ * QObject API<br>
=C2=A0 *<br>
=C2=A0 * Based on ideas by Avi Kivity &lt;<a href=3D"mailto:avi@redhat.com"=
 target=3D"_blank">avi@redhat.com</a>&gt;<br>
=C2=A0 *<br>
@@ -10,24 +10,31 @@<br>
=C2=A0 *<br>
=C2=A0 * This work is licensed under the terms of the GNU LGPL, version 2.1=
 or later.<br>
=C2=A0 * See the COPYING.LIB file in the top-level directory.<br>
+ */<br>
+<br>
+/**<br>
+ * DOC: QObject Reference Counts Terminology<br>
=C2=A0 *<br>
- * QObject Reference Counts Terminology<br>
- * ------------------------------------<br>
+ * Returning references<br>
+ * --------------------<br>
=C2=A0 *<br>
- *=C2=A0 - Returning references: A function that returns an object may<br>
- *=C2=A0 return it as either a weak or a strong reference.=C2=A0 If the<br=
>
- *=C2=A0 reference is strong, you are responsible for calling<br>
- *=C2=A0 qobject_unref() on the reference when you are done.<br>
+ * A function that returns an object may return it as either a<br>
+ * weak or a strong reference.=C2=A0 If the reference is strong, you<br>
+ * are responsible for calling qobject_unref() on the reference<br>
+ * when you are done.<br>
=C2=A0 *<br>
- *=C2=A0 If the reference is weak, the owner of the reference may free it =
at<br>
- *=C2=A0 any time in the future.=C2=A0 Before storing the reference anywhe=
re, you<br>
- *=C2=A0 should call qobject_ref() to make the reference strong.<br>
+ * If the reference is weak, the owner of the reference may free it at<br>
+ * any time in the future.=C2=A0 Before storing the reference anywhere, yo=
u<br>
+ * should call qobject_ref() to make the reference strong.<br>
=C2=A0 *<br>
- *=C2=A0 - Transferring ownership: when you transfer ownership of a refere=
nce<br>
- *=C2=A0 by calling a function, you are no longer responsible for calling<=
br>
- *=C2=A0 qobject_unref() when the reference is no longer needed.=C2=A0 In =
other words,<br>
- *=C2=A0 when the function returns you must behave as if the reference to =
the<br>
- *=C2=A0 passed object was weak.<br>
+ * Transferring ownership<br>
+ * ----------------------<br>
+ *<br>
+ * When you transfer ownership of a reference by calling a<br>
+ * function, you are no longer responsible for calling<br>
+ * qobject_unref() when the reference is no longer needed.=C2=A0 In<br>
+ * other words, when the function returns you must behave as if<br>
+ * the reference to the passed object was weak.<br>
=C2=A0 */<br>
=C2=A0#ifndef QOBJECT_H<br>
=C2=A0#define QOBJECT_H<br>
@@ -81,6 +88,8 @@ static inline void qobject_ref_impl(QObject *obj)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_is_equal(): Return whether the two objects are equal.<br>
+ * @x: QObject pointer<br>
+ * @y: QObject pointer<br>
=C2=A0 *<br>
=C2=A0 * Any of the pointers may be NULL; return true if both are.=C2=A0 Al=
ways<br>
=C2=A0 * return false if only one is (therefore a QNull object is not<br>
@@ -90,6 +99,7 @@ bool qobject_is_equal(const QObject *x, const QObject *y)=
;<br>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_destroy(): Free resources used by the object<br>
+ * @obj: QObject pointer<br>
=C2=A0 */<br>
=C2=A0void qobject_destroy(QObject *obj);<br>
<br>
@@ -103,6 +113,7 @@ static inline void qobject_unref_impl(QObject *obj)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_ref(): Increment QObject&#39;s reference count<br>
+ * @obj: QObject pointer<br>
=C2=A0 *<br>
=C2=A0 * Returns: the same @obj. The type of @obj will be propagated to the=
<br>
=C2=A0 * return type.<br>
@@ -115,12 +126,14 @@ static inline void qobject_unref_impl(QObject *obj)<b=
r>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_unref(): Decrement QObject&#39;s reference count, dealloca=
te<br>
- * when it reaches zero<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when it r=
eaches zero<br>
+ * @obj: QObject pointer<br>
=C2=A0 */<br>
=C2=A0#define qobject_unref(obj) qobject_unref_impl(QOBJECT(obj))<br>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_type(): Return the QObject&#39;s type<br>
+ * @obj: QObject pointer<br>
=C2=A0 */<br>
=C2=A0static inline QType qobject_type(const QObject *obj)<br>
=C2=A0{<br>
@@ -130,6 +143,9 @@ static inline QType qobject_type(const QObject *obj)<br=
>
<br>
=C2=A0/**<br>
=C2=A0 * qobject_check_type(): Helper function for the qobject_to() macro.<=
br>
+ * @obj: QObject pointer<br>
+ * @type: Expected type of QObject<br>
+ *<br>
=C2=A0 * Return @obj, but only if @obj is not NULL and @type is equal to<br=
>
=C2=A0 * @obj&#39;s type.=C2=A0 Return NULL otherwise.<br>
=C2=A0 */<br>
diff --git a/qobject/qnum.c b/qobject/qnum.c<br>
index 7012fc57f2..017c8aa739 100644<br>
--- a/qobject/qnum.c<br>
+++ b/qobject/qnum.c<br>
@@ -17,6 +17,7 @@<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_from_int(): Create a new QNum from an int64_t<br>
+ * @value: int64_t value<br>
=C2=A0 *<br>
=C2=A0 * Return strong reference.<br>
=C2=A0 */<br>
@@ -33,6 +34,7 @@ QNum *qnum_from_int(int64_t value)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_from_uint(): Create a new QNum from an uint64_t<br>
+ * @value: uint64_t value<br>
=C2=A0 *<br>
=C2=A0 * Return strong reference.<br>
=C2=A0 */<br>
@@ -49,6 +51,7 @@ QNum *qnum_from_uint(uint64_t value)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_from_double(): Create a new QNum from a double<br>
+ * @value: double value<br>
=C2=A0 *<br>
=C2=A0 * Return strong reference.<br>
=C2=A0 */<br>
@@ -65,6 +68,8 @@ QNum *qnum_from_double(double value)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_get_try_int(): Get an integer representation of the number<br=
>
+ * @qn: QNum object<br>
+ * @val: pointer to value<br>
=C2=A0 *<br>
=C2=A0 * Return true on success.<br>
=C2=A0 */<br>
@@ -90,6 +95,7 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_get_int(): Get an integer representation of the number<br>
+ * @qn: QNum object<br>
=C2=A0 *<br>
=C2=A0 * assert() on failure.<br>
=C2=A0 */<br>
@@ -102,7 +108,9 @@ int64_t qnum_get_int(const QNum *qn)<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
- * qnum_get_uint(): Get an unsigned integer from the number<br>
+ * qnum_value_get_try_uint(): Get an unsigned integer from the number<br>
+ * @qn: QNum object<br>
+ * @val: pointer to value<br>
=C2=A0 *<br>
=C2=A0 * Return true on success.<br>
=C2=A0 */<br>
@@ -128,6 +136,7 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)<b=
r>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_get_uint(): Get an unsigned integer from the number<br>
+ * @qn: QNum object<br>
=C2=A0 *<br>
=C2=A0 * assert() on failure.<br>
=C2=A0 */<br>
@@ -141,6 +150,7 @@ uint64_t qnum_get_uint(const QNum *qn)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_get_double(): Get a float representation of the number<br>
+ * @qn: QNum object<br>
=C2=A0 *<br>
=C2=A0 * qnum_get_double() loses precision for integers beyond 53 bits.<br>
=C2=A0 */<br>
@@ -200,6 +210,8 @@ char *qnum_to_string(QNum *qn)<br>
<br>
=C2=A0/**<br>
=C2=A0 * qnum_is_equal(): Test whether the two QNums are equal<br>
+ * @x: QNum object<br>
+ * @y: QNum object<br>
=C2=A0 *<br>
=C2=A0 * Negative integers are never considered equal to unsigned integers,=
<br>
=C2=A0 * but positive integers in the range [0, INT64_MAX] are considered<b=
r>
@@ -253,8 +265,9 @@ bool qnum_is_equal(const QObject *x, const QObject *y)<=
br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
- * qnum_destroy_obj(): Free all memory allocated by a<br>
- * QNum object<br>
+ * qnum_destroy_obj(): Free all memory allocated by a QNum object<br>
+ *<br>
+ * @obj: QNum object to be destroyed<br>
=C2=A0 */<br>
=C2=A0void qnum_destroy_obj(QObject *obj)<br>
=C2=A0{<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c16f5d05b449372c--

