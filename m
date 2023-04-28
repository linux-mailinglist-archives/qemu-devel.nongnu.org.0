Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0C6F20BE
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWO4-0004gC-Sh; Fri, 28 Apr 2023 18:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1psWO2-0004fy-Lk; Fri, 28 Apr 2023 18:16:18 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1psWO1-00030I-2a; Fri, 28 Apr 2023 18:16:18 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-b980e16b27bso214246276.2; 
 Fri, 28 Apr 2023 15:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682720174; x=1685312174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeyEOHXGV982kug+dx36RAjIYTHomeFxuF3bqvVe3NA=;
 b=qNV3NqvsJqkz2gaSskt4TNboegjFpmEaC/adEFUsTubdkWfFhcPd5neBOc8rOBOtLr
 Q7mXODElxM3fwgP13CruoaEqWfmVAFvPyAY+HkQfpjxno4gLrqnJH6/R+NSmC28mDAPB
 /nONjhtVXOPge9VG0zUk10pauukDa256a68jssP2K+U2Z+5ZAtitK8c5jwkD5FqxgF22
 Tf/tXfBztmKdbZAOyVBcqEYIobgbhxPEwUzKqypSxIXlvEZRjAybnDcbdQnV1JYzNzda
 B94cFjIQzkABGGnPO8f/yliJUHUWmpJwLxGUbrw5vsFz9mdSe7JUZOHfOcyvRm9RJXvX
 GhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682720174; x=1685312174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeyEOHXGV982kug+dx36RAjIYTHomeFxuF3bqvVe3NA=;
 b=GLHZVJ5QeErmfYfcmxQzcsPGgAw5bjKj4ND+/eb8ZlZbacRKn2+V3hr9a6QEsDIvbl
 gXU+ynAzEi+Uh9hmw8E8dhAFxgYLwuaZaELLUYcZRGlHwatfsXUMzBUo4qBf192mDsMV
 FAeGratL4i6SYgScO9eNYzZB6CyyHMEVYtwYHa1sxrpYfJNJ9Yxo0r+6Ytez3Rt7FSb0
 nfMU/UW0hIJhuEz/9hGxryeO9L3YRth+1fQm2C7OlmM1Wh7AQ6IhxF/aWHQiPrtwbRs3
 lECGnbTAmtEqpB0vAIYTOloLqCGq5Tp1XAERWwVz+Ab1k0LsQsrQburULt02a94MNOHU
 hW2g==
X-Gm-Message-State: AC+VfDzv04SGMY28jJp1XXTsR00Fww49uWV28QNZulrLNmSAyQhxCrzg
 FHv3vX/SUexiqcMOWUBo46paJnXWFELjk6aGY8w=
X-Google-Smtp-Source: ACHHUZ62cUODlWJKWTm0IhM51sqYzYt+cjPa/CdxvcFnBnPf+uoFe5M6SRh674URLoFqVvnrQkaUpuPVMhOgtfKOA9o=
X-Received: by 2002:a25:374e:0:b0:b8f:6bb8:946e with SMTP id
 e75-20020a25374e000000b00b8f6bb8946emr4566110yba.63.1682720174329; Fri, 28
 Apr 2023 15:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
 <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
 <CAL77WPDgx5gsnDZAbir+ae5f6N419WxHQVHZhUr=M4E63AZk0w@mail.gmail.com>
 <792ee284-473e-b659-2a33-3c15f8bae2b8@virtuozzo.com>
In-Reply-To: <792ee284-473e-b659-2a33-3c15f8bae2b8@virtuozzo.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Sat, 29 Apr 2023 01:15:38 +0300
Message-ID: <CAL77WPCAWgD=69LdXgMZ+5a2sDHATWbvR53RfwVbWvmmXvA3pQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com, 
 stefanha@redhat.com, vsementsov@yandex-team.ru, kwolf@redhat.com, 
 hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There is another issue with host_cluster_index() function.
After this patchset applied `qemu-img check -f parallels  some_disk`
aborts for  empty (just created) disk image.
The problem is that host_cluster_index() returns 0 and then
bitmap_new(0) rises an abort.

For default empty disk s->header->data_off=3D2048, and
res->image_end_offset =3D 1048576, so:
static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t 1048576)
{
  off =3D 1048576  - le32_to_cpu(2048) << 9;
  return 0 / 1048576;
}

Could you check this case?

Regards,
Mike.

On Thu, Apr 27, 2023 at 3:29=E2=80=AFPM Alexander Ivanov
<alexander.ivanov@virtuozzo.com> wrote:
>
> Good point. Thank you.
>
> Best regards,
> Alexander Ivanov
>
> On 4/26/23 23:56, Mike Maslenkin wrote:
> > On Mon, Apr 24, 2023 at 12:44=E2=80=AFPM Alexander Ivanov
> > <alexander.ivanov@virtuozzo.com> wrote:
> >> Cluster offsets must be unique among all the BAT entries. Find duplica=
te
> >> offsets in the BAT and fix it by copying the content of the relevant
> >> cluster to a newly allocated cluster and set the new cluster offset to=
 the
> >> duplicated entry.
> >>
> >> Add host_cluster_index() helper to deduplicate the code.
> >>
> >> Move parallels_fix_leak() call to parallels_co_check() to fix both typ=
es
> >> of leak: real corruption and a leak produced by allocate_clusters()
> >> during deduplication.
> >>
> >> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> >> ---
> >>   block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++=
--
> >>   1 file changed, 129 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/block/parallels.c b/block/parallels.c
> >> index ec89ed894b..3b992e8173 100644
> >> --- a/block/parallels.c
> >> +++ b/block/parallels.c
> >> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *=
s, int64_t sector_num,
> >>       return MIN(nb_sectors, ret);
> >>   }
> >>
> >> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off=
)
> >> +{
> >> +    off -=3D s->header->data_off << BDRV_SECTOR_BITS;
> >> +    return off / s->cluster_size;
> >> +}
> >> +
> > I guess  there should be:
> > off -=3D le32_to_cpu(s->header->data_off) << BDRV_SECTOR_BITS
> >
> > Regards,
> > Mike.
>

