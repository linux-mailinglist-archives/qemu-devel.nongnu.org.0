Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4F3B0AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:58:20 +0200 (CEST)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvjj8-0001LV-Ki
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lvjhv-0000ZI-UD
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lvjhr-0007gt-Rt
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624381012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8P8bRA16DAM2lPUDMVlGVIYrRpg+irhktcJo2EfrSo=;
 b=WOcf1MT45MVYZOyyiAPgYQcIycfutN9JXGqe44lhl8hcbOkk353On8gXeYVptHJD+YAwor
 GmLvFMJUm/o+9VGLVnKAHROfdB7fda2dIs51FXduj02W3Ze/NfBFNHv+Mqoto1mlRhyYwF
 HasSjCdcMKLvaUMz5uARwxP7reuzgF8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-UlSp9T2QOQGhzo-UMPT4DQ-1; Tue, 22 Jun 2021 12:56:49 -0400
X-MC-Unique: UlSp9T2QOQGhzo-UMPT4DQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 c25-20020a4ad7990000b029020e67cc1879so9515oou.18
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 09:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8P8bRA16DAM2lPUDMVlGVIYrRpg+irhktcJo2EfrSo=;
 b=eTIDMkxLKdbYIqeqeCjMQTMfmH73AXj8oggzJ8d6nTdQBdb7I9J79Jc8QKfzzJTCcU
 3XoeO1scNE9TukBt0UFA2lwkQHSK0hmY/HCNUcUOTd25uxFZYHdTO0a2O8jdAARf6PJ1
 kXEvgAZmEEi0yMcS8xWxmMb3nP442UwpSoKyLtq2x7OfhU1JNwq1hyI8MXIwyQUrRzCC
 lwJKLYMvXqQRPxluwiCB3P+9+/zGL4SAbuSItPTxJA+MxsfDQHbGnYVBChlTcQYKf/di
 PQZmG61YCRswB8wRQ5OowSxcWCMnHl1qglqV+23S6+4/j7orW1406mlbSFHisNYhNnDZ
 YnVg==
X-Gm-Message-State: AOAM531TXjfj+XbDX7AX0HEH0NIbrGDBfYKOC5TCQYHeL/olECU9OaQW
 EF+1Rx0KuSHXHzuciwBXzZA1LpQ9J4PYGU59XqcwKxkH7L30w+1p0M6oigSSr8pNkiPmtojfTBC
 emlHeHWitEMci3BFnJYaoAcvqwx7vaNw=
X-Received: by 2002:a9d:6250:: with SMTP id i16mr3893041otk.170.1624381008744; 
 Tue, 22 Jun 2021 09:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKOVuUkX+lgTxAnFOs52uKBvc1lMye7uAJsKvFhTF/39sBLGDsqA/NZtAqFaKxIOyrLoqj0h5KJoFpL5xclec=
X-Received: by 2002:a9d:6250:: with SMTP id i16mr3893036otk.170.1624381008551; 
 Tue, 22 Jun 2021 09:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
In-Reply-To: <YNID9rbo+RdwklCf@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 22 Jun 2021 19:56:32 +0300
Message-ID: <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 6:38 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
> > To save the user from having to check 'qemu-img info --backing-chain'
> > or other followup command to determine which "depth":n goes beyond the
> > chain, add a boolean field "backing" that is set only for unallocated
> > portions of the disk.
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >
> > Touches the same iotest output as 1/1.  If we decide that switching to
> > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > while keeping "depth":n is good enough, then we'd have just one patch,
> > instead of this double churn.  Preferences?
>
> I think the additional flag is better because it's guaranteed to be
> backwards compatible, and because you don't need to know the number of
> layers to infer whether a cluster was allocated in the whole backing
> chain. And by exposing ALLOCATED we definitely give access to the whole
> information that exists in QEMU.
>
> However, to continue with the bike shedding: I won't insist on
> "allocated" even if that is what the flag is called internally and
> consistency is usually helpful, but "backing" is misleading, too,
> because intuitively it doesn't cover the top layer or standalone images
> without a backing file. How about something like "present"?

Looks hard to document:

# @present: if present and false, the range is not allocated within the
#           backing chain (since 6.1)

And is not consistent with "offset". It would work better as:

# @present: if present, the range is allocated within the backing
#           chain (since 6.1)

Or:

# @absent: if present, the range is not allocated within the backing
#           chain (since 6.1)

This is used by libnbd now:
https://github.com/libguestfs/libnbd/commit/1d01d2ac4f6443b160b7d81119d555e1aaedb56d

But I'm fine with "backing", It is consistent with BLK_BACKING_FILE,
meaning this area exposes data from a backing file (if one exists).

We use "backing" internally to be consistent with future qemu-img.


