Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360E1CF64D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 15:58:30 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYVQT-00045x-4i
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYVPS-0003FC-G7
 for qemu-devel@nongnu.org; Tue, 12 May 2020 09:57:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60807
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYVPP-0006Mr-Oc
 for qemu-devel@nongnu.org; Tue, 12 May 2020 09:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589291841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oi5lQuHUIkDUj75UpFsyn9APOPNHr+7pHnvO0dJ5m6k=;
 b=D4FZZXr7Cjvzsgr/2MTaqLh59hnjDJ9W+8Y/4Crhf107eupKHSxrUWZScQJ6mMBAMv9Lqw
 6QpzwV7YXVV0YXx980WaJl+80HVSzC3MWHYbV7g33XjgmbB+dJeh45DZbLXzgkwdcayuJj
 h0L8l/TaNIby7xDtsJdy1FNpFoNHbTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-lLGJd508PNGYFVQSNOPlVQ-1; Tue, 12 May 2020 09:57:17 -0400
X-MC-Unique: lLGJd508PNGYFVQSNOPlVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C5C1054F8B;
 Tue, 12 May 2020 13:57:16 +0000 (UTC)
Received: from [10.3.116.145] (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDED05EE11;
 Tue, 12 May 2020 13:57:15 +0000 (UTC)
Subject: Re: [PATCH] qemu-nbd: Close inherited stderr
To: Raphael Pour <raphael.pour@hetzner.com>, qemu-devel@nongnu.org
References: <ac17fad1-baf1-75ad-843d-cab8d17f1b2e@hetzner.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <26f7bcad-d058-712e-1663-21923da40f0f@redhat.com>
Date: Tue, 12 May 2020 08:57:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ac17fad1-baf1-75ad-843d-cab8d17f1b2e@hetzner.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/20 3:56 AM, Raphael Pour wrote:
> Hello,
> 
> after e6df58a5, the inherited stderr 'old_stderr' won't get closed
> anymore if 'fork_process' is false. This causes other processes relying
> on EOF to infinitely block or crash.
> 
>>From 47ab9b517038d13117876a8bb3ef45c53d7f2f9e Mon Sep 17 00:00:00 2001
> From: "Raphael Pour" <raphael.pour@hetzner.com>
> Date: Tue, 12 May 2020 10:18:44 +0200
> Subject: [PATCH] qemu-nbd: Close inherited stderr
> 
> Close inherited stderr of the parent if fork_process is false.
> Otherwise no one will close it. (introduced by e6df58a5)
> 
> Signed-off-by: Raphael Pour <raphael.pour@hetzner.com>
> ---
>   qemu-nbd.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Wouldn't it just be simpler to not dup in the first place?

diff --git i/qemu-nbd.c w/qemu-nbd.c
index 4aa005004ebd..6ba2544feb3a 100644
--- i/qemu-nbd.c
+++ w/qemu-nbd.c
@@ -916,7 +916,9 @@ int main(int argc, char **argv)
          } else if (pid == 0) {
              close(stderr_fd[0]);

-            old_stderr = dup(STDERR_FILENO);
+            if (fork_process) {
+                old_stderr = dup(STDERR_FILENO);
+            }
              ret = qemu_daemon(1, 0);

              /* Temporarily redirect stderr to the parent's pipe...  */


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


