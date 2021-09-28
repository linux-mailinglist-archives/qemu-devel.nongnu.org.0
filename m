Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D085341B100
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:38:35 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDJa-0006jp-US
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCn0-00072t-Qe
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCmw-0007hG-Cj
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632834288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pvEeJInqiPLsgVJBSXPan8XqPHASLrR6WtmGMClEIeo=;
 b=AUmnwWO6fxAS6EtSGsxrD4NzA0vIzhmrNNzBYlKuRPvGmu0FmpVPFwZdGyZvk7UPkeB2y6
 xf0PVZitMcWL0JnQjjAOz/0BLmm11/T+pVuqUY/TyflyAf/8j6R8ug0kI2fXNN3yijSJFu
 1N++JI9K9HKiqeabLvk3oEkm4DLCaiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-dq4J19mMMHGUEhVTPKODKw-1; Tue, 28 Sep 2021 09:04:46 -0400
X-MC-Unique: dq4J19mMMHGUEhVTPKODKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 713E03FB0;
 Tue, 28 Sep 2021 13:04:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F9A65C23A;
 Tue, 28 Sep 2021 13:04:44 +0000 (UTC)
Date: Tue, 28 Sep 2021 14:04:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Message-ID: <YVMS5K5ZqyZGSDxf@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck wrote:
> Implements deep auto free of arrays while retaining common C-style
> squared bracket access.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 include/qemu/qarray.h
> 
> diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> new file mode 100644
> index 0000000000..9885e5e9ed
> --- /dev/null
> +++ b/include/qemu/qarray.h
> @@ -0,0 +1,150 @@

