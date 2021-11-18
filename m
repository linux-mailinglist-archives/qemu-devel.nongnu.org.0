Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8794554E9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:51:52 +0100 (CET)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnbGx-0003O4-IM
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:51:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnbEq-0001ze-OX
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnbEp-0005g4-2r
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637218178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kglofxlW3uy2h5kyas8ajZ4rkX33zsvfm18ztiNbbeY=;
 b=X+iu75xoyo4apuGTgWMhs0B7p60Zk7YDSlHlbY0vuAcRR2+Wzq7Q4Jz8YJLcXz+Xcd0C1F
 zXp8vu6WrtUSuJuhzqzx4RJSOsfinnHN0M2+5Nm0NqP08MwUxAJKVALqWrhb7Nfbm//Yp6
 sRwd4YL/b2iRykdxyrJA/culJq4rYV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-P7Zv7RGePZqJc7cW2BqpjA-1; Thu, 18 Nov 2021 01:49:36 -0500
X-MC-Unique: P7Zv7RGePZqJc7cW2BqpjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F96787D542;
 Thu, 18 Nov 2021 06:49:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5081E19D9B;
 Thu, 18 Nov 2021 06:49:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 882C411380A7; Thu, 18 Nov 2021 07:49:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from
 object-add in COLO docs
References: <1637209041-15080-1-git-send-email-lei.rao@intel.com>
Date: Thu, 18 Nov 2021 07:49:32 +0100
In-Reply-To: <1637209041-15080-1-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Thu, 18 Nov 2021 12:17:21 +0800")
Message-ID: <878rxmx8jn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> writes:

> From: "Rao, Lei" <lei.rao@intel.com>
>
> With the removal of deprecated 'props' from object-add in the commit of
> "50243407457a9fb0ed17b9a9ba9fc9aee09495b1", we also should update COLO's
> documents.

We should've done this right when we deprecated it.  Not your fault, and
better late than never.

Recommend to quote commits like

    in commit 5024340745 "qapi/qom: Drop deprecated 'props' from
    object-add" (v6.0.0)

I have

    [alias]
            whatis = "!f() { git --no-pager show -s --pretty=\"tformat:%h \"%s\" (`git dc $1 | sed 's/~.*//;s/%/%%/g'`, %cd)\" --date=short $1; }; f"

in my ~/.gitconfig, so I can run

    $ git whatis 50243407457a9fb0ed17b9a9ba9fc9aee09495b1
    5024340745 qapi/qom: Drop deprecated 'props' from object-add (v6.0.0-rc0, 2021-03-19)

> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Same issue in docs/system/authz.rst, docs/throttle.txt, and
docs/tools/qemu-nbd.rst.  Care to fix it there as well?

Also...

> ---
>  docs/COLO-FT.txt | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> index 8d6d53a..fd5ffcc 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -289,11 +289,11 @@ Wait until disk is synced, then:
>  {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
>  {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
>  

... I'd like us to use double quotes in examples, not single quotes.
QMP supports single quotes as an extension over JSON.  Best to avoid it.
Separate patch, of course.

Same in docs/block-replication.txt.

[...]


