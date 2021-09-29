Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B641CB1E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:35:52 +0200 (CEST)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdUl-0004Po-Ep
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVdRp-0003Yf-Hw
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:32:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVdRm-0006tR-R4
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Dye4a07YBrZmZSzmvHOP3hRnzmMHo4Bn3IKeU+f5a/w=; b=Q+4/4m0KbdkwnzSvLfad5GLuK3
 Xt63EXZaMU1W9Sp16LHkoA/rmXCdKjPHxJqrT24jKp6qGYD+n1cSKRC0LMfOiq1xrr3xA6mR8CCtz
 VTW34ttqY+SVN/D6kaGdzxhpObVs0XolwPQAHRqocOjFsEojfnr/krHS8+emafn4ixly0/kbfhO6g
 fpTL9oePEEkEF/Zsl3TPdQN2jNM8WqhODcRK2XAO1oY4SmMO8A2+iybOl7N54zhwtty9wOF2nhwyJ
 2Oe9n7NunAn6YAR4Se0DAzuuOuyzu/RYYSnWTsw+mQuBtkmN5TE8n1By8+Jl8llXWKqRbYR9usUCe
 eb8cu7cJrlox/BygMEYMn42M5J+3CoK33URUv/s0xCNGTaBz3w9kME0XkWPhtUEdH9u9macFe52vx
 AyrSCVN6cl0jMsFsTcLeOSAqWSgNIV+XMga+MMVeXjD+bFb2kY6tvf/naOVcLXB8xFzi4DHdS73C2
 UuWLUbs4Qe3dS49x614k5MpB5jrxbTV9B35q/UixImkjoxi7GbO7GgZQLBHsRf+l/Vl5kPdvabqob
 ATBYkughuZDpd0ht+LRrP4iFIMzVmTygtj+9wTr9/LNghZ9Ni85F6ePd1ahsAkTjbHmFgRRk7Pwf8
 Bw2u8kzUWYzUX7s7HE4tS/iOOEOJ6Bc6zCX3kCExI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Date: Wed, 29 Sep 2021 19:32:39 +0200
Message-ID: <3065428.eF6XsjkFDY@silver>
In-Reply-To: <YVNFlwiw9sJS4cea@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <3048101.GpayOE22Id@silver> <YVNFlwiw9sJS4cea@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 28. September 2021 18:41:17 CEST Daniel P. Berrang=E9 wrote:
> On Tue, Sep 28, 2021 at 06:23:23PM +0200, Christian Schoenebeck wrote:
> > On Dienstag, 28. September 2021 15:04:36 CEST Daniel P. Berrang=E9 wrot=
e:
> > > On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck wrote:
[...]
> > > If using QArray, it still has to keep passing around the
> > > 'size_t naddrs' value because QArray hides the length
> > > field from the code.
> >=20
> > Well no, you don't need to pass around anything, as the array length is
> > always accessible; it is always just (compile time) constant -wordsize
> > (-padding) offset away from the C-array pointer. Maybe the phrasing
> > "private" was a bit misleading in the QArray.h comments.
> >=20
> > It is correct that my 9p use case so far did not need the array length
> > info by means of accessing an API, for that reason I really just ommitt=
ed
> > (yet) to add a separate patch for that. All it would take was extending
> > QArray.h in a way like (roughly):
> >=20
> > typedef struct _QArrayGeneric {
> >=20
> >     size_t len;
> >     char first[];
> >=20
> > } _QArrayGeneric;
> >=20
> > /**
> >=20
> >  * Returns the amount of scalar elements in the passed array.
> >  *
> >  * @param first - start of array
> >  */
> >=20
> > size_t qarray_len(void* first)
> > {
> >=20
> >     if (!first) {
> >    =20
> >         return 0;
> >    =20
> >     }
> >     _QArrayGeneric *arr =3D (_QArrayGeneric *) (
> >    =20
> >         ((char *)first) - offsetof(_QArrayGeneric, first)
> >    =20
> >     );
> >     return arr->len;
> >=20
> > }
> >=20
> > #define QARRAY_LEN(arr) qarray_len(arr)
> >=20
> > And as this is generic code for all array scalar types, it would probab=
ly
> > be partly placed in a separate qarray.c file.
> >=20
> > After that change your user example would become:
> >   for (i =3D 0; i < QARRAY_LEN(addrs); i++) {
> >  =20
> >       ...try to connect to addrs[i]...
> >  =20
> >   }
> >=20
> > If you want I can post a v3 with a formal patch (or two) to handle that
> > array length API.
>=20
> I still find this all overkill compared to just exposing the
> array struct explicitly.

