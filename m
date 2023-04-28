Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22F6F187C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:52:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psNZw-0006ON-TF; Fri, 28 Apr 2023 08:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1psNZq-0006HP-Tw
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:51:58 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1psNZp-0003lq-0w
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Ay3PhoRru5UnYfSPe1PU4ebRnqXXLTv2sGB01hLCaXM=; b=O2j8mSxylcebDt4sE7oRFoAJur
 HcK7aYdYGOAYuM3EeGYjgbccyC6ZiUvTc4kuqNX8XTwvKgv06aQ7ZPp1wh880Ar+v0DXT7+bEfYDp
 JQfozb7M7yv/mvN8ILvQ9VI2ur8zL3LoIM7Wl0p96aOZptE5L3CwaQlS8sgm5FgTECoexDwqSOkOc
 1coe0zfTz71Firi/rNmv/+pVcyF4q5JWlLd7qvGPGPXaMNAU216+nEC+wbUncMtcC1Z/cB1vq0CPX
 IBL5/EALEvRXlDZkAMTj7uedrXnc4L5KwSdUkaFd7o132suCyHs1bNMYX4FPtOUC0rOuebGxtEYt4
 C1ehx4ApTaLg57IMwyRA7I6JhWXSMaJj6pjCjrE/nqv/uYdBYFYQ9W5tngiuJNcfr2ept3mr5bX2t
 jynM4w1ORRgQOhkV9XcG60r2gvc/IVGtSC7aro48fJhLebGVN/Ry2M/Tkd+WjESpu4LcCMJ0FsFXs
 paF+Zn1FawXxseCrkKRSC1wAFsL7pWROcR+PVoaOVdrwR3OhtJr9jfBp6pkjiNo14v8XKVLfW2SWQ
 gFG0m34saLtfIXjumzwK3OB6O8tE0/u2bvvnI1Gu6XzOvC1fQxHYhopDLT9l8eaQx5fre5hKEiTKX
 ljg1pg+LrcMscZgQbhT0PUjZNhCKIMeggFPskZTFA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests: virtio-9p-client: Rreaddir fields are all mandatory
Date: Fri, 28 Apr 2023 14:51:48 +0200
Message-ID: <1690923.g4PEXVpXuU@silver>
In-Reply-To: <20230427131023.105801-1-pbonzini@redhat.com>
References: <20230427131023.105801-1-pbonzini@redhat.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, April 27, 2023 3:10:23 PM CEST Paolo Bonzini wrote:
> If rreaddir.entries is NULL, the resulting dirent list is leaked.
> Check that the rreaddir case is filled correctly in the caller
> when treaddir succeeds; this then makes it possible to remove
> the conditionals is v9fs_rreaddir.
> 
> Reported by Coverity.

That's an old defects report, right? I remember I saw something like this last
year and ignored it as being purely theoretical.

> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qtest/libqos/virtio-9p-client.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
> index e4a368e03660..17125e78deae 100644
> --- a/tests/qtest/libqos/virtio-9p-client.c
> +++ b/tests/qtest/libqos/virtio-9p-client.c
> @@ -579,6 +579,7 @@ TReadDirRes v9fs_treaddir(TReadDirOpt opt)
>              v9fs_rlerror(req, &err);
>              g_assert_cmpint(err, ==, opt.expectErr);
>          } else {
> +            g_assert(opt.rreaddir.count && opt.rreaddir.nentries && opt.rreaddir.entries);

That would be the opposite of what recent test code restructuring was about:
it reduced overall 9p test code complexity by relaxing how the actual 9p unit
tests (virtio-9p-test.c) shall call the underlying 9p client functions
(virtio-9p-client.c):

https://lore.kernel.org/all/cover.1664917004.git.qemu_oss@crudebyte.com/

From virtio-9p-client.h:

/* options for 'Treaddir' 9p request */
typedef struct TReadDirOpt {
    /* 9P client being used (mandatory) */
    QVirtio9P *client;
    /* user supplied tag number being returned with response (optional) */
    uint16_t tag;
    /* file ID of directory whose entries shall be retrieved (required) */
    uint32_t fid;
    /* offset in entries stream, i.e. for multiple requests (optional) */
    uint64_t offset;
    /* maximum bytes to be returned by server (required) */
    uint32_t count;
    /* data being received from 9p server as 'Rreaddir' response (optional) */
    struct {
        uint32_t *count;
        uint32_t *nentries;
        struct V9fsDirent **entries;
    } rreaddir;
    /* only send Treaddir request but not wait for a reply? (optional) */
    bool requestOnly;
    /* do we expect an Rlerror response, if yes which error code? (optional) */
    uint32_t expectErr;
} TReadDirOpt;

So the burden to deal with the individual use cases was moved from the 9p unit
tests down to the client code. Because that's easier to read and maintain than
having to let each unit test deal with all sorts of requirements that it has no use for in the first place.

>              v9fs_rreaddir(req, opt.rreaddir.count, opt.rreaddir.nentries,
>                            opt.rreaddir.entries);
>          }
> @@ -600,9 +601,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>      v9fs_req_recv(req, P9_RREADDIR);
>      v9fs_uint32_read(req, &local_count);
>  
> -    if (count) {
> -        *count = local_count;
> -    }
> +    *count = local_count;
>  
>      for (int32_t togo = (int32_t)local_count;
>           togo >= 13 + 8 + 1 + 2;
> @@ -610,9 +609,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>      {
>          if (!e) {
>              e = g_new(struct V9fsDirent, 1);
> -            if (entries) {
> -                *entries = e;
> -            }
> +            *entries = e;

I would just add a local auto free pointer in this function that is assigned
to in case argument `entries` was passed as NULL, and not change overall
behaviour and requirements.

>          } else {
>              e = e->next = g_new(struct V9fsDirent, 1);
>          }
> @@ -624,10 +621,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>          v9fs_string_read(req, &slen, &e->name);
>      }
>  
> -    if (nentries) {
> -        *nentries = n;
> -    }
> -
> +    *nentries = n;
>      v9fs_req_free(req);
>  }
>  
> 



