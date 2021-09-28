Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6141B41A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:42:58 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGC1-0004Ya-DD
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGAi-0003dF-Rw
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGAf-0002Ns-G0
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632847292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMs59WQWJAh3IiyL8P3Ygr1sb0GumoQ+HF40Il+JFN0=;
 b=B6jgFoqqjjwRMs+cp78Hs7Tx0I/CmgcnNk8tlrgHMUba6VKRxl2ZJOv+CO7ys02GawGCxM
 Imw+HLz687dMUsCpqpKNl+wcY9QWC5wnppzQopat6upzwbYT5621MC30tlSM8kqU2lO353
 WviTzRgAh5XNvk5nMw4zIVdbwETno4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-0QBZjccQPRS5DAUCBrCakQ-1; Tue, 28 Sep 2021 12:41:22 -0400
X-MC-Unique: 0QBZjccQPRS5DAUCBrCakQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D521006AA5;
 Tue, 28 Sep 2021 16:41:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A25755F91D;
 Tue, 28 Sep 2021 16:41:19 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:41:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Message-ID: <YVNFlwiw9sJS4cea@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 <YVMS5K5ZqyZGSDxf@redhat.com> <3048101.GpayOE22Id@silver>
MIME-Version: 1.0
In-Reply-To: <3048101.GpayOE22Id@silver>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 06:23:23PM +0200, Christian Schoenebeck wrote:
> On Dienstag, 28. September 2021 15:04:36 CEST Daniel P. Berrangé wrote:
> > On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck wrote:
> > > Implements deep auto free of arrays while retaining common C-style
> > > squared bracket access.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 150 insertions(+)
> > >  create mode 100644 include/qemu/qarray.h
> > > 
> > > diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> > > new file mode 100644
> > > index 0000000000..9885e5e9ed
> > > --- /dev/null
> > > +++ b/include/qemu/qarray.h
> > > @@ -0,0 +1,150 @@
> > > 
> > > +#ifndef QEMU_QARRAY_H
> > > +#define QEMU_QARRAY_H
> > > +
> > > +/**
> > > + * QArray provides a mechanism to access arrays in common C-style (e.g.
> > > by
> > > + * square bracket [] operator) in conjunction with reference variables
> > > that + * perform deep auto free of the array when leaving the scope of
> > > the auto + * reference variable. That means not only is the array itself
> > > automatically + * freed, but also memory dynamically allocated by the
> > > individual array + * elements.
> > > + *
> > > + * Example:
> > > + *
> > > + * Consider the following user struct @c Foo which shall be used as
> > > scalar
> > > + * (element) type of an array:
> > > + * @code
> > > + * typedef struct Foo {
> > > + *     int i;
> > > + *     char *s;
> > > + * } Foo;
> > > + * @endcode
> > > + * and assume it has the following function to free memory allocated by
> > > @c Foo + * instances:
> > > + * @code
> > > + * void free_foo(Foo *foo) {
> > > + *     free(foo->s);
> > > + * }
> > > + * @endcode
> > > + * Add the following to a shared header file:
> > > + * @code
> > > + * DECLARE_QARRAY_TYPE(Foo);
> > > + * @endcode
> > > + * and the following to a C unit file:
> > > + * @code
> > > + * DEFINE_QARRAY_TYPE(Foo, free_foo);
> > > + * @endcode
> > > + * Finally the array may then be used like this:
> > > + * @code
> > > + * void doSomething(int n) {
> > > + *     QArrayRef(Foo) foos = NULL;
> > > + *     QARRAY_CREATE(Foo, foos, n);
> > > + *     for (size_t i = 0; i < n; ++i) {
> > > + *         foos[i].i = i;
> > > + *         foos[i].s = calloc(4096, 1);
> > > + *         snprintf(foos[i].s, 4096, "foo %d", i);
> > > + *     }
> > > + * }
> > 
> > So essentially here the 'foos' variable is still a plain C array
> > from POV of the caller ie it is a  'Foo *foos'
> 
> Yes, that's the main feature probably: getting rid of any (n times) manually 
> written deep-free code branches while at the same time keeping the burden low, 
> i.e. requiring to refactor as little existing code as possible, as it is still 
> a "normal" C-array from user code perspective, just with meta info prepended 
> in front of the C-array that the user code however does not need to care about 
> at all:
> 
>   Contiguous Memory Space ->
>   ----------------------------------------------------------
>   | Array-Meta-Info | Scalar 0 | Scalar 1 | ... | Scalar n |
>   ----------------------------------------------------------
> 
>   ^- QArrayFoo*     ^- Foo*
> 
> So switching between the two is just +- const_offset math.
> 
> Plus this has the positive side effect that a C-style array code is better to 
> the human eye.
> 
> For now that "Array-Meta-Info" is really just the array size, in future this 
> might be extended to contain a reference count for instance. And as this 
> concept is actually generic code (a.k.a template code), you could also extend 
> this in a way where you just pull in features that you really need in user 
> code. I.e. if you don't need an atomic reference count at one place (and avoid 
> the sync overhead), don't enable it for your use case. If you need it 
> somewhere else, then enable it there.
> 
> > By QARRAY_CREATE() is actually allocating a 'QArrayFoo' which
> > is a struct containing a 'size_t len' along with the 'Foo *foos'
> > entry.
> > 
> > This is a clever trick, and it works in the example above,
> > because the code already has the length available in a
> > convenient way via the 'int n' parameter.
> > 
> > IMHO this makes the code less useful than it otherwise would
> > be in the general case, because there are places where the code
> > needs to pass around the array and its assoicated length, and
> > so this with this magic hidden length, we're still left to pass
> > around the length separately.
> > 
> > Consider this example:
> > 
> >   int open_conn(const char *hostname) {
> >     SocketAddress *addrs;
> >     size_t naddrs;
> >     int ret = -1;
> >     size_t i;
> > 
> >     if (resolve_hostname(hostname, &addrs, &naddrs) < 0)
> >         return -1;
> > 
> >     for (i = 0; i < naddrs; i++) {
> >         ...try to connect to addrs[i]...
> >     }
> > 
> >     ret = 0
> >    cleanup:
> >     for (i = 0; i < naddrs; i++) {
> >        qapi_free_SocketAddress(addrs[i])
> >     }
> >     return ret;
> >   }
> > 
> > To simplify this it is deisrable to autofree the 'addrs'
> > array.
> > 
> > If using QArray, it still has to keep passing around the
> > 'size_t naddrs' value because QArray hides the length
> > field from the code.
> 
> Well no, you don't need to pass around anything, as the array length is always 
> accessible; it is always just (compile time) constant -wordsize (-padding) 
> offset away from the C-array pointer. Maybe the phrasing "private" was a bit 
> misleading in the QArray.h comments.
> 
> It is correct that my 9p use case so far did not need the array length info by 
> means of accessing an API, for that reason I really just ommitted (yet) to add 
> a separate patch for that. All it would take was extending QArray.h in a way 
> like (roughly):
> 
> typedef struct _QArrayGeneric {
>     size_t len;
>     char first[];
> } _QArrayGeneric;
> 
> /**
>  * Returns the amount of scalar elements in the passed array.
>  *
>  * @param first - start of array
>  */
> size_t qarray_len(void* first)
> {
>     if (!first) {
>         return 0;
>     }
>     _QArrayGeneric *arr = (_QArrayGeneric *) (
>         ((char *)first) - offsetof(_QArrayGeneric, first)
>     );
>     return arr->len;
> }
> 
> #define QARRAY_LEN(arr) qarray_len(arr)
> 
> And as this is generic code for all array scalar types, it would probably be 
> partly placed in a separate qarray.c file.
> 
> After that change your user example would become:
> 
>   for (i = 0; i < QARRAY_LEN(addrs); i++) {
>       ...try to connect to addrs[i]...
>   }
> 
> If you want I can post a v3 with a formal patch (or two) to handle that array 
> length API.