Yes, you made that clear. :)

> > > If it instead just exposed the array struct explicitly, it can
> > > use the normal g_autoptr() declarator, and can also now just
> > > return the array directly since it is a single pointer
> > >=20
> > >   int open_conn(const char *hostname) {
> > >  =20
> > >     g_autoptr(SocketAddressArray) addrs =3D NULL;
> > >     int ret =3D -1;
> > >     size_t i;
> > >    =20
> > >     if (!(addrs =3D resolve_hostname(hostname)))
> > >    =20
> > >         return -1;
> > >    =20
> > >     for (i =3D 0; i < addrs.len; i++) {
> > >    =20
> > >         ...try to connect to addrs.data[i]...
> > >    =20
> > >     }
> > >    =20
> > >     ret =3D 0
> > >   =20
> > >    cleanup:
> > >     return ret;
> > >  =20
> > >   }
> > >=20
> > > In terms of the first example, it adds an indirection to access
> > > the array data, but on the plus side IMHO the code is clearer
> > > because it uses 'g_autoptr' which is what is more in line with
> > > what is expected for variables that are automatically freed.
> > > QArrayRef() as a name doesn't make it clear that the value will
> > > be freed.
> > >=20
> > >    void doSomething(int n) {
> > >   =20
> > >        g_autoptr(FooArray) foos =3D NULL;
> > >        QARRAY_CREATE(Foo, foos, n);
> > >        for (size_t i =3D 0; i < foos.len; ++i) {
> > >       =20
> > >            foos.data[i].i =3D i;
> > >            foos.data[i].s =3D calloc(4096, 1);
> > >            snprintf(foos.data[i].s, 4096, "foo %d", i);
> > >       =20
> > >        }
> > >   =20
> > >    }
> >=20
> > Well, that would destroy the intended major feature "as little refactor=
ing
> > as possible". The amount of locations where you define a reference
> > variable is usually much smaller than the amount of code locations where
> > you actually access arrays.
>=20
> If there's a large amount of existing code refactoring to be avoided
> an intermediate variable can be declared to point to the struct field
> to avoid the field references.

That would be one additional (unguarded) raw pointer variable per array &=20
function, that multiplied by the amount of arrays and functions ...

=2E.. the suggested shared utility code is 34 lines LOC net.

> > Personally I would not mix in this case macros of foreign libraries (gl=
ib)
> > with macros of a local framework (QArray), because if for some reason o=
ne
> > of the two deviate in future in a certain way, you would need to refact=
or
> > a whole bunch of user code. By just separating those definitions from d=
ay
> > one, you can avoid such future refactoring work right from the start.
>=20
> The GLib automatic memory support is explicitly designed to be extendd
> with support for application specific types. We already do exactly that
> all over QEMU with many calls to G_DEFINE_AUTOPTR_CLEANUP_FUNC(..) to
> register functions for free'ing specific types, such that you can
> use 'g_autoptr' with them.

Ok, just to make sure that I am not missing something here, because really =
if=20
there is already something that does the job that I simply haven't seen, th=
en=20
I happily drop this QArray code.

But AFAICS this G_DEFINE_AUTOPTR_CLEANUP_FUNC() & g_autoptr concept does no=
t=20
have any notion of "size" or "amount", right?

So let's say you already have the following type and cleanup function in yo=
ur=20
existing code:

