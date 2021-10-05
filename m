Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7FB422299
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:46:05 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXh1Q-0006Gs-3I
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXgzb-0005aj-Vo
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXgzY-0005Vx-6Y
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633427045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7IzfpkZAW4vaGGdzY8nDR/3jx97k1RmFrML3Ke19BNA=;
 b=Nj18IlyJghEWMx5k/iduyplHzy4OKDYTrG38Cb15Rp5XfynU14YcNlBpKqQGiHXIZ8e1U6
 DlxYTNzPrgokn1QZKETvl5wuVWyZlcVZzdshwjfiDBsuxPnS2CuVzX1GGUS14AkaDITcND
 nDhc5xjt8LdL94iZxfZnATxxqdXYFPc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-Qgo9kDdgOG2v9xtROjdvXg-1; Tue, 05 Oct 2021 05:44:02 -0400
X-MC-Unique: Qgo9kDdgOG2v9xtROjdvXg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f12-20020a1c6a0c000000b0030d696e37b7so1061880wmc.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 02:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7IzfpkZAW4vaGGdzY8nDR/3jx97k1RmFrML3Ke19BNA=;
 b=RWfMKZNLffjaH8yR8niJG/hb2JauFEC36+VuM1T13//BjF5Dnwxbg7WREAO9iBZxTF
 1d+96GXlaoDLEpZwbCA7yRb+VgThJ3zavgUvTlmHgblpfWJ+90XmNwKLJM4INPxCUFtN
 LXiWwwz0DrQrTeSTfWWjGn39lcswu/PULtwOjNV5RoVdTUIMrhhJZ2+1XQkzG8U+y+rg
 RyQ5/b18TBxgy59T85uwHtbFam0jAYN2op1VVFPaSrr1nFx4DAYFrNZq738eRjN1NOd+
 a0kskS/sC2DICTU9BdDamAcHEVB/Hc5aIIBj+HRsQ8dvLNDiSdFKrh6gX9O49CmebS/y
 YVBQ==
X-Gm-Message-State: AOAM531mx0+LgvRdxf4P+6XMoyJCFr5ccFLMz2ynLiCk/OFyRoZIEGvL
 4hpIoUZZ2vB51roS5AVHNsIPjHFyC5bd/iDZR9xzv5eJTD3OyRDP2TjBPPd+6/ZuamnkfPhRtGR
 JMWXiBKgZZFAl6AU=
X-Received: by 2002:adf:fb0a:: with SMTP id c10mr21065352wrr.354.1633427041441; 
 Tue, 05 Oct 2021 02:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBHt82RhcawSYYOYrIbR+Ft8Tf6MMsZc2YpRcJGb440TS5/ZuVQft3Dp56PclOnglbTgGwRA==
X-Received: by 2002:adf:fb0a:: with SMTP id c10mr21065325wrr.354.1633427041161; 
 Tue, 05 Oct 2021 02:44:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id 1sm1396817wms.0.2021.10.05.02.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:44:00 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:43:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: xattr mapping add a new type "unsupported"
Message-ID: <YVweXhsYK9V6oH1Q@work-vm>
References: <YUt9qbmgAfCFfg5t@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YUt9qbmgAfCFfg5t@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Right now for xattr remapping, we support types of "prefix", "ok" or "bad".
> Type "bad" returns -EPERM on setxattr and hides xattr in listxattr. For
> getxattr, mapping code returns -EPERM but getxattr code converts it to -ENODATA.
> 
> I need a new semantics where if an xattr is unsupported, then
> getxattr()/setxattr() return -ENOTSUP and listxattr() should hide the xattr.
> This is needed to simulate that security.selinux is not supported by
> virtiofs filesystem and in that case client falls back to some default
> label specified by policy.
> 
> So add a new type "unsupported" which returns -ENOTSUP on getxattr() and
> setxattr() and hides xattrs in listxattr().
> 
> For example, one can use following mapping rule to not support
> security.selinux xattr and allow others.
> 
> "-o xattrmap=/unsupported/all/security.selinux/security.selinux//ok/all///"
> 
> Suggested-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Yes, that's nice and simple.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/tools/virtiofsd.rst         |    6 ++++++
>  tools/virtiofsd/passthrough_ll.c |   17 ++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-09-22 08:37:16.070377732 -0400
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-09-22 14:17:09.543016250 -0400
> @@ -2465,6 +2465,11 @@ static void lo_flock(fuse_req_t req, fus
>   * Automatically reversed on read
>   */
>  #define XATTR_MAP_FLAG_PREFIX  (1 <<  2)
> +/*
> + * The attribute is unsupported;
> + * ENOTSUP on write, hidden on read.
> + */
> +#define XATTR_MAP_FLAG_UNSUPPORTED     (1 <<  3)
>  
>  /* scopes */
>  /* Apply rule to get/set/remove */
> @@ -2636,6 +2641,8 @@ static void parse_xattrmap(struct lo_dat
>              tmp_entry.flags |= XATTR_MAP_FLAG_OK;
>          } else if (strstart(map, "bad", &map)) {
>              tmp_entry.flags |= XATTR_MAP_FLAG_BAD;
> +        } else if (strstart(map, "unsupported", &map)) {
> +            tmp_entry.flags |= XATTR_MAP_FLAG_UNSUPPORTED;
>          } else if (strstart(map, "map", &map)) {
>              /*
>               * map is sugar that adds a number of rules, and must be
> @@ -2646,8 +2653,8 @@ static void parse_xattrmap(struct lo_dat
>          } else {
>              fuse_log(FUSE_LOG_ERR,
>                       "%s: Unexpected type;"
> -                     "Expecting 'prefix', 'ok', 'bad' or 'map' in rule %zu\n",
> -                     __func__, lo->xattr_map_nentries);
> +                     "Expecting 'prefix', 'ok', 'bad', 'unsupported' or 'map'"
> +                     " in rule %zu\n", __func__, lo->xattr_map_nentries);
>              exit(1);
>          }
>  
> @@ -2749,6 +2756,9 @@ static int xattr_map_client(const struct
>              if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
>                  return -EPERM;
>              }
> +            if (cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
> +                return -ENOTSUP;
> +            }
>              if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
>                  /* Unmodified name */
>                  return 0;
> @@ -2788,7 +2798,8 @@ static int xattr_map_server(const struct
>  
>          if ((cur_entry->flags & XATTR_MAP_FLAG_SERVER) &&
>              (strstart(server_name, cur_entry->prepend, &end))) {
> -            if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
> +            if (cur_entry->flags & XATTR_MAP_FLAG_BAD ||
> +                cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
>                  return -ENODATA;
>              }
>              if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
> Index: rhvgoyal-qemu/docs/tools/virtiofsd.rst
> ===================================================================
> --- rhvgoyal-qemu.orig/docs/tools/virtiofsd.rst	2021-09-22 08:37:15.938372097 -0400
> +++ rhvgoyal-qemu/docs/tools/virtiofsd.rst	2021-09-22 14:44:09.814188712 -0400
> @@ -183,6 +183,12 @@ Using ':' as the separator a rule is of
>    'ok' as either an explicit terminator or for special handling of certain
>    patterns.
>  
> +- 'unsupported' - If a client tries to use a name matching 'key' it's
> +  denied using ENOTSUP; when the server passes an attribute
> +  name matching 'prepend' it's hidden.  In many ways it's use is very like
> +  'ok' as either an explicit terminator or for special handling of certain
> +  patterns.
> +
>  **key** is a string tested as a prefix on an attribute name originating
>  on the client.  It maybe empty in which case a 'client' rule
>  will always match on client names.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


