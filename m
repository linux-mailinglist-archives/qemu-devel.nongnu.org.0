Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B455FFE0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:32:38 +0200 (CEST)
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Wry-0001dB-PI
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o6Wnp-0008RQ-3d
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:28:17 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o6Wnm-0000Jz-Ic
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:
 Content-ID:Content-Description;
 bh=16r/dqd3X/j6bwBVaw1n7sJe+XdPoP0HyjhYQD/4ZZ0=; b=SomiYbLOy+X0VPzbqlS196YHA4
 ByHywbXO+e/CnWR9AxuU3wBg0KcKCZ7CeHiplluKaDKeFvcFqzxnMYXJGNoALqohK+8y+C2amG8ZW
 CAHZpHSAOh6UsYZK/bHjbTQkwTZUPmDD/UmPf22NStEap9CeKfEtKDE45Duk2REdTLOqghJZkNYnB
 986NT4x4BkIvZdaLk5/G/qCWH7eau3NuEjgGz4nSQRYbFkRywV2Jb8HK5da7EvWNbmX5YfoC7uBQS
 ehVG1Vx+J+oV/LR4Ft/DEdlH4jWCRCUFx+lCV0CxHboCiJsyPukCWp+4SOHykEk53uCkfxK9Ck5eL
 QB5DZbTzTAox+rtF5TRMqvoJ6dKGFYxwvOOeAdRGP/Qmixbu+/O2/H8prf3NKDT/LliZqoSTdeLeL
 rc4K/+uZhdwgoXujOHIjf5laa9IynadQTvrILF1Od9OByOWwgjcvRasneX1O0fBHnlNYT2WpxFZwX
 ij9GAVLDF+GOy52jmeqW6kHrFWRsDxAEQptESk/D6SZUBi3ixKbEGXrIVQ7UPiixTiVeX7kYbz7TP
 AGmxfKxGrW+H9ruqhyC1OUeD+6A8VLQKqi1VZKO6qygA9B3d4QJxmgV6wSlarlUTN4YdpuTKpQC04
 9LpGBsuiwohJQuVNnBcrSd923q9wRAi2SIs8LQ5Ac=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH] tests/9p: introduce declarative function calls
Date: Wed, 29 Jun 2022 14:28:08 +0200
Message-ID: <2207225.vfURlT2vNz@silver>
In-Reply-To: <20220629093502.38b99945@bahia>
References: <E1o4nzC-0005fT-RL@lizzy.crudebyte.com>
 <20220629093502.38b99945@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 29. Juni 2022 09:35:02 CEST Greg Kurz wrote:
> Hi Christian,

Hi Greg,

first off, this RFC patch was really just yet intended for discussing the high
aspect coding style idea of using named function arguments in general (with a
random example), i.e. checking acceptance, but also to see whether somebody
sees a way to code this more elegantly.

In a more perfect (C-)universe I would like to code named function args like:

    void someTask(struct { int a = -1; char b; double c; } opt) {
        ...
    }
    ...
    someTask({ .a = 3, .c = 3.141 });

So using an anonymous struct in the function signature (that part works
actually in C, with a compiler warning though), but the problem is that the
function call would need a type cast:

    someTask((SomeType) { .a = 3, .c = 3.141 });

Which defeats the motivation of using an anonymous struct. At least I did not
find a way to get rid of this type cast (compiler options or whatever), which
I somehow find odd, because you are actually allowed to do this in a function
body / block:

    SomeStruct foo = {
        .a = 3
    };

So you don't have to do:

    SomeStruct foo = (SomeStruct) {
        .a = 3
    };

Some people seem to define a variadic macro, but you would have to do that for
each new function, e.g.:

    #define SomeTask(...) someTask((SomeType) __VA_ARGS__)

Not very appealing.

> On Fri, 24 Jun 2022 19:46:18 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > There are currently 3 different functions for sending a 9p 'Twalk'
> > request. They are all doing the same thing, just in a slightly different
> > way and with slightly different function arguments.
> > 
> > Merge those 3 functions into a single function by using a struct for
> > function call arguments and use designated initializers when calling this
> > function to turn usage into a declarative approach, which is better
> > readable and easier to maintain.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >   Before working on actual new stuff, I looked at the current unit test
> >   code
> >   and thought it's probably a good time to make the overall test code
> >   better
> >   readable before piling up more test code soon.
> >   
> >   In this patch I am suggesting to use named function arguments. For
> >   instance
> >   
> >      do_walk_expect_error(v9p, "non-existent", ENOENT);
> >   
> >   is probably a bit hard to tell what it is supposed to be doing without
> >   looking up the function prototype, whereas
> >   
> >     Twalk((TWalkOpt) {
> >     
> >       .client = v9p, .path = "non-existent", .expectErr = ENOENT
> >     
> >     });
> >   
> >   should make it immediately clear (provided you have some knowledge about
> >   the 9p network protocol). I'm using this coding style of declarative
> >   functions calls a lot nowadays, which makes especially sense in the
> >   context of unit test code as those are typically passing literals as
> >   function arguments as shown above very often. But also in other
> >   contexts it is beneficial as it allows various linear combinations of
> >   possible function arguments being used / ommitted on function calls and
> >   still being handled with only one function implementation.
> >   
> >   Caller has a great flexibility of which function arguments to use, and
> >   is
> >   also completely free of the order of the arguments being specified.
> >   
> >   Another benefit is that you can also extend functionality later on,
> >   without
> >   breaking existing function calls. So this avoids a lot of refactoring
> >   work
> >   on the long-term.
> >   
> >   With C++ you could also define specific default values for ommitted
> >   function arguments. In C unfortunately it is just the language default
> >   initializer which usually is simply zero.
> 
> AFAIK the "Designated Initializers" feature of C99 guarantees zero is the
> default so we should be good.