typedef struct MyScalar {
    int a;
    char *b;
} MyScalar;

void myscalar_free(MayScalar *s) {
    g_free(s->b);
}

Then if you want to use G_DEFINE_AUTOPTR_CLEANUP_FUNC() for an array on tha=
t=20
scalar type, then you still would need to *manually* write additionally a=20
separate type and cleanup function like:

typedef struct MyArray {
    MyScalar *s;
    int n;
};

void myarray_free(MyArray *a) {
    for (int i =3D 0; i < a->n; ++i) {
        myscalar_free(a->s[i]);
    }
    g_free(a);
}

Plus you have to manually populate that field 'n' after allocation.

Am I wrong?

> > As far as the terminology is concerned: probably a matter of taste. For=
 me
> > a "reference" implies (either unique or shared) ownership, a "pointer"
> > IMO doesn't. And the usage of QArray alone makes it clear that an array
> > without any references gets automatically freed.
>=20
> It is more important than a matter of taste - it is about having a
> consistent approach throughout QEMU. That means automatic free'ing of
> variables should involve g_autoptr, not something custom to a specific ty=
pe
> with different terminology.

The barriers to add few lines of utility code are really high. :)

> > > I would also suggest that QARRAY_CREATE doesn't need to
> > > exist as a macro - callers could just use the allocator
> > > function directly for clearer code, if it was changed to
> > >=20
> > > return the ptr rather than use an out parameter:
> > >    void doSomething(int n) {
> > >   =20
> > >        g_autoptr(FooArray) foos =3D foo_array_new(n);
> > >        for (size_t i =3D 0; i < foos.len; ++i) {
> > >       =20
> > >            foos.data[i].i =3D i;
> > >            foos.data[i].s =3D calloc(4096, 1);
> > >            snprintf(foos.data[i].s, 4096, "foo %d", i);
> > >       =20
> > >        }
> > >   =20
> > >    }
> > >=20
> > > For this it needs to pass 2 args into the DECLARE_QARRAY_TYPE
> > > macro - the struct name and desired method name - basically
> > > the method name is the struct name in lowercase with underscores.
> >=20
> > As you can see with patch 2, one of the movations of making this a macro
> > was>=20
> > the intention to increase strictness of type safety, e.g to make things=
=20
like:
> > 	void *p;
> > 	...
> > 	QARRAY_CREATE(FooType, p, n);
> >=20
> > to raise a compiler error immediately, but that's not all ...
> >=20
> > > Overall I think the goal of having an convenient sized array for
> > > types is good, but I think we should make it look a bit less
> > > magic. I think we only need the DECLARE_QARRAY_TYPE and
> > > DEFINE_QARRAY_TYPE macros.
> >=20
> > ... actually making it appear anything like magic was not my intention.
> > The
> > actual main reason for wrapping these things into macros is because tha=
t's
> > actually the only way to write generic code in C. Especially in larger
> > projects like this one I favour clear separation of API ("how to use it=
")
> > from its actual implementation ("how does it do it exactly").
> >=20
> > So if you use macros for all those things from the beginning, it is far
> > less likely that you will need to refactor a huge amount of user code
> > with future changes of this array framework.
>=20
> I can't see the array framework being complex enough that it will be
> changed in a way that invalidates existing usage.

Well, there are some things that would come to my mind (e.g. strong vs. wea=
k=20
refs) , but I think for now my upper question is more important ATM, i.e.=20
whether there is already something that does the job (right).
=20
> > > Incidentally, I'd suggest naming to be QARRAY_DECLARE_TYPE
> > > and QARRAY_DEFINE_TYPE.
> >=20
> > Also a matter of taste I guess. The suggested naming DECLARE_QARRAY_TYP=
E()
> > and DEFINE_QARRAY_TYPE() reflect more natural language IMO.
>=20
> I consider the QEMU normal practice for namespacing types/macros/functions
> is to have the typename as the first component.
>=20
> Regards,
> Daniel



