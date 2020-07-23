Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B751D22B0BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:47:00 +0200 (CEST)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jybYp-0007V6-Ft
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jybXr-0006xp-UL
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:45:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21093
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jybXo-0000Il-UP
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595511956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=iUDYCT2c+Qb7jJW+GV3PymMxld0AOo1JfsIRCzQZv6Y=;
 b=P7e3xzMQ82c13SDIclaIMhQCpWHy7jUcIEA8MzCu2wK3x/hWo3uzxrrII9RVx8Y6bia/t4
 fDMzsVv9cuRurK4511PmahGZ4sjpZNqGkzOfToBx1uEra2tWc2cqOdzS5YWgo+K8S3q2R5
 oHHtAWg60Ixm0xYq+QCpg0BK+0eJ8i4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-KwitdmZCOoeUFtEm_Ni3NA-1; Thu, 23 Jul 2020 09:45:52 -0400
X-MC-Unique: KwitdmZCOoeUFtEm_Ni3NA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C0B518C63C1;
 Thu, 23 Jul 2020 13:45:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F6874F44;
 Thu, 23 Jul 2020 13:45:48 +0000 (UTC)
Subject: Re: [PATCH] target/unicore32: Remove CURSES stuff from the
 Makefile.objs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-devel@nongnu.org
References: <20200723132219.2956-1-thuth@redhat.com>
 <b177ca63-a7bb-03e7-df22-13f77fed9678@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <18291cc0-13e1-65de-d878-eb432acd6219@redhat.com>
Date: Thu, 23 Jul 2020 15:45:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b177ca63-a7bb-03e7-df22-13f77fed9678@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:26:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/2020 15.42, Philippe Mathieu-Daudé wrote:
> On 7/23/20 3:22 PM, Thomas Huth wrote:
>> The dependency on curses has been removed in commit c7a856b42e403e2b
>> ("target/unicore32: Prefer qemu_semihosting_log_out() over curses").
>> So we can remove the related lines in the Makefile now, too.
> 
> Don't we also need to remove all uses of CONFIG_CURSES to
> be complete? Eventually display a warning with --(en|dis)able-curses
> is used.

Which ones do you mean? I can't find any other CONFIG_CURSES anymore in
the target/ folder...

Or do you also plan to get rid of ui/curses.c ??? ... that's certainly
another story.

 Thomas