No doubt that omitted fields on designated initializers are always initialized
with a reasonable default value with C99. My point was rather that's it
unfortunately *only* zero with C. Because in most cases you are fine with
zero, but in our context of 9p tests for instance you might want to have this
as default initializer for fids instead:

    struct TwalkOpt {
       ...
       fid = -1;
       ...
    };

Then we could do, if omitted:

    /* caller did not pass a fid, so let's generate one */
    if (opt.fid == -1)
        opt.fid = genfid();

As fid == 0 is indeed a reasonable usage scenario for a caller.

> >   Obviously with a large number of possible function arguments provided,
> >   some
> >   combinations make sense and some simply don't. In this patch for
> >   instance
> >   
> >   this is handled with assertion faults like:
> >     /* you can expect either Rwalk or Rlerror, but obviously not both */
> >     g_assert(!opt.expectErr || !(opt.Rwalk.nwqid || opt.Rwalk.wqid));
> >   
> >   So this would be a runtime error. In C++ you could turn the function
> >   into
> >   a constexpr and make that a compile error instead, in C there is
> >   
> >     _Static_assert(...)
> >   
> >   but as there is no constexpr, that would probably be a hard to achieve.
> >   
> >   Thoughts?
> > 
> > ---
> 
> This change LGTM. Some remarks below.
> 
> >  tests/qtest/virtio-9p-test.c | 79 +++++++++++++++++++-----------------
> >  1 file changed, 42 insertions(+), 37 deletions(-)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 25305a4cf7..6a7f1f6252 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -669,50 +669,51 @@ static void do_version(QVirtio9P *v9p)
> > 
> >      g_assert_cmpmem(server_version, server_len, version,
> >      strlen(version));
> >  
> >  }
> > 
> > +/* options for 'Twalk' 9p request */
> > +typedef struct TWalkOpt {
> > +    /* 9P client being used (mandatory) */
> > +    QVirtio9P *client;
> > +    /* path to walk to (mandatory) */
> > +    const char *path;
> > +    /* data being received from 9p server as 'Rwalk' response (optional)
> > */ +    struct {
> > +        uint16_t *nwqid;
> > +        v9fs_qid **wqid;
> > +    } Rwalk;
> 
> Rwalk should be all downcase as a regular struct field name.

Sure! I guess same applies to the function name which should be lower case
twalk() instead of Twalk() as well.

> What about introducing:
> 
> typedef struct Rwalk {
>     uint16_t nwqid;
>     v9fs_qid *wqid;
> } Rwalk;
> 
> and having an `Rwalk *rwalk` field in TwalkOpt ?
> 
> The rationale is that it might make sense for a caller to only want the
> number of qids, but if it wants the qid array then nwqid is mandatory.

Yeah, that makes sense in this Twalk example. But what about other 9p request
types where you have much more data being returned, and therefore more
potential linear combinations of individual fields caller might be interested
in, e.g. Rstatfs? I mean in the sense of homogenous coding style?

https://github.com/chaos/diod/blob/master/protocol.md#statfs----get-file-system-information

or Rgettattr:
https://github.com/chaos/diod/blob/master/protocol.md#getattr----get-file-attributes

So always one huge response struct, like you get all or nothing?

> > +    /* do we expect an Rlerror response, if yes which error code?
> > (optional) */ +    uint32_t expectErr;
> > +} TWalkOpt;
> > +
> > 
> >  /*
> >  
> >   * utility function: walk to requested dir and return fid for that dir
> >   and
> >   * the QIDs of server response
> >   */
> > 
> > -static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t
> > *nwqid, -                              v9fs_qid **wqid)
> > +static uint32_t Twalk(TWalkOpt opt)
> > 
> >  {
> >  
> >      char **wnames;
> >      P9Req *req;
> > 
> > +    uint32_t err;
> > 
> >      const uint32_t fid = genfid();
> > 
> > -    int nwnames = split(path, "/", &wnames);
> > -
> > -    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
> > -    v9fs_req_wait_for_reply(req, NULL);
> > -    v9fs_rwalk(req, nwqid, wqid);
> > -
> > -    split_free(&wnames);
> > -    return fid;
> > -}
> > +    g_assert(opt.client);
> > +    g_assert(opt.path);
> > +    /* you can expect either Rwalk or Rlerror, but obviously not both */
> > +    g_assert(!opt.expectErr || !(opt.Rwalk.nwqid || opt.Rwalk.wqid));
> 
> Assert would then just be:
> 
> g_assert(!opt.expectErr || !opt.rwalk);

