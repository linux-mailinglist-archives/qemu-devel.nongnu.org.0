Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5AB5AC487
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:40:50 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUprl-0007nW-7k
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUppp-0006Oz-Op; Sun, 04 Sep 2022 09:38:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUppn-0006wE-LR; Sun, 04 Sep 2022 09:38:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso4322860wmq.1; 
 Sun, 04 Sep 2022 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=YlINzt4BneemVZGr2EaLE9TqdFv0fQtbSEguA6w5+qw=;
 b=SFjJccWXmwr8I4fb5MEYmW2cxw47J57AAFtPHNQi6Zjg2XlxkXXFxAhdU378VLXly/
 A2L9evqzUpKt3AZKLr1K8AjH1pSnrOEbd+cPfcCYs7DBP/cZQKGUPEqWaVWBgEk6q65n
 4lziuLQZ0MxN4qRj5Hy6yvjWHRFD/TgNphzXZuxlzpV2eTno+lrKvgvcTXD0xNbTMLJ2
 hofnzfMSISlUlwI9IdweNw0Uk5GmcGUcdPX1wMtqONM9gSVUIzb5zLw6KU+9wjAhSBxe
 jHSEn1nHs8Ed2Wn54K3z4d7JKYTlMWA+uamTD4xNRoNaTXdFlAEomS1aYbkmK/j9CpXV
 DPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=YlINzt4BneemVZGr2EaLE9TqdFv0fQtbSEguA6w5+qw=;
 b=RikYDQ8dv/2gYClLybRKlyPn9hYKoI24/MIL2YKakUVsKJm2Pa6LF/Dg3vFi8rYCzt
 IJ6KXojfcTQQ8oETQsNhgRQozphSafeg+PqnN+Df2SiK9XoYrPjKVQSQ151ODH8u+vUT
 XSDd+8BWNw9FrwwW3XApgSyWSRgdXsL5GfMFIIo3BsAB41V3ZkBH10yubJmDWQs+yCD4
 zghAyoKfZrIMHCtp4ZVf1uwT4R4B865ndPOXG42sw5l0pIIUUiBQZl5zkFqaOYmK+91a
 YMezm8h+/Ck/FLjx2wIe74DoQjequ/coupeOvSnNY5WR+3Frwfs49QtlZIX+pyaV9i1Z
 hG7A==
X-Gm-Message-State: ACgBeo3YoVuwrkvFcS+10oqnbWyARunTWG4iVLJwICfihdNdObMHR0vp
 FHvKxPme38CL47hZytlZuic=
X-Google-Smtp-Source: AA6agR6W9fRmond1P3LrB300hBbZeSgxl7cebkwYTyMBmGj9SJYKwBSqLC+MabtzY1j0R0kTqQsJ1A==
X-Received: by 2002:a7b:cbd0:0:b0:3a6:9f6:a3e8 with SMTP id
 n16-20020a7bcbd0000000b003a609f6a3e8mr8147650wmi.13.1662298725535; 
 Sun, 04 Sep 2022 06:38:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a7bcd01000000b003a35516ccc3sm7781230wmj.26.2022.09.04.06.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:38:45 -0700 (PDT)
Message-ID: <df5c1e4b-9581-61e6-b0be-eb43d9620edf@amsat.org>
Date: Sun, 4 Sep 2022 15:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] 9pfs: use GHashMap for fid table
Content-Language: en-US
To: Linus Heckemann <git@sphalerite.org>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, Qemu-block <qemu-block@nongnu.org>
References: <20220903150327.2780127-1-git@sphalerite.org>
In-Reply-To: <20220903150327.2780127-1-git@sphalerite.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Linus,

On 3/9/22 17:03, Linus Heckemann wrote:
> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for nearly every
> open, stat, read, write, etc operation.
> 
> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.
> 
> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> ---
>   hw/9pfs/9p.c | 130 +++++++++++++++++++++++++++------------------------
>   hw/9pfs/9p.h |   2 +-
>   2 files changed, 69 insertions(+), 63 deletions(-)

> @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
>   {
>       V9fsFidState *fidp;
>   
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->fid == fid) {
> -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> -            fidp->clunked = true;
> -            return fidp;
> -        }
> +    fidp = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (fidp) {
> +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> +        fidp->clunked = true;
> +        return fidp;
>       }
>       return NULL;
>   }
> @@ -439,10 +433,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>       int reclaim_count = 0;
>       V9fsState *s = pdu->s;
>       V9fsFidState *f;
> +