> +#ifndef QEMU_QARRAY_H
> +#define QEMU_QARRAY_H
> +
> +/**
> + * QArray provides a mechanism to access arrays in common C-style (e.g. by
> + * square bracket [] operator) in conjunction with reference variables that
> + * perform deep auto free of the array when leaving the scope of the auto
> + * reference variable. That means not only is the array itself automatically
> + * freed, but also memory dynamically allocated by the individual array
> + * elements.
> + *
> + * Example:
> + *
> + * Consider the following user struct @c Foo which shall be used as scalar
> + * (element) type of an array:
> + * @code
> + * typedef struct Foo {
> + *     int i;
> + *     char *s;
> + * } Foo;
> + * @endcode
> + * and assume it has the following function to free memory allocated by @c Foo
> + * instances:
> + * @code
> + * void free_foo(Foo *foo) {
> + *     free(foo->s);
> + * }
> + * @endcode
> + * Add the following to a shared header file:
> + * @code
> + * DECLARE_QARRAY_TYPE(Foo);
> + * @endcode
> + * and the following to a C unit file:
> + * @code
> + * DEFINE_QARRAY_TYPE(Foo, free_foo);
> + * @endcode
> + * Finally the array may then be used like this:
> + * @code
> + * void doSomething(int n) {
> + *     QArrayRef(Foo) foos = NULL;
> + *     QARRAY_CREATE(Foo, foos, n);
> + *     for (size_t i = 0; i < n; ++i) {
> + *         foos[i].i = i;
> + *         foos[i].s = calloc(4096, 1);
> + *         snprintf(foos[i].s, 4096, "foo %d", i);
> + *     }
> + * }

So essentially here the 'foos' variable is still a plain C array
from POV of the caller ie it is a  'Foo *foos'

By QARRAY_CREATE() is actually allocating a 'QArrayFoo' which
is a struct containing a 'size_t len' along with the 'Foo *foos'
entry.

This is a clever trick, and it works in the example above,
because the code already has the length available in a
convenient way via the 'int n' parameter.

IMHO this makes the code less useful than it otherwise would
be in the general case, because there are places where the code
needs to pass around the array and its assoicated length, and
so this with this magic hidden length, we're still left to pass
around the length separately.

Consider this example:

  int open_conn(const char *hostname) {
    SocketAddress *addrs;
    size_t naddrs;
    int ret = -1;
    size_t i;

    if (resolve_hostname(hostname, &addrs, &naddrs) < 0)
        return -1;

    for (i = 0; i < naddrs; i++) {
        ...try to connect to addrs[i]...
    }

    ret = 0
   cleanup:
    for (i = 0; i < naddrs; i++) {
       qapi_free_SocketAddress(addrs[i])
    }
    return ret;
  }

To simplify this it is deisrable to autofree the 'addrs'
array.

If using QArray, it still has to keep passing around the
'size_t naddrs' value because QArray hides the length
field from the code.


  int open_conn(const char *hostname) {
    QArrayRef(SocketAddress) addrs = NULL;
    size_t naddrs;
    int ret = -1;
    size_t i;

    if (resolve_hostname(hostname, &addrs, &naddrs) < 0)
        return -1;

    for (i = 0; i < naddrs; i++) {
        ...try to connect to addrs[i]...
    }

    ret = 0
   cleanup:
    return ret;
  }


If it instead just exposed the array struct explicitly, it can
use the normal g_autoptr() declarator, and can also now just
return the array directly since it is a single pointer


  int open_conn(const char *hostname) {
    g_autoptr(SocketAddressArray) addrs = NULL;
    int ret = -1;
    size_t i;

    if (!(addrs = resolve_hostname(hostname)))
        return -1;

    for (i = 0; i < addrs.len; i++) {
        ...try to connect to addrs.data[i]...
    }

    ret = 0
   cleanup:
    return ret;
  }


In terms of the first example, it adds an indirection to access
the array data, but on the plus side IMHO the code is clearer
because it uses 'g_autoptr' which is what is more in line with
what is expected for variables that are automatically freed.
QArrayRef() as a name doesn't make it clear that the value will
be freed.

   void doSomething(int n) {
       g_autoptr(FooArray) foos = NULL;
       QARRAY_CREATE(Foo, foos, n);
       for (size_t i = 0; i < foos.len; ++i) {
           foos.data[i].i = i;
           foos.data[i].s = calloc(4096, 1);
           snprintf(foos.data[i].s, 4096, "foo %d", i);
       }
   }

I would also suggest that QARRAY_CREATE doesn't need to
exist as a macro - callers could just use the allocator
function directly for clearer code, if it was changed to
return the ptr rather than use an out parameter:

   void doSomething(int n) {
       g_autoptr(FooArray) foos = foo_array_new(n);
       for (size_t i = 0; i < foos.len; ++i) {
           foos.data[i].i = i;
           foos.data[i].s = calloc(4096, 1);
           snprintf(foos.data[i].s, 4096, "foo %d", i);
       }
   }

For this it needs to pass 2 args into the DECLARE_QARRAY_TYPE
macro - the struct name and desired method name - basically
the method name is the struct name in lowercase with underscores.

Overall I think the goal of having an convenient sized array for
types is good, but I think we should make it look a bit less
magic. I think we only need the DECLARE_QARRAY_TYPE and
DEFINE_QARRAY_TYPE macros.

Incidentally, I'd suggest naming to be QARRAY_DECLARE_TYPE
and QARRAY_DEFINE_TYPE.



> + * @endcode
> + */
> +
> +/**
> + * Declares an array type for the passed @a scalar_type.
> + *
> + * This is typically used from a shared header file.
> + *
> + * @param scalar_type - type of the individual array elements
> + */
> +#define DECLARE_QARRAY_TYPE(scalar_type) \
> +    typedef struct QArray##scalar_type { \
> +        size_t len; \
> +        scalar_type first[]; \
> +    } QArray##scalar_type; \
> +    \
> +    void qarray_create_##scalar_type(scalar_type **auto_var, size_t len); \
> +    void qarray_auto_free_##scalar_type(scalar_type **auto_var); \
> +
> +/**
> + * Defines an array type for the passed @a scalar_type and appropriate
> + * @a scalar_cleanup_func.
> + *
> + * This is typically used from a C unit file.
> + *
> + * @param scalar_type - type of the individual array elements
> + * @param scalar_cleanup_func - appropriate function to free memory dynamically
> + *                              allocated by individual array elements before
> + */
> +#define DEFINE_QARRAY_TYPE(scalar_type, scalar_cleanup_func) \
> +    void qarray_create_##scalar_type(scalar_type **auto_var, size_t len) \
> +    { \
> +        qarray_auto_free_##scalar_type(auto_var); \
> +        QArray##scalar_type *arr = g_malloc0(sizeof(QArray##scalar_type) + \
> +            len * sizeof(scalar_type)); \
> +        arr->len = len; \
> +        *auto_var = &arr->first[0]; \
> +    } \
> +    \
> +    void qarray_auto_free_##scalar_type(scalar_type **auto_var) \
> +    { \
> +        scalar_type *first = (*auto_var); \
> +        if (!first) { \
> +            return; \
> +        } \
> +        QArray##scalar_type *arr = (QArray##scalar_type *) ( \
> +            ((char *)first) - offsetof(QArray##scalar_type, first) \
> +        ); \
> +        for (size_t i = 0; i < arr->len; ++i) { \
> +            scalar_cleanup_func(&arr->first[i]); \
> +        } \
> +        g_free(arr); \
> +    } \
> +
> +/**
> + * Used to declare a reference variable (unique pointer) for an array. After
> + * leaving the scope of the reference variable, the associated array is
> + * automatically freed.
> + *
> + * @param scalar_type - type of the individual array elements
> + */
> +#define QArrayRef(scalar_type) \
> +    __attribute((__cleanup__(qarray_auto_free_##scalar_type))) scalar_type*
> +
> +/**
> + * Allocates a new array of passed @a scalar_type with @a len number of array
> + * elements and assigns the created array to the reference variable
> + * @a auto_var.
> + *
> + * @param scalar_type - type of the individual array elements
> + * @param auto_var - destination reference variable
> + * @param len - amount of array elements to be allocated immediately
> + */
> +#define QARRAY_CREATE(scalar_type, auto_var, len) \
> +    qarray_create_##scalar_type((&auto_var), len)
> +
> +#endif /* QEMU_QARRAY_H */
> -- 
> 2.20.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