Yes, that's true.

> > -/* utility function: walk to requested dir and return fid for that dir */
> > -static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> > -{
> > -    return do_walk_rqids(v9p, path, NULL, NULL);
> > -}
> > +    int nwnames = split(opt.path, "/", &wnames);
> > 
> > -/* utility function: walk to requested dir and expect passed error
> > response */ -static void do_walk_expect_error(QVirtio9P *v9p, const char
> > *path, uint32_t err) -{
> > -    char **wnames;
> > -    P9Req *req;
> > -    uint32_t _err;
> > -    const uint32_t fid = genfid();
> > -
> > -    int nwnames = split(path, "/", &wnames);
> > -
> > -    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
> > +    req = v9fs_twalk(opt.client, 0, fid, nwnames, wnames, 0);
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > -    v9fs_rlerror(req, &_err);
> > 
> > -    g_assert_cmpint(_err, ==, err);
> > +    if (opt.expectErr) {
> > +        v9fs_rlerror(req, &err);
> > +        g_assert_cmpint(err, ==, opt.expectErr);
> > +    } else {
> > +        v9fs_rwalk(req, opt.Rwalk.nwqid, opt.Rwalk.wqid);
> > +    }
> > 
> >      split_free(&wnames);
> > 
> > +    return fid;
> > 
> >  }
> >  
> >  static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
> > 
> > @@ -1098,7 +1099,9 @@ static void fs_walk_nonexistent(void *obj, void
> > *data, QGuestAllocator *t_alloc)> 
> >       * The 9p2000 protocol spec says: "If the first element cannot be
> >       walked
> >       * for any reason, Rerror is returned."
> >       */
> > 
> > -    do_walk_expect_error(v9p, "non-existent", ENOENT);
> > +    Twalk((TWalkOpt) {
> > +        .client = v9p, .path = "non-existent", .expectErr = ENOENT
> > +    });
> > 
> >  }
> >  
> >  static void fs_walk_2nd_nonexistent(void *obj, void *data,
> > 
> > @@ -1116,7 +1119,9 @@ static void fs_walk_2nd_nonexistent(void *obj, void
> > *data,> 
> >      );
> >      
> >      do_attach_rqid(v9p, &root_qid);
> > 
> > -    fid = do_walk_rqids(v9p, path, &nwqid, &wqid);
> > +    fid = Twalk((TWalkOpt) {
> > +        .client = v9p, .path = path, .Rwalk.nwqid = &nwqid, .Rwalk.wqid =
> > &wqid +    });
> > 
> >      /*
> >      
> >       * The 9p2000 protocol spec says: "nwqid is therefore either nwname
> >       or the
> >       * index of the first elementwise walk that failed."
> > 
> > @@ -1311,7 +1316,7 @@ static void do_mkdir(QVirtio9P *v9p, const char
> > *path, const char *cname)> 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = Twalk((TWalkOpt) { .client = v9p, .path = path });
> > 
> >      req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1326,7 +1331,7 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const
> > char *path,> 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = Twalk((TWalkOpt) { .client = v9p, .path = path });
> > 
> >      req = v9fs_tlcreate(v9p, fid, name, 0, 0750, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1344,7 +1349,7 @@ static void do_symlink(QVirtio9P *v9p, const char
> > *path, const char *clink,> 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = Twalk((TWalkOpt) { .client = v9p, .path = path });
> > 
> >      req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1358,8 +1363,8 @@ static void do_hardlink(QVirtio9P *v9p, const char
> > *path, const char *clink,> 
> >      uint32_t dfid, fid;
> >      P9Req *req;
> > 
> > -    dfid = do_walk(v9p, path);
> > -    fid = do_walk(v9p, to);
> > +    dfid = Twalk((TWalkOpt) { .client = v9p, .path = path });
> > +    fid = Twalk((TWalkOpt) { .client = v9p, .path = to });
> > 
> >      req = v9fs_tlink(v9p, dfid, fid, clink, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1373,7 +1378,7 @@ static void do_unlinkat(QVirtio9P *v9p, const char
> > *atpath, const char *rpath,> 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, atpath);
> > +    fid = Twalk((TWalkOpt) { .client = v9p, .path = atpath });
> > 
> >      req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> 
> I understand that the current patch is converting the `do_walk*()`
> functions. Would it make sense to convert the many callers of
> `v9fs_twalk()` to call `Twalk()` as well in a subsequent patch ?

Yeah, I would probably merge v9fs_twalk() as well, whether as a separate patch
or merged to the next version of this patch, I don't care.

The only real difference is that v9fs_twalk() does not wait for a server
response. But that behaviour could (if desired) also be preserved with an
optional P9Req* field. But maybe we could simply drop this low-level
separation of not waiting for a respone anyway.

Best regards,
Christian Schoenebeck