Style nitpicking: we don't restrict to C89 but still declare variables
at the beginning of functions, so please move this new line ...

> +    GHashTableIter iter;
> +    gpointer fid;

... here.

> +    g_hash_table_iter_init(&iter, s->fids);
> +
>       QSLIST_HEAD(, V9fsFidState) reclaim_list =
>           QSLIST_HEAD_INITIALIZER(reclaim_list);
>   
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &f)) {

Please cast to (gpointer *) instead.

>           /*
>            * Unlink fids cannot be reclaimed. Check
>            * for them and skip them. Also skip fids
> @@ -518,12 +517,12 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>   {
>       int err;
>       V9fsState *s = pdu->s;
> -    V9fsFidState *fidp, *fidp_next;
> +    V9fsFidState *fidp;
> +    gpointer fid;
> +
> +    GHashTableIter iter;

Style.

> +    g_hash_table_iter_init(&iter, s->fids);
>   
> -    fidp = QSIMPLEQ_FIRST(&s->fid_list);
> -    if (!fidp) {
> -        return 0;
> -    }
>   
>       /*
>        * v9fs_reopen_fid() can yield : a reference on the fid must be held
> @@ -534,7 +533,13 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>        * iteration after we could get a reference on the next fid. Start with
>        * the first one.
>        */
> -    for (fidp->ref++; fidp; fidp = fidp_next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &fidp)) {

gpointer *.

> +        /*
> +         * Ensure the fid survives a potential clunk request during
> +         * put_fid() below and v9fs_reopen_fid() in the next iteration.
> +         */
> +        fidp->ref++;
> +
>           if (fidp->path.size == path->size &&
>               !memcmp(fidp->path.data, path->data, path->size)) {
>               /* Mark the fid non reclaimable. */
> @@ -548,16 +553,6 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>               }
>           }
>   
> -        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> -
> -        if (fidp_next) {
> -            /*
> -             * Ensure the next fid survives a potential clunk request during
> -             * put_fid() below and v9fs_reopen_fid() in the next iteration.
> -             */
> -            fidp_next->ref++;
> -        }
> -
>           /* We're done with this fid */
>           put_fid(pdu, fidp);
>       }
> @@ -570,18 +565,20 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>       V9fsState *s = pdu->s;
>       V9fsFidState *fidp;
>   
> +    gpointer fid;
> +    GHashTableIter iter;

Style.

> +    g_hash_table_iter_init(&iter, s->fids);
> +
>       /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &fidp)) {

gpointer *.

>           fidp->ref++;
>   
>           /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
>           fidp->clunked = true;
>   
>           put_fid(pdu, fidp);
>       }
> +    g_hash_table_remove_all(s->fids);
>   }
>   
>   #define P9_QID_TYPE_DIR         0x80
> @@ -3206,6 +3203,9 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
>       V9fsState *s = pdu->s;
>       V9fsFidState *dirfidp = NULL;
>   

Please remove this extra new line.

> +    GHashTableIter iter;
> +    gpointer fid;
> +
>       v9fs_path_init(&new_path);
>       if (newdirfid != -1) {
>           dirfidp = get_fid(pdu, newdirfid);
> @@ -3238,11 +3238,13 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
>       if (err < 0) {
>           goto out;
>       }
> +
>       /*
>        * Fixup fid's pointing to the old name to
>        * start pointing to the new name
>        */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &tfidp)) {
>           if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
>               /* replace the name */
>               v9fs_fix_path(&tfidp->path, &new_path, strlen(fidp->path.data));
> @@ -3321,6 +3323,9 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
>       V9fsState *s = pdu->s;
>       int err;
>   

Extra new line.

> +    GHashTableIter iter;
> +    gpointer fid;
> +
>       v9fs_path_init(&oldpath);
>       v9fs_path_init(&newpath);
>       err = v9fs_co_name_to_path(pdu, olddir, old_name->data, &oldpath);
> @@ -3336,7 +3341,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
>        * Fixup fid's pointing to the old name to
>        * start pointing to the new name
>        */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &tfidp)) {

gpointer *.

>           if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>               /* replace the name */
>               v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4232,7 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
>       s->ctx.fmode = fse->fmode;
>       s->ctx.dmode = fse->dmode;
>   
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids = g_hash_table_new(NULL, NULL);
>       qemu_co_rwlock_init(&s->rename_lock);

Minor style nitpicking comments, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

