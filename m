Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA47598592
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 16:17:25 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOgKq-000510-Pb
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 10:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOgHL-0001o0-I7
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:13:48 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:32867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOgHI-0007ba-Ef
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7CkHDaO91Yj3UjaiT7x+p2QjnqGqgxy0RTzuAg6woW8=; b=YlDW9JlvpWcDuYb+Xx2hjGiD/4
 cUbJLcOBbn1CjJg50XHHU+6o/6kFxJnqiJMIw3rjsOq+Ww6L3e93xKlXznqb72J+NMRqXsIcYk4BO
 JktKPP/tQApYjXq4ThAzO6gqJoIQ84RqB/hL4RglHnHegoMszraH/wyVbrvlA8yiRQD0l/k+ofTSy
 jY2BV8Kq9LdZb9Kh2hPa4KowbE/GkYgm2eDGVIoG44x6VsyH1Q9mqe++Ed0VI6139ZybXJk2YBmJm
 HSjcG2oyzeSPg0Q48CfBV7IINnTPfd+GyAcAZE3ZjKLOFEkews2K9+v67cCQJW5MsomcSuVWiJFAm
 rrcd7DhrA+dkvrF2wjsvZ05kFowOM6YblyOlL6JjQVLYWPdksq+Qqdr7M1qFmO01LHQhXLHDcG9jJ
 /wwM7VVr/Iz+ryoefTsaOFnG6xSOV44Jme6FsbpUJwwnOGLHh6SQfsO4HgQKLlV2Z5eeap3z/Jo5D
 DBJm4f23GxCUi/uPizyZXoluawc3ig7UHsAnuzE0a7hhfmXCFw55fpvBYPJASGRLEQhsHlEQzGy90
 KkYp8DVYjHIX253kzGuAko8JIomIIK8nWMrhyJ2IC8zXX8Z/nrGKEtzAJAze3PY0mssH/bZuIHEkS
 1gfsT17aDDdhamtYYP33lb3lDTwUgZr06joFr0VoU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH v2] tests/9p: introduce declarative function calls
Date: Thu, 18 Aug 2022 16:13:40 +0200
Message-ID: <2029366.JiBd3r0HjS@silver>
In-Reply-To: <1683188.qTr0RtP6NM@silver>
References: <E1o4nzC-0005fT-RL@lizzy.crudebyte.com>
 <E1oDQqv-0003d4-Hm@lizzy.crudebyte.com> <1683188.qTr0RtP6NM@silver>
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

On Montag, 18. Juli 2022 16:02:31 CEST Christian Schoenebeck wrote:
> On Montag, 18. Juli 2022 15:10:55 CEST Christian Schoenebeck wrote:
> > There are currently 4 different functions for sending a 9p 'Twalk'
> > request. They are all doing the same thing, just in a slightly different
> > way and with slightly different function arguments.
> > 
> > Merge those 4 functions into a single function by using a struct for
> > function call arguments and use designated initializers when calling this
> > function to turn usage into a declarative apporach, which is better
> > readable and easier to maintain.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> > v1 -> v2:
> >   * Also merge low-level function v9fs_twalk().
> >   
> >   * Lower case twalk() function name.
> >   
> >   * Lower case rwalk struct field.
> >   
> >   * Add result struct TWalkRes.
> >   
> >   NOTE: I have not separated rwalk struct, because it would have
> >   simplified code at one place, but complicated it at another one.
> 
> BTW, I also toyed around with virtio-9p-test.c -> virtio-9p-test.cpp, due to
> advantages described in v1 discussion, however there are quite a bunch of C
> header files included which would need refactoring (C++ keywords used like
> 'export', 'class', 'private' and missing type casts from void*).
> 
> I also saw no easy way to separate those as alternative (like C low level
> unit, C++ unit on top). so I decided that it was not worth it.

Not sure if you are on summer vacation right now, but I guess I just go ahead 
and convert the rest of the 9p test code in the same way? At least I haven't 
seen that you were opposed about the suggested idea in general.

Best regards,
Christian Schoenebeck

