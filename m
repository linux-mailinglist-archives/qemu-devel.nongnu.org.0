Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580553669AC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:06:42 +0200 (CEST)
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZAgr-0007l0-3n
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZAfJ-0007DL-Mw
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZAfF-0002Vb-34
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619003100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4j2WHoGAgLplZwBiFT/eQtTcwL5a1dtwc3fdzTG7M80=;
 b=F02Qr/dowEzrQ24KTJMKttZRbrxYjd5CjnBWrjNcv9ixknQ5aXay/F7Antrh8LA4DpYBHA
 Jk/eVPkgkxh49Ulwov0ao6AnplsJF+9fwcO5rKh+cflmjf7I6na628beweJAzJ4Q+gfPVL
 /C2/a0xrnm++0r3JSs5/46ZtxBUCqME=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-TfkXAjZPPPmCIJk4uo2GGg-1; Wed, 21 Apr 2021 07:04:58 -0400
X-MC-Unique: TfkXAjZPPPmCIJk4uo2GGg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v5-20020a0564023485b029037ff13253bcso14815732edc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 04:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4j2WHoGAgLplZwBiFT/eQtTcwL5a1dtwc3fdzTG7M80=;
 b=J8mrKkH1HD6XiEbzRMgKNCH5DymdGvVhag52pRZQr8oH5Ikl79iWBMOYMkVyFje4C7
 DQMXC4C3g2X3v/Mtu9GzCC59th3P6XKOp6XSNmCJISpVHaA6hU5PfNUixDFBrqyuxcp1
 A0A2GDS78Unl0BYCcihxd41H8LPh+12dIyLrPV5QcwdXm1IKh6BrgjncK4G9Ew1LiqvK
 9JyNS2AoAsavSpn3Pn9GibEswFiIyb2IKv9GfN0OIGCjVLQYb8QWuuF10MkdN2dssGNr
 BzEQ92NET3rTkZARyWxcBL1fllGq6tZCSnxt9qIcp9lDcITNLc0jhZYJvFaL+j3uEr5E
 vdDA==
X-Gm-Message-State: AOAM53261oTdDPL8xD1EZYZa6DBUcZfjhgbM9gLbviisJ8Y+WtC6DzlV
 ByaSPt3+25ZSiBogzzQxO4w27Iy2SFaJ7tI9HUMNGXJ07nOS7AS12yfsRmoC6bLHeFCZ3Duo3ZJ
 XCo2SJfF5OnnhzrI=
X-Received: by 2002:a17:906:40c5:: with SMTP id
 a5mr31452474ejk.465.1619003097129; 
 Wed, 21 Apr 2021 04:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX/VHQX07ME555AXSdtWn4uYi/01Ubi9odHYGl3qZAP+KzauLOANMETUwraGZckJco6nnlbA==
X-Received: by 2002:a17:906:40c5:: with SMTP id
 a5mr31452440ejk.465.1619003096816; 
 Wed, 21 Apr 2021 04:04:56 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a17sm2008337ejx.13.2021.04.21.04.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 04:04:56 -0700 (PDT)
Date: Wed, 21 Apr 2021 13:04:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH v3 2/2] block/rbd: Add an escape-aware strchr helper
Message-ID: <20210421110454.6jcig7ujr25my2xw@steredhat>
References: <20210409143854.138177-1-ckuehl@redhat.com>
 <20210409143854.138177-3-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210409143854.138177-3-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 09:38:54AM -0500, Connor Kuehl wrote:
>Sometimes the parser needs to further split a token it has collected
>from the token input stream. Right now, it does a cursory check to see
>if the relevant characters appear in the token to determine if it should
>break it down further.
>
>However, qemu_rbd_next_tok() will escape characters as it removes tokens
>from the token stream and plain strchr() won't. This can make the
>initial strchr() check slightly misleading since it implies
>qemu_rbd_next_tok() will find the token and split on it, except the
>reality is that qemu_rbd_next_tok() will pass over it if it is escaped.
>
>Use a custom strchr to avoid mixing escaped and unescaped string
>operations.
>
>Reported-by: Han Han <hhan@redhat.com>
>Fixes: https://bugzilla.redhat.com/1873913
>Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>---
>  v2 -> v3:
>    * Update qemu_rbd_strchr to only skip if there's a delimiter AND the
>      next character is not the NUL terminator
>
> block/rbd.c                | 20 ++++++++++++++++++--
> tests/qemu-iotests/231     |  4 ++++
> tests/qemu-iotests/231.out |  3 +++
> 3 files changed, 25 insertions(+), 2 deletions(-)
>
>diff --git a/block/rbd.c b/block/rbd.c
>index 9071a00e3f..291e3f09e1 100644
>--- a/block/rbd.c
>+++ b/block/rbd.c
>@@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
>     return src;
> }
>
>+static char *qemu_rbd_strchr(char *src, char delim)
>+{
>+    char *p;
>+
>+    for (p = src; *p; ++p) {
>+        if (*p == delim) {
>+            return p;
>+        }
>+        if (*p == '\\' && p[1] != '\0') {
>+            ++p;
>+        }
>+    }
>+
>+    return NULL;
>+}
>+

IIUC this is similar to the code used in qemu_rbd_next_tok().
To avoid code duplication can we use this new function inside it?

I mean something like this (not tested):

diff --git a/block/rbd.c b/block/rbd.c
index f098a89c7b..eb6a839362 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -119,15 +119,8 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
  
      *p = NULL;
  
-    for (end = src; *end; ++end) {
-        if (*end == delim) {
-            break;
-        }
-        if (*end == '\\' && end[1] != '\0') {
-            end++;
-        }
-    }
-    if (*end == delim) {
+    end = qemu_rbd_strchr(src, delim);
+    if (end && *end == delim) {
          *p = end + 1;
          *end = '\0';
      }


The rest LGTM!

Thanks for fixing this issue,
Stefano


