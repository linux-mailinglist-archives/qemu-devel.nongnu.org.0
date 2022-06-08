Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD554387B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:10:05 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyFw-00083S-HZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyyDd-0005zr-8s
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyyDb-0001Ps-Lg
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654704459;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YtbSdxEtALwXpEzREFhMpabBQh9zYXLXbQe+yqIm+3g=;
 b=erd3XzUI8UdcGQ48JK++VJghXhCCEjKR9ILEUtGksz9wXB8W0n4kEh3+QijGBi4+kH47Am
 gkysENDOW1E1orSdxnGuoWcsAcvVnCv7lUe6jDlSZFYndMuoZB/RbB6gJ1ZQeyu1XCjMDt
 W7fSBNqzEb9tS5C+KDEYpormfvnVemU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-IX_0mAo2Owe_fxxTc2TdrA-1; Wed, 08 Jun 2022 12:07:35 -0400
X-MC-Unique: IX_0mAo2Owe_fxxTc2TdrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89DC3804181;
 Wed,  8 Jun 2022 16:07:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A401415100;
 Wed,  8 Jun 2022 16:07:34 +0000 (UTC)
Date: Wed, 8 Jun 2022 17:07:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: gitlab: convert Cirrus jobs to .base_job_template
Message-ID: <YqDJRTFC9f27h9OP@redhat.com>
References: <7909a6e5-3c7c-5859-a1cd-075302fc18f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7909a6e5-3c7c-5859-a1cd-075302fc18f8@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 08:48:48AM -0700, Richard Henderson wrote:
> Commit 00125414ba1 is not working as intended.  E.g.
> 
> https://gitlab.com/rth7680/qemu/-/jobs/2558862885
> 
> where I have neither CIRRUS_GITHUB_REPO nor CIRRUS_API_TOKEN set, but the
> job tries to run anyway.  Then fails, predictably, with "token not defined".

Opps, GitLab variable comparisons aren't shell-like where an unset
variable compares equal to empty string.

I just sent a fix & CC'd you

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