> >  tests/qtest/virtio-9p-test.c | 251 +++++++++++++++++++++--------------
> >  1 file changed, 154 insertions(+), 97 deletions(-)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 25305a4cf7..69b1c27268 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -72,6 +72,7 @@ static int split(const char *in, const char *delim, char
> > ***out) static void split_free(char ***out)
> > 
> >  {
> >  
> >      int i;
> > 
> > +    if (!*out) return;
> > 
> >      for (i = 0; (*out)[i]; ++i) {
> >      
> >          g_free((*out)[i]);
> >      
> >      }
> > 
> > @@ -390,31 +391,6 @@ static void v9fs_rattach(P9Req *req, v9fs_qid *qid)
> > 
> >      v9fs_req_free(req);
> >  
> >  }
> > 
> > -/* size[4] Twalk tag[2] fid[4] newfid[4] nwname[2] nwname*(wname[s]) */
> > -static P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
> > -                         uint16_t nwname, char *const wnames[], uint16_t
> > tag) -{
> > -    P9Req *req;
> > -    int i;
> > -    uint32_t body_size = 4 + 4 + 2;
> > -
> > -    for (i = 0; i < nwname; i++) {
> > -        uint16_t wname_size = v9fs_string_size(wnames[i]);
> > -
> > -        g_assert_cmpint(body_size, <=, UINT32_MAX - wname_size);
> > -        body_size += wname_size;
> > -    }
> > -    req = v9fs_req_init(v9p,  body_size, P9_TWALK, tag);
> > -    v9fs_uint32_write(req, fid);
> > -    v9fs_uint32_write(req, newfid);
> > -    v9fs_uint16_write(req, nwname);
> > -    for (i = 0; i < nwname; i++) {
> > -        v9fs_string_write(req, wnames[i]);
> > -    }
> > -    v9fs_req_send(req);
> > -    return req;
> > -}
> > -
> > 
> >  /* size[4] Rwalk tag[2] nwqid[2] nwqid*(wqid[13]) */
> >  static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
> >  {
> > 
> > @@ -432,6 +408,98 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid,
> > v9fs_qid **wqid) v9fs_req_free(req);
> > 
> >  }
> > 
> > +/* options for 'Twalk' 9p request */
> > +typedef struct TWalkOpt {
> > +    /* 9P client being used (mandatory) */
> > +    QVirtio9P *client;
> > +    /* user supplied tag number being returned with response (optional)
> > */
> > +    uint16_t tag;
> > +    /* file ID of directory from where walk should start (optional) */
> > +    uint32_t fid;
> > +    /* file ID for target directory being walked to (optional) */
> > +    uint32_t newfid;
> > +    /* low level variant of path to walk to (optional) */
> > +    uint16_t nwname;
> > +    char **wnames;
> > +    /* high level variant of path to walk to (optional) */
> > +    const char *path;
> > +    /* data being received from 9p server as 'Rwalk' response (optional)
> > */ +    struct {
> > +        uint16_t *nwqid;
> > +        v9fs_qid **wqid;
> > +    } rwalk;
> > +    /* only send Twalk request but not wait for a reply? (optional) */
> > +    bool requestOnly;
> > +    /* do we expect an Rlerror response, if yes which error code?
> > (optional) */ +    uint32_t expectErr;
> > +} TWalkOpt;
> > +
> > +/* result of 'Twalk' 9p request */
> > +typedef struct TWalkRes {
> > +    /* file ID of target directory been walked to */
> > +    uint32_t newfid;
> > +    /* if requestOnly was set: request object for further processing */
> > +    P9Req *req;
> > +} TWalkRes;
> > +
> > +/* size[4] Twalk tag[2] fid[4] newfid[4] nwname[2] nwname*(wname[s]) */
> > +static TWalkRes twalk(TWalkOpt opt)
> > +{
> > +    P9Req *req;
> > +    int i;
> > +    uint32_t body_size = 4 + 4 + 2;
> > +    uint32_t err;
> > +    char **wnames = NULL;
> > +
> > +    g_assert(opt.client);
> > +    /* expecting either high- or low-level path, both not both */
> > +    g_assert(!opt.path || !(opt.nwname || opt.wnames));
> > +    /* expecting either Rwalk or Rlerror, but obviously not both */
> > +    g_assert(!opt.expectErr || !(opt.rwalk.nwqid || opt.rwalk.wqid));
> > +
> > +    if (!opt.newfid) {
> > +        opt.newfid = genfid();
> > +    }
> > +
> > +    if (opt.path) {
> > +        opt.nwname = split(opt.path, "/", &wnames);
> > +        opt.wnames = wnames;
> > +    }
> > +
> > +    for (i = 0; i < opt.nwname; i++) {
> > +        uint16_t wname_size = v9fs_string_size(opt.wnames[i]);
> > +
> > +        g_assert_cmpint(body_size, <=, UINT32_MAX - wname_size);
> > +        body_size += wname_size;
> > +    }
> > +    req = v9fs_req_init(opt.client, body_size, P9_TWALK, opt.tag);
> > +    v9fs_uint32_write(req, opt.fid);
> > +    v9fs_uint32_write(req, opt.newfid);
> > +    v9fs_uint16_write(req, opt.nwname);
> > +    for (i = 0; i < opt.nwname; i++) {
> > +        v9fs_string_write(req, opt.wnames[i]);
> > +    }
> > +    v9fs_req_send(req);
> > +
> > +    if (!opt.requestOnly) {
> > +        v9fs_req_wait_for_reply(req, NULL);
> > +        if (opt.expectErr) {
> > +            v9fs_rlerror(req, &err);
> > +            g_assert_cmpint(err, ==, opt.expectErr);
> > +        } else {
> > +            v9fs_rwalk(req, opt.rwalk.nwqid, opt.rwalk.wqid);
> > +        }
> > +        req = NULL; /* request was freed */
> > +    }
> > +
> > +    split_free(&wnames);
> > +
> > +    return (TWalkRes) {
> > +        .newfid = opt.newfid,
> > +        .req = req,
> > +    };
> > +}
> > +
> > 
> >  /* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
> >  static P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t
> > 
> > request_mask, uint16_t tag)
> > @@ -669,52 +737,6 @@ static void do_version(QVirtio9P *v9p)
> > 
> >      g_assert_cmpmem(server_version, server_len, version,
> >      strlen(version));
> >  
> >  }
> > 
> > -/*
> > - * utility function: walk to requested dir and return fid for that dir
> > and
> > - * the QIDs of server response
> > - */
> > -static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t
> > *nwqid, -                              v9fs_qid **wqid)
> > -{
> > -    char **wnames;
> > -    P9Req *req;
> > -    const uint32_t fid = genfid();
> > -
> > -    int nwnames = split(path, "/", &wnames);
> > -
> > -    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
> > -    v9fs_req_wait_for_reply(req, NULL);
> > -    v9fs_rwalk(req, nwqid, wqid);
> > -
> > -    split_free(&wnames);
> > -    return fid;
> > -}
> > -
> > -/* utility function: walk to requested dir and return fid for that dir */
> > -static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> > -{
> > -    return do_walk_rqids(v9p, path, NULL, NULL);
> > -}
> > -
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
> > -    v9fs_req_wait_for_reply(req, NULL);
> > -    v9fs_rlerror(req, &_err);
> > -
> > -    g_assert_cmpint(_err, ==, err);
> > -
> > -    split_free(&wnames);
> > -}
> > -
> > 
> >  static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
> >  {
> >  
> >      alloc = t_alloc;
> > 
> > @@ -757,7 +779,10 @@ static void fs_walk(void *obj, void *data,
> > QGuestAllocator *t_alloc) }
> > 
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, P9_MAXWELEM, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = P9_MAXWELEM, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, &nwqid, &wqid);
> > 
> > @@ -941,7 +966,7 @@ static void fs_readdir(void *obj, void *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> > 
> >      uint16_t nqid;
> >      v9fs_qid qid;
> >      uint32_t count, nentries;
> > 
> > @@ -949,7 +974,10 @@ static void fs_readdir(void *obj, void *data,
> > QGuestAllocator *t_alloc) P9Req *req;
> > 
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, &nqid, NULL);
> >      g_assert_cmpint(nqid, ==, 1);
> > 
> > @@ -993,7 +1021,7 @@ static void fs_readdir(void *obj, void *data,
> > QGuestAllocator *t_alloc) /* readdir test where overall request is split
> > over several messages */ static void do_readdir_split(QVirtio9P *v9p,
> > uint32_t count)
> > 
> >  {
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> > 
> >      uint16_t nqid;
> >      v9fs_qid qid;
> >      uint32_t nentries, npartialentries;
> > 
> > @@ -1010,7 +1038,10 @@ static void do_readdir_split(QVirtio9P *v9p,
> > uint32_t count) nentries = 0;
> > 
> >      tail = NULL;
> > 
> > -    req = v9fs_twalk(v9p, 0, fid, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = fid,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, &nqid, NULL);
> >      g_assert_cmpint(nqid, ==, 1);
> > 
> > @@ -1074,12 +1105,15 @@ static void fs_walk_no_slash(void *obj, void
> > *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup(" /") };
> > +    char *wnames[] = { g_strdup(" /") };
> > 
> >      P9Req *req;
> >      uint32_t err;
> >      
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rlerror(req, &err);
> > 
> > @@ -1098,7 +1132,9 @@ static void fs_walk_nonexistent(void *obj, void
> > *data, QGuestAllocator *t_alloc) * The 9p2000 protocol spec says: "If the
> > first element cannot be walked * for any reason, Rerror is returned."
> > 
> >       */
> > 
> > -    do_walk_expect_error(v9p, "non-existent", ENOENT);
> > +    twalk((TWalkOpt) {
> > +        .client = v9p, .path = "non-existent", .expectErr = ENOENT
> > +    });
> > 
> >  }
> >  
> >  static void fs_walk_2nd_nonexistent(void *obj, void *data,
> > 
> > @@ -1116,7 +1152,10 @@ static void fs_walk_2nd_nonexistent(void *obj, void
> > *data, );
> > 
> >      do_attach_rqid(v9p, &root_qid);
> > 
> > -    fid = do_walk_rqids(v9p, path, &nwqid, &wqid);
> > +    fid = twalk((TWalkOpt) {
> > +        .client = v9p, .path = path,
> > +        .rwalk.nwqid = &nwqid, .rwalk.wqid = &wqid
> > +    }).newfid;
> > 
> >      /*
> >      
> >       * The 9p2000 protocol spec says: "nwqid is therefore either nwname
> >       or
> > 
> > the * index of the first elementwise walk that failed."
> > @@ -1148,7 +1187,10 @@ static void fs_walk_none(void *obj, void *data,
> > QGuestAllocator *t_alloc) v9fs_req_wait_for_reply(req, NULL);
> > 
> >      v9fs_rattach(req, &root_qid);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 0, .wnames = NULL, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, &wqid);
> > 
> > @@ -1166,7 +1208,7 @@ static void fs_walk_dotdot(void *obj, void *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup("..") };
> > +    char *wnames[] = { g_strdup("..") };
> > 
> >      v9fs_qid root_qid;
> >      g_autofree v9fs_qid *wqid = NULL;
> >      P9Req *req;
> > 
> > @@ -1176,7 +1218,10 @@ static void fs_walk_dotdot(void *obj, void *data,
> > QGuestAllocator *t_alloc) v9fs_req_wait_for_reply(req, NULL);
> > 
> >      v9fs_rattach(req, &root_qid);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, &wqid); /* We now we'll get one qid */
> > 
> > @@ -1189,11 +1234,14 @@ static void fs_lopen(void *obj, void *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
> > 
> >      P9Req *req;
> >      
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, NULL);
> > 
> > @@ -1209,13 +1257,16 @@ static void fs_write(void *obj, void *data,
> > QGuestAllocator *t_alloc) QVirtio9P *v9p = obj;
> > 
> >      alloc = t_alloc;
> >      static const uint32_t write_count = P9_MAX_SIZE / 2;
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
> > 
> >      g_autofree char *buf = g_malloc0(write_count);
> >      uint32_t count;
> >      P9Req *req;
> >      
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, NULL);
> > 
> > @@ -1235,13 +1286,16 @@ static void fs_flush_success(void *obj, void
> > *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
> > 
> >      P9Req *req, *flush_req;
> >      uint32_t reply_len;
> >      uint8_t should_block;
> >      
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, NULL);
> > 
> > @@ -1272,13 +1326,16 @@ static void fs_flush_ignored(void *obj, void
> > *data,
> > QGuestAllocator *t_alloc) {
> > 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> > 
> > -    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
> > +    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
> > 
> >      P9Req *req, *flush_req;
> >      uint32_t count;
> >      uint8_t should_block;
> >      
> >      do_attach(v9p);
> > 
> > -    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > +    req = twalk((TWalkOpt) {
> > +        .client = v9p, .fid = 0, .newfid = 1,
> > +        .nwname = 1, .wnames = wnames, .requestOnly = true
> > +    }).req;
> > 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rwalk(req, NULL, NULL);
> > 
> > @@ -1311,7 +1368,7 @@ static void do_mkdir(QVirtio9P *v9p, const char
> > *path, const char *cname) uint32_t fid;
> > 
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = twalk((TWalkOpt) { .client = v9p, .path = path }).newfid;
> > 
> >      req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1326,7 +1383,7 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const
> > char
> > *path, uint32_t fid;
> > 
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = twalk((TWalkOpt) { .client = v9p, .path = path }).newfid;
> > 
> >      req = v9fs_tlcreate(v9p, fid, name, 0, 0750, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1344,7 +1401,7 @@ static void do_symlink(QVirtio9P *v9p, const char
> > *path, const char *clink, uint32_t fid;
> > 
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, path);
> > +    fid = twalk((TWalkOpt) { .client = v9p, .path = path }).newfid;
> > 
> >      req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1358,8 +1415,8 @@ static void do_hardlink(QVirtio9P *v9p, const char
> > *path, const char *clink, uint32_t dfid, fid;
> > 
> >      P9Req *req;
> > 
> > -    dfid = do_walk(v9p, path);
> > -    fid = do_walk(v9p, to);
> > +    dfid = twalk((TWalkOpt) { .client = v9p, .path = path }).newfid;
> > +    fid = twalk((TWalkOpt) { .client = v9p, .path = to }).newfid;
> > 
> >      req = v9fs_tlink(v9p, dfid, fid, clink, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> > 
> > @@ -1373,7 +1430,7 @@ static void do_unlinkat(QVirtio9P *v9p, const char
> > *atpath, const char *rpath, uint32_t fid;
> > 
> >      P9Req *req;
> > 
> > -    fid = do_walk(v9p, atpath);
> > +    fid = twalk((TWalkOpt) { .client = v9p, .path = atpath }).newfid;
> > 
> >      req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
> >      v9fs_req_wait_for_reply(req, NULL);