I still find this all overkill compared to just exposing the
array struct explicitly.

> > If it instead just exposed the array struct explicitly, it can
> > use the normal g_autoptr() declarator, and can also now just
> > return the array directly since it is a single pointer
> > 
> > 
> >   int open_conn(const char *hostname) {
> >     g_autoptr(SocketAddressArray) addrs = NULL;
> >     int ret = -1;
> >     size_t i;
> > 
> >     if (!(addrs = resolve_hostname(hostname)))
> >         return -1;
> > 
> >     for (i = 0; i < addrs.len; i++) {
> >         ...try to connect to addrs.data[i]...
> >     }
> > 
> >     ret = 0
> >    cleanup:
> >     return ret;
> >   }
> > 
> > 
> > In terms of the first example, it adds an indirection to access
> > the array data, but on the plus side IMHO the code is clearer
> > because it uses 'g_autoptr' which is what is more in line with
> > what is expected for variables that are automatically freed.
> > QArrayRef() as a name doesn't make it clear that the value will
> > be freed.
> > 
> >    void doSomething(int n) {
> >        g_autoptr(FooArray) foos = NULL;
> >        QARRAY_CREATE(Foo, foos, n);
> >        for (size_t i = 0; i < foos.len; ++i) {
> >            foos.data[i].i = i;
> >            foos.data[i].s = calloc(4096, 1);
> >            snprintf(foos.data[i].s, 4096, "foo %d", i);
> >        }
> >    }
> 
> Well, that would destroy the intended major feature "as little refactoring as 
> possible". The amount of locations where you define a reference variable is 
> usually much smaller than the amount of code locations where you actually 
> access arrays.

If there's a large amount of existing code refactoring to be avoided
an intermediate variable can be declared to point to the struct field
to avoid the field references.

> Personally I would not mix in this case macros of foreign libraries (glib) 
> with macros of a local framework (QArray), because if for some reason one of 
> the two deviate in future in a certain way, you would need to refactor a whole 
> bunch of user code. By just separating those definitions from day one, you can 
> avoid such future refactoring work right from the start.

The GLib automatic memory support is explicitly designed to be extendd
with support for application specific types. We already do exactly that
all over QEMU with many calls to G_DEFINE_AUTOPTR_CLEANUP_FUNC(..) to
register functions for free'ing specific types, such that you can
use 'g_autoptr' with them. 

> As far as the terminology is concerned: probably a matter of taste. For me a 
> "reference" implies (either unique or shared) ownership, a "pointer" IMO 
> doesn't. And the usage of QArray alone makes it clear that an array without 
> any references gets automatically freed.

It is more important than a matter of taste - it is about having a consistent
approach throughout QEMU. That means automatic free'ing of variables should
involve g_autoptr, not something custom to a specific type with different
terminology.

> > I would also suggest that QARRAY_CREATE doesn't need to
> > exist as a macro - callers could just use the allocator
> > function directly for clearer code, if it was changed to
> > return the ptr rather than use an out parameter:
> > 
> >    void doSomething(int n) {
> >        g_autoptr(FooArray) foos = foo_array_new(n);
> >        for (size_t i = 0; i < foos.len; ++i) {
> >            foos.data[i].i = i;
> >            foos.data[i].s = calloc(4096, 1);
> >            snprintf(foos.data[i].s, 4096, "foo %d", i);
> >        }
> >    }
> > 
> > For this it needs to pass 2 args into the DECLARE_QARRAY_TYPE
> > macro - the struct name and desired method name - basically
> > the method name is the struct name in lowercase with underscores.
> 
> As you can see with patch 2, one of the movations of making this a macro was 
> the intention to increase strictness of type safety, e.g to make things like:
> 
> 	void *p;
> 	...
> 	QARRAY_CREATE(FooType, p, n);
> 
> to raise a compiler error immediately, but that's not all ...
> 
> > Overall I think the goal of having an convenient sized array for
> > types is good, but I think we should make it look a bit less
> > magic. I think we only need the DECLARE_QARRAY_TYPE and
> > DEFINE_QARRAY_TYPE macros.
> 
> ... actually making it appear anything like magic was not my intention. The 
> actual main reason for wrapping these things into macros is because that's 
> actually the only way to write generic code in C. Especially in larger 
> projects like this one I favour clear separation of API ("how to use it") from 
> its actual implementation ("how does it do it exactly").
> 
> So if you use macros for all those things from the beginning, it is far less 
> likely that you will need to refactor a huge amount of user code with future 
> changes of this array framework.

I can't see the array framework being complex enough that it will be
changed in a way that invalidates existing usage.

> 
> > Incidentally, I'd suggest naming to be QARRAY_DECLARE_TYPE
> > and QARRAY_DEFINE_TYPE.
> 
> Also a matter of taste I guess. The suggested naming DECLARE_QARRAY_TYPE() and 
> DEFINE_QARRAY_TYPE() reflect more natural language IMO.

I consider the QEMU normal practice for namespacing types/macros/functions
is to have the typename as the first component.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


